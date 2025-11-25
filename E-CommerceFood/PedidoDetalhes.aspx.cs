using System;
using System.Linq;
using System.Web.UI;

namespace E_CommerceFood
{
    // Classe responsável por exibir e controlar a visualização dos detalhes de um pedido específico.
    public partial class PedidoDetalhes : System.Web.UI.Page
    {
        //Garante que a lógica de busca de dados só execute no PRIMEIRO carregamento 
        // (evita repetição em PostBacks).
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Obtém o parâmetro de entrada (ID do pedido) da URL.
                string id = Request.QueryString["id"];
                if (int.TryParse(id, out int idPedido))
                {
                    // Inicia o Contexto do Entity Framework, que atua como a unidade de trabalho e repositório.
                    using (var ctx = new pizzafoodEntities())
                    {
                        // Acessa a coleção 'Pedidos',
                        //Usa 'Include("ItensPedido")' para carregar os detalhes do pedido e seus itens relacionados 
                        //Usa 'FirstOrDefault' para buscar o pedido cujo Id corresponde ao 'idPedido' fornecido.
                        var pedido = ctx.Pedidos.Include("ItensPedido").FirstOrDefault(p => p.Id == idPedido);
                        if (pedido != null)
                        {
                            //Atribui os dados do objeto 'pedido' aos Labels da página.
                            lblId.Text = pedido.Id.ToString();
                            lblUsuario.Text = pedido.IdUsuario.ToString();
                            lblData.Text = pedido.DataPedido?.ToString();
                            lblStatus.Text = pedido.Status;
                            // Formatação do valor total com duas casas decimais.
                            lblTotal.Text = pedido.ValorTotal.ToString("F2");

                            // Prepara a lista de itens do pedido para ser exibida em um controle de repetição (Repeater).
                            rptItensPedido.DataSource = pedido.ItensPedido.ToList();
                            // Vincula os dados ao controle RptItensPedido.
                            rptItensPedido.DataBind();
                        }
                    }
                }
            }

           
            UIHelper.SetNavbarUser(this);
        }

        // Redireciona o usuário de volta para a lista de pedidos.
        protected void btnVoltar_Click(object sender, EventArgs e)
        {
            Response.Redirect("MeusPedidos.aspx");
        }
    }
}
