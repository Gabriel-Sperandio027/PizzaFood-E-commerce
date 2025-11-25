using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_CommerceFood.admin
{
    public partial class GerenciadorPedidos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {// Verifica se é a primeira vez que a página está sendo carregada
            if (!IsPostBack)
            {
                CarregarPedidos();
            }
        }
        // Método para carregar os pedidos do banco de dados e vinculá-los ao GridView
        private void CarregarPedidos()
        {// Conecta ao banco de dados usando o contexto pizzafoodEntities
            using (var ctx = new pizzafoodEntities())
            {// Obtém todos os pedidos da tabela Pedidos
                var pedidos = ctx.Pedidos.ToList();
                gvPedidos.DataSource = pedidos;
                gvPedidos.DataBind();
            }
        }
        // Evento disparado quando uma linha do GridView é vinculada aos dados
        protected void gvPedidos_RowDataBound(object sender, GridViewRowEventArgs e)
        {// Verifica se a linha é uma linha de dados (não cabeçalho ou rodapé)
            if (e.Row.RowType == DataControlRowType.DataRow)
            {// Obtém o objeto Pedido associado à linha atual
                var pedido = (Pedidos)e.Row.DataItem;
                DropDownList ddl = (DropDownList)e.Row.FindControl("ddlStatus");
                if (ddl != null && pedido != null)
                {// Define o status selecionado no DropDownList com base no status do pedido
                    ListItem item = ddl.Items.FindByValue(pedido.Status);
                    if (item != null)
                        item.Selected = true;
                }
            }
        }
        // Evento disparado quando um comando é executado em uma linha do GridView
        protected void gvPedidos_RowCommand(object sender, GridViewCommandEventArgs e)
        {// Verifica se o comando é para atualizar o status do pedido
            if (e.CommandName == "AtualizarStatus")
            {// Obtém o ID do pedido a partir do CommandArgument
                int idPedido = Convert.ToInt32(e.CommandArgument);
                // Encontrar a linha do GridView
                int index = Convert.ToInt32(((GridViewRow)((Control)e.CommandSource).NamingContainer).RowIndex);
                GridViewRow row = gvPedidos.Rows[index];
                DropDownList ddl = (DropDownList)row.FindControl("ddlStatus");
                string novoStatus = ddl.SelectedValue;
                // Atualizar o status no banco de dados
                using (var ctx = new pizzafoodEntities())
                {// Encontrar o pedido pelo ID
                    var pedido = ctx.Pedidos.FirstOrDefault(p => p.Id == idPedido);
                    if (pedido != null)
                    {// Atualiza o status do pedido
                        pedido.Status = novoStatus;
                        ctx.SaveChanges();
                    }
                }

                // Recarregar lista
                CarregarPedidos();
            }
        }
    }
}
