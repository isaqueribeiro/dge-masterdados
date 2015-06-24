


/*------ SYSDBA 06/04/2015 22:53:55 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_COMPETENCIA (
    NUMERO integer,
    DESCRICAO varchar(50))
as
begin
  if ( (trim(coalesce(:descricao, '')) = '') and (:numero > 200000) ) then
  begin
    descricao = Case Cast(substring(:numero from 5 for 2) as Smallint)
                  when  1 then 'JAN/' || substring(:numero from 1 for 4)
                  when  2 then 'FEV/' || substring(:numero from 1 for 4)
                  when  3 then 'MAR/' || substring(:numero from 1 for 4)
                  when  4 then 'ABR/' || substring(:numero from 1 for 4)
                  when  5 then 'MAI/' || substring(:numero from 1 for 4)
                  when  6 then 'JUN/' || substring(:numero from 1 for 4)
                  when  7 then 'JUL/' || substring(:numero from 1 for 4)
                  when  8 then 'AGO/' || substring(:numero from 1 for 4)
                  when  9 then 'SET/' || substring(:numero from 1 for 4)
                  when 10 then 'OUT/' || substring(:numero from 1 for 4)
                  when 11 then 'NOV/' || substring(:numero from 1 for 4)
                  when 12 then 'DEZ/' || substring(:numero from 1 for 4)
                  else
                    :descricao
                end;
  end
   
  if (not exists(
    Select
      c.cmp_num
    from TBCOMPETENCIA c
    where c.cmp_num = :numero
  )) then
  begin

    Insert Into TBCOMPETENCIA (
        cmp_num
      , cmp_desc
    ) values (
        :numero
      , :descricao
    );

  end
  else
  begin

    Update TBCOMPETENCIA c Set
      c.cmp_desc = :descricao
    where c.cmp_num = :numero
      and c.cmp_desc is null;

  end 
end^

SET TERM ; ^

COMMENT ON PROCEDURE SET_COMPETENCIA IS 'Store Procedure Registrar Competencia.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   --/--/2014

Procedure reponsavel por cadastrar o registro de competencia das movimentacoes.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    06/04/2015 - IMR :
        * Documentacao da store procedure.';







/*------ SYSDBA 20/04/2015 11:31:58 --------*/

CREATE DOMAIN DMN_VCHAR_12 AS
VARCHAR(10);


/*------ SYSDBA 20/04/2015 11:32:32 --------*/

ALTER DOMAIN DMN_VCHAR_12
TYPE VARCHAR(12) CHARACTER SET ISO8859_2;




/*------ SYSDBA 20/04/2015 12:11:25 --------*/

ALTER TABLE TBVENDAS
    ADD DNFE_COMPRA_ANO DMN_SMALLINT_N,
    ADD DNFE_COMPRA_COD DMN_BIGINT_N,
    ADD DNFE_FORMA DMN_SMALLINT_N,
    ADD DNFE_UF DMN_UF,
    ADD DNFE_CNPJ_CPF DMN_CNPJ,
    ADD DNFE_IE DMN_VCHAR_20,
    ADD DNFE_COMPETENCIA DMN_VCHAR_04,
    ADD DNFE_SERIE DMN_VCHAR_04,
    ADD DNFE_NUMERO DMN_BIGINT_N,
    ADD DNFE_MODELO DMN_SMALLINT_N,
    ADD DNFE_CHAVE DMN_VCHAR_250,
    ADD DECF_MODELO DMN_SMALLINT_N,
    ADD DECF_NUMERO DMN_BIGINT_N,
    ADD DECF_COO DMN_BIGINT_N;

COMMENT ON COLUMN TBVENDAS.DNFE_COMPRA_ANO IS
'Devolucao -> Ano Compra';

COMMENT ON COLUMN TBVENDAS.DNFE_COMPRA_COD IS
'Devolucao -> Codigo Compra';

