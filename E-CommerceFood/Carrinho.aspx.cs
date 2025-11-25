using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_CommerceFood
{
    public partial class Carrinho : System.Web.UI.Page
    {
        //Garante que a lógica de busca de dados só execute no PRIMEIRO carregamento
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                CarregarCarrinho();

            // Atualiza a navbar com as informações do usuário logado
            UIHelper.SetNavbarUser(this);
        }

        // Carrega os itens do carrinho e atualiza o total
        private void CarregarCarrinho()
        {
            // Vincula os itens do carrinho ao Repeater
            rptCarrinho.DataSource = GerenciadorCarrinho.Carrinho;
            rptCarrinho.DataBind();
            lblTotal.Text = GerenciadorCarrinho.Total.ToString("F2");

            // Limpa mensagens anteriores
            if (lblMensagem != null)
                lblMensagem.Text = string.Empty;
        }

        // Finaliza o pedido
        protected void btnFinalizar_Click(object sender, EventArgs e)
        {
            // Verifica se o carrinho está vazio
            if (GerenciadorCarrinho.Carrinho == null || !GerenciadorCarrinho.Carrinho.Any())
            {
                // Exibe mensagem de erro
                if (lblMensagem != null)
                {
                    lblMensagem.Text = "Não é possível finalizar o pedido, o carrinho está vazio!";
                }
                return;
            }

            // Verifica usuário na sessão
            if (Session["idUsuario"] == null)
            {
                // Redireciona para login
                Response.Redirect("FrmLogin.aspx");
                return;
            }

            // Valida ID do usuário
            int idUsuario;
            if (!int.TryParse(Session["idUsuario"].ToString(), out idUsuario))
            {
                Response.Redirect("FrmLogin.aspx");
                return;
            }

            // Checa se usuário existe no banco antes de criar o pedido
            using (var ctx = new pizzafoodEntities())
            {
                var usuario = ctx.Usuario.Find(idUsuario);
                if (usuario == null)
                {
                    Response.Redirect("FrmLogin.aspx");
                    return;
                }
            }

            // Cria pedido
            int idPedido = PedidoDAO.CriarPedido(idUsuario, GerenciadorCarrinho.Carrinho);

            // Limpa carrinho
            GerenciadorCarrinho.Carrinho.Clear();

            Response.Redirect("PedidoDetalhes.aspx?id=" + idPedido);
        }

        // Manipula o evento ItemCommand do Repeater para ajustar quantidades ou remover itens
        protected void rptCarrinho_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            //  Verifica o comando e executa a ação correspondente
            if (e.CommandName == "Aumentar")
            {
                // Tenta converter o argumento do comando para o ID do produto
                if (int.TryParse(e.CommandArgument.ToString(), out int idProd))
                {
                    GerenciadorCarrinho.Aumentar(idProd);
                }
            }
            //  Verifica o comando e executa a ação correspondente
            else if (e.CommandName == "Diminuir")
            {
                //  Tenta converter o argumento do comando para o ID do produto
                if (int.TryParse(e.CommandArgument.ToString(), out int idProd))
                {
                    GerenciadorCarrinho.Diminuir(idProd);
                }
            }
            //  Verifica o comando e executa a ação correspondente
            else if (e.CommandName == "Remover")
            {
                // Tenta converter o argumento do comando para o ID do produto
                if (int.TryParse(e.CommandArgument.ToString(), out int idProd))
                {
                    GerenciadorCarrinho.Remover(idProd);
                }
            }

            // Recarrega a lista e atualiza total
            CarregarCarrinho();
        }

        // Volta para o cardápio
        protected void btnVoltar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Cardapio.aspx");
        }
    }
}