Projetos BlusaBlusas.

Sistema interno de administração e análise da loja online BlusaBlusas.

Descrição:

O Projeto BlusaBlusas é um modelo interno de gestão e administração das principais informações e valores da loja online 'blusablusas'.Trata-se de um sistema que possibilita: cadastros de funcionários e produtos,consultas de vendas, usuários cadastrados no sistemas, funcionários e movimentações financeiras em determinados períodos. Além disso, possui seis relatórios para análise de produtos mais vendidos, vendas por cliente, as principais formas de pagamentos realizados nas vendas, os estados com mais usuários cadastrados, as deletações-produtos,pessoas e vendas. O sistema também promove uma segurança nos acessos, com os cadastros e atualizações de login e senha, separando os usuários que podem acessar em 'Normal' ou 'Admin'.

Demonstrações(---------------------------)

Funcionalidades

Dashboard

A tela inicial que  resume as principais informações da loja blusablusas, o objetivo da tela home é apresentar ao usuário seja ele normal ou administrador conhecimentos e o estado da loja, há quatro painéis-receitas,total de produtos ativos no estoque,número de vendas e funcionários ativos cadastrados no sistema.Além disso, possuí três tabelas: estoque critico-produtos que estão abaixo de dez quantidades no estoque- ultimas vendas-ultimas cinco vendas feitas- e aniversariantes do mês atual. Por fim a tela possui uma parte menu que possibilita o ingresso às outras telas.

Cadastro de Funcionários

A tela de Cadastro de Funcionários possibilita o salvar novos funcionários, editar funcionários e deletar funcionários. Possui um campo para preenchimento do nome,email de usuário,salário,cpf,gênero,data de nascimento,cargo, matrícula,código e situação. E também possui uma tabela com esses campos sendo colunas, possibilitando a consulta e as atualizações necessárias. 

Cadastro de produtos
(--------------------)


Consultas
Dividida em quatro consultas, a primeira é a consulta de usuários/clientes cadastrados no sistema da loja blusablusa, possibilita a visualização do código de usuário,nome,email,cpf,gênero  sua situação como usuário, ao clicar em uma dessa linhas o usuário selecionado gerará informações de endereço e telefone, representados nas tabelas em baixo da tabela principal de usuário. A segunda trata-se da consulta de vendas com um campo de filtragem por data, uma tabela com código da venda, cliente, cpf do cliente,data da compra e valor da venda, ao clicar em uma das linhas podemos informações sobre os itens que foram comprados nessa venda, a parte financeira da venda como o tipo de pagamento e o valor, além das informações da nota fiscal. A terceira trata-se da consulta de movimentações financeiras feitas em um determinado período que é feita pela filtragem de data inicial e data final, ainda possuí a opção de visualização de entrada e saída. além de um calculo feito através da diferença dos valores que entraram e saíram.(tela funcionário----------------------)

Relatórios

Possuí seis relatórios, cada contendo campos de filtragem, uma tabela de visualização e gráficos relacionados a tabela.Relatório de produtos mais vendidos: possibilita filtra por produtos, uma tabela com três colunas denominação do produto,quantidade de Vendas e Código do Produto e um gráfico que representar visualmente os produtos mais vendidos.Relatório de vendas por cliente: possibilita filtra por cpf, uma tabela com cinco colunas- denominação do usuário,cpf do usuário,email do usuário, código do usuário e valor total que esse usuário fez na loja e um gráfico que representar visualmente os usuários que mais compraram na loja. Relatório dos tipos pagamentos feitos: possibilita filtra por tipo de pagamento, uma tabela com três colunas-o tipo de pagamento, os valores que esse tipo movimentou e a quantidade de vezes que ele foi utilizado e um gráfico que representar visualmente os tipos de pagamento mais feitos na loja.Estados(------------------------------).Relatório de estoque : possibilita filtra por produto, uma tabela com cinco colunas- código do produto,denominação do produto quantidade em estoque do produto,preço do produto e sua situação,ativo ou inativo, e um gráfico que representar visualmente os produto em maiores ou menores quantidades.Relatório de deletações, contendo três tabelas com pessoas deletadas, produtos deletadas e vendas deletadas.

Controle de Acesso

Dividida em três processos, o primeiro e o cadastro de usuário, com ele tenho um email e uma senha, que inicialmente é uma senha padrão. Esse cadastro é feita em uma tela de cadastro com campos de não preenchimento: código e usuários, e campos que possibilita o preenchimento com situacao e tipo (admin ou normal), ao ser cadastrado o usuário tem dois tipos de relacionamento com o sistema: caso seja normal, terá acesso apenas a consultas, tela home e relatórios.Mas se for admin terá acesso a todas as funcionalidades do sistemas, incluindo os cadastros.O acesso é restrito aos funcionários que ao se cadastrarem, no primeiro acesso terão a possibilidade de resetar senha, pois com a senha padrão eles serão automaticamente levados a tela de resetar senha onde poderão criar uma nova senha e assim ter acesso ao sistema. Ao entrarem no sistema o botão em vermelho "Sair" para deslogar da sua conta.

Tecnologias utilizadas

Java 11-Linguagem principal do projeto
NetBeans-Ambiente de desenvolvimento
Mysql-Banco de dados Relacional.
SQL-Linguagem para criação de tabelas,inserção e consultas de dados.
brModelo-Modelagem do banco de Dados Relacional
jDBC-Conexão entre o java e o mysql
Java Swing-Interface Gráfica(GUI)
JFreeChart- Biblioteca que possibilita a construção de gráficos.


Requisitos 

JDK instalada
NetBeans IDE
Mysql instalado e rodando
DriverJDBC
Biblioteca JFreeChart instalada
Linguagem Java compatível
Conexão correta com o Banco de Dados(Url,usuário,senha)

Instalação e execução

Baixar o arquivo zip (----------)
Descompactar o projeto zip(-------------)
importar o projeto descompactado(----------------------)
Baixar o Dump do banco de dados(--------------)
Criar um novo Banco, e usá-lo.
Colocar o conteúdo Dump para rodar no mysql,
Conectar na classe (-------------).java o banco de dados criado.

(video-----------------------------------------)

Autor:

Nome Completo: Vitor Pessoa Silva
Curso: Curso técnico de desenvolvimento de sistemas
Email Pessoa: vitorsilvapessoa97@gmail.com
Github: https://github.com/Vit-Pe0208
Email Institucional: vitor55679526@edu.df.senac.br











  



