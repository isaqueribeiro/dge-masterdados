


/*------ SYSDBA 25/04/2014 14:45:37 --------*/

ALTER TABLE SYS_SISTEMA
    ADD SIS_ATUALIZACAO DMN_DATETIME;

COMMENT ON COLUMN SYS_SISTEMA.SIS_ATUALIZACAO IS
'Data/Hora da ultima atualizacao';




/*------ SYSDBA 25/04/2014 14:46:54 --------*/

COMMENT ON TABLE SYS_SISTEMA IS 'Tabela Sistema.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   25/04/2014

Tabela responsavel por armazenar dados sobre o(s) sistema(s) com conexao a base.';




/*------ SYSDBA 08/05/2014 17:47:19 --------*/

ALTER TABLE TBPRODUTO
    ADD MOVIMENTA_ESTOQUE DMN_LOGICO DEFAULT 1;

COMMENT ON COLUMN TBPRODUTO.MOVIMENTA_ESTOQUE IS
'Movimenta Estoque:
0 - Nao
1 - Sim';




/*------ SYSDBA 09/05/2014 14:00:26 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_VCHAR_50'
where (RDB$FIELD_NAME = 'TIPODESP') and
(RDB$RELATION_NAME = 'TBTPDESPESA')
;




/*------ SYSDBA 09/05/2014 14:00:31 --------*/

COMMENT ON COLUMN TBTPDESPESA.COD IS
'Codigo';




/*------ SYSDBA 09/05/2014 14:00:37 --------*/

COMMENT ON COLUMN TBTPDESPESA.TIPODESP IS
'Descricao';




/*------ SYSDBA 09/05/2014 14:06:33 --------*/

CREATE TABLE TBPLANO_CONTA (
    EMPRESA DMN_CNPJ NOT NULL,
    CODIGO DMN_BIGINT_NN NOT NULL,
    DESCRICAO_COMPLETA DMN_VCHAR_250,
    DESCRICAO_RESUMIDA DMN_VCHAR_100);

ALTER TABLE TBPLANO_CONTA
ADD CONSTRAINT PK_TBPLANO_CONTA
PRIMARY KEY (CODIGO,EMPRESA);

COMMENT ON COLUMN TBPLANO_CONTA.EMPRESA IS
'Empresa';

COMMENT ON COLUMN TBPLANO_CONTA.CODIGO IS
'Codigo';

COMMENT ON COLUMN TBPLANO_CONTA.DESCRICAO_COMPLETA IS
'Descricao completa';

COMMENT ON COLUMN TBPLANO_CONTA.DESCRICAO_RESUMIDA IS
'Descricao resumida';




/*------ SYSDBA 09/05/2014 14:06:34 --------*/

COMMENT ON TABLE TBPLANO_CONTA IS 'Tabela Plano de Contas (Contabilidade).

    Autor   :   Isaque Marinho Ribeiro
    Data    :   09/05/2014

Tabela responsavel por armazenar o plano de contas adotado pela empresa. Informacoes estas lancadas pela Contabilidade.';

GRANT ALL ON TBPLANO_CONTA TO "PUBLIC";



/*------ SYSDBA 09/05/2014 14:07:12 --------*/

CREATE DOMAIN DMN_BIGINT_N AS
INTEGER;


/*------ SYSDBA 09/05/2014 14:07:22 --------*/

ALTER TABLE TBTPDESPESA
    ADD PLANO_CONTA DMN_BIGINT_N;




/*------ SYSDBA 09/05/2014 14:08:35 --------*/

ALTER TABLE TBPLANO_CONTA DROP CONSTRAINT PK_TBPLANO_CONTA;




/*------ SYSDBA 09/05/2014 14:08:44 --------*/

ALTER TABLE TBPLANO_CONTA DROP EMPRESA;




/*------ SYSDBA 09/05/2014 14:08:53 --------*/

ALTER TABLE TBPLANO_CONTA
ADD CONSTRAINT PK_TBPLANO_CONTA
PRIMARY KEY (CODIGO);




/*------ SYSDBA 09/05/2014 14:10:57 --------*/

ALTER TABLE TBPLANO_CONTA
    ADD EXERCICIO DMN_SMALLINT_NN DEFAULT 0,
    ADD GRUPO DMN_SMALLINT_NN DEFAULT 0;

COMMENT ON COLUMN TBPLANO_CONTA.EXERCICIO IS
'Exercicio';

COMMENT ON COLUMN TBPLANO_CONTA.GRUPO IS
'Grupo:
0 - A Definir
1 - Ativo
2 - Passivo
3 ...
4 ...
5 ...
6 ...';

alter table TBPLANO_CONTA
alter EXERCICIO position 1;

alter table TBPLANO_CONTA
alter CODIGO position 2;

alter table TBPLANO_CONTA
alter DESCRICAO_COMPLETA position 3;

alter table TBPLANO_CONTA
alter DESCRICAO_RESUMIDA position 4;

alter table TBPLANO_CONTA
alter GRUPO position 5;




/*------ SYSDBA 09/05/2014 14:11:09 --------*/

alter table TBPLANO_CONTA
alter column CODIGO position 1;


/*------ SYSDBA 09/05/2014 14:11:09 --------*/

alter table TBPLANO_CONTA
alter column EXERCICIO position 2;


/*------ SYSDBA 09/05/2014 14:11:09 --------*/

alter table TBPLANO_CONTA
alter column GRUPO position 3;


/*------ SYSDBA 09/05/2014 14:11:09 --------*/

alter table TBPLANO_CONTA
alter column DESCRICAO_COMPLETA position 4;


/*------ SYSDBA 09/05/2014 14:11:09 --------*/

alter table TBPLANO_CONTA
alter column DESCRICAO_RESUMIDA position 5;


/*------ SYSDBA 09/05/2014 14:12:06 --------*/

CREATE INDEX IDX_PLANO_CONTA_GRUPO
ON TBPLANO_CONTA (GRUPO);

CREATE INDEX IDX_PLANO_CONTA_EXERCICIO
ON TBPLANO_CONTA (EXERCICIO);




/*------ SYSDBA 09/05/2014 14:12:22 --------*/

ALTER TABLE TBTPDESPESA
ADD CONSTRAINT FK_TBTPDESPESA_PLANO_CONTA
FOREIGN KEY (PLANO_CONTA)
REFERENCES TBPLANO_CONTA(CODIGO);




/*------ SYSDBA 09/05/2014 14:12:41 --------*/

COMMENT ON COLUMN TBTPDESPESA.PLANO_CONTA IS
'Plano de contas para despesas';




/*------ SYSDBA 09/05/2014 14:34:08 --------*/

CREATE SEQUENCE GEN_PLANO_CONTA;

COMMENT ON SEQUENCE GEN_PLANO_CONTA IS 'Sequencializador para o PLANO DE CONTAS';




/*------ SYSDBA 09/05/2014 14:34:24 --------*/

SET TERM ^ ;

CREATE trigger tg_plano_conta_novo for tbplano_conta
active before insert position 0
AS
begin
  if ( new.codigo is null ) then
    new.codigo = GEN_ID(GEN_PLANO_CONTA, 1);

end^

SET TERM ; ^




/*------ SYSDBA 09/05/2014 14:35:35 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_plano_conta_novo for tbplano_conta
active before insert position 0
AS
begin
  if ( new.codigo is null ) then
    new.codigo = GEN_ID(GEN_PLANO_CONTA, 1);

end^

SET TERM ; ^

COMMENT ON TRIGGER TG_PLANO_CONTA_NOVO IS 'Trigger Novo Plano de Contas (Contabilidade).

    Autor   :   Isaque Marinho Ribeiro
    Data    :   09/05/2014

Trigger responsavel por gerar o sequencial unico para o registro quando este nao for informado pela aplicacao.';




/*------ SYSDBA 13/05/2014 13:19:27 --------*/

CREATE TABLE TBAUTORIZA_COMPRA (
    ANO DMN_SMALLINT_NN NOT NULL,
    CODIGO DMN_BIGINT_NN NOT NULL,
    EMPRESA DMN_CNPJ,
    FORNECEDOR DMN_INTEGER_NN,
    TIPO DMN_SMALLINT_NN DEFAULT 0,
    EMISSAO_DATA DMN_DATE_NN,
    EMISSAO_USUARIO DMN_USUARIO,
    VALIDADE DMN_DATE,
    MOVITO DMN_TEXTO,
    OBSERVACAO DMN_TEXTO,
    ENDERECO_ENTREGA DMN_TEXTO,
    STATUS DMN_SMALLINT_NN DEFAULT 0,
    AUTORIZADO_DATA DMN_DATE,
    AUTORIZADO_USUARIO DMN_USUARIO,
    RECEBEDOR_NOME DMN_VCHAR_100,
    RECEBEDOR_CPF DMN_CNPJ,
    FORMA_PAGTO DMN_SMALLINT_N,
    CONDICAO_PAGTO DMN_SMALLINT_N);

