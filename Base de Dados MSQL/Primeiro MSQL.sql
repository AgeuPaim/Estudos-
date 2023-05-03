create database aulaBD;
use aulaBD;
create table TBL_Cliente(
id_Cliente int auto_increment not null primary key,
nome varchar (30),
telefone varchar (30),
debitos double);

select* from TBL_Cliente where debitos >= "2.5";

insert into TBL_Cliente (nome, telefone,debitos) Values ("joão", "927390020", "2.50");