COMMENT ON COLUMN TBVENDAS.DNFE_FORMA IS
'Devolucao -> Forma/modelo de devolucao:
0 - NFe Eletronica
1 - NFe Modelo 1/1A
2 - NF produtor Rural
3 - Cupom Fiscal';

COMMENT ON COLUMN TBVENDAS.DNFE_UF IS
'Devolucao -> UF da NF devolvida';

COMMENT ON COLUMN TBVENDAS.DNFE_CNPJ_CPF IS
'Devolucao -> CPF/CNPJ da NF devolvida';

COMMENT ON COLUMN TBVENDAS.DNFE_IE IS
'Devolucao -> IE da NF devolvida';

COMMENT ON COLUMN TBVENDAS.DNFE_COMPETENCIA IS
'Devolucao -> Competencia de emissao da NF devolvida
Obs.: Formato AAMM.';

COMMENT ON COLUMN TBVENDAS.DNFE_SERIE IS
'Devolucao -> Serie da NF devolvida';

COMMENT ON COLUMN TBVENDAS.DNFE_NUMERO IS
'Devolucao -> Numero da NF devolvida';

COMMENT ON COLUMN TBVENDAS.DNFE_MODELO IS
'Devolucao -> Modelo da NF devolvida';

COMMENT ON COLUMN TBVENDAS.DNFE_CHAVE IS
'Devolucao -> Chave da NF-e devolvida';

COMMENT ON COLUMN TBVENDAS.DECF_MODELO IS
'Devolucao -> Modelo do cupom fiscal devolvido:
0 - (ECFModRefVazio)
1 - 2B = Cupom Fiscal emitido por maquina registradora (ECFModRef2B)
2 - 2C = Cupom Fiscal PDV (ECFModRef2C)
3 - 2D = Cupom Fiscal emitido por ECF (ECFModRef2D)';

COMMENT ON COLUMN TBVENDAS.DECF_NUMERO IS
'Devolucao -> Numero da ECF do cupom fiscal devolvido';

COMMENT ON COLUMN TBVENDAS.DECF_COO IS
'Devolucao -> Numero COO do cupom fiscal devolvido';




/*------ SYSDBA 20/04/2015 12:12:21 --------*/

ALTER TABLE TBVENDAS
ADD CONSTRAINT FK_TBVENDAS_DEVOLVER_COMPRA
FOREIGN KEY (DNFE_COMPRA_ANO,DNFE_COMPRA_COD,CODEMP)
REFERENCES TBCOMPRAS(ANO,CODCONTROL,CODEMP);




/*------ SYSDBA 20/04/2015 12:13:51 --------*/

COMMENT ON COLUMN TBVENDAS.DNFE_NUMERO IS
'Devolucao -> Numero DF da NF devolvida:
0 - moNFe  (Nota Fiscal Eletronica)
1 - moNFCe (Nota Fiscal do Consumidor Eletronica)';




/*------ SYSDBA 20/04/2015 12:15:36 --------*/

CREATE OR ALTER VIEW VW_TIPO_DOCUMENTO_ENTRADA(
    TPD_CODIGO,
    TPD_DESCRICAO)
AS
Select 0 as TPD_CODIGO , 'Avulso'        as TPD_DESCRICAO from RDB$DATABASE union
Select 1 as TPD_CODIGO , 'Nota Fiscal *' as TPD_DESCRICAO from RDB$DATABASE union
Select 2 as TPD_CODIGO , 'Cupom Fiscal'  as TPD_DESCRICAO from RDB$DATABASE union
Select 3 as TPD_CODIGO , 'Nota Série D'  as TPD_DESCRICAO from RDB$DATABASE union
Select 4 as TPD_CODIGO , 'Contrato'      as TPD_DESCRICAO from RDB$DATABASE union
Select 5 as TPD_CODIGO , 'NF-e'          as TPD_DESCRICAO from RDB$DATABASE union
Select 6 as TPD_CODIGO , 'NFC-e'         as TPD_DESCRICAO from RDB$DATABASE
;