ALTER TABLE TBAUTORIZA_COMPRA
ADD CONSTRAINT PK_TBAUTORIZA_COMPRA
PRIMARY KEY (ANO,CODIGO);

COMMENT ON COLUMN TBAUTORIZA_COMPRA.ANO IS
'Ano';

COMMENT ON COLUMN TBAUTORIZA_COMPRA.CODIGO IS
'Codigo';

COMMENT ON COLUMN TBAUTORIZA_COMPRA.EMPRESA IS
'Empresa';

COMMENT ON COLUMN TBAUTORIZA_COMPRA.FORNECEDOR IS
'Fornecedor';

COMMENT ON COLUMN TBAUTORIZA_COMPRA.TIPO IS
'Tipo:
0 - A Definir
1 - Compra
2 - Servico
3 - Compra/Servico';

COMMENT ON COLUMN TBAUTORIZA_COMPRA.EMISSAO_DATA IS
'Data de Emissao';

COMMENT ON COLUMN TBAUTORIZA_COMPRA.EMISSAO_USUARIO IS
'Usuario de Emissao';

COMMENT ON COLUMN TBAUTORIZA_COMPRA.VALIDADE IS
'Data de Validade';

COMMENT ON COLUMN TBAUTORIZA_COMPRA.MOVITO IS
'Motivo';

COMMENT ON COLUMN TBAUTORIZA_COMPRA.OBSERVACAO IS
'Observacoes';

COMMENT ON COLUMN TBAUTORIZA_COMPRA.ENDERECO_ENTREGA IS
'Endereco de Entrega';

COMMENT ON COLUMN TBAUTORIZA_COMPRA.STATUS IS
'Status:
0 - Em edicao
1 - Aberta
2 - Autorizada
3 - Cancelada';

COMMENT ON COLUMN TBAUTORIZA_COMPRA.AUTORIZADO_DATA IS
'Data de Autorizacao';

COMMENT ON COLUMN TBAUTORIZA_COMPRA.AUTORIZADO_USUARIO IS
'Usuario de Autorizacao';

COMMENT ON COLUMN TBAUTORIZA_COMPRA.RECEBEDOR_NOME IS
'Recebedor (Nome)';

COMMENT ON COLUMN TBAUTORIZA_COMPRA.RECEBEDOR_CPF IS
'Recebedor (CPF)';

COMMENT ON COLUMN TBAUTORIZA_COMPRA.FORMA_PAGTO IS
'Forma de Pagamento';

COMMENT ON COLUMN TBAUTORIZA_COMPRA.CONDICAO_PAGTO IS
'Condicao de Pagamento';

GRANT ALL ON TBAUTORIZA_COMPRA TO "PUBLIC";



/*------ SYSDBA 13/05/2014 13:20:36 --------*/

CREATE SEQUENCE GEN_AUTORIZA_COMPRA_2014;

CREATE SEQUENCE GEN_AUTORIZA_COMPRA_2015;

CREATE SEQUENCE GEN_AUTORIZA_COMPRA_2016;

CREATE SEQUENCE GEN_AUTORIZA_COMPRA_2017;

CREATE SEQUENCE GEN_AUTORIZA_COMPRA_2018;

CREATE SEQUENCE GEN_AUTORIZA_COMPRA_2019;

CREATE SEQUENCE GEN_AUTORIZA_COMPRA_2020;




/*------ SYSDBA 13/05/2014 13:23:12 --------*/

SET TERM ^ ;

CREATE trigger tg_autoriza_compra_codigo for tbautoriza_compra
active before insert position 0
AS
begin
  if (new.codigo is null) then
    if ( new.ano = 2014 ) then
      new.codigo = gen_id(GEN_AUTORIZA_COMPRA_2014, 1);
    else
    if ( new.ano = 2015 ) then
      new.codigo = gen_id(GEN_AUTORIZA_COMPRA_2015, 1);
    else
    if ( new.ano = 2016 ) then
      new.codigo = gen_id(GEN_AUTORIZA_COMPRA_2016, 1);
    else
    if ( new.ano = 2017 ) then
      new.codigo = gen_id(GEN_AUTORIZA_COMPRA_2017, 1);
    else
    if ( new.ano = 2018 ) then
      new.codigo = gen_id(GEN_AUTORIZA_COMPRA_2018, 1);
    else
    if ( new.ano = 2019 ) then
      new.codigo = gen_id(GEN_AUTORIZA_COMPRA_2019, 1);
    else
    if ( new.ano = 2020 ) then
      new.codigo = gen_id(GEN_AUTORIZA_COMPRA_2020, 1);
end^

SET TERM ; ^




/*------ SYSDBA 13/05/2014 13:24:41 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_autoriza_compra_codigo for tbautoriza_compra
active before insert position 0
AS
begin
  if (new.codigo is null) then
    if ( new.ano = 2014 ) then
      new.codigo = gen_id(GEN_AUTORIZA_COMPRA_2014, 1);
    else
    if ( new.ano = 2015 ) then
      new.codigo = gen_id(GEN_AUTORIZA_COMPRA_2015, 1);
    else
    if ( new.ano = 2016 ) then
      new.codigo = gen_id(GEN_AUTORIZA_COMPRA_2016, 1);
    else
    if ( new.ano = 2017 ) then
      new.codigo = gen_id(GEN_AUTORIZA_COMPRA_2017, 1);
    else
    if ( new.ano = 2018 ) then
      new.codigo = gen_id(GEN_AUTORIZA_COMPRA_2018, 1);
    else
    if ( new.ano = 2019 ) then
      new.codigo = gen_id(GEN_AUTORIZA_COMPRA_2019, 1);
    else
    if ( new.ano = 2020 ) then
      new.codigo = gen_id(GEN_AUTORIZA_COMPRA_2020, 1);
end^

SET TERM ; ^

COMMENT ON TRIGGER TG_AUTORIZA_COMPRA_CODIGO IS 'Trigger Nova Autorizacao de Compra.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   13/05/2014

Trigger responsavel por gerar um sequencial unico para cada novo registro de autorizacao de compra no ano.';




/*------ SYSDBA 13/05/2014 13:25:47 --------*/

COMMENT ON TABLE TBAUTORIZA_COMPRA IS 'Tabela Autorizacao de Compras

    Autor   :   Isaque Marinho Ribeiro
    Data    :   13/05/2014

Tabela responsavel por armazenar as autorizacoes de compras da empresa.';




/*------ SYSDBA 13/05/2014 13:27:37 --------*/

ALTER TABLE TBAUTORIZA_COMPRA
ADD CONSTRAINT FK_TBAUTORIZA_COMPRA_EMP
FOREIGN KEY (EMPRESA)
REFERENCES TBEMPRESA(CNPJ)
ON UPDATE CASCADE;

ALTER TABLE TBAUTORIZA_COMPRA
ADD CONSTRAINT FK_TBAUTORIZA_COMPRA_FRN
FOREIGN KEY (FORNECEDOR)
REFERENCES TBFORNECEDOR(CODFORN);

ALTER TABLE TBAUTORIZA_COMPRA
ADD CONSTRAINT FK_TBAUTORIZA_COMPRA_FPAGTO
FOREIGN KEY (FORMA_PAGTO)
REFERENCES TBFORMPAGTO(COD);

ALTER TABLE TBAUTORIZA_COMPRA
ADD CONSTRAINT FK_TBAUTORIZA_COMPRA_CPAGTO
FOREIGN KEY (CONDICAO_PAGTO)
REFERENCES TBCONDICAOPAGTO(COND_COD);




/*------ SYSDBA 13/05/2014 13:29:43 --------*/

ALTER TABLE TBCONTREC_BAIXA DROP CONSTRAINT FK_TBCONTREC_BAIXA_USUARIO;




/*------ SYSDBA 13/05/2014 13:29:52 --------*/

ALTER TABLE TBCONTPAG_BAIXA DROP CONSTRAINT FK_TBCONTPAG_BAIXA_USUARIO;




/*------ SYSDBA 13/05/2014 13:30:06 --------*/

ALTER TABLE TBCAIXA_MOVIMENTO DROP CONSTRAINT FK_TBCAIXA_MOVIMENTO_US;




/*------ SYSDBA 13/05/2014 13:30:15 --------*/

ALTER TABLE TBCAIXA DROP CONSTRAINT FK_TBCAIXA_USUARIO;




/*------ SYSDBA 13/05/2014 13:30:19 --------*/

ALTER TABLE TBCAIXA DROP CONSTRAINT FK_TBCAIXA_USUARIO_CANCEL;




/*------ SYSDBA 13/05/2014 13:30:29 --------*/

