using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_CommerceFood
{
    // Classe responsável por exibir os detalhes de um único produto.
    public partial class VerMaisProduto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //Este bloco SÓ é executado na PRIMEIRA vez que a página é carregada 
            // (evita recarregar dados do banco após um clique ou PostBack).
            if
                (!Page.IsPostBack)
            {
                // Obtém o código (ID) do produto passado na URL (Query String).
                string cod = Request.QueryString["cod"];
                // Verifica se o código foi fornecido.
                if (!string.IsNullOrEmpty(cod))
                {
                    int idProduto;
                    if (int.TryParse(cod, out idProduto))
                    {
                        // Chama o Repositório (DAO) para buscar o objeto 'Produtos' no banco de dados 
                        // usando o ID validado.
                        Produtos produto = ProdutoDAO.BuscarPorId(idProduto);

                        // Verifica se o produto foi encontrado.
                        if (produto != null)
                        {
                            MostrarDadosProduto(produto);  // Se encontrado, preenche os controles visuais (Labels e Imagem).
                        }
                        else
                        {
                            lblNome.Text = "Produto não encontrado.";
                        }
                    }
                    else
                    {
                        // Mensagem de erro se o parâmetro 'cod' não for um número.
                        lblNome.Text = "Código de produto inválido.";
                    }
                }
                else
                {
                    lblNome.Text = "Nenhum código de produto fornecido.";
                }
            }

            // Garante que o nome do usuário seja exibido na navbar, se estiver logado.
            UIHelper.SetNavbarUser(this);
        }


        // Método encapsulado para mapear os dados do objeto 'Produtos' para os controles de tela.
        private void MostrarDadosProduto(Produtos produto)
        {
            lblNome.Text = produto.Nome;
            lblDescricao.Text = produto.Descricao;
            lblPreco.Text = "R$" + produto.Preco.ToString();
            imgProduto.ImageUrl = produto.Imagem;
        }

    }
}