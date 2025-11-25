using System;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace E_CommerceFood
{
    public static class UIHelper
    {
        public static void SetNavbarUser(Page page)
        {
            if (page == null) return;
            if (page.Session == null) return;
            if (page.Session["NomeUsuario"] == null) return;

            var nome = page.Session["NomeUsuario"].ToString();
            var lbl = FindControlRecursive(page, "lblNomeUsuario") as HtmlGenericControl;
            if (lbl != null)
            {
                lbl.InnerText = "Olá, " + nome;
            }
        }

        private static Control FindControlRecursive(Control root, string id)
        {
            if (root == null) return null;
            var c = root.FindControl(id);
            if (c != null) return c;
            foreach (Control child in root.Controls)
            {
                var found = FindControlRecursive(child, id);
                if (found != null) return found;
            }
            return null;
        }
    }
}
