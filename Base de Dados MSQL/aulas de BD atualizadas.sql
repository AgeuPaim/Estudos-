
/*  Melhorar a performace da mesma database incluindo formato tf8 com assentuações do português ou 
linguas derivadas do latin.*/

create database cadastro
default character set utf8
default collate utf8_general_ci;

create table pessoas (
nome varchar (30) not null,
nascimento date,
sexo enum ('M', 'F'),
peso decimal (5,2),
altura decimal (3,2),
nacionalidade varchar(20) default 'Brasil'
) default charset = utf8;
alter table pessoas
add id int not null auto_increment
primary key (id);
desc pessoas;

insert into pessoas
(nome, nascimento, sexo, peso, altura, nacionalidade)
values 
('Maria','1999-12-30','F','55.2','1.55','Portugal'),
('Creuza','1920-12-20','F','50.2','1.65',Default),
('Adalgiza','1930-11-02','F','63.2','1.75','Irlanda'),
('Claudio','1987-11-22','M','99.0','2.15',Default),
('Pedro','1999-12-03','M','87','2.0', Default),
('Janaina','1987-11-22','F','75.4','1.66','EUA');
insert into pessoas
(nome, nascimento, sexo, peso, altura, nacionalidade)
values 
('Godofedro','1984-01-02','M','70.5','1.83','default');
desc pessoas;
select *from pessoas;
/*alter table modifica a coluna pode ter varias funções no caso o ADD adiciona, o 
drop elimina*/

alter table pessoas 
add column profissao varchar (10);

alter table pessoas 
drop column profissao;
/* vamos adicionar a coluna profissão noutro local após o nome*/
alter table pessoas 
add column profissao varchar (10) after nome;

/* vamos adicionar a coluna em primeiro lugar uso o first caso não coloco nada 
a coluna vai para o fim*/
alter table pessoas 
add column codigo int first;
/* O comando modify modifica as constrains ou sejas as regras ou variaveis
no exemplo abaixo modifiquei na coluna profição de varchar 10 para 20*/
alter table pessoas 
modify column profissao varchar (20);
select * from pessoas;
/*Modifico o nome das colunas, tipo primitivo e também as constrains 'o tipo das variaveis eg int 
etc' uso o alter table nome da coluna e alter table change nome da coluna antigo nome novo e o tipo de constrains que pode ser
a mesma ou outra*/
alter table pessoas
change column profissao Prof varchar(20);
desc pessoas;
/*Reonomear a tabela, sempre uso o alter table rename to*/
alter table pessoas
 rename to Gafanhoto;
desc Gafanhoto;
/* o campo if not exists só acontece se ela não existe caso contraio sobrepõe o que já existe */
create table if not exists cursos(
nome varchar(30) not null unique,
descricao text,
carga int unsigned,
totaulas int,
ano year default '2016'
) default charset = utf8;

/*não consigo introduzir PK uma coluna que havia esquecido na tbela criada de uma unica vez
primeiro adiciono a coluna com alter table e depois posso com altero para PK)*/
alter table cursos
add column idcurso int first;
/* adicionando uma chave primaria numa tabela existente*/
alter table cursos
add primary key (idcurso);

/*apagar a tabela é uso o drop, o drop pode ser um comando como pode ser usado no alter table
para apagar colunas, atenção que quando usado sozinho ele pode apagar tanto tabela como base de dados*/
/* o drop pode ser parametro do alter table para alterar colunas ou eliminas 
ou pode ser usado como comando para apagar a tabela como um todo por exemplo drop table curso; apaga a tabela 
curso*/

create table if not exists teste(

id int,
idade int,
nome varchar(40)
);


insert into teste
(id, idade,nome)

values
('Ageu Paim','2','5'),
('Carmen Paim','2','5'),
('Asiel Paim','2','5'),
('Abiel Paim','2','5'),
('Amiel Paim','2','5'),
('Leonor Cardoso','2','5');

drop table teste
desc teste

/* Manipulação de registos linhas ou tuplas é a mesma coisa delete e truncate aula 7 */

select * from cursos;