/*------ SYSDBA 20/04/2015 12:17:08 --------*/

CREATE OR ALTER VIEW VW_TIPO_DOCUMENTO_ENTRADA(
    TPD_CODIGO,
    TPD_DESCRICAO)
AS
Select 0 as TPD_CODIGO , 'Avulso'        as TPD_DESCRICAO from RDB$DATABASE union
Select 1 as TPD_CODIGO , 'Nota Fiscal *' as TPD_DESCRICAO from RDB$DATABASE union
Select 2 as TPD_CODIGO , 'Cupom Fiscal'  as TPD_DESCRICAO from RDB$DATABASE union
Select 3 as TPD_CODIGO , 'Nota Série D'  as TPD_DESCRICAO from RDB$DATABASE union
Select 4 as TPD_CODIGO , 'Contrato'      as TPD_DESCRICAO from RDB$DATABASE union
Select 5 as TPD_CODIGO , 'NF-e'          as TPD_DESCRICAO from RDB$DATABASE union
Select 6 as TPD_CODIGO , 'NFC-e'         as TPD_DESCRICAO from RDB$DATABASE
;



/*------ SYSDBA 20/04/2015 19:25:04 --------*/

/*!!! Error occured !!!
Invalid token.
Dynamic SQL Error.
SQL error code = -104.
Unexpected end of command - line 4, column 44.

*/


/*------ SYSDBA 20/04/2015 19:25:26 --------*/

CREATE OR ALTER VIEW vw_forma_devolucao ( Codigo, Descricao )
as
Select 0 as Codigo, 'NF Eletronica'     as Descricao from RDB$DATABASE Union
Select 1 as Codigo, 'NF Modelo 1/1A'    as Descricao from RDB$DATABASE Union
Select 2 as Codigo, 'NF Produtor Rural' as Descricao from RDB$DATABASE Union
Select 3 as Codigo, 'Cupom Fiscal'      as Descricao from RDB$DATABASE
;

GRANT ALL ON VW_FORMA_DEVOLUCAO TO "PUBLIC";



/*------ SYSDBA 20/04/2015 19:32:17 --------*/

CREATE OR ALTER VIEW VW_FORMA_DEVOLUCAO(
    CODIGO,
    DESCRICAO)
AS
Select 0 as Codigo, 'Nota Fiscal Eletronica'     as Descricao from RDB$DATABASE Union
Select 1 as Codigo, 'Nota Fiscal Modelo 1/1A'    as Descricao from RDB$DATABASE Union
Select 2 as Codigo, 'Nota Fiscal Produtor Rural' as Descricao from RDB$DATABASE Union
Select 3 as Codigo, 'Cupom Fiscal'      as Descricao from RDB$DATABASE
;




/*------ SYSDBA 20/04/2015 20:13:45 --------*/

create view vw_modelo_cupom_fiscal ( codigo, descricao )
as
Select 0 as Codigo, 'Vazio' as Descricao from RDB$DATABASE Union
Select 1 as Codigo, '2B - Cupom Fiscal emitido por Maquina Registradora' as Descricao from RDB$DATABASE Union
Select 2 as Codigo, '2C - Cupom Fiscal PDV'             as Descricao from RDB$DATABASE Union
Select 3 as Codigo, '2D - Cupom Fiscal emitido por ECF' as Descricao from RDB$DATABASE
;

GRANT ALL ON VW_MODELO_CUPOM_FISCAL TO "PUBLIC";

/*------ SYSDBA 23/05/2015 09:09:11 --------*/

