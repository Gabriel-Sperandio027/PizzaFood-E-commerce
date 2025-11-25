using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_CommerceFood
{
    public partial class Cardápio : System.Web.UI.Page
    {
        //Garante que a lógica de busca de dados só execute no PRIMEIRO carregamento
        protected void Page_Load(object sender, EventArgs e)
        {
            // Este bloco SÓ é executado na PRIMEIRA vez que a página é carregada
            if (!Page.IsPostBack)
            {
                // Verifica se o usuário está logado
                if (Session["NomeUsuario"] != null)
                {

                    navbarLogado.Visible = true;

                    lblNomeUsuario.InnerText = "Olá, " + Session["NomeUsuario"].ToString();

                    // Atualiza contador do carrinho
                    int cartCount = GerenciadorCarrinho.Carrinho?.Sum(i => i.Quantidade) ??0;
                    
                }
                // Usuário não está logado
                else
                {

                    navbarLogado.Visible = false;
                }
                // Carrega os produtos agrupados por categoria
                CarregarProdutosPorCategoria();
            }

            //  Atualiza a navbar do usuário
            UIHelper.SetNavbarUser(this);
        }
        // Carrega os produtos do banco de dados e os agrupa por categoria
        private void CarregarProdutosPorCategoria()
        {
            // Busca a lista completa de produtos
            var produtos = ProdutoDAO.ListarProdutos();
            // Agrupa os produtos pela categoria
            var grupos = produtos
    .GroupBy(p => p.Categorias)               // agrupa pela categoria inteira
    .OrderBy(g => g.Key.IdCategoria)          // ordena pelo ID da categoria
    .ToList();

            // Define a fonte de dados do Repeater principal como os grupos de categorias
            rptCategorias.DataSource = grupos;
            rptCategorias.DataBind();
        }


        // Manipula o evento ItemDataBound do Repeater de categorias para popular o Repeater de produtos
        protected void rptCategorias_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            // Verifica se o item é um item de dados (não cabeçalho ou rodapé).
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var grupo = (IGrouping<Categorias, Produtos>)e.Item.DataItem;

                // Encontra o Repeater interno para produtos
                Repeater rptProdutos = (Repeater)e.Item.FindControl("rptProdutos");
                rptProdutos.DataSource = grupo.ToList();
                rptProdutos.DataBind();
            }
        }

        // Manipula o evento ItemCommand do Repeater de produtos para ações como "Ver Mais" e "Adicionar ao Carrinho"
        protected void rptProdutos_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            // Verifica o comando e executa a ação correspondente
            if (e.CommandName == "VerMais")
            {
                // Redireciona para a página de detalhes do produto
                string cod = e.CommandArgument.ToString();
                Response.Redirect("VerMaisProduto.aspx?cod=" + cod);
            }
            // Adiciona o produto ao carrinho
            else if (e.CommandName == "AdicionarAoCarrinho")
            {
                // Adiciona o produto ao carrinho e redireciona para a página do carrinho
                int idProduto;
                if (int.TryParse(e.CommandArgument.ToString(), out idProduto))
                {
                    // Busca o produto no banco de dados
                    var produto = ProdutoDAO.BuscarPorId(idProduto);
                    if (produto != null)
                    {
                        // Cria um item de carrinho e adiciona ao gerenciador de carrinho
                        var item = new ItemCarrinho
                        {
                            IdProduto = produto.Id,
                            Nome = produto.Nome,
                            Preco = produto.Preco ??0m,
                            Quantidade =1,
                            Imagem = produto.Imagem
                        };

                        GerenciadorCarrinho.Adicionar(item);
                        Response.Redirect("Carrinho.aspx");
                    }
                }
            }
        }

    }
}