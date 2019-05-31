DROP TABLE veiculo CASCADE CONSTRAINTS;
drop table funcionario;
drop table motorista;
drop table pneus;
drop table manutencao;
drop table seguros;
drop table abastecimento;
DROP TABLE gerente CASCADE CONSTRAINTS;
drop table relatorio;
drop table avisos;


-- VEICULOS E SUAS LIGACOES 
create table veiculo( 
placa varchar2(10), 
km number(38), 
tipo varchar2(40), 
cor varchar2(25), 
modelo varchar2(25), 
chassi varchar2(30), 
disponibilidade number(2), 
primary key(placa) 
);
    -- TABELA PNEUS
create table pneus( 
n_seq number(10), 
placa varchar2(10) not null, 
tipo varchar2(15), 
aro varchar2(10), 
qnt number(20), 
primary key(n_seq),
FOREIGN KEY (placa) 
REFERENCES veiculo(placa) 
);
    -- TABELA MANUTENÇÃO
create table manutencao( 
cod_seq number(10), 
placa varchar2(10) not null, 
m_data date, 
servico varchar2(40), 
valor number(20,2), 
primary key(cod_seq),
FOREIGN KEY (placa) 
REFERENCES veiculo(placa) 
);
    -- TABELA ABASTECIMENTO
create table abastecimento( 
cod_seq number(10), 
placa varchar2(10) not null, 
a_data date, 
posto varchar2(40), 
tipo varchar2(20), 
valor number(20,2), 
valor_por_litros number(20,2),
primary key(cod_seq),
FOREIGN KEY (placa) 
REFERENCES veiculo(placa) 
);
    -- TABELA SEGURO
create table seguros( 
cod_seguro number(10), 
placa varchar2(10) not null, 
seguradora varchar2(20), 
apolice varchar2(20),
desc_seguro varchar2(140),
primary key(cod_seguro),
FOREIGN KEY (placa) 
REFERENCES veiculo(placa) 
);

-- TABELA FUNCIONARIO COM SUA GENENERALIZAÇÕES 
create table funcionario( 
cpf varchar2(11) not null, 
nome varchar2(50), 
celular varchar2(11), 
pis varchar2(20), 
tipo number(2), 
admissao date, 
primary key (cpf) 
);
create table motorista( 
cpf varchar2(11) not null, 
nome varchar2(50), 
celular varchar2(11), 
pis varchar2(20), 
admissao date, 
cnh varchar2(20), 
vencimento_cnh date, 
disponibilidade number(2), 
primary key (cpf) 
);

create table gerente( 
cpf varchar2(11) not null, 
nome varchar2(50), 
celular varchar2(11), 
pis varchar2(20), 
admissao date, 
primary key (cpf) 
);

create table avisos( 
n_seq number(10), 
titulo varchar2(20), 
cpf varchar2(11) not null, 
recado varchar2(100), 
hora varchar2(20),
a_data date,
primary key(n_seq),
FOREIGN KEY (cpf) 
REFERENCES gerente(cpf) 
);

create table relatorio( 
n_seq number(10), 
titulo varchar2(20), 
cpf varchar2(11) not null, 
conteudo varchar2(100), 
r_data date,
primary key(n_seq),
FOREIGN KEY (cpf) 
REFERENCES gerente(cpf) 
);


insert into veiculo values ('abc-1234',440,'caminhao','azul','Volvo t-b9','eksf8548ge8',2);
INSERT INTO pneus(n_seq,placa,tipo,aro,qnt) VALUES (2,'abc-1234','caminhao','e 230-ee',3);
select * from veiculo;
select * from pneus;
delete from pneus where placa = 'abc-1234';
delete from veiculo where placa = 'abc-1234';