using E_CommerceFood;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_CommerceFood
{
    public partial class FrmUsuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bool isAdmin = false;

                if (Session["Perfil"] != null)
                {
                    isAdmin = Convert.ToBoolean(Session["Perfil"]);
                }

                var listaUsuarios = UsuarioDAO.ListarUsuarios() as List<Usuario>;

                bool primeiroUsuario = listaUsuarios == null || listaUsuarios.Count == 0;

                // Mostrar dropdown se for o primeiro usuário OU se o usuário logado for admin
                ddlPerfil.Visible = primeiroUsuario || isAdmin;


            }
        }

        // Evento de clique do botão Cadastrar
        protected void btnCadastrar_Click(object sender, EventArgs e)
        {
            // Obter valores dos campos
            var senha = txtSenha.Value;
            var RepSenha = txtRepetirSenha.Value;

            // Validação de campos obrigatórios
            if (string.IsNullOrWhiteSpace(txtNomeUsuario.Value) ||
                string.IsNullOrWhiteSpace(txtLogin.Value) ||
                string.IsNullOrWhiteSpace(txtEmail.Value) ||
                string.IsNullOrWhiteSpace(senha) ||
                string.IsNullOrWhiteSpace(RepSenha))
            {
                //Obriga o usuário a preencher todos os campos
                lblMensagem.InnerText = "Preencha todos os campos obrigatórios.";
                return;
            }
            // Validação de formato de e-mail
            if (!txtEmail.Value.Contains("@"))
            {
                //Caso o e-mail não contenha o caractere '@', exibe mensagem de erro
                lblMensagem.InnerText = "Formato de e-mail inválido.";
                return;
            }

            // Verificação de e-mail duplicado
            var listaUsuarios = UsuarioDAO.ListarUsuarios() as List<E_CommerceFood.Usuario>;

            // Se a lista não for nula e contiver um usuário com o mesmo e-mail, exibe mensagem de erro
            if (listaUsuarios != null && listaUsuarios.Any(u => u.Email.Equals(txtEmail.Value, StringComparison.OrdinalIgnoreCase)))
            {
                //Avisa que o e-mail já está cadastrado
                lblMensagem.InnerText = "Este e-mail já está cadastrado.";
                return;
            }
            // Verificação de login duplicado
            if (senha.Equals(RepSenha))
            {
                // Verifica se o login já existe
                E_CommerceFood.Usuario usuario = new E_CommerceFood.Usuario();
                usuario.NomeUsuario = txtNomeUsuario.Value;
                usuario.Login = txtLogin.Value;
                usuario.Email = txtEmail.Value;

                // Define o perfil com base na seleção do dropdown
                if (ddlPerfil != null && ddlPerfil.Value == "1")
                {
                    usuario.Perfil = true; 
                }
                // Se o dropdown não estiver visível ou não for selecionado como admin, define como usuário comum
                else
                {
                    usuario.Perfil = false;
                }
                // Define outros atributos do usuário
                usuario.DataCadastro = DateTime.Now;
                // Hash da senha antes de salvar
                usuario.Senha = Sha1Hasher.ComputeSha1Hash(senha);
                // Chama o método para cadastrar o usuário
                string mensagem = UsuarioDAO.CadastrarUsuario(usuario);
                LimparDados();
                lblMensagem.InnerText = mensagem;
                //  Redireciona para a página de login se o cadastro for bem-sucedido
                if (mensagem.Contains("sucesso") || mensagem.Contains("cadastrado"))
                {
                    Response.Redirect("~/FrmLogin.aspx");
                }
            }

            else
            {
                //Exibir mensagens sobre as senhas 
                lblMensagem.InnerText = "As senhas não conferem!";
                return;
            }
        }

        // Limpa os dados dos campos
        private void LimparDados()
        {
            txtNomeUsuario.Value = "";
            txtLogin.Value = "";
            txtEmail.Value = "";
            txtSenha.Value = "";
            txtRepetirSenha.Value = "";

        }

        // Evento de clique do botão Limpar Campos
        protected void btnLimparCampos_Click(object sender, EventArgs e)
        {
              LimparCampos("Campos Limpos com sucesso!");
        }

        // Limpa os campos e exibe a mensagem passada como parâmetro
        private void LimparCampos(string mensagem)
        {
            lblMensagem.InnerText = mensagem;
            txtNomeUsuario.Value = "";
            txtLogin.Value = "";
            txtSenha.Value = "";
            txtRepetirSenha.Value = "";
            txtEmail.Value = "";
        }
    }
}
