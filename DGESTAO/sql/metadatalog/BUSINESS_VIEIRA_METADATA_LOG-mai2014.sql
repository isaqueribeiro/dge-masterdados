


/*------ SYSDBA 07/05/2014 03:13:46 --------*/

ALTER TABLE TBPRODUTO
    ADD CUST_DESP_OFIC DMN_MONEY,
    ADD CUST_DESP_GERAIS DMN_MONEY,
    ADD CUST_DESP_ADM DMN_MONEY,
    ADD CUST_COMISSAO DMN_MONEY,
    ADD CUST_IMPOSTO DMN_MONEY,
    ADD FI_RET_FINANC DMN_MONEY,
    ADD FI_RET_PLANO DMN_MONEY;




/*------ SYSDBA 08/05/2014 10:58:14 --------*/

CREATE DOMAIN DMN_COMISSAOVALOR AS
NUMERIC(6,2)
DEFAULT 0
NOT NULL;COMMENT ON DOMAIN DMN_COMISSAOVALOR IS 'Valor de Comissao';




/*------ SYSDBA 08/05/2014 10:59:26 --------*/

ALTER TABLE TBVENDEDOR
    ADD COMISSAO_VL DMN_COMISSAOVALOR;

COMMENT ON COLUMN TBVENDEDOR.COMISSAO_VL IS
'Valor de Comissao';




/*------ SYSDBA 08/05/2014 10:59:43 --------*/

UPDATE TBVENDEDOR
SET COMISSAO_VL = 0;




/*------ SYSDBA 08/05/2014 11:06:17 --------*/

COMMENT ON COLUMN TBPRODUTO.CUST_DESP_OFIC IS
'Custo Veiculo - Despesas Oficina';

COMMENT ON COLUMN TBPRODUTO.CUST_DESP_GERAIS IS
'Custo Veiculo - Despesas Gerais';

COMMENT ON COLUMN TBPRODUTO.CUST_DESP_ADM IS
'Custo Veiculo - Despesas Administrativas';

COMMENT ON COLUMN TBPRODUTO.CUST_COMISSAO IS
'Custo Veiculo - Despesas Comissao';

COMMENT ON COLUMN TBPRODUTO.CUST_IMPOSTO IS
'Custo Veiculo - Despesas Impostos';

COMMENT ON COLUMN TBPRODUTO.FI_RET_FINANC IS
'Retorno Financeiro - Financiadora';

COMMENT ON COLUMN TBPRODUTO.FI_RET_PLANO IS
'Retorno Financeiro - Por Plano';




/*------ SYSDBA 08/05/2014 11:12:09 --------*/

ALTER TABLE TBVENDEDOR
    ADD ATIVO DMN_LOGICO DEFAULT 1;

COMMENT ON COLUMN TBVENDEDOR.ATIVO IS
'Usuario ativo:
0 - Nao
1 - Sim';




/*------ SYSDBA 08/05/2014 11:12:21 --------*/

alter table TBVENDEDOR
alter COD position 1;

alter table TBVENDEDOR
alter NOME position 2;

alter table TBVENDEDOR
alter CPF position 3;

alter table TBVENDEDOR
alter ATIVO position 4;

alter table TBVENDEDOR
alter COMISSAO position 5;

alter table TBVENDEDOR
alter COMISSAO_VL position 6;

