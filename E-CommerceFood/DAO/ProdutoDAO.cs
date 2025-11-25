using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.Entity;
using System.Web;

namespace E_CommerceFood
{
    public class ProdutoDAO
    {
        // Recebe o produto preenchido e grava no banco
        public static string CadastrarProduto(Produtos produto)
        {
            string mensagem = "";

            try
            {
                var ctx = new pizzafoodEntities();
                // Adiciona no contexto e manda salvar as alterações no banco
                ctx.Produtos.Add(produto);
                ctx.SaveChanges();

                mensagem = "O produto " + produto.Nome +
                    " foi cadastrado com sucesso!";

            }
            // Pega a mensagem de erro caso o banco falhe
            catch (Exception ex)
            {
                mensagem = ex.Message;
            }
            return mensagem;
        }

        // Retorna a lista completa pra preencher a tabela do admin
        public static List<Produtos> ListarProdutos()
        {
            using (pizzafoodEntities ctx = new pizzafoodEntities())
            {
                // O Include é importante aqui pois força o carregamento dos dados da tabela Categoria. 
                // Sem isso, o objeto Categoria viria vazio.
                var lista = ctx.Produtos
                               .Include("Categorias")
                               .ToList();

                return lista;
            }
        }

        // Filtra os produtos de uma categoria específica (só pizzas, só bebidas...)
        public static List<Produtos> ListarPorCategoria(int categoriaId)
        {
            using (pizzafoodEntities ctx = new pizzafoodEntities())
            {
                // Filtra onde o ID da categoria bate com o que foi pedido
                return ctx.Produtos
                         .Where(p => p.CategoriaId == categoriaId)
                         .ToList();
            }
        }

        internal static string AlterarProdutos(Produtos produto)
        {
            string mensagem = "";

            try
            {
                using (var ctx = new pizzafoodEntities())
                {
                    // Pra editar no Entity Framework, primeiro preciso buscar o objeto original no banco
                    Produtos produtoAlterado = ctx.Produtos.
                        FirstOrDefault(p => p.Id == produto.Id);

                    // Atualiza os campos com os dados novos que vieram do formulário
                    produtoAlterado.Descricao = produto.Descricao;
                    produtoAlterado.Nome = produto.Nome;
                    produtoAlterado.Imagem = produto.Imagem;
                    produtoAlterado.Preco = produto.Preco;
                    produtoAlterado.CategoriaId = produto.CategoriaId;
                    produtoAlterado.Estoque = produto.Estoque;

                    // O SaveChanges identifica o que mudou e faz o update sozinho
                    ctx.SaveChanges();

                    mensagem = "Produto alterado com sucesso!";
                }

            }
            catch (Exception ex)
            {
                mensagem = ex.Message;
            }

            return mensagem;
        }

        // Busca um produto específico pelo ID pra preencher os campos na tela de edição
        internal static Produtos BuscarPorId(int idProduto)
        {
            pizzafoodEntities ctx = new pizzafoodEntities();
            return ctx.Produtos.Find(idProduto);
        }

        internal static string ExcluirProduto(int id)
        {
            string mensagem = "";

            try
            {
                using (var ctx = new pizzafoodEntities())
                {
                    // Busca o produto antes de remover
                    Produtos produto =
                        ctx.Produtos.FirstOrDefault(p => p.Id == id);
                    ctx.Produtos.Remove(produto);
                    ctx.SaveChanges();
                    mensagem = "Produto excluído com sucesso!";
                }
            }
            catch (Exception ex)
            {
                // Se o produto já tiver sido vendido, o banco trava por causa da chave estrangeira e cai aqui
                mensagem = ex.Message;
            }

            return mensagem;
        }

        internal static Produtos VisualizarProdutos(int id)
        {
            Produtos produto = null;

            try
            {
                using (var ctx = new pizzafoodEntities())
                {
                    produto = ctx.Produtos.FirstOrDefault(p => p.Id == id);
                }
            }
            catch (Exception ex)
            {
            }

            return produto;
        }
    }

}