ALTER TABLE TBUSERS DROP CONSTRAINT PK_TBUSERS;




/*------ SYSDBA 13/05/2014 13:30:46 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_USUARIO'
where (RDB$FIELD_NAME = 'NOME') and
(RDB$RELATION_NAME = 'TBUSERS')
;




/*------ SYSDBA 13/05/2014 13:30:59 --------*/

ALTER TABLE TBUSERS
ADD CONSTRAINT PK_TBUSERS
PRIMARY KEY (NOME);




/*------ SYSDBA 13/05/2014 13:32:14 --------*/

ALTER TABLE TBCAIXA
ADD CONSTRAINT FK_TBCAIXA_USUARIO
FOREIGN KEY (USUARIO)
REFERENCES TBUSERS(NOME);

ALTER TABLE TBCAIXA
ADD CONSTRAINT FK_TBCAIXA_USUARIO_CANCEL
FOREIGN KEY (USUARIO_CANCEL)
REFERENCES TBUSERS(NOME);




/*------ SYSDBA 13/05/2014 13:32:46 --------*/

ALTER TABLE TBCAIXA_MOVIMENTO
ADD CONSTRAINT FK_TBCAIXA_MOVIMENTO_US
FOREIGN KEY (USUARIO)
REFERENCES TBUSERS(NOME);




/*------ SYSDBA 13/05/2014 13:33:16 --------*/

ALTER TABLE TBCONTPAG_BAIXA
ADD CONSTRAINT FK_TBCONTPAG_BAIXA_USUARIO
FOREIGN KEY (USUARIO)
REFERENCES TBUSERS(NOME);




/*------ SYSDBA 13/05/2014 13:33:45 --------*/

ALTER TABLE TBCONTREC_BAIXA
ADD CONSTRAINT FK_TBCONTREC_BAIXA_USUARIO
FOREIGN KEY (USUARIO)
REFERENCES TBUSERS(NOME);




/*------ SYSDBA 13/05/2014 13:34:14 --------*/

ALTER TABLE TBAUTORIZA_COMPRA
ADD CONSTRAINT FK_TBAUTORIZA_COMPRA_EMISSOR
FOREIGN KEY (EMISSAO_USUARIO)
REFERENCES TBUSERS(NOME);




/*------ SYSDBA 13/05/2014 13:35:22 --------*/

ALTER TABLE TBAUTORIZA_COMPRA
ADD CONSTRAINT FK_TBAUTORIZA_COMPRA_USR_AUT
FOREIGN KEY (AUTORIZADO_USUARIO)
REFERENCES TBUSERS(NOME);

ALTER TABLE TBAUTORIZA_COMPRA DROP CONSTRAINT FK_TBAUTORIZA_COMPRA_EMISSOR;

ALTER TABLE TBAUTORIZA_COMPRA
ADD CONSTRAINT FK_TBAUTORIZA_COMPRA_USR_EMISS
FOREIGN KEY (EMISSAO_USUARIO)
REFERENCES TBUSERS(NOME)
USING INDEX FK_TBAUTORIZA_COMPRA_EMISSOR;




/*------ SYSDBA 13/05/2014 13:36:40 --------*/

ALTER TABLE TBAUTORIZA_COMPRA
    ADD CANCELADO_DATA DMN_DATE,
    ADD CANCELADO_USUARIO DMN_USUARIO,
    ADD CANCELADO_MOTIVO DMN_TEXTO;

COMMENT ON COLUMN TBAUTORIZA_COMPRA.CANCELADO_DATA IS
'Data de Cancelamento';

COMMENT ON COLUMN TBAUTORIZA_COMPRA.CANCELADO_USUARIO IS
'Usuario de Cancelamento';

COMMENT ON COLUMN TBAUTORIZA_COMPRA.CANCELADO_MOTIVO IS
'Motivo de Cancelamento';

alter table TBAUTORIZA_COMPRA
alter ANO position 1;

alter table TBAUTORIZA_COMPRA
alter CODIGO position 2;

alter table TBAUTORIZA_COMPRA
alter EMPRESA position 3;

alter table TBAUTORIZA_COMPRA
alter FORNECEDOR position 4;

alter table TBAUTORIZA_COMPRA
alter TIPO position 5;

alter table TBAUTORIZA_COMPRA
alter EMISSAO_DATA position 6;

alter table TBAUTORIZA_COMPRA
alter EMISSAO_USUARIO position 7;

alter table TBAUTORIZA_COMPRA
alter VALIDADE position 8;

alter table TBAUTORIZA_COMPRA
alter MOVITO position 9;

alter table TBAUTORIZA_COMPRA
alter OBSERVACAO position 10;

alter table TBAUTORIZA_COMPRA
alter ENDERECO_ENTREGA position 11;

alter table TBAUTORIZA_COMPRA
alter STATUS position 12;

alter table TBAUTORIZA_COMPRA
alter AUTORIZADO_DATA position 13;

alter table TBAUTORIZA_COMPRA
alter AUTORIZADO_USUARIO position 14;

alter table TBAUTORIZA_COMPRA
alter CANCELADO_DATA position 15;

alter table TBAUTORIZA_COMPRA
alter CANCELADO_USUARIO position 16;

alter table TBAUTORIZA_COMPRA
alter CANCELADO_MOTIVO position 17;

alter table TBAUTORIZA_COMPRA
alter RECEBEDOR_NOME position 18;

alter table TBAUTORIZA_COMPRA
alter RECEBEDOR_CPF position 19;

alter table TBAUTORIZA_COMPRA
alter FORMA_PAGTO position 20;

alter table TBAUTORIZA_COMPRA
alter CONDICAO_PAGTO position 21;




/*------ SYSDBA 13/05/2014 13:37:08 --------*/

ALTER TABLE TBAUTORIZA_COMPRA
ADD CONSTRAINT FK_TBAUTORIZA_COMPRA_USR_CANCEL
FOREIGN KEY (CANCELADO_USUARIO)
REFERENCES TBUSERS(NOME);




/*------ SYSDBA 13/05/2014 13:42:11 --------*/

ALTER TABLE TBAUTORIZA_COMPRA
    ADD EMPRESA_NFE DMN_CNPJ,
    ADD VALOR_BRUTO DMN_MONEY,
    ADD VALOR_DESCONTO DMN_MONEY,
    ADD VALOR_TOTAL DMN_MONEY;

COMMENT ON COLUMN TBAUTORIZA_COMPRA.EMPRESA_NFE IS
'Empresa para Nota Fiscal';

COMMENT ON COLUMN TBAUTORIZA_COMPRA.VALOR_BRUTO IS
'Valor Total Bruto (Total Produtos)';

COMMENT ON COLUMN TBAUTORIZA_COMPRA.VALOR_DESCONTO IS
'Valor Total de Descontos';

COMMENT ON COLUMN TBAUTORIZA_COMPRA.VALOR_TOTAL IS
'Valor Total (Valor Bruto - Valor Desconto)';

alter table TBAUTORIZA_COMPRA
alter ANO position 1;

alter table TBAUTORIZA_COMPRA
alter CODIGO position 2;

alter table TBAUTORIZA_COMPRA
alter EMPRESA position 3;

alter table TBAUTORIZA_COMPRA
alter EMPRESA_NFE position 4;

alter table TBAUTORIZA_COMPRA
alter FORNECEDOR position 5;

alter table TBAUTORIZA_COMPRA
alter TIPO position 6;

alter table TBAUTORIZA_COMPRA
alter EMISSAO_DATA position 7;

alter table TBAUTORIZA_COMPRA
alter EMISSAO_USUARIO position 8;

alter table TBAUTORIZA_COMPRA
alter VALIDADE position 9;

alter table TBAUTORIZA_COMPRA
alter MOVITO position 10;

alter table TBAUTORIZA_COMPRA
alter OBSERVACAO position 11;

alter table TBAUTORIZA_COMPRA
alter ENDERECO_ENTREGA position 12;

alter table TBAUTORIZA_COMPRA
alter STATUS position 13;

alter table TBAUTORIZA_COMPRA
alter AUTORIZADO_DATA position 14;

alter table TBAUTORIZA_COMPRA
alter AUTORIZADO_USUARIO position 15;

alter table TBAUTORIZA_COMPRA
alter CANCELADO_DATA position 16;

alter table TBAUTORIZA_COMPRA
alter CANCELADO_USUARIO position 17;

alter table TBAUTORIZA_COMPRA
alter CANCELADO_MOTIVO position 18;

alter table TBAUTORIZA_COMPRA
alter RECEBEDOR_NOME position 19;

alter table TBAUTORIZA_COMPRA
alter RECEBEDOR_CPF position 20;

alter table TBAUTORIZA_COMPRA
alter FORMA_PAGTO position 21;

alter table TBAUTORIZA_COMPRA
alter CONDICAO_PAGTO position 22;

