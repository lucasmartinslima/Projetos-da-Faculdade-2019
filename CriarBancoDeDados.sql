DROP TABLE veiculo CASCADE CONSTRAINTS;
drop table funcionario;
drop table motorista CASCADE CONSTRAINTS;
drop table pneus;
drop table manutencao;
drop table seguros;
drop table abastecimento;
DROP TABLE gerente CASCADE CONSTRAINTS;
drop table relatorio;
drop table avisos;
drop table utiliza;
drop table entrada_saida;
drop table viagens;
drop table multa;
drop table locatario CASCADE CONSTRAINTS;
drop table veiculo_alugado;


-- VEICULOS E SUAS LIGACOES 

create table locatario( 
cpf varchar2(11) not null, 
nome varchar2(50), 
cnh varchar2(20), 
primary key (cpf) 
);

create table veiculo( 
placa varchar2(10) not null, 
km number(38), 
tipo varchar2(40), 
cor varchar2(25), 
modelo varchar2(25), 
chassi varchar2(30), 
disponibilidade number(2), 
primary key(placa) 
);
create table veiculo_alugado( 
placa varchar2(10) not null, 
km number(38), 
tipo varchar2(40), 
cor varchar2(25), 
modelo varchar2(25), 
chassi varchar2(30), 
disponibilidade number(2), 
data_locacao date,
data_devolucao date,
cpf_locatario varchar2(11),
primary key(placa),
foreign key (cpf_locatario) references locatario(cpf)
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


create table utiliza(
cpfMotorista varchar2(11) not null,
placaVeiculo varchar2(10) not null,
data_f date primary key,
FOREIGN KEY (cpfMotorista) REFERENCES motorista(cpf),
FOREIGN KEY (placaVeiculo) REFERENCES veiculo(placa)
);


create table entrada_saida(
n_seq number(38),
fk_cpfMotorista varchar2(11) not null,
fk_placaVeiculo varchar2(10) not null,
hora varchar(10),
entrada_saida number(1),
dataES date,
primary key(n_seq),
FOREIGN KEY (fk_cpfMotorista) REFERENCES motorista(cpf),
FOREIGN KEY (fk_placaVeiculo) REFERENCES veiculo(placa)
);

create table viagens(
n_seq number(38),
dataV date,
km number(28),
situacao varchar2(1),
rota varchar2(50),
data_partida date,
data_chegada date,

fk_placa varchar2(10) not null,
fk_cpf varchar2(11) not null,
FOREIGN KEY (fk_cpf) REFERENCES motorista(cpf),
FOREIGN KEY (fk_placa) REFERENCES veiculo(placa)

);

create table multa(
cod_seq number(38),
dataM date,
valor number(28,2),
cod_infracao varchar2(15),
gravidade varchar2(10),
descricao_multa varchar2(150),
status_pagamento varchar2(1),
localM varchar2(40),

fk_placa varchar2(10) not null,
fk_cpf varchar2(11) not null,
FOREIGN KEY (fk_cpf) REFERENCES motorista(cpf),
FOREIGN KEY (fk_placa) REFERENCES veiculo(placa)

);




insert into veiculo values ('abc-1234',440,'caminhao','azul','Volvo t-b9','eksf8548ge8',2);
INSERT INTO pneus(n_seq,placa,tipo,aro,qnt) VALUES (2,'abc-1234','caminhao','e 230-ee',3);
select * from veiculo;
select * from pneus;
delete from pneus where placa = 'abc-1234';
delete from veiculo where placa = 'abc-1234';