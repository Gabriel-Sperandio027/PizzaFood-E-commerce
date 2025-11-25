using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using E_CommerceFood.Security;

namespace E_CommerceFood.admin
{
    public partial class DefaultAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            VerificacaoAcesso.VerificarAcessoAdmin(this);

            if (!IsPostBack)
            {
               
                UIHelper.SetNavbarUser(this);
            }

            UIHelper.SetNavbarUser(this);
        }
    }
}