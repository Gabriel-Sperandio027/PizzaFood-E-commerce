using E_CommerceFood.admin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Data.Entity;

namespace E_CommerceFood
{
    public class UsuarioDAO
    {
        internal static string CadastrarUsuario(Usuario usuario)
        {
            string mensagem = string.Empty;
            try
            {
                // O using aqui é padrão pra garantir que a conexão não fique aberta à toa consumindo memória do servidor
                using (var ctx = new pizzafoodEntities())
                {
                    ctx.Usuario.Add(usuario);
                    ctx.SaveChanges();
                }

                mensagem = "Usuário cadastrado com sucesso!";
            }
            catch (Exception ex)
            {
                mensagem = ex.Message;
            }


            return mensagem;
        }

        // Usado na tela de Login pra verificar se o usuário existe
        public static Usuario ListarUsuario(string login)
        {
            Usuario usuario = null;
            try
            {
                using (var ctx = new pizzafoodEntities())
                {
                    // Busca pelo login exato. Se não achar, retorna null e a tela de login avisa que os dados inseridos estão errados.
                    usuario = ctx.Usuario.FirstOrDefault(u => u.Login == login);
                }
            }
            catch (Exception ex)
            {
            }

            return usuario;
        }

        // Atualiza apenas a data/hora pra termos um log de atividade
        public static void SetUltimoAcesso(Usuario usuario)
        {
            try
            {
                using (var ctx = new pizzafoodEntities())
                {
                    Usuario user = ctx.Usuario.FirstOrDefault(
                        u => u.IdUsuario == usuario.IdUsuario);

                    user.DataUltimoAcesso = DateTime.Now;
                    ctx.SaveChanges();
                }
            }
            catch (Exception ex)
            {
            }
        }

        internal static string ExcluirUsuario(int id)
        {
            using (var ctx = new pizzafoodEntities())
            {
                string mensagem = "";
                try
                {
                    //Exclui os pedidos relacionados ao usuário
                    ctx.Database.ExecuteSqlCommand("DELETE FROM Pedidos WHERE IdUsuario = {0}", id);

                    //Busca o usuário pelo id
                    var usuario = ctx.Usuario.FirstOrDefault(u => u.IdUsuario == id);

                    if (usuario != null)
                    {
                        ctx.Usuario.Remove(usuario);
                        ctx.SaveChanges();
                        mensagem = "Usuário e pedidos excluídos com sucesso!";
                    }
                    else
                    {
                        mensagem = "Usuário não encontrado.";
                    }
                }
                catch (Exception ex)
                {
                    mensagem = ex.Message;
                }
                return mensagem;
            }
        }

        internal static List<Usuario> ListarUsuarios()
        {
            using (var ctx = new pizzafoodEntities())
            {
                // Retorna a lista completa pra Grid do Admin
                return ctx.Usuario.ToList();
                
            }
        }

        public static string BloquearUsuario(int id)
        {
            using (var ctx = new pizzafoodEntities())
            {
                try
                {
                    // Altera o status pra impedir o login, mas mantém os dados no banco
                    var usuario = ctx.Usuario.First(u => u.IdUsuario == id);
                    usuario.Status = true;
                    ctx.SaveChanges();
                    return "Usuário bloqueado com sucesso!";
                }
                catch (Exception ex)
                {
                    return ex.Message;
                }
            }
        }

        public static string AtivarUsuario(int id)
        {
            using (var ctx = new pizzafoodEntities())
            {
                try
                {
                    // Libera o acesso novamente
                    var usuario = ctx.Usuario.First(u => u.IdUsuario == id);
                    usuario.Status = false;
                    ctx.SaveChanges();
                    return "Usuário ativado com sucesso!";
                }
                catch (Exception ex)
                {
                    return ex.Message;
                }
            }
        }
    }

}
