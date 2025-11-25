using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_CommerceFood
{

    // Página de login do usuário
    public partial class FrmLogin : System.Web.UI.Page
    {
        // Evento disparado ao carregar a página
        protected void Page_Load(object sender, EventArgs e)
        {
            // Se o usuário já estiver logado, redireciona conforme o perfil
            if (Session["Perfil"] != null)
            {
                bool perfil = (bool)Session["Perfil"];
                if (perfil)
                    Response.Redirect("~/admin/DefaultAdmin.aspx");
                else
                    Response.Redirect("~/Default.aspx");
            }
        }

        // Evento disparado ao clicar no botão de login
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            // Obtém os valores dos campos de login e senha
            string login = txtLogin.Value;
            string senha = txtSenha.Value;
            //  Verifica se os campos estão preenchidos
            if (String.IsNullOrEmpty(login) ||
                   String.IsNullOrEmpty(senha))
            {
                // Exibe mensagem de erro se algum campo estiver vazio
                lblMensagem.Text = "Você precisa preencher todos os campos!";
                return;
            }
            //  Hash da senha usando SHA1
            string hashSenha = Sha1Hasher.ComputeSha1Hash(senha);
            // Verifica as credenciais do usuário no banco de dados
            using (var ctx = new pizzafoodEntities())
            {
                // Busca o usuário com o login e senha fornecidos
                var usuario = ctx.Usuario.FirstOrDefault(u => u.Login == login && u.Senha == hashSenha);

                // Se o usuário não for encontrado, exibe mensagem de erro
                if (usuario == null)
                {
                    lblMensagem.Text = "Login ou senha incorretos!";
                    return;
                }
                // Verifica se o usuário está bloqueado
                if (usuario.Status == true)
                {
                    lblMensagem.Text = "Seu usuário está bloqueado.";
                    return;
                }

                // Salva informações do usuário na sessão
                Session["idUsuario"] = usuario.IdUsuario; // <--- garante id usado ao finalizar pedido
                Session["NomeUsuario"] = usuario.NomeUsuario;
                Session["Perfil"] = usuario.Perfil;

                // Redireciona o usuário conforme o perfil
                if (usuario.Perfil == true)
                    Response.Redirect("~/admin/DefaultAdmin.aspx");
                else
                    Response.Redirect("~/Default.aspx");

            }
        }
    }
}