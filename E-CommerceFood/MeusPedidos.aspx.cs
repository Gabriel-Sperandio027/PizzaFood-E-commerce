using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;

namespace E_CommerceFood
{
    // Responsável por exibir a lista de pedidos do usuário logado e gerenciar o cancelamento.
    public partial class MeusPedidos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Verifica se o usuário está logado (se 'idUsuario' está na Session).
                if (Session["idUsuario"] == null)
                {
                    // Redireciona para a página de login se não estiver logado.
                    Response.Redirect("FrmLogin.aspx");
                    return;
                }
                // Vincula os pedidos do usuário ao Repeater.
                BindPedidos();
            }

            // Configura a barra de navegação para o usuário logado.
            UIHelper.SetNavbarUser(this);
        }

        
        private void BindPedidos()
        {
            // Obtém o ID do usuário logado.
            int idUsuario = Convert.ToInt32(Session["idUsuario"]);
            using (var ctx = new pizzafoodEntities())
            {
                // Obtém os pedidos do usuário.
                var pedidos = ctx.Pedidos.Where(p => p.IdUsuario == idUsuario).ToList();
                rptPedidos.DataSource = pedidos;
                rptPedidos.DataBind();
            }
        }

        // Manipula o evento ItemDataBound do Repeater para vincular os itens do pedido e gerenciar a visibilidade do botão de cancelamento.
        protected void rptPedidos_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            // Verifica se o item é um item de dados (não cabeçalho ou rodapé).
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                // Obtém o pedido associado ao item.
                var pedido = (Pedidos)e.Item.DataItem;
                var rptItens = (Repeater)e.Item.FindControl("rptItens");
                var btnCancelar = (Button)e.Item.FindControl("btnCancelar");
                // Vincula os itens do pedido ao Repeater interno.
                if (rptItens != null)
                {
                    rptItens.DataSource = pedido.ItensPedido.ToList();
                    rptItens.DataBind();
                }
                // Gerencia a visibilidade do botão de cancelamento.
                if (btnCancelar != null && pedido != null)
                {
                    // permitir cancelar quando status for Pendente ou Em Preparação
                    if (pedido.Status != "Pendente" && pedido.Status != "Em Preparação")
                    {
                        btnCancelar.Visible = false;
                    }
                }
            }
        }

        // Manipula o evento ItemCommand do Repeater para cancelar um pedido.
        protected void rptPedidos_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            // Verifica se o comando é para cancelar o pedido.
            if (e.CommandName == "CancelarPedido")
            {
                int idPedido = Convert.ToInt32(e.CommandArgument);
                int idUsuario = Convert.ToInt32(Session["idUsuario"]);
                using (var ctx = new pizzafoodEntities())
                {
                    // Obtém o pedido do usuário.
                    var pedido = ctx.Pedidos.Include("ItensPedido").FirstOrDefault(p => p.Id == idPedido && p.IdUsuario == idUsuario);
                    // Verifica se o pedido existe e pertence ao usuário.
                    if (pedido == null)
                    {
                        // não encontrado ou não pertence ao usuário
                        return;
                    }

                    // permitir cancelar apenas se status for Pendente ou Em Preparação
                    if (pedido.Status != "Pendente" && pedido.Status != "Em Preparação")
                    {
                        // não permitir cancelamento
                        return;
                    }

                    // remover itens
                    var itens = pedido.ItensPedido.ToList();
                    foreach (var ip in itens)
                    {
                        ctx.ItensPedido.Remove(ip);
                    }
                    // remover pedido
                    ctx.Pedidos.Remove(pedido);
                    ctx.SaveChanges();
                }

                // Exibe mensagem de sucesso
                BindPedidos();
            }
        }

        // Manipula o clique do botão para excluir todos os pedidos do usuário.
        protected void btnExcluirPedidos_Click(object sender, EventArgs e)
        {
            // Obtém o ID do usuário logado.
            int idUsuario = Convert.ToInt32(Session["IdUsuario"]); // Ajuste conforme seu session
            using (var ctx = new pizzafoodEntities())
            {
                // Obtém todos os pedidos do usuário
                var pedidos = ctx.Pedidos.Where(p => p.IdUsuario == idUsuario).ToList();

                // Remove todos os pedidos diretamente, os itens serão deletados automaticamente pelo cascade
                foreach (var pedido in pedidos)
                {
                    ctx.Pedidos.Remove(pedido);
                }
                // Salva as alterações no banco de dados
                ctx.SaveChanges();
            }
            // Exibe mensagem de sucesso
            Response.Write("<script>alert('Todos os pedidos foram excluídos com sucesso!');</script>");

            // Recarrega o repeater
            rptPedidos.DataSource = null;
            rptPedidos.DataBind();
        }
    }
}