Alter Table TBCOMPRAS
 add column DNFE_ENTRADA_ANO            DMN_SMALLINT_N /* DMN_SMALLINT_N = SMALLINT */,
 add column DNFE_ENTRADA_COD            DMN_BIGINT_N /* DMN_BIGINT_N = INTEGER */,
 add column DNFE_FORMA                 DMN_SMALLINT_N /* DMN_SMALLINT_N = SMALLINT */,
 add column DNFE_UF                    DMN_UF /* DMN_UF = CHAR(2) */,
 add column DNFE_CNPJ_CPF              DMN_CNPJ /* DMN_CNPJ = VARCHAR(18) */,
 add column DNFE_IE                    DMN_VCHAR_20 /* DMN_VCHAR_20 = VARCHAR(20) */,
 add column DNFE_COMPETENCIA           DMN_VCHAR_04 /* DMN_VCHAR_04 = VARCHAR(4) */,
 add column DNFE_SERIE                 DMN_VCHAR_04 /* DMN_VCHAR_04 = VARCHAR(4) */,
 add column DNFE_NUMERO                DMN_BIGINT_N /* DMN_BIGINT_N = INTEGER */,
 add column DNFE_MODELO                DMN_SMALLINT_N /* DMN_SMALLINT_N = SMALLINT */,
 add column DNFE_CHAVE                 DMN_VCHAR_250 /* DMN_VCHAR_250 = VARCHAR(250) */,
 add column DECF_MODELO                DMN_SMALLINT_N /* DMN_SMALLINT_N = SMALLINT */,
 add column DECF_NUMERO                DMN_BIGINT_N /* DMN_BIGINT_N = INTEGER */,
 add column DECF_COO                   DMN_BIGINT_N /* DMN_BIGINT_N = INTEGER */;

/*------ SYSDBA 23/05/2015 09:09:11 --------*/

/*!!! Error occured !!!
Invalid token.
Dynamic SQL Error.
SQL error code = -104.
Token unknown - line 2, column 6.
column.

*/

/*------ SYSDBA 23/05/2015 09:10:46 --------*/

Alter Table TBCOMPRAS
 add DNFE_ENTRADA_ANO            DMN_SMALLINT_N /* DMN_SMALLINT_N = SMALLINT */,
 add DNFE_ENTRADA_COD            DMN_BIGINT_N /* DMN_BIGINT_N = INTEGER */,
 add DNFE_FORMA                 DMN_SMALLINT_N /* DMN_SMALLINT_N = SMALLINT */,
 add DNFE_UF                    DMN_UF /* DMN_UF = CHAR(2) */,
 add DNFE_CNPJ_CPF              DMN_CNPJ /* DMN_CNPJ = VARCHAR(18) */,
 add DNFE_IE                    DMN_VCHAR_20 /* DMN_VCHAR_20 = VARCHAR(20) */,
 add DNFE_COMPETENCIA           DMN_VCHAR_04 /* DMN_VCHAR_04 = VARCHAR(4) */,
 add DNFE_SERIE                 DMN_VCHAR_04 /* DMN_VCHAR_04 = VARCHAR(4) */,
 add DNFE_NUMERO                DMN_BIGINT_N /* DMN_BIGINT_N = INTEGER */,
 add DNFE_MODELO                DMN_SMALLINT_N /* DMN_SMALLINT_N = SMALLINT */,
 add DNFE_CHAVE                 DMN_VCHAR_250 /* DMN_VCHAR_250 = VARCHAR(250) */,
 add DECF_MODELO                DMN_SMALLINT_N /* DMN_SMALLINT_N = SMALLINT */,
 add DECF_NUMERO                DMN_BIGINT_N /* DMN_BIGINT_N = INTEGER */,
 add DECF_COO                   DMN_BIGINT_N /* DMN_BIGINT_N = INTEGER */;

/*------ SYSDBA 23/05/2015 09:10:49 --------*/

COMMIT WORK;

/*------ 23/05/2015 09:12:48 --------*/

COMMENT ON COLUMN TBCOMPRAS.DNFE_ENTRADA_ANO IS
'Devolucao -> Ano Entrada';

/*------ 23/05/2015 09:12:48 --------*/

COMMENT ON COLUMN TBCOMPRAS.DNFE_ENTRADA_COD IS
'Devolucao -> Codigo Entrada';

