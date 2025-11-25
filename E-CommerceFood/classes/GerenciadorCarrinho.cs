using System;
using System.Collections.Generic;
using System.Linq;

namespace E_CommerceFood
{
    // Classe simples (DTO) só pra segurar os dados do produto na memória RAM
    // enquanto o pedido não é fechado. Não precisa ir pro banco ainda.
    public class ItemCarrinho
    {
        public int IdProduto { get; set; }
        public string Nome { get; set; }
        public decimal Preco { get; set; }
        public int Quantidade { get; set; }
        public string Imagem { get; set; }
    }

    public static class GerenciadorCarrinho
    {
        // A lista é estática para conseguir acessar ela de qualquer página (Cardápio, Carrinho, Detalhes)
        // sem perder os dados quando ocorre a troca de tela.
        public static List<ItemCarrinho> Carrinho { get; } = new List<ItemCarrinho>();

        // Valor total calculado
        public static decimal Total => Carrinho.Sum(i => i.Preco * i.Quantidade);

        public static void Clear()
        {
            Carrinho.Clear();
        }


        public static void Adicionar(ItemCarrinho item)
        {
            // Antes de adicionar, verifica se o produto já existe na lista
            var existente = Carrinho.FirstOrDefault(i => i.IdProduto == item.IdProduto);

            // Se não existe, adiciona um novo
            if (existente == null)
                Carrinho.Add(item);
            else

                // Se já existe, só soma a quantidade no item que já está lá
                existente.Quantidade += item.Quantidade;
        }
        // Remove o item do carrinho
        public static void Remover(int idProduto)
        {
            var item = Carrinho.FirstOrDefault(i => i.IdProduto == idProduto);
            if (item != null)
                Carrinho.Remove(item);
        }
        // Aumenta a quantidade do item no carrinho
        public static void Aumentar(int idProduto)
        {
            var item = Carrinho.FirstOrDefault(i => i.IdProduto == idProduto);
            if (item != null)
                item.Quantidade++;
        }
        // Diminui a quantidade do item no carrinho
        public static void Diminuir(int idProduto)
        {
            var item = Carrinho.FirstOrDefault(i => i.IdProduto == idProduto);
            if (item != null)
            {
                item.Quantidade--;

                // Validação importante: se a quantidade chegar a zero, removo o item da lista
                // pra não ficar um produto com quantidade 0 ou negativa no carrinho.
                if (item.Quantidade <= 0)
                    Carrinho.Remove(item);
            }
        }
    }
}