alter table TBAUTORIZA_COMPRA
alter VALOR_BRUTO position 23;

alter table TBAUTORIZA_COMPRA
alter VALOR_DESCONTO position 24;

alter table TBAUTORIZA_COMPRA
alter VALOR_TOTAL position 25;




/*------ SYSDBA 13/05/2014 13:42:35 --------*/

ALTER TABLE TBAUTORIZA_COMPRA DROP EMPRESA_NFE;




/*------ SYSDBA 13/05/2014 13:44:18 --------*/

update RDB$RELATION_FIELDS set
RDB$NULL_FLAG = 1
where (RDB$FIELD_NAME = 'EMPRESA') and
(RDB$RELATION_NAME = 'TBAUTORIZA_COMPRA')
;




/*------ SYSDBA 13/05/2014 13:44:49 --------*/

CREATE DOMAIN DMN_CNPJ_NN AS
VARCHAR(18)
NOT NULL;


/*------ SYSDBA 13/05/2014 13:45:12 --------*/

ALTER TABLE TBAUTORIZA_COMPRA DROP CONSTRAINT FK_TBAUTORIZA_COMPRA_EMP;




/*------ SYSDBA 13/05/2014 13:45:24 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_CNPJ_NN'
where (RDB$FIELD_NAME = 'EMPRESA') and
(RDB$RELATION_NAME = 'TBAUTORIZA_COMPRA')
;




/*------ SYSDBA 13/05/2014 13:45:35 --------*/

ALTER TABLE TBAUTORIZA_COMPRA
ADD CONSTRAINT PK_TBAUTORIZA_COMPRA
PRIMARY KEY (ANO,CODIGO,EMPRESA);




/*------ SYSDBA 13/05/2014 13:45:53 --------*/

ALTER TABLE TBAUTORIZA_COMPRA
ADD CONSTRAINT FK_TBAUTORIZA_COMPRA_EMPRESA
FOREIGN KEY (EMPRESA)
REFERENCES TBEMPRESA(CNPJ)
ON UPDATE CASCADE;




/*------ SYSDBA 13/05/2014 13:46:22 --------*/

ALTER TABLE TBAUTORIZA_COMPRA DROP CONSTRAINT FK_TBAUTORIZA_COMPRA_EMPRESA;

ALTER TABLE TBAUTORIZA_COMPRA
ADD CONSTRAINT FK_TBAUTORIZA_COMPRA_EMPRESA
FOREIGN KEY (EMPRESA)
REFERENCES TBEMPRESA(CNPJ)
USING INDEX FK_TBAUTORIZA_COMPRA_EMPRESA;




/*------ SYSDBA 13/05/2014 13:49:18 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.VALOR_BRUTO IS
'Valor Total Bruto';




/*------ SYSDBA 13/05/2014 13:54:12 --------*/

CREATE TABLE TBAUTORIZA_COMPRAITEM (
    ANO DMN_SMALLINT_NN NOT NULL,
    CODIGO DMN_BIGINT_NN NOT NULL,
    EMPRESA DMN_CNPJ_NN NOT NULL,
    SEQ DMN_SMALLINT_NN NOT NULL,
    FORNECEDOR DMN_INTEGER_N,
    PRODUTO DMN_INTEGER_N,
    QUANTIDADE DMN_QUANTIDADE_D3,
    VALOR_UNITARIO DMN_MONEY,
    VALOR_TOTAL DMN_MONEY,
    CONFIRMADO_RECEBIMENTO DMN_LOGICO DEFAULT 0);

ALTER TABLE TBAUTORIZA_COMPRAITEM
ADD CONSTRAINT PK_TBAUTORIZA_COMPRAITEM
PRIMARY KEY (ANO,CODIGO,EMPRESA,SEQ);

COMMENT ON COLUMN TBAUTORIZA_COMPRAITEM.ANO IS
'Ano da Autorizacao';

COMMENT ON COLUMN TBAUTORIZA_COMPRAITEM.CODIGO IS
'Codigo da Autorizacao';

COMMENT ON COLUMN TBAUTORIZA_COMPRAITEM.EMPRESA IS
'Empresa da Autorizacao';

COMMENT ON COLUMN TBAUTORIZA_COMPRAITEM.SEQ IS
'Sequencial';

COMMENT ON COLUMN TBAUTORIZA_COMPRAITEM.FORNECEDOR IS
'Fornecedor';

COMMENT ON COLUMN TBAUTORIZA_COMPRAITEM.PRODUTO IS
'Produto/Servico';

COMMENT ON COLUMN TBAUTORIZA_COMPRAITEM.QUANTIDADE IS
'Quantidade

(Aceita valores decimais)';

COMMENT ON COLUMN TBAUTORIZA_COMPRAITEM.VALOR_UNITARIO IS
'Valor Unitario';

COMMENT ON COLUMN TBAUTORIZA_COMPRAITEM.VALOR_TOTAL IS
'Valor Total (Quantidade * Valor Unitario)';

COMMENT ON COLUMN TBAUTORIZA_COMPRAITEM.CONFIRMADO_RECEBIMENTO IS
'Confirmado recebimento do produto/servico pela empresa:
0 - Nao
1 - Sim';




/*------ SYSDBA 13/05/2014 13:56:15 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_VCHAR_10'
where (RDB$FIELD_NAME = 'PRODUTO') and
(RDB$RELATION_NAME = 'TBAUTORIZA_COMPRAITEM')
;




/*------ SYSDBA 13/05/2014 13:56:32 --------*/

ALTER TABLE TBAUTORIZA_COMPRAITEM
ADD CONSTRAINT FK_TBAUTORIZA_COMPRAITEM_PRD
FOREIGN KEY (PRODUTO)
REFERENCES TBPRODUTO(COD);

GRANT ALL ON TBAUTORIZA_COMPRAITEM TO "PUBLIC";



/*------ SYSDBA 13/05/2014 13:57:56 --------*/

COMMENT ON TABLE TBAUTORIZA_COMPRAITEM IS 'Tabela de Produtos/Servicos da Autorizacao de Compra/Servico.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   13/05/2014

Tabela responsavel por armazenar os itens (produtos eou servicos) das autorizacoes de compras/servicos.';




/*------ SYSDBA 13/05/2014 13:58:17 --------*/

COMMENT ON TABLE TBAUTORIZA_COMPRA IS 'Tabela Autorizacao de Compras/Servicos

    Autor   :   Isaque Marinho Ribeiro
    Data    :   13/05/2014

Tabela responsavel por armazenar as autorizacoes de compras/servicos da empresa.';




/*------ SYSDBA 13/05/2014 13:59:07 --------*/

CREATE INDEX IDX_TBAUTORIZA_COMPRAITEM_REC
ON TBAUTORIZA_COMPRAITEM (CONFIRMADO_RECEBIMENTO);




/*------ SYSDBA 13/05/2014 14:01:09 --------*/

ALTER TABLE TBAUTORIZA_COMPRA
    ADD RECEBEDOR_FUNCAO DMN_VCHAR_50;

COMMENT ON COLUMN TBAUTORIZA_COMPRA.RECEBEDOR_FUNCAO IS
'Recebedor (Funcao)';

alter table TBAUTORIZA_COMPRA
alter ANO position 1;

alter table TBAUTORIZA_COMPRA
alter CODIGO position 2;

alter table TBAUTORIZA_COMPRA
alter EMPRESA position 3;

alter table TBAUTORIZA_COMPRA
alter FORNECEDOR position 4;

alter table TBAUTORIZA_COMPRA
alter TIPO position 5;

alter table TBAUTORIZA_COMPRA
alter EMISSAO_DATA position 6;

alter table TBAUTORIZA_COMPRA
alter EMISSAO_USUARIO position 7;

alter table TBAUTORIZA_COMPRA
alter VALIDADE position 8;

alter table TBAUTORIZA_COMPRA
alter MOVITO position 9;

alter table TBAUTORIZA_COMPRA
alter OBSERVACAO position 10;

alter table TBAUTORIZA_COMPRA
alter ENDERECO_ENTREGA position 11;

alter table TBAUTORIZA_COMPRA
alter STATUS position 12;

alter table TBAUTORIZA_COMPRA
alter AUTORIZADO_DATA position 13;

alter table TBAUTORIZA_COMPRA
alter AUTORIZADO_USUARIO position 14;

alter table TBAUTORIZA_COMPRA
alter CANCELADO_DATA position 15;

alter table TBAUTORIZA_COMPRA
alter CANCELADO_USUARIO position 16;

alter table TBAUTORIZA_COMPRA
alter CANCELADO_MOTIVO position 17;

alter table TBAUTORIZA_COMPRA
alter RECEBEDOR_NOME position 18;

alter table TBAUTORIZA_COMPRA
alter RECEBEDOR_CPF position 19;

