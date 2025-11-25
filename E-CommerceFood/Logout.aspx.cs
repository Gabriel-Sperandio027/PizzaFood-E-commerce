using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_CommerceFood
{
    
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Limpa a sessão do usuário
            Session.Clear();
            Session.Abandon();

            // Redireciona para o login
            Response.Redirect("~/FrmLogin.aspx");
        }
    }
}