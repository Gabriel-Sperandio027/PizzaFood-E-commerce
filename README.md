# PizzaFood-E-commerce

|TIPO USUARIO|LOGIN|SENHA|
|---|---|---|
|administrador|gabriel|123456789|
|usuario|joao|123456789|

# 🍕 **Pizza Food – Sistema de Delivery**  
### Plataforma de E-commerce e Painel Administrativo para Pizzarias

Projeto acadêmico desenvolvido para a disciplina de **Desenvolvimento Web (TADS)**. O sistema consiste em uma aplicação completa para gestão de vendas online de uma pizzaria, contemplando tanto a área pública (cliente) quanto um painel administrativo para gerenciamento interno do negócio.

---

## 📌 **Sobre o Projeto**

O **Pizza Food** foi construído utilizando a stack Microsoft, com foco em **arquitetura em camadas (DAO)**, segurança de dados e interface responsiva. Diferentemente de páginas estáticas, este sistema é totalmente dinâmico, integrando-se a um banco de dados **SQL Server** para manipulação e persistência das informações.

---

## ⚙️ **Principais Funcionalidades**

### 🛍️ **Área do Cliente (Front-end)**

- **Catálogo Dinâmico**  
  Listagem de pizzas e bebidas diretamente carregadas do banco de dados.

- **Carrinho de Compras**  
  Adição e remoção de itens, cálculo automático de valores e validação de estoque em memória.

- **Autenticação de Usuários**  
  Sistema de Login e Cadastro com validação completa dos campos.

- **Interface Responsiva**  
  Layout adaptável utilizando **Bootstrap 5**, incluindo carrossel de promoções.

---

### 🛠️ **Painel Administrativo (Back-end)**

- **Dashboard Intuitivo**  
  Navegação em Iframes integrada ao menu Offcanvas, permitindo gerenciamento sem recarregamento da estrutura principal.

- **Gestão de Produtos**  
  CRUD completo para pizzas e bebidas, com upload de imagens e definição de preços.

- **Gerenciamento de Usuários**  
  - Listagem de clientes e administradores.  
  - Sistema de ativação/bloqueio (Soft Delete/Status).  
  - Exclusão com tratamento de integridade referencial (remoção de pedidos associados antes de excluir o usuário).

- **Segurança do Sistema**  
  Controle de acesso baseado em perfis (Administrador x Usuário) e criptografia de senhas via SHA1.

---

## 🧩 **Tecnologias Utilizadas**

- **Linguagem:** C#  
- **Framework Web:** ASP.NET Web Forms  
- **ORM:** Entity Framework (Database First)  
- **Banco de Dados:** SQL Server  
- **Front-end:** HTML5, CSS3, Bootstrap 5.3  
- **Segurança:** Criptografia SHA1  

---

## 🗂️ **Estrutura do Projeto**

O projeto segue uma organização voltada para fácil manutenção e escalabilidade:

- **DAO (Data Access Object):**  
  Camada responsável pela comunicação com o banco de dados  
  (ex.: `ProdutoDAO.cs`, `UsuarioDAO.cs`).

- **Security:**  
  Classes de controle de acesso e criptografia  
  (ex.: `Sha1Hasher.cs`).

- **Admin:**  
  Páginas acessíveis apenas a administradores para gerenciamento do sistema.

- **Imagens / CSS:**  
  Recursos estáticos e estilos personalizados.

---

<p align="center">
  <strong>Desenvolvido por aluno do 4º Período de TADS.</strong>
</p>