alter table TBAUTORIZA_COMPRA
alter RECEBEDOR_FUNCAO position 20;

alter table TBAUTORIZA_COMPRA
alter FORMA_PAGTO position 21;

alter table TBAUTORIZA_COMPRA
alter CONDICAO_PAGTO position 22;

alter table TBAUTORIZA_COMPRA
alter VALOR_BRUTO position 23;

alter table TBAUTORIZA_COMPRA
alter VALOR_DESCONTO position 24;

alter table TBAUTORIZA_COMPRA
alter VALOR_TOTAL position 25;



/*------ 13/05/2014 14:29:22 --------*/

ALTER TABLE TBPRODUTO
    ADD CUST_DESP_OFIC DMN_MONEY,
    ADD CUST_DESP_GERAIS DMN_MONEY,
    ADD CUST_DESP_ADM DMN_MONEY,
    ADD CUST_COMISSAO DMN_MONEY,
    ADD CUST_IMPOSTO DMN_MONEY,
    ADD FI_RET_FINANC DMN_MONEY,
    ADD FI_RET_PLANO DMN_MONEY;

/*------ 13/05/2014 14:29:22 --------*/

CREATE DOMAIN DMN_COMISSAOVALOR AS
NUMERIC(6,2)
DEFAULT 0
NOT NULL;

/*------ 13/05/2014 14:29:22 --------*/

COMMENT ON DOMAIN DMN_COMISSAOVALOR IS 'Valor de Comissao';

/*------ 13/05/2014 14:29:22 --------*/

ALTER TABLE TBVENDEDOR
    ADD COMISSAO_VL DMN_COMISSAOVALOR;

/*------ 13/05/2014 14:29:22 --------*/

COMMENT ON COLUMN TBVENDEDOR.COMISSAO_VL IS
'Valor de Comissao';

/*------ 13/05/2014 14:29:22 --------*/

COMMENT ON COLUMN TBPRODUTO.CUST_DESP_OFIC IS
'Custo Veiculo - Despesas Oficina';

/*------ 13/05/2014 14:29:22 --------*/

COMMENT ON COLUMN TBPRODUTO.CUST_DESP_GERAIS IS
'Custo Veiculo - Despesas Gerais';

/*------ 13/05/2014 14:29:22 --------*/

COMMENT ON COLUMN TBPRODUTO.CUST_DESP_ADM IS
'Custo Veiculo - Despesas Administrativas';

/*------ 13/05/2014 14:29:22 --------*/

COMMENT ON COLUMN TBPRODUTO.CUST_COMISSAO IS
'Custo Veiculo - Despesas Comissao';

/*------ 13/05/2014 14:29:22 --------*/

COMMENT ON COLUMN TBPRODUTO.CUST_IMPOSTO IS
'Custo Veiculo - Despesas Impostos';

/*------ 13/05/2014 14:29:22 --------*/

COMMENT ON COLUMN TBPRODUTO.FI_RET_FINANC IS
'Retorno Financeiro - Financiadora';

/*------ 13/05/2014 14:29:22 --------*/

COMMENT ON COLUMN TBPRODUTO.FI_RET_PLANO IS
'Retorno Financeiro - Por Plano';

/*------ 13/05/2014 14:29:22 --------*/

ALTER TABLE TBVENDEDOR
    ADD ATIVO DMN_LOGICO DEFAULT 1;

/*------ 13/05/2014 14:29:22 --------*/

COMMENT ON COLUMN TBVENDEDOR.ATIVO IS
'Usuario ativo:
0 - Nao
1 - Sim';


/*------ SYSDBA 13/05/2014 14:29:38 --------*/

COMMENT ON COLUMN TBVENDEDOR.ATIVO IS
'Vendedor ativo:
0 - Nao
1 - Sim';




/*------ SYSDBA 13/05/2014 15:08:13 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_ajust_estoque_historico for tbajustestoq
active after insert position 0
AS
--  declare variable movimentar Smallint;
begin
/*
  Select
    coalesce(p.movimenta_estoque, 1)
  from TBPRODUTO p
  where p.cod    = new.codprod
    and p.codemp = new.codempresa
  Into
    movimentar;

  movimentar = coalesce(:movimentar, 1);

  if (:movimentar = 0) then
    Exit;
*/
  update TBPRODUTO p set
    p.qtde = coalesce(p.qtde, 0) + coalesce(new.qtdenova, 0)
  where p.cod    = new.codprod
    and p.codemp = new.codempresa;

  Insert Into TBPRODHIST (
      Codempresa
    , Codprod
    , Doc
    , Historico
    , Dthist
    , Qtdeatual
    , Qtdenova
    , Qtdefinal
    , Resp
    , Motivo
  ) values (
      new.codempresa
    , new.codprod
    , new.doc
    , case when new.qtdenova > 0 then 'AJUSTE DE ESTOQUE - ENTRADA' else 'AJUSTE DE ESTOQUE - SAIDA' end
    , new.dtajust
    , new.qtdeatual
    , new.qtdenova
    , new.qtdefinal
    , coalesce(new.Usuario, user)
    , substring(trim(new.motivo) from 1 for 40)
  );
end^

SET TERM ; ^