insert into cursos
		(idcursos,nome,descricao,carga,totaulas,ano)
 values (1,'HTML4','Curso de HTML5','48','37','2014');
 
insert into cursos
		(idcursos,nome,descricao,carga,totaulas,ano)
values  (2,'Algoritimos','Lógica de programação','20','15','2014'),
		(3,'Photoshop','Dicas de Photoshop CC','10','8','2014'),
		(4,'PGP', 'Curso de PHP para iniciantes','40','20','2010'),
		(5,'Jarva', 'introdução a Linguagem JAva','10','29','2000'),
		(6,'MSQL', 'bancos de dados MSQL','30','15','2016'),
		(7,'Word', 'Curso completo de Word','40','30','2016'),
		(8,'Sapateado', 'Danças Ritimicas','40','30','2018'),
		(9,'Cosingaarabe', 'aprenda a fazer Kibe','40','30','2018'),
		(10,'Youtuber', 'Gerar Polemica e ganhar inscritos','5','2','2018');
desc cursos
select * from cursos

/*Não é possivel manipular varias llinhas ao mesmo tempo mas posso manipular varias colunas na mesma linha
uso o comando update nome da tabela o campo alterar e onde quero a alteração*/
update cursos
set nome = 'HTML5'
where idcurso = '1';


/* alterar 2 campos na mesma linha e em colunas diferentes o where refere-se sempre da chave primaria para naão falharisso 
porque altera apenas uma unica linha, caso contrario pode afetar outras linhas*/

update cursos
set nome ='PHP', ano ='2015'
where idcurso = '4';

select * from cursos

update cursos
set nome ='Java', carga= '40', ano ='2015' /*  vai mudar os 3 campos assinalados */
where idcurso = '5'
limit 1; /*limita a atuação em apenas uma linha*/

/*alterando 3 linhas aonde possui ano= 2018 atenção que sempre que pretendo alterar devo retiraro limit*/
update cursos
set ano ='2050', carga ='800' /*  vai mudar os 2 campos assinalados e separados com ,  */
where ano = '2018';

/*  vai mudar os 2 campos assinalados e separados com ,  */
update cursos
set ano ='2018', carga= '0' /*  vai mudar os 2 campos assinalados e separados com ,  */
where ano = '2050'
limit 1; /*  apesar de serem 3 linhas com o ano 2050, com o limit ele apenas altera a 1 linha */

/*  comando para apagar sem deixar nada é o delete apesar de o update também apagar ele deixa oscampos em null ou vasio 
se eu quiser eliminar uma linha devo usar o delete */
/*edit> perferences> sql editor> selecionar o save UPdate box no fim para ele limitar a alteração em varias linhas
é uma proteção do workbench que depois devo abilitar*/

delete from cursos 
where idcurso = '8'; /*apagar a linha 8*/

delete from cursos 
where ano = '2050'
limit 2; /*  o limit uma vez mais permite alterar apenas nas linhas definidas no caso as primeiras duas linhas*/

select * from cursos

/* remover as todas as linhas de uma tabela uso o comando truncate*
A # entre o trancate e o Drop é que drop apaga a extrutura da tabela e truncate apenas os dado deixando a tabela vazia
já o drop não fica nem a conteudo ou linhas nem a extrutura*/
create table if not exists teste(

id int,
idade int,
nome varchar(40)
);


insert into teste
(nome, idade,id)

values
('Ageu Paim','2','5'),
('Carmen Paim','2','5'),
('Asiel Paim','2','5'),
('Abiel Paim','2','5'),
('Amiel Paim','2','5'),
('Leonor Cardoso','2','5');
truncate table teste; /* ele apaga a tabela 

select * from teste;
/*
DDL  data definiton LAnguage(Creat dabase, create table, alter table, drop table)
DML data Manipulation Language (insert into, update, delete,truncate)
*/

/***** Aulanº 8 Gerenciando copias de segurança do base de aula MSQL
como exportar os scrip para uma pen e voltar a usar o mesmo script  vou a server> data export> *****/
select * from cursos;

desc gafanhoto;

select * from gafanhoto;

desc cursos;


drop database world


























