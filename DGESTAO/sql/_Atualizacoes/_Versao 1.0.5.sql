


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

