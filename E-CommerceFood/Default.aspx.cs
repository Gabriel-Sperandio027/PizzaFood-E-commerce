using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_CommerceFood
{
    public partial class Default : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            //Garante que a lógica de busca de dados só execute no PRIMEIRO carregamento
            if (!Page.IsPostBack)
            {
                // Verifica se o usuário está logado
                if (Session["NomeUsuario"] != null)
                {
                    navbarVisitante.Visible = false;
                    navbarLogado.Visible = true;

                }
                // Usuário NÃO está logado
                else
                {
                    navbarVisitante.Visible = true;
                    navbarLogado.Visible = false;
                }
                
                var lista = ProdutoDAO.ListarProdutos();
                VitrineProdutos();
            }
            // Atualiza a navbar com as informações do usuário logado
            UIHelper.SetNavbarUser(this);
        }
        // Exibe os produtos agrupados por categoria na vitrine
        private void VitrineProdutos()
        {
            // Busca a lista completa de produtos
            var listaProdutos = ProdutoDAO.ListarProdutos();

            // Agrupa pelos nomes das categorias
            var categoriasAgrupadas = listaProdutos
                .GroupBy(p => p.Categorias)
                .ToDictionary(
                    g => g.Key,
                    g => g.Take(8).ToList() // LIMITA 8 PRODUTOS POR CATEGORIA
                );
            // Vincula os dados ao Repeater de categorias
            rptCategorias.DataSource = categoriasAgrupadas;
            rptCategorias.DataBind();
        }

        // Manipula o evento ItemDataBound do Repeater para vincular os produtos de cada categoria
        protected void rptCategorias_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            // Verifica se o item é um item de dados (não cabeçalho ou rodapé).
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var categoria = (KeyValuePair<Categorias, List<Produtos>>)e.Item.DataItem;
                // Encontra o Repeater interno para produtos e vincula os dados
                var rptProdutos = (Repeater)e.Item.FindControl("rptProdutos");
                rptProdutos.DataSource = categoria.Value;
                rptProdutos.DataBind();
            }
        }
        // Manipula o evento ItemCommand do Repeater de produtos
        protected void rptProdutos_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            // Verifica o comando executado
            if (e.CommandName == "VerMais")
            {
                // Impede acesso se NÃO estiver logado
                if (Session["NomeUsuario"] == null)
                {
                    Response.Redirect("FrmLogin.aspx");
                    return;
                }
                // Redireciona para a página de detalhes do produto
                string cod = e.CommandArgument.ToString();
                Response.Redirect("VerMaisProduto.aspx?cod=" + cod);
            }
            // Adiciona o produto ao carrinho
            else if (e.CommandName == "AdicionarAoCarrinho")
            {
                // Impede acesso se NÃO estiver logado
                if (Session["NomeUsuario"] == null)
                {
                    Response.Redirect("FrmLogin.aspx");
                    return;
                }
                int idProduto;
                // Tenta converter o argumento do comando para um ID de produto
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
                        // Adiciona o item ao carrinho
                        GerenciadorCarrinho.Adicionar(item);

                        Response.Redirect("Carrinho.aspx");
                    }
                }
            }
        }

        // Manipula o clique no botão "Ver Todos os Produtos"
        protected void btnVerTodos_Click(object sender, EventArgs e)
        {
            // Impede acesso se NÃO estiver logado
            if (Session["NomeUsuario"] == null)
            {
                Response.Redirect("FrmLogin.aspx");
                return;
            }
            // Redireciona para a página do cardápio completo
            Response.Redirect("Cardapio.aspx");
        }
    }   
    }

    