using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using E_CommerceFood.Security;

namespace E_CommerceFood.admin
{
    public partial class FrmGerenciadorClientes : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            // Verifica se o usuário tem acesso de administrador
            VerificacaoAcesso.VerificarAcessoAdmin(this);
            // Carrega a lista de usuários apenas na primeira carga da página
            if (!IsPostBack)
            {
                ListarUsuarios();
                // Define o nome do usuário na barra de navegação
                if (Session["NomeUsuario"] != null)
                {
                    
                    try
                    {
                        // Encontra o controle lblNomeUsuario na página mestre
                        if (lblNomeUsuario != null)
                        {
                            lblNomeUsuario.InnerText = "Olá, " + Session["NomeUsuario"].ToString();
                        }
                    }
                    catch { }
                }
            }
        }

        // Lista todos os usuários na ListView
        private void ListarUsuarios()
        {
            // Usa o contexto do Entity Framework para buscar os usuários
            using (var ctx = new pizzafoodEntities())
            {
                // Projeta os dados necessários para a ListView
                var lista = ctx.Usuario
                    .Select(u => new
                    {
                        u.IdUsuario,
                        u.NomeUsuario,
                        u.Login,
                        u.DataCadastro,
                        Ativo = !u.Status,
                        Perfil = u.Perfil ? "Administrador" : "Usuário"
                    })
                    .ToList();
                // Vincula os dados à ListView
                lvUsuarios.DataSource = lista;
                lvUsuarios.DataBind();
            }
        }

        // Manipula os comandos da ListView para bloquear, ativar ou excluir usuários
        protected void lvUsuarios_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            // Obtém o ID do usuário a partir do CommandArgument
            int idUsuario = Convert.ToInt32(e.CommandArgument);
            // Executa a ação correspondente ao comando
            if (e.CommandName == "Bloquear")
            {
                UsuarioDAO.BloquearUsuario(idUsuario);
            }
            else if (e.CommandName == "Ativar")
            {
                UsuarioDAO.AtivarUsuario(idUsuario);
            }
            else if (e.CommandName == "Excluir")
            {
                UsuarioDAO.ExcluirUsuario(idUsuario);
            }

            ListarUsuarios();
        }

        // Botões de comando para bloquear, ativar e excluir usuários
        protected void btnBloquearUsuario_Command(object sender, CommandEventArgs e)
        {
            // Obtém o ID do usuário a partir do CommandArgument
            int id = Convert.ToInt32(e.CommandArgument);
            UsuarioDAO.BloquearUsuario(id);
            ListarUsuarios();
        }


        // Botão de comando para ativar usuário
        protected void btnAtivarUsuario_Command(object sender, CommandEventArgs e)
        {// Obtém o ID do usuário a partir do CommandArgument
            int id = Convert.ToInt32(e.CommandArgument);
            UsuarioDAO.AtivarUsuario(id);
            ListarUsuarios();
        }

        // Botão de comando para excluir usuário
        protected void btnExcluirUsuario_Command(object sender, CommandEventArgs e)
        {// Obtém o ID do usuário a partir do CommandArgument
            int id= Convert.ToInt32(e.CommandArgument);
            UsuarioDAO.ExcluirUsuario(id);
            ListarUsuarios();
        }

        // Evento disparado ao clicar no botão de cadastrar usuário
        protected void btnCadastrarUsuario_Click(object sender, EventArgs e)
        {
            // Verifica se está editando um usuário existente
            if (ViewState["IdUsuarioEditando"] != null)
            {
                // Salva as alterações do usuário existente
                SalvarEdicao();
                return;
            }
            // Cadastra um novo usuário
            if (txtSenha.Value != txtRepetirSenha.Value)
            {
                Response.Write("<script>alert('As senhas não coincidem!');</script>");
                return;
            }

            // Cadastra um novo usuário
            using (var ctx = new pizzafoodEntities())
            {
                // Cria um novo objeto de usuário
                E_CommerceFood.Usuario usuario = new E_CommerceFood.Usuario();
                // Define os atributos do usuário com base nos valores dos campos
                usuario.NomeUsuario = txtNomeUsuario.Value;
                usuario.Login = txtLogin.Value;
                usuario.Senha = Sha1Hasher.ComputeSha1Hash(txtSenha.Value);
                usuario.Email = txtEmail.Value;
                usuario.DataCadastro = DateTime.Now;
                usuario.Perfil = ddlPerfil.Value == "1";

                // Adiciona o usuário ao contexto e salva as alterações no banco de dados
                ctx.Usuario.Add(usuario);
                ctx.SaveChanges();
            }

            // Limpa campos
            txtNomeUsuario.Value = "";
            txtLogin.Value = "";
            txtSenha.Value = "";
            txtRepetirSenha.Value = "";
            txtEmail.Value = "";
            ddlPerfil.Value = "0";

            // Recarrega a tabela
            ListarUsuarios();
        }

        // Salva as edições feitas em um usuário existente
        private void SalvarEdicao()
        {
            // Obtém o ID do usuário que está sendo editado
            int id = Convert.ToInt32(ViewState["IdUsuarioEditando"]);
            // Atualiza os dados do usuário no banco de dados
            using (var ctx = new pizzafoodEntities())
            {
                // Busca o usuário pelo ID
                var usuario = ctx.Usuario.FirstOrDefault(u => u.IdUsuario == id);
                // Atualiza os atributos do usuário com os novos valores
                if (usuario != null)
                {
                    usuario.NomeUsuario = txtNomeUsuario.Value;
                    usuario.Login = txtLogin.Value;
                    usuario.Senha = Sha1Hasher.ComputeSha1Hash(txtSenha.Value);
                    usuario.Email = txtEmail.Value;
                    usuario.Perfil = ddlPerfil.Value == "1";

                    ctx.SaveChanges();
                }
            }

            // Limpa o estado e os campos
            ViewState["IdUsuarioEditando"] = null;
            // Limpa campos
            txtNomeUsuario.Value = "";
            txtLogin.Value = "";
            txtSenha.Value = "";
            txtRepetirSenha.Value = "";
            txtEmail.Value = "";
            ddlPerfil.Value = "0";

            ListarUsuarios();
        }
        // Botão de comando para editar usuário
        protected void btnEditarUsuario_Command(object sender, CommandEventArgs e)
        {// Obtém o ID do usuário a partir do CommandArgument
            int id = Convert.ToInt32(e.CommandArgument);
            // Carrega os dados do usuário para edição
            using (var ctx = new pizzafoodEntities())
            {// Busca o usuário pelo ID
                var usuario = ctx.Usuario.FirstOrDefault(u => u.IdUsuario == id);
                //  Preenche os campos com os dados do usuário
                if (usuario != null)
                {
                    // Preenche os campos com os dados do usuário
                    txtNomeUsuario.Value = usuario.NomeUsuario;
                    txtLogin.Value = usuario.Login;
                    txtSenha.Value = usuario.Senha;
                    txtRepetirSenha.Value = usuario.Senha;
                    txtEmail.Value = usuario.Email;
                    ddlPerfil.Value = usuario.Perfil ? "1" : "0";

                    // Salva o ID no ViewState para saber qual usuário está sendo editado
                    ViewState["IdUsuarioEditando"] = usuario.IdUsuario;
                }
            }
        }
    }
}