/*------ SYSDBA 13/05/2014 15:11:50 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_compras_atualizar_estoque for tbcompras
active after update position 1
AS
  declare variable produto varchar(10);
  declare variable empresa varchar(18);
  declare variable estoque    DMN_QUANTIDADE_D3;
  declare variable quantidade DMN_QUANTIDADE_D3;
  declare variable custo_produto numeric(15,2);
  declare variable custo_compra numeric(15,2);
  declare variable custo_medio numeric(15,2);
  declare variable preco_venda dmn_money;
  declare variable percentual_markup dmn_percentual_3;
  declare variable alterar_custo Smallint;
  declare variable estoque_unico Smallint;
  declare variable movimentar Smallint;
begin
  if ( (coalesce(old.Status, 0) <> coalesce(new.Status, 0)) and (new.Status = 2)) then
  begin

    -- Buscar FLAG de alteracao de custo de produto
    Select
      cf.cfop_altera_custo_produto
    from TBCFOP cf
    where cf.cfop_cod = new.nfcfop
    Into
        alterar_custo;

    alterar_custo = coalesce(:alterar_custo, 1);

    -- Buscar FLAG de estoque unico
    Select
      cnf.estoque_unico_empresas
    from TBCONFIGURACAO cnf
    where cnf.empresa = new.codemp
    Into
      estoque_unico;

    estoque_unico = coalesce(:estoque_unico, 0);

    -- Incrimentar Estoque do produto
    for
      Select
          i.Codprod
        , i.Codemp
        , i.Qtde
        , coalesce(p.Qtde, 0)
        , coalesce(i.Customedio, 0)
        , coalesce(p.Customedio, 0)
        , p.percentual_marckup
        , p.preco
        , p.movimenta_estoque
      from TBCOMPRASITENS i
        inner join TBPRODUTO p on (p.Cod = i.Codprod)
      where i.Ano = new.Ano
        and i.Codcontrol = new.Codcontrol
      into
          Produto
        , Empresa
        , Quantidade
        , Estoque
        , Custo_compra
        , Custo_produto
        , Percentual_markup
        , Preco_venda
        , Movimentar
    do
    begin
      if ( (:Custo_compra > 0) and (:Custo_produto > 0) and (:Estoque > 0) ) then
        Custo_medio = (:Custo_compra + :Custo_produto) / 2;
      else
        Custo_medio = :Custo_compra;

--      Percentual_markup = cast( ( ( (:Preco_venda - :Custo_medio) / :Custo_medio) * 100) as numeric(18,3) );
      Percentual_markup = cast( ( ( (:Preco_venda - :Custo_compra) / :Custo_compra) * 100 ) as numeric(18,3) );

      -- Incrementar estoque
      Update TBPRODUTO p Set
          --p.Customedio = Case when :alterar_custo = 1 then :Custo_medio else p.Customedio end
          p.Customedio = Case when :alterar_custo = 1 then :Custo_compra else p.Customedio end
        , p.Qtde       = Case when :Movimentar = 1    then :Estoque + :Quantidade else :Estoque end
        , p.percentual_marckup = :Percentual_markup
--        , p.preco_sugerido     = cast( (:Custo_medio + (:Custo_medio * :Percentual_markup / 100)) as numeric(15,2) )
        , p.preco_sugerido     = cast( (:Custo_compra + (:Custo_compra * :Percentual_markup / 100)) as numeric(15,2) )
      where (p.Cod     = :Produto)
        and ((p.Codemp = :Empresa) or (:estoque_unico = 1)) ;

      -- Gravar posicao de estoque
      Update TBCOMPRASITENS i Set
          i.Qtdeantes = :Estoque
        , i.Qtdefinal = Case when :Movimentar = 1 then :Estoque + :Quantidade else :Estoque end
      where i.Ano = new.Ano
        and i.Codcontrol = new.Codcontrol
        and i.Codemp     = new.Codemp
        and i.Codprod    = :Produto;

      -- Gerar historico
      Insert Into TBPRODHIST (
          Codempresa
        , Codprod
        , Doc
        , Historico
        , Dthist
        , Qtdeatual
        , Qtdenova
        , Qtdefinal
        , Resp
        , Motivo
      ) values (
          :Empresa
        , :Produto
        , new.Ano || '/' || new.Codcontrol
        , 'ENTRADA - COMPRA'
        , Current_time
        , :Estoque
        , :Quantidade
        , Case when :Movimentar = 1 then :Estoque + :Quantidade else :Estoque end
        , new.Usuario
        , 'Custo Medio no valor de R$ ' || :Custo_medio
      );
    end
     
  end 
end^

SET TERM ; ^




/*------ SYSDBA 13/05/2014 15:12:31 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_ajust_estoque_historico for tbajustestoq
active after insert position 0
AS
begin
  update TBPRODUTO p set
    p.qtde = coalesce(p.qtde, 0) + coalesce(new.qtdenova, 0)
  where p.cod    = new.codprod
    and p.codemp = new.codempresa;

  Insert Into TBPRODHIST (
      Codempresa
    , Codprod
    , Doc
    , Historico
    , Dthist
    , Qtdeatual
    , Qtdenova
    , Qtdefinal
    , Resp
    , Motivo
  ) values (
      new.codempresa
    , new.codprod
    , new.doc
    , case when new.qtdenova > 0 then 'AJUSTE DE ESTOQUE - ENTRADA' else 'AJUSTE DE ESTOQUE - SAIDA' end
    , new.dtajust
    , new.qtdeatual
    , new.qtdenova
    , new.qtdefinal
    , coalesce(new.Usuario, user)
    , substring(trim(new.motivo) from 1 for 40)
  );
end^

SET TERM ; ^




/*------ SYSDBA 13/05/2014 15:13:51 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_compras_atualizar_estoque for tbcompras
active after update position 1
AS
  declare variable produto varchar(10);
  declare variable empresa varchar(18);
  declare variable estoque    DMN_QUANTIDADE_D3;
  declare variable quantidade DMN_QUANTIDADE_D3;
  declare variable custo_produto numeric(15,2);
  declare variable custo_compra numeric(15,2);
  declare variable custo_medio numeric(15,2);
  declare variable preco_venda dmn_money;
  declare variable percentual_markup dmn_percentual_3;
  declare variable alterar_custo Smallint;
  declare variable estoque_unico Smallint;
  declare variable movimentar Smallint;
begin
  if ( (coalesce(old.Status, 0) <> coalesce(new.Status, 0)) and (new.Status = 2)) then
  begin

    -- Buscar FLAG de alteracao de custo de produto
    Select
      cf.cfop_altera_custo_produto
    from TBCFOP cf
    where cf.cfop_cod = new.nfcfop
    Into
        alterar_custo;

    alterar_custo = coalesce(:alterar_custo, 1);

    -- Buscar FLAG de estoque unico
    Select
      cnf.estoque_unico_empresas
    from TBCONFIGURACAO cnf
    where cnf.empresa = new.codemp
    Into
      estoque_unico;

    estoque_unico = coalesce(:estoque_unico, 0);

    -- Incrimentar Estoque do produto
    for
      Select
          i.Codprod
        , i.Codemp
        , i.Qtde
        , coalesce(p.Qtde, 0)
        , coalesce(i.Customedio, 0)
        , coalesce(p.Customedio, 0)
        , p.percentual_marckup
        , p.preco
        , p.movimenta_estoque
      from TBCOMPRASITENS i
        inner join TBPRODUTO p on (p.Cod = i.Codprod)
      where i.Ano = new.Ano
        and i.Codcontrol = new.Codcontrol
      into
          Produto
        , Empresa
        , Quantidade
        , Estoque
        , Custo_compra
        , Custo_produto
        , Percentual_markup
        , Preco_venda
        , Movimentar
    do
    begin
      if ( (:Custo_compra > 0) and (:Custo_produto > 0) and (:Estoque > 0) ) then
        Custo_medio = (:Custo_compra + :Custo_produto) / 2;
      else
        Custo_medio = :Custo_compra;

--      Percentual_markup = cast( ( ( (:Preco_venda - :Custo_medio) / :Custo_medio) * 100) as numeric(18,3) );
      Percentual_markup = cast( ( ( (:Preco_venda - :Custo_compra) / :Custo_compra) * 100 ) as numeric(18,3) );

      -- Incrementar estoque
      Update TBPRODUTO p Set
          --p.Customedio = Case when :alterar_custo = 1 then :Custo_medio else p.Customedio end
          p.Customedio = Case when :alterar_custo = 1 then :Custo_compra else p.Customedio end
        , p.Qtde       = Case when :Movimentar = 1    then :Estoque + :Quantidade else :Estoque end
        , p.percentual_marckup = :Percentual_markup
--        , p.preco_sugerido     = cast( (:Custo_medio + (:Custo_medio * :Percentual_markup / 100)) as numeric(15,2) )
        , p.preco_sugerido     = cast( (:Custo_compra + (:Custo_compra * :Percentual_markup / 100)) as numeric(15,2) )
      where (p.Cod     = :Produto)
        and ((p.Codemp = :Empresa) or (:estoque_unico = 1)) ;

      -- Gravar posicao de estoque
      Update TBCOMPRASITENS i Set
          i.Qtdeantes = :Estoque
        , i.Qtdefinal = :Estoque + :Quantidade
      where i.Ano = new.Ano
        and i.Codcontrol = new.Codcontrol
        and i.Codemp     = new.Codemp
        and i.Codprod    = :Produto;

      -- Gerar historico
      Insert Into TBPRODHIST (
          Codempresa
        , Codprod
        , Doc
        , Historico
        , Dthist
        , Qtdeatual
        , Qtdenova
        , Qtdefinal
        , Resp
        , Motivo
      ) values (
          :Empresa
        , :Produto
        , new.Ano || '/' || new.Codcontrol
        , 'ENTRADA - COMPRA'
        , Current_time
        , :Estoque
        , :Quantidade
        , :Estoque + :Quantidade
        , new.Usuario
        , 'Custo Medio no valor de R$ ' || :Custo_medio
      );
    end
     
  end 
end^

SET TERM ; ^




/*------ SYSDBA 13/05/2014 15:16:41 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_compras_cancelar for tbcompras
active after update position 2
AS
  declare variable produto varchar(10);
  declare variable empresa varchar(18);
  declare variable estoque    DMN_QUANTIDADE_D3;
  declare variable quantidade DMN_QUANTIDADE_D3;
  declare variable custo_compra numeric(15,2);
  declare variable Movimentar Smallint;
begin
  if ( (coalesce(old.Status, 0) <> coalesce(new.Status, 0)) and (new.Status = 3)) then
  begin

    -- Decrementar Estoque do produto
    for
      Select
          i.Codprod
        , i.Codemp
        , i.Qtde
        , coalesce(p.Qtde, 0)
        , coalesce(i.Customedio, 0)
        , coalesce(p.movimenta_estoque, 1)
      from TBCOMPRASITENS i
        inner join TBPRODUTO p on (p.Cod = i.Codprod)
      where i.Ano = new.Ano
        and i.Codcontrol = new.Codcontrol
      into
          Produto
        , Empresa
        , Quantidade
        , Estoque
        , Custo_compra
        , Movimentar
    do
    begin
      -- Decrementar estoque
      Update TBPRODUTO p Set
        p.Qtde       = Case when :Movimentar = 1 then :Estoque - :Quantidade else :Estoque end
      where p.Cod    = :Produto
        and p.Codemp = :Empresa;

      -- Gerar historico
      Insert Into TBPRODHIST (
          Codempresa
        , Codprod
        , Doc
        , Historico
        , Dthist
        , Qtdeatual
        , Qtdenova
        , Qtdefinal
        , Resp
        , Motivo
      ) values (
          :Empresa
        , :Produto
        , new.Ano || '/' || new.Codcontrol
        , Trim('SAIDA - COMPRA CANCELADA ' || Case when :Movimentar = 1 then '' else '*' end)
        , Current_time
        , :Estoque
        , :Quantidade
        , :Estoque - :Quantidade
        , new.Cancel_usuario
        , 'Custo Final no valor de R$ ' || :Custo_compra
      );
    end
     
    -- Cancelar Movimento Caixa
    Update TBCAIXA_MOVIMENTO m Set
      m.Situacao = 0 -- Cancelado
    where m.Empresa = new.Codemp
      and m.Fornecedor = new.Codforn
      and m.Compra_ano = new.Ano
      and m.Compra_num = new.Codcontrol;

  end 
end^

SET TERM ; ^




/*------ SYSDBA 13/05/2014 15:17:13 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_compras_atualizar_estoque for tbcompras
active after update position 1
AS
  declare variable produto varchar(10);
  declare variable empresa varchar(18);
  declare variable estoque    DMN_QUANTIDADE_D3;
  declare variable quantidade DMN_QUANTIDADE_D3;
  declare variable custo_produto numeric(15,2);
  declare variable custo_compra numeric(15,2);
  declare variable custo_medio numeric(15,2);
  declare variable preco_venda dmn_money;
  declare variable percentual_markup dmn_percentual_3;
  declare variable alterar_custo Smallint;
  declare variable estoque_unico Smallint;
  declare variable movimentar Smallint;
begin
  if ( (coalesce(old.Status, 0) <> coalesce(new.Status, 0)) and (new.Status = 2)) then
  begin

    -- Buscar FLAG de alteracao de custo de produto
    Select
      cf.cfop_altera_custo_produto
    from TBCFOP cf
    where cf.cfop_cod = new.nfcfop
    Into
        alterar_custo;

    alterar_custo = coalesce(:alterar_custo, 1);

    -- Buscar FLAG de estoque unico
    Select
      cnf.estoque_unico_empresas
    from TBCONFIGURACAO cnf
    where cnf.empresa = new.codemp
    Into
      estoque_unico;

    estoque_unico = coalesce(:estoque_unico, 0);

    -- Incrimentar Estoque do produto
    for
      Select
          i.Codprod
        , i.Codemp
        , i.Qtde
        , coalesce(p.Qtde, 0)
        , coalesce(i.Customedio, 0)
        , coalesce(p.Customedio, 0)
        , p.percentual_marckup
        , p.preco
        , coalesce(p.movimenta_estoque, 1)
      from TBCOMPRASITENS i
        inner join TBPRODUTO p on (p.Cod = i.Codprod)
      where i.Ano = new.Ano
        and i.Codcontrol = new.Codcontrol
      into
          Produto
        , Empresa
        , Quantidade
        , Estoque
        , Custo_compra
        , Custo_produto
        , Percentual_markup
        , Preco_venda
        , Movimentar
    do
    begin
      if ( (:Custo_compra > 0) and (:Custo_produto > 0) and (:Estoque > 0) ) then
        Custo_medio = (:Custo_compra + :Custo_produto) / 2;
      else
        Custo_medio = :Custo_compra;

--      Percentual_markup = cast( ( ( (:Preco_venda - :Custo_medio) / :Custo_medio) * 100) as numeric(18,3) );
      Percentual_markup = cast( ( ( (:Preco_venda - :Custo_compra) / :Custo_compra) * 100 ) as numeric(18,3) );

      -- Incrementar estoque
      Update TBPRODUTO p Set
          --p.Customedio = Case when :alterar_custo = 1 then :Custo_medio else p.Customedio end
          p.Customedio = Case when :alterar_custo = 1 then :Custo_compra else p.Customedio end
        , p.Qtde       = Case when :Movimentar = 1    then :Estoque + :Quantidade else :Estoque end
        , p.percentual_marckup = :Percentual_markup
--        , p.preco_sugerido     = cast( (:Custo_medio + (:Custo_medio * :Percentual_markup / 100)) as numeric(15,2) )
        , p.preco_sugerido     = cast( (:Custo_compra + (:Custo_compra * :Percentual_markup / 100)) as numeric(15,2) )
      where (p.Cod     = :Produto)
        and ((p.Codemp = :Empresa) or (:estoque_unico = 1)) ;

      -- Gravar posicao de estoque
      Update TBCOMPRASITENS i Set
          i.Qtdeantes = :Estoque
        , i.Qtdefinal = :Estoque + :Quantidade
      where i.Ano = new.Ano
        and i.Codcontrol = new.Codcontrol
        and i.Codemp     = new.Codemp
        and i.Codprod    = :Produto;

      -- Gerar historico
      Insert Into TBPRODHIST (
          Codempresa
        , Codprod
        , Doc
        , Historico
        , Dthist
        , Qtdeatual
        , Qtdenova
        , Qtdefinal
        , Resp
        , Motivo
      ) values (
          :Empresa
        , :Produto
        , new.Ano || '/' || new.Codcontrol
        , Trim('ENTRADA - COMPRA ' || Case when :Movimentar = 1 then '' else '*' end)
        , Current_time
        , :Estoque
        , :Quantidade
        , :Estoque + :Quantidade
        , new.Usuario
        , 'Custo Medio no valor de R$ ' || :Custo_medio
      );
    end
     
  end 
end^

SET TERM ; ^




/*------ SYSDBA 13/05/2014 15:19:06 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_vendas_cancelar for tbvendas
active after update position 3
AS
  declare variable produto varchar(10);
  declare variable empresa varchar(18);
  declare variable estoque    DMN_QUANTIDADE_D3;
  declare variable quantidade DMN_QUANTIDADE_D3;
  declare variable valor_produto numeric(15,2);
  declare variable Movimentar Smallint;
begin
  if ( (coalesce(old.Status, 0) <> coalesce(new.Status, 0)) and (new.Status = 5)) then /* 5. Cancelada */
  begin

    -- Retornar produto do Estoque
    for
      Select
          i.Codprod
        , i.Codemp
        , i.Qtde
        , coalesce(p.Qtde, 0)
        , coalesce(p.Preco, 0)
        , coalesce(p.movimenta_estoque, 1)
      from TVENDASITENS i
        inner join TBPRODUTO p on (p.Cod = i.Codprod)
      where i.Ano = new.Ano
        and i.Codcontrol = new.Codcontrol
      into
          produto
        , empresa
        , quantidade
        , estoque
        , valor_produto
        , Movimentar
    do
    begin
      estoque = Case when :Movimentar = 1 then (:Estoque + :Quantidade) else :Estoque end;

      -- Retornar estoque
      Update TBPRODUTO p Set
        p.Qtde = :Estoque
      where p.Cod    = :Produto
        and p.Codemp = :Empresa;

      -- Gerar historico
      Insert Into TBPRODHIST (
          Codempresa
        , Codprod
        , Doc
        , Historico
        , Dthist
        , Qtdeatual
        , Qtdenova
        , Qtdefinal
        , Resp
        , Motivo
      ) values (
          :Empresa
        , :Produto
        , new.Ano || '/' || new.Codcontrol
        , Trim('ENTRADA - VENDA CANCELADA ' || Case when :Movimentar = 1 then '' else '*' end)
        , Current_time
        , :Estoque - :Quantidade
        , :Quantidade
        , :Estoque
        , new.Cancel_usuario
        , 'Venda no valor de R$ ' || :Valor_produto
      );

    end

    -- Cancelar Contas A Receber (Apenas parcelas nao pagas)
    Update TBCONTREC r Set
        r.status   = 'CANCELADA'
      , r.Situacao = 0 -- Cancelado
      , r.enviado  = 0 -- Enviar boleto novamente para o banco
    where r.anovenda = new.ano
      and r.numvenda = new.codcontrol
      and coalesce(r.Valorrectot, 0) = 0;

    -- Cancelar Movimento Caixa
    Update TBCAIXA_MOVIMENTO m Set
      m.Situacao = 0 -- Cancelado
    where m.Empresa = new.Codemp
      and m.Cliente = new.Codcli
      and m.Venda_ano = new.Ano
      and m.Venda_num = new.Codcontrol;
     
  end 
