using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace E_CommerceFood.Security
{
    public class VerificacaoAcesso
    {
        public static void VerificarAcessoAdmin(Page page)
        {
            if (page.Session["Perfil"] == null)
            {
                HttpContext.Current.Response.Redirect("~/FrmLogin.aspx", false);
                HttpContext.Current.ApplicationInstance.CompleteRequest();
                return;
            }

            bool isAdmin;
            // Tenta converter de forma segura
            if (!bool.TryParse(page.Session["Perfil"].ToString(), out isAdmin) || !isAdmin)
            {
                HttpContext.Current.Response.Redirect("~/AcessoNegado.aspx", false);
                HttpContext.Current.ApplicationInstance.CompleteRequest();
                return;
            }
        }
    }
}