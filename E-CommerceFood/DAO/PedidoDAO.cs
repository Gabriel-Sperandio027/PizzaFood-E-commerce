using System;
using System.Collections.Generic;
using System.Linq;

namespace E_CommerceFood
{
    public class PedidoDAO
    {
        // Método principal para finalizar a compra.
        // Recebemos o ID do usuário e a lista temporária do carrinho.
        public static int CriarPedido(int idUsuario, List<ItemCarrinho> itens)
        {
            using (var ctx = new pizzafoodEntities())
            {
                var usuario = ctx.Usuario.Find(idUsuario);

                // Validação de segurança para garantir que não estamos criando pedido para um ID inexistente.
                if (usuario == null)
                {
                    // Usuário não existe no banco
                    throw new InvalidOperationException("Usuário inválido. Faça login novamente.");
                }

                // Montamos o objeto Pedido (Cabeçalho).
                // Usamos (.Sum) para calcular o valor total dinamicamente, evitando erros de cálculo manual.
                var pedido = new Pedidos
                {
                    IdUsuario = usuario.IdUsuario,
                    DataPedido = DateTime.Now,
                    Status = "Pendente",
                    ValorTotal = itens.Sum(i => i.Preco * i.Quantidade),
                    Usuario = usuario
                };

                ctx.Pedidos.Add(pedido);

                // Salvamos o pedido PRIMEIRO. 
                // Precisamos fazer isso para o Banco de Dados gerar o ID (PK) desse pedido, que será usado nos itens abaixo.
                ctx.SaveChanges();

                // Agora varremos a lista do carrinho para salvar os itens individuais no banco (Tabela ItensPedido)
                foreach (var it in itens)
                {
                    var itemPedido = new ItensPedido
                    {
                        IdPedido = pedido.Id, // Aqui usamos o ID que acabou de ser gerado no SaveChanges anterio
                        IdProduto = it.IdProduto,
                        Quantidade = it.Quantidade,
                        PrecoUnitario = it.Preco
                    };
                    ctx.ItensPedido.Add(itemPedido);
                }
                // Salvamos todos os itens de uma vez no final.
                ctx.SaveChanges();

                return pedido.Id;
            }
        }
    }
}