/*------ 23/05/2015 09:12:48 --------*/

COMMENT ON COLUMN TBCOMPRAS.DNFE_FORMA IS 
'Devolucao -> Forma/modelo de devolucao:
0 - NFe Eletronica
1 - NFe Modelo 1/1A
2 - NF produtor Rural
3 - Cupom Fiscal';

/*------ 23/05/2015 09:12:48 --------*/

COMMENT ON COLUMN TBCOMPRAS.DNFE_UF IS 
'Devolucao -> UF da NF devolvida';

/*------ 23/05/2015 09:12:48 --------*/

COMMENT ON COLUMN TBCOMPRAS.DNFE_CNPJ_CPF IS 
'Devolucao -> CPF/CNPJ da NF devolvida';

/*------ 23/05/2015 09:12:48 --------*/

COMMENT ON COLUMN TBCOMPRAS.DNFE_IE IS 
'Devolucao -> IE da NF devolvida';

/*------ 23/05/2015 09:12:48 --------*/

COMMENT ON COLUMN TBCOMPRAS.DNFE_COMPETENCIA IS 
'Devolucao -> Competencia de emissao da NF devolvida
Obs.: Formato AAMM.';

/*------ 23/05/2015 09:12:48 --------*/

COMMENT ON COLUMN TBCOMPRAS.DNFE_SERIE IS 
'Devolucao -> Serie da NF devolvida';

/*------ 23/05/2015 09:12:48 --------*/

COMMENT ON COLUMN TBCOMPRAS.DNFE_NUMERO IS
'Devolucao -> Numero DF da NF devolvida:
0 - moNFe  (Nota Fiscal Eletronica)
1 - moNFCe (Nota Fiscal do Consumidor Eletronica)';

/*------ 23/05/2015 09:12:48 --------*/

COMMENT ON COLUMN TBCOMPRAS.DNFE_MODELO IS 
'Devolucao -> Modelo da NF devolvida';

/*------ 23/05/2015 09:12:48 --------*/

COMMENT ON COLUMN TBCOMPRAS.DNFE_CHAVE IS 
'Devolucao -> Chave da NF-e devolvida';

/*------ 23/05/2015 09:12:48 --------*/

COMMENT ON COLUMN TBCOMPRAS.DECF_MODELO IS 
'Devolucao -> Modelo do cupom fiscal devolvido:
0 - (ECFModRefVazio)
1 - 2B = Cupom Fiscal emitido por maquina registradora (ECFModRef2B)
2 - 2C = Cupom Fiscal PDV (ECFModRef2C)
3 - 2D = Cupom Fiscal emitido por ECF (ECFModRef2D)';

/*------ 23/05/2015 09:12:48 --------*/

COMMENT ON COLUMN TBCOMPRAS.DECF_NUMERO IS 
'Devolucao -> Numero da ECF do cupom fiscal devolvido';

/*------ 23/05/2015 09:12:48 --------*/

COMMENT ON COLUMN TBCOMPRAS.DECF_COO IS 
'Devolucao -> Numero COO do cupom fiscal devolvido';


/*------ SYSDBA 23/05/2015 09:15:42 --------*/

ALTER TABLE TBCOMPRAS
ADD CONSTRAINT FK_TBCOMPRAS_DEVOLVER_ENTRADA
FOREIGN KEY (DNFE_ENTRADA_ANO,DNFE_ENTRADA_COD,CODEMP)
REFERENCES TBCOMPRAS(ANO,CODCONTROL,CODEMP);



/*------ SYSDBA 23/05/2015 09:50:52 --------*/

/*!!! Error occured !!!
Column does not belong to referenced table.
Dynamic SQL Error.
SQL error code = -206.
Column unknown.
C.DNFE_COMPRA_ANO.
At line 5, column 7.

*/

/*------ SYSDBA 11/06/2015 09:01:14 --------*/