end^

SET TERM ; ^




/*------ SYSDBA 13/05/2014 15:20:34 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_vendas_estoque_atualizar for tbvendas
active after update position 1
AS
  declare variable produto varchar(10);
  declare variable empresa varchar(18);
  declare variable estoque    DMN_QUANTIDADE_D3;
  declare variable quantidade DMN_QUANTIDADE_D3;
  declare variable reserva    DMN_QUANTIDADE_D3;
  declare variable valor_produto numeric(15,2);
  declare variable estoque_unico Smallint;
  declare variable Movimentar Smallint;
begin
  if ( (coalesce(old.Status, 0) <> coalesce(new.Status, 0)) and (new.Status = 3)) then /* 3. Finalizada */
  begin

    -- Buscar FLAG de estoque unico
    Select
      cnf.estoque_unico_empresas
    from TBCONFIGURACAO cnf
    where cnf.empresa = new.codemp
    Into
      estoque_unico;
    estoque_unico = coalesce(:estoque_unico, 0);

    -- Baixar produto do Estoque
    for
      Select
          i.Codprod
        , i.Codemp
        , i.Qtde
        , coalesce(p.Qtde, 0)
        , coalesce(p.Reserva, 0)
        , coalesce(p.Preco, 0)
        , coalesce(p.movimenta_estoque, 1)
      from TVENDASITENS i
        inner join TBPRODUTO p on (p.Cod = i.Codprod)
      where i.Ano = new.Ano
        and i.Codcontrol = new.Codcontrol
      into
          produto
        , empresa
        , quantidade
        , estoque
        , reserva
        , valor_produto
        , Movimentar
    do
    begin
      reserva = 0; -- :reserva - :Quantidade;  -- Descontinuada RESERVA
      estoque = Case when :Movimentar = 1 then (:Estoque - :Quantidade) else :Estoque end;

      -- Baixar estoque
      Update TBPRODUTO p Set
          p.Qtde    = :Estoque
        --, p.Reserva = :Reserva               -- Descontinuada RESERVA
      where (p.Cod     = :Produto)
        and ((p.Codemp = :Empresa) or (:estoque_unico = 1)) ;

      -- Gravar posicao de estoque
      Update TVENDASITENS i Set
        i.Qtdefinal = :Estoque
      where i.Ano        = new.Ano
        and i.Codcontrol = new.Codcontrol
        and i.Codemp     = new.Codemp
        and i.Codprod    = :Produto;

      -- Gerar historico
      Insert Into TBPRODHIST (
          Codempresa
        , Codprod
        , Doc
        , Historico
        , Dthist
        , Qtdeatual
        , Qtdenova
        , Qtdefinal
        , Resp
        , Motivo
      ) values (
          :Empresa
        , :Produto
        , new.Ano || '/' || new.Codcontrol
        , Trim('SAIDA - VENDA ' || Case when :Movimentar = 1 then '' else '*' end)
        , Current_time
        , :Estoque + :Quantidade
        , :Quantidade
        , :Estoque
        , new.Usuario
        , 'Venda no valor de R$ ' || :Valor_produto
      );
    end
     
  end 
