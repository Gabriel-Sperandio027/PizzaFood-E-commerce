using System;

namespace E_CommerceFood.admin
{
    // Classe que espelha a tabela de Usuários do banco de dados.
    internal class Usuario
    {
        public Usuario()
        {
        }

        // Propriedades mapeadas das colunas da tabela.
        // O set é internal pra evitar que classes de fora do namespace alterem os dados diretamente.
        public string NomeUsuario { get; internal set; }
        public string Login { get; internal set; }
        public string Email { get; internal set; }
        public DateTime DataCadastro { get; internal set; }
        public string Senha { get; internal set; }

        // Usei DateTime (nullable) aqui porque, quando o usuário acaba de se cadastrar,
        // ele ainda não tem um "último acesso". O banco aceita NULL, então o C# precisa aceitar também.
        public DateTime? DataUltimoAcesso { get; set; }

        // Define a permissão (Admin ou Cliente).
        // Boolean foi a forma mais simples de resolver o controle de acesso sem criar tabela de perfis.
        public bool Perfil { get; set; }
    }
}