ALTER TABLE TBCOMPRASITENS
    ADD TOTAL_BRUTO DMN_MONEY,
    ADD TOTAL_LIQUIDO DMN_MONEY;




/*------ SYSDBA 11/06/2015 09:01:35 --------*/

COMMENT ON COLUMN TBCOMPRASITENS.TOTAL_BRUTO IS
'Valor Total Produto.';




/*------ SYSDBA 11/06/2015 09:02:23 --------*/

COMMENT ON COLUMN TBCOMPRASITENS.TOTAL_LIQUIDO IS
'Valor Total Liquido.';




/*------ SYSDBA 11/06/2015 09:03:33 --------*/

COMMENT ON COLUMN TBCOMPRASITENS.TOTAL_LIQUIDO IS
'Valor Total Liquido (Total Bruto Produto - Valor Total Desconto).';



/*------ SYSDBA 11/06/2015 09:50:08 --------*/

execute block
as
  declare variable ano Smallint;
  declare variable cod Integer;
  declare variable emp DMN_CNPJ;
  declare variable seq Smallint;
  declare variable tot DMN_MONEY;
begin
  for
    Select
        ci.ano
      , ci.codcontrol
      , ci.codemp
      , ci.seq
      , ci.qtde * ci.precounit
    from TBCOMPRASITENS ci
    Into
        ano
      , cod
      , emp
      , seq
      , tot
  do
  begin
    Update TBCOMPRASITENS ci Set
       ci.total_bruto   = :tot
     , ci.total_liquido = :tot - ci.valor_desconto
    where ci.ano        = :ano
      and ci.codcontrol = :cod
      and ci.codemp     = :emp
      and ci.seq        = :seq;
  end 
end;

/*------ SYSDBA 24/06/2015 02:25:13 --------*/


ALTER TABLE TBCOMPRASITENS
    ADD CSOSN DMN_VCHAR_03;

alter table TBCOMPRASITENS
alter ANO position 1;

alter table TBCOMPRASITENS
alter CODCONTROL position 2;

alter table TBCOMPRASITENS
alter CODEMP position 3;

alter table TBCOMPRASITENS
alter SEQ position 4;

alter table TBCOMPRASITENS
alter CODFORN position 5;

alter table TBCOMPRASITENS
alter CODPROD position 6;

alter table TBCOMPRASITENS
alter QTDE position 7;

alter table TBCOMPRASITENS
alter PRECOUNIT position 8;

alter table TBCOMPRASITENS
alter CUSTOMEDIO position 9;

alter table TBCOMPRASITENS
alter DTENT position 10;

alter table TBCOMPRASITENS
alter NF position 11;

alter table TBCOMPRASITENS
alter QTDEANTES position 12;

alter table TBCOMPRASITENS
alter QTDEFINAL position 13;

alter table TBCOMPRASITENS
alter PERC_PARTICIPACAO position 14;

alter table TBCOMPRASITENS
alter VALOR_FRETE position 15;

alter table TBCOMPRASITENS
alter VALOR_DESCONTO position 16;

alter table TBCOMPRASITENS
alter VALOR_OUTROS position 17;

alter table TBCOMPRASITENS
alter VALOR_IPI position 18;

alter table TBCOMPRASITENS
alter UNID_COD position 19;

alter table TBCOMPRASITENS
alter NCM_SH position 20;

alter table TBCOMPRASITENS
alter CST position 21;

alter table TBCOMPRASITENS
alter CSOSN position 22;

alter table TBCOMPRASITENS
alter CFOP position 23;

alter table TBCOMPRASITENS
alter ALIQUOTA position 24;

alter table TBCOMPRASITENS
alter ALIQUOTA_CSOSN position 25;

alter table TBCOMPRASITENS
alter ALIQUOTA_PIS position 26;

alter table TBCOMPRASITENS
alter ALIQUOTA_COFINS position 27;

alter table TBCOMPRASITENS
alter PERCENTUAL_REDUCAO_BC position 28;