end^

SET TERM ; ^




/*------ SYSDBA 13/05/2014 15:21:01 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_compras_atualizar_estoque for tbcompras
active after update position 1
AS
  declare variable produto varchar(10);
  declare variable empresa varchar(18);
  declare variable estoque    DMN_QUANTIDADE_D3;
  declare variable quantidade DMN_QUANTIDADE_D3;
  declare variable custo_produto numeric(15,2);
  declare variable custo_compra numeric(15,2);
  declare variable custo_medio numeric(15,2);
  declare variable preco_venda dmn_money;
  declare variable percentual_markup dmn_percentual_3;
  declare variable alterar_custo Smallint;
  declare variable estoque_unico Smallint;
  declare variable movimentar Smallint;
begin
  if ( (coalesce(old.Status, 0) <> coalesce(new.Status, 0)) and (new.Status = 2)) then
  begin

    -- Buscar FLAG de alteracao de custo de produto
    Select
      cf.cfop_altera_custo_produto
    from TBCFOP cf
    where cf.cfop_cod = new.nfcfop
    Into
        alterar_custo;

    alterar_custo = coalesce(:alterar_custo, 1);

    -- Buscar FLAG de estoque unico
    Select
      cnf.estoque_unico_empresas
    from TBCONFIGURACAO cnf
    where cnf.empresa = new.codemp
    Into
      estoque_unico;

    estoque_unico = coalesce(:estoque_unico, 0);

    -- Incrimentar Estoque do produto
    for
      Select
          i.Codprod
        , i.Codemp
        , i.Qtde
        , coalesce(p.Qtde, 0)
        , coalesce(i.Customedio, 0)
        , coalesce(p.Customedio, 0)
        , p.percentual_marckup
        , p.preco
        , coalesce(p.movimenta_estoque, 1)
      from TBCOMPRASITENS i
        inner join TBPRODUTO p on (p.Cod = i.Codprod)
      where i.Ano = new.Ano
        and i.Codcontrol = new.Codcontrol
      into
          Produto
        , Empresa
        , Quantidade
        , Estoque
        , Custo_compra
        , Custo_produto
        , Percentual_markup
        , Preco_venda
        , Movimentar
    do
    begin
      if ( (:Custo_compra > 0) and (:Custo_produto > 0) and (:Estoque > 0) ) then
        Custo_medio = (:Custo_compra + :Custo_produto) / 2;
      else
        Custo_medio = :Custo_compra;

--      Percentual_markup = cast( ( ( (:Preco_venda - :Custo_medio) / :Custo_medio) * 100) as numeric(18,3) );
      Percentual_markup = cast( ( ( (:Preco_venda - :Custo_compra) / :Custo_compra) * 100 ) as numeric(18,3) );

      -- Incrementar estoque
      Update TBPRODUTO p Set
          --p.Customedio = Case when :alterar_custo = 1 then :Custo_medio else p.Customedio end
          p.Customedio = Case when :alterar_custo = 1 then :Custo_compra else p.Customedio end
        , p.Qtde       = Case when :Movimentar = 1    then (:Estoque + :Quantidade) else :Estoque end
        , p.percentual_marckup = :Percentual_markup
--        , p.preco_sugerido     = cast( (:Custo_medio + (:Custo_medio * :Percentual_markup / 100)) as numeric(15,2) )
        , p.preco_sugerido     = cast( (:Custo_compra + (:Custo_compra * :Percentual_markup / 100)) as numeric(15,2) )
      where (p.Cod     = :Produto)
        and ((p.Codemp = :Empresa) or (:estoque_unico = 1)) ;

      -- Gravar posicao de estoque
      Update TBCOMPRASITENS i Set
          i.Qtdeantes = :Estoque
        , i.Qtdefinal = :Estoque + :Quantidade
      where i.Ano = new.Ano
        and i.Codcontrol = new.Codcontrol
        and i.Codemp     = new.Codemp
        and i.Codprod    = :Produto;

      -- Gerar historico
      Insert Into TBPRODHIST (
          Codempresa
        , Codprod
        , Doc
        , Historico
        , Dthist
        , Qtdeatual
        , Qtdenova
        , Qtdefinal
        , Resp
        , Motivo
      ) values (
          :Empresa
        , :Produto
        , new.Ano || '/' || new.Codcontrol
        , Trim('ENTRADA - COMPRA ' || Case when :Movimentar = 1 then '' else '*' end)
        , Current_time
        , :Estoque
        , :Quantidade
        , :Estoque + :Quantidade
        , new.Usuario
        , 'Custo Medio no valor de R$ ' || :Custo_medio
      );
    end
     
  end 
end^

SET TERM ; ^




/*------ SYSDBA 13/05/2014 15:21:20 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_compras_cancelar for tbcompras
active after update position 2
AS
  declare variable produto varchar(10);
  declare variable empresa varchar(18);
  declare variable estoque    DMN_QUANTIDADE_D3;
  declare variable quantidade DMN_QUANTIDADE_D3;
  declare variable custo_compra numeric(15,2);
  declare variable Movimentar Smallint;
begin
  if ( (coalesce(old.Status, 0) <> coalesce(new.Status, 0)) and (new.Status = 3)) then
  begin

    -- Decrementar Estoque do produto
    for
      Select
          i.Codprod
        , i.Codemp
        , i.Qtde
        , coalesce(p.Qtde, 0)
        , coalesce(i.Customedio, 0)
        , coalesce(p.movimenta_estoque, 1)
      from TBCOMPRASITENS i
        inner join TBPRODUTO p on (p.Cod = i.Codprod)
      where i.Ano = new.Ano
        and i.Codcontrol = new.Codcontrol
      into
          Produto
        , Empresa
        , Quantidade
        , Estoque
        , Custo_compra
        , Movimentar
    do
    begin
      -- Decrementar estoque
      Update TBPRODUTO p Set
        p.Qtde       = Case when :Movimentar = 1 then (:Estoque - :Quantidade) else :Estoque end
      where p.Cod    = :Produto
        and p.Codemp = :Empresa;

      -- Gerar historico
      Insert Into TBPRODHIST (
          Codempresa
        , Codprod
        , Doc
        , Historico
        , Dthist
        , Qtdeatual
        , Qtdenova
        , Qtdefinal
        , Resp
        , Motivo
      ) values (
          :Empresa
        , :Produto
        , new.Ano || '/' || new.Codcontrol
        , Trim('SAIDA - COMPRA CANCELADA ' || Case when :Movimentar = 1 then '' else '*' end)
        , Current_time
        , :Estoque
        , :Quantidade
        , :Estoque - :Quantidade
        , new.Cancel_usuario
        , 'Custo Final no valor de R$ ' || :Custo_compra
      );
    end
     
    -- Cancelar Movimento Caixa
    Update TBCAIXA_MOVIMENTO m Set
      m.Situacao = 0 -- Cancelado
    where m.Empresa = new.Codemp
      and m.Fornecedor = new.Codforn
      and m.Compra_ano = new.Ano
      and m.Compra_num = new.Codcontrol;

  end 
end^

SET TERM ; ^

