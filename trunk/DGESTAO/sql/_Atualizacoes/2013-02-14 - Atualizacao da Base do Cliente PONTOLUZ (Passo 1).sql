/* Server version: WI-V6.3.4.18393 Firebird 2.1 
   SQLDialect: 3. ODS: 11.1. Forced writes: On. Sweep inteval: 20000.
   Page size: 8192. Cache pages: 2048 (16384 Kb). Read-only: False. */

SET CLIENTLIB 'fbclient.dll';
SET NAMES ISO8859_2;

SET SQL DIALECT 3;

--CONNECT 'E:\db\Dorivaldo\BUSINESS-PONTOLUZ.FDB' USER 'SYSDBA' PASSWORD 'masterkey';

SET AUTODDL ON;

ALTER TABLE TBCOMPRAS ADD LOTE_NFE_ANO SMALLINT;

ALTER TABLE TBCOMPRAS ADD LOTE_NFE_NUMERO INTEGER;

ALTER TABLE TBCOMPRAS ADD NFE_ENVIADA SMALLINT DEFAULT 0;

DESCRIBE FIELD NFE_ENVIADA TABLE TBCOMPRAS
'NF de Entrada Enviada:
0 - Nao
1 - Sim';

ALTER TABLE TBCOMPRAS ADD VERIFICADOR_NFE VARCHAR(250);

DESCRIBE FIELD VERIFICADOR_NFE TABLE TBCOMPRAS
'Condigo de verificacao da NF-e gerada.';

ALTER TABLE TBCOMPRAS ADD XML_NFE BLOB SUB_TYPE 1;

DESCRIBE FIELD XML_NFE TABLE TBCOMPRAS
'Arquivo XML da NF-e gerada.';

ALTER TABLE TBCOMPRAS ADD XML_NFE_FILENAME VARCHAR(250);

DESCRIBE FIELD XML_NFE_FILENAME TABLE TBCOMPRAS
'Nome do arquivo XML da NF-e gerada.';

ALTER TABLE TBCOMPRAS ADD HREMISS TIME;

DESCRIBE FIELD HREMISS TABLE TBCOMPRAS
'Hora de Emissao da NF.';

ALTER TABLE TBCOMPRAS ADD VALORSEGURO DMN_MONEY;

DESCRIBE FIELD VALORSEGURO TABLE TBCOMPRAS
'Valor Total Seguro.';

ALTER TABLE TBCOMPRAS ADD VALORTOTAL_II DMN_MONEY;

DESCRIBE FIELD VALORTOTAL_II TABLE TBCOMPRAS
'Valor Total II.';

ALTER TABLE TBCOMPRAS ADD VALORTOTAL_IPI DMN_MONEY;

DESCRIBE FIELD VALORTOTAL_IPI TABLE TBCOMPRAS
'Valor Total IPI.';

ALTER TABLE TBCOMPRAS ADD VALORPIS DMN_MONEY;

DESCRIBE FIELD VALORPIS TABLE TBCOMPRAS
'Valor Total PIS.';

ALTER TABLE TBCOMPRAS ADD VALORCOFINS DMN_MONEY;

DESCRIBE FIELD VALORCOFINS TABLE TBCOMPRAS
'Valor Total COFINS.';

ALTER TABLE TBNFE_ENVIADA ADD ANOCOMPRA DMN_SMALLINT_N;

DESCRIBE FIELD ANOCOMPRA TABLE TBNFE_ENVIADA
'Ano Compra.';

ALTER TABLE TBNFE_ENVIADA ADD NUMCOMPRA DMN_INTEGER_N;

DESCRIBE FIELD NUMCOMPRA TABLE TBNFE_ENVIADA
'Numero de Controle Compra.';

ALTER TABLE TBVENDAS ADD TOTALVENDA_BRUTA DMN_MONEY;

DESCRIBE FIELD TOTALVENDA_BRUTA TABLE TBVENDAS
'Valor Total Venda Bruta (Total Produto).';

ALTER TABLE TVENDASITENS ADD TOTAL_BRUTO DMN_MONEY;

DESCRIBE FIELD TOTAL_BRUTO TABLE TVENDASITENS
'Total Bruto.';

ALTER TABLE TVENDASITENS ADD TOTAL_DESCONTO DMN_MONEY;

DESCRIBE FIELD TOTAL_DESCONTO TABLE TVENDASITENS
'Total Desconto.';

ALTER TABLE TVENDASITENS ADD TOTAL_LIQUIDO DMN_MONEY;

DESCRIBE FIELD TOTAL_LIQUIDO TABLE TVENDASITENS
'Total Liquido.';

DESCRIBE FIELD NF TABLE TBCOMPRAS
'Numero da NF-e';

ALTER TABLE TBCOMPRAS ALTER COLUMN NFSERIE TYPE DMN_VCHAR_04;

DESCRIBE FIELD NFSERIE TABLE TBCOMPRAS
'Serie da NF-e.';

DESCRIBE FIELD DTEMISS TABLE TBCOMPRAS
'Data de Emissao da NF.';

DESCRIBE FIELD IPI TABLE TBCOMPRAS
'Valor Total IPI.';

DESCRIBE FIELD ICMSBASE TABLE TBCOMPRAS
'Valor Base ICMS.';

DESCRIBE FIELD ICMSVALOR TABLE TBCOMPRAS
'Valor ICMS.';

DESCRIBE FIELD ICMSSUBSTBASE TABLE TBCOMPRAS
'Valor Base Subst. Trib. ICMS.';

DESCRIBE FIELD ICMSSUBSTVALOR TABLE TBCOMPRAS
'Valor Subst. Trib. ICMS.';

DESCRIBE FIELD FRETE TABLE TBCOMPRAS
'Valot Total Frete.';

DESCRIBE FIELD OUTROSCUSTOS TABLE TBCOMPRAS
'Valor Total de Outras Despesas.';

DESCRIBE FIELD DESCONTO TABLE TBCOMPRAS
'Valor Total Descontos.';

DESCRIBE FIELD TOTALPROD TABLE TBCOMPRAS
'Valor Total Produto.';

DESCRIBE FIELD TOTALNF TABLE TBCOMPRAS
'Valor Total Nota Fiscal.';

DESCRIBE FIELD PRECOUNIT TABLE TBCOMPRASITENS
'Valor Unitario Bruto.';

DESCRIBE FIELD CUSTOMEDIO TABLE TBCOMPRASITENS
'Valor Unitario Liquido.';

DESCRIBE FIELD PERC_PARTICIPACAO TABLE TBCOMPRASITENS
'Percentual de participacao do produto no tocante ao valor total da nota.';

DESCRIBE FIELD VALOR_FRETE TABLE TBCOMPRASITENS
'Valor Total do Frete do Produto.';

DESCRIBE FIELD VALOR_DESCONTO TABLE TBCOMPRASITENS
'Valor Total de Descontos do Produto.';

DESCRIBE FIELD VALOR_OUTROS TABLE TBCOMPRASITENS
'Valor Total de Outras Despesas do Produto.';

DESCRIBE FIELD VALOR_IPI TABLE TBCOMPRASITENS
'Valor Total IPI do Produto.';

/* Alter Field (Null / Not Null)... */
UPDATE RDB$RELATION_FIELDS SET RDB$NULL_FLAG = NULL WHERE RDB$FIELD_NAME='ANOVENDA' AND RDB$RELATION_NAME='TBNFE_ENVIADA';

SET TERM ^ ;

ALTER TRIGGER TG_NFE_ATUALIZAR_VENDA
 AS Declare variable I integer;
BEGIN I = 0; END
^

SET TERM ; ^

ALTER TABLE TBNFE_ENVIADA ALTER COLUMN ANOVENDA TYPE DMN_SMALLINT_N;

DESCRIBE FIELD ANOVENDA TABLE TBNFE_ENVIADA
'Ano Venda.';

DESCRIBE FIELD NUMVENDA TABLE TBNFE_ENVIADA
'Numero de Controle Venda.';

DESCRIBE FIELD TOTALVENDA TABLE TBVENDAS
'Valor Total Venda Liquida (Total Nota, na maioria dos casos).';


/* Alter View (Drop, Create)... */
/* Drop altered view: VW_TIPO_MOVIMENTO_CAIXA */
DROP VIEW VW_TIPO_MOVIMENTO_CAIXA;

/* Create altered view: VW_TIPO_MOVIMENTO_CAIXA */
/* Create view: VW_TIPO_MOVIMENTO_CAIXA */
CREATE VIEW VW_TIPO_MOVIMENTO_CAIXA(
TIPO,
TIPO_DESC)
 AS 
Select First 1
    'C' as TIPO
  , 'Credito' as TIPO_DESC
from TBEMPRESA

union

Select First 1
    'D' as TIPO
  , 'Debito' as TIPO_DESC
from TBEMPRESA
;

/* Create index... */
CREATE INDEX IDX_TBCOMPRAS_NFE ON TBCOMPRAS(CODFORN, NF, NFSERIE);


/* Create Foreign Key... */
RECONNECT;

ALTER TABLE TBCOMPRAS ADD CONSTRAINT FK_TBCOMPRAS_CFOP FOREIGN KEY (NFCFOP) REFERENCES TBCFOP (CFOP_COD);

/* Alter Procedure... */
/* empty dependent procedure body */
/* Clear: SET_GERAR_DUPLICATAS for: GET_DIA_UTIL */
SET TERM ^ ;

ALTER PROCEDURE SET_GERAR_DUPLICATAS(ANOCOMPRA SMALLINT,
NUMCOMPRA INTEGER)
 RETURNS(FORNECEDOR INTEGER,
NOTAFISCAL INTEGER,
PARCELAS SMALLINT,
VALOR_TOTAL NUMERIC(15,2),
PARCELA SMALLINT,
EMISSAO DATE,
VENCIMENTO DATE,
VALOR_DOCUMENTO NUMERIC(15,2),
FORMA_PAGTO SMALLINT,
CONDICAO_PAGTO SMALLINT,
DATA_ENTRADA DATE,
ANO_LANC SMALLINT,
NUM_LANC INTEGER)
 AS
 BEGIN SUSPEND; END
^

/* empty dependent procedure body */
/* Clear: SET_GERAR_TITULOS for: GET_DIA_UTIL */
ALTER PROCEDURE SET_GERAR_TITULOS(ANOVENDA SMALLINT,
NUMVENDA INTEGER)
 RETURNS(CLIENTE VARCHAR(18),
PARCELAS SMALLINT,
VALOR_TOTAL NUMERIC(15,2),
PARCELA SMALLINT,
EMISSAO DATE,
VENCIMENTO DATE,
VALOR_DOCUMENTO NUMERIC(15,2),
FORMA_PAGTO SMALLINT,
DATA_FINALIZ_VENDA DATE,
ANO_LANC SMALLINT,
NUM_LANC INTEGER)
 AS
 BEGIN SUSPEND; END
^

/* Alter (GET_DIA_UTIL) */
ALTER PROCEDURE GET_DIA_UTIL(DATA DATE,
DIAS INTEGER)
 RETURNS(DIA_UTIL DATE)
 AS
begin
  Dia_util = :Data + :Dias;
  if ( Extract(Weekday from :Dia_util) = 0 ) then /* Caso seja domingo */
    Dia_util = :Dia_util + 1;
  else
  if ( Extract(Weekday from :Dia_util) = 6 ) then /* Caso seja sabado */
    Dia_util = :Dia_util + 2;

  suspend;
end
^

/* Alter (SET_CONTA_CORRENTE_SALDO) */
ALTER PROCEDURE SET_CONTA_CORRENTE_SALDO(CONTA_CORRENTE INTEGER,
DATA_MOVIMENTO DATE)
 AS
declare variable DATA_SALDO_ANT date;
declare variable VALOR_SALDO_ANT numeric(15,2);
declare variable TOTAL_CREDITO_DIA numeric(15,2);
declare variable TOTAL_DEBITO_DIA numeric(15,2);
declare variable TOTAL_SALDO_DIA numeric(15,2);
begin
  -- Buscar Saldo anterior
  Select
      s1.Data_saldo
    , s1.Valor_saldo
  from TBCONTA_CORRENTE_SALDO s1
  where s1.Codigo = :Conta_corrente
    and s1.Data_saldo in (
      Select
        max(s2.Data_saldo)
      from TBCONTA_CORRENTE_SALDO s2
      where s2.Codigo = :Conta_corrente
        and s2.Data_saldo < :Data_movimento
    )
  into
      Data_saldo_ant
    , Valor_saldo_ant;

  -- Gravar Saldo anterior caso nao exista
  if ( :Data_saldo_ant is null ) then
  begin
    Data_saldo_ant  = :Data_movimento - 1;
    Valor_saldo_ant = 0;

    Insert Into TBCONTA_CORRENTE_SALDO (
        Codigo
      , Data_saldo
      , Valor_saldo
    ) values (
        :Conta_corrente
      , :Data_saldo_ant
      , :Valor_saldo_ant
    );
  end 

  -- Consolidar Creditos e Debitos do dia
  Select
      sum( Case when upper(m.Tipo) = 'C' then m.Valor else 0 end )
    , sum( Case when upper(m.Tipo) = 'D' then m.Valor else 0 end )
  from TBCAIXA_MOVIMENTO m
  where m.Situacao = 1 -- Confirmado
    and m.Conta_corrente = :Conta_corrente
    and cast(m.Datahora as Date ) = :Data_movimento
  into
      Total_credito_dia
    , Total_debito_dia;

  Total_saldo_dia = :Valor_saldo_ant + coalesce(:Total_credito_dia, 0) - coalesce(:Total_debito_dia, 0);

  /* Gerar Saldo Conta Corrente do Dia */
  if ( not Exists(
    Select
      s3.Codigo
    from TBCONTA_CORRENTE_SALDO s3
    where s3.Codigo = :Conta_corrente
      and s3.Data_saldo = :Data_movimento
  ) ) then
  begin

    -- Inserir Saldo do Dia
    Insert Into TBCONTA_CORRENTE_SALDO (
        Codigo
      , Data_saldo
      , Valor_saldo
    ) values (
        :Conta_corrente
      , :Data_movimento
      , :Total_saldo_dia
    );

   end
   else
   begin

     -- Atualizar Saldo do Dia
     Update TBCONTA_CORRENTE_SALDO s Set
       s.Valor_saldo = :Total_saldo_dia
     where s.Codigo = :Conta_corrente
       and s.Data_saldo = :Data_movimento;

   end 
end
^

/* Alter (SET_GERAR_DUPLICATAS) */
ALTER PROCEDURE SET_GERAR_DUPLICATAS(ANOCOMPRA SMALLINT,
NUMCOMPRA INTEGER)
 RETURNS(FORNECEDOR INTEGER,
NOTAFISCAL INTEGER,
PARCELAS SMALLINT,
VALOR_TOTAL NUMERIC(15,2),
PARCELA SMALLINT,
EMISSAO DATE,
VENCIMENTO DATE,
VALOR_DOCUMENTO NUMERIC(15,2),
FORMA_PAGTO SMALLINT,
CONDICAO_PAGTO SMALLINT,
DATA_ENTRADA DATE,
ANO_LANC SMALLINT,
NUM_LANC INTEGER)
 AS
declare variable P01 smallint;
declare variable P02 smallint;
declare variable P03 smallint;
declare variable P04 smallint;
declare variable P05 smallint;
declare variable P06 smallint;
declare variable P07 smallint;
declare variable P08 smallint;
declare variable P09 smallint;
declare variable P10 smallint;
declare variable P11 smallint;
declare variable P12 smallint;
declare variable valor_total_parcelas numeric(15,2);
begin
  for
    Select
        c.Codforn
      , c.Nf
      , coalesce(c.Prazo_01, 0)
      , c.Prazo_02
      , c.Prazo_03
      , c.Prazo_04
      , c.Prazo_05
      , c.Prazo_06
      , c.Prazo_07
      , c.Prazo_08
      , c.Prazo_09
      , c.Prazo_10
      , c.Prazo_11
      , c.Prazo_12
      , case when coalesce(c.Prazo_01, 0) is not null then 1 else 0 end +
        case when c.Prazo_02 is not null then 1 else 0 end +
        case when c.Prazo_03 is not null then 1 else 0 end +
        case when c.Prazo_04 is not null then 1 else 0 end +
        case when c.Prazo_05 is not null then 1 else 0 end +
        case when c.Prazo_06 is not null then 1 else 0 end +
        case when c.Prazo_07 is not null then 1 else 0 end +
        case when c.Prazo_08 is not null then 1 else 0 end +
        case when c.Prazo_09 is not null then 1 else 0 end +
        case when c.Prazo_10 is not null then 1 else 0 end +
        case when c.Prazo_11 is not null then 1 else 0 end +
        case when c.Prazo_12 is not null then 1 else 0 end as parcelas
      , c.Totalnf
      , c.Formapagto_cod
      , c.Condicaopagto_cod
      , c.Dtent
    from TBCOMPRAS c
    where c.Ano        = :Anocompra
      and c.Codcontrol = :Numcompra
    into
        Fornecedor
      , NotaFiscal
      , p01
      , p02
      , p03
      , p04
      , p05
      , p06
      , p07
      , p08
      , p09
      , p10
      , p11
      , p12
      , parcelas
      , valor_total
      , forma_pagto
      , Condicao_pagto
      , Data_entrada
  do
  begin

    parcela = 0;
    emissao = :Data_entrada;
    valor_documento = :Valor_total / :Parcelas;

    -- Parcela 1
    if ( :P01 is not null ) then
    begin
      if ( :P01 = 0 ) then
        parcela = 0;
      else
      if ( :P01 > 0 ) then
        parcela = 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P01) d into vencimento;

      Select
          d.Anolancamento
        , d.Numlancamento
      from SET_DUPLICATA_PAGAR (
          :Anocompra
        , :Numcompra
        , :Fornecedor
        , :Notafiscal
        , :Forma_pagto
        , :Condicao_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) d
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 2
    if ( :P02 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P02) d into vencimento;

      Select
          d.Anolancamento
        , d.Numlancamento
      from SET_DUPLICATA_PAGAR (
          :Anocompra
        , :Numcompra
        , :Fornecedor
        , :Notafiscal
        , :Forma_pagto
        , :Condicao_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) d
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 3
    if ( :P03 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P03) d into vencimento;

      Select
          d.Anolancamento
        , d.Numlancamento
      from SET_DUPLICATA_PAGAR (
          :Anocompra
        , :Numcompra
        , :Fornecedor
        , :Notafiscal
        , :Forma_pagto
        , :Condicao_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) d
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 4
    if ( :P04 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P04) d into vencimento;

      Select
          d.Anolancamento
        , d.Numlancamento
      from SET_DUPLICATA_PAGAR (
          :Anocompra
        , :Numcompra
        , :Fornecedor
        , :Notafiscal
        , :Forma_pagto
        , :Condicao_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) d
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 5
    if ( :P05 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P05) d into vencimento;

      Select
          d.Anolancamento
        , d.Numlancamento
      from SET_DUPLICATA_PAGAR (
          :Anocompra
        , :Numcompra
        , :Fornecedor
        , :Notafiscal
        , :Forma_pagto
        , :Condicao_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) d
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 6
    if ( :P06 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P06) d into vencimento;

      Select
          d.Anolancamento
        , d.Numlancamento
      from SET_DUPLICATA_PAGAR (
          :Anocompra
        , :Numcompra
        , :Fornecedor
        , :Notafiscal
        , :Forma_pagto
        , :Condicao_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) d
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 7
    if ( :P07 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P07) d into vencimento;

      Select
          d.Anolancamento
        , d.Numlancamento
      from SET_DUPLICATA_PAGAR (
          :Anocompra
        , :Numcompra
        , :Fornecedor
        , :Notafiscal
        , :Forma_pagto
        , :Condicao_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) d
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 8
    if ( :P08 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P08) d into vencimento;

      Select
          d.Anolancamento
        , d.Numlancamento
      from SET_DUPLICATA_PAGAR (
          :Anocompra
        , :Numcompra
        , :Fornecedor
        , :Notafiscal
        , :Forma_pagto
        , :Condicao_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) d
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 9
    if ( :P09 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P09) d into vencimento;

      Select
          d.Anolancamento
        , d.Numlancamento
      from SET_DUPLICATA_PAGAR (
          :Anocompra
        , :Numcompra
        , :Fornecedor
        , :Notafiscal
        , :Forma_pagto
        , :Condicao_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) d
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 10
    if ( :P10 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P10) d into vencimento;

      Select
          d.Anolancamento
        , d.Numlancamento
      from SET_DUPLICATA_PAGAR (
          :Anocompra
        , :Numcompra
        , :Fornecedor
        , :Notafiscal
        , :Forma_pagto
        , :Condicao_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) d
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 11
    if ( :P11 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P11) d into vencimento;

      Select
          d.Anolancamento
        , d.Numlancamento
      from SET_DUPLICATA_PAGAR (
          :Anocompra
        , :Numcompra
        , :Fornecedor
        , :Notafiscal
        , :Forma_pagto
        , :Condicao_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) d
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 12
    if ( :P12 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P12) d into vencimento;

      Select
          d.Anolancamento
        , d.Numlancamento
      from SET_DUPLICATA_PAGAR (
          :Anocompra
        , :Numcompra
        , :Fornecedor
        , :Notafiscal
        , :Forma_pagto
        , :Condicao_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) d
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Verificar ao valor total das parcelas
    if ( :Parcelas > 1 ) then
    begin
      Select
          sum( coalesce(d.Valorpag, 0) )
      from TBCONTPAG d
      where d.Anocompra = :Anocompra
        and d.Numcompra = :Numcompra
      into
          valor_total_parcelas;

      -- Atualizar o valor da ultima parcela
      if ( :Valor_total_parcelas < :Valor_total ) then
      begin
        Update TBCONTPAG d Set
            d.Valorpag = :Valor_documento + (:Valor_total - :Valor_total_parcelas)
        where d.Anocompra = :Anocompra
          and d.Numcompra = :Numcompra
          and d.Parcela   = :Parcela;
      end 
    end 

  end
end
^

/* Alter (SET_GERAR_TITULOS) */
ALTER PROCEDURE SET_GERAR_TITULOS(ANOVENDA SMALLINT,
NUMVENDA INTEGER)
 RETURNS(CLIENTE VARCHAR(18),
PARCELAS SMALLINT,
VALOR_TOTAL NUMERIC(15,2),
PARCELA SMALLINT,
EMISSAO DATE,
VENCIMENTO DATE,
VALOR_DOCUMENTO NUMERIC(15,2),
FORMA_PAGTO SMALLINT,
DATA_FINALIZ_VENDA DATE,
ANO_LANC SMALLINT,
NUM_LANC INTEGER)
 AS
declare variable P01 smallint;
declare variable P02 smallint;
declare variable P03 smallint;
declare variable P04 smallint;
declare variable P05 smallint;
declare variable P06 smallint;
declare variable P07 smallint;
declare variable P08 smallint;
declare variable P09 smallint;
declare variable P10 smallint;
declare variable P11 smallint;
declare variable P12 smallint;
declare variable VALOR_TOTAL_PARCELAS numeric(15,2);
begin
  for
    Select
        x.Codcli
      , coalesce(v.Prazo_01, 0)
      , v.Prazo_02
      , v.Prazo_03
      , v.Prazo_04
      , v.Prazo_05
      , v.Prazo_06
      , v.Prazo_07
      , v.Prazo_08
      , v.Prazo_09
      , v.Prazo_10
      , v.Prazo_11
      , v.Prazo_12
      , case when coalesce(v.Prazo_01, 0) is not null then 1 else 0 end +
        case when v.Prazo_02 is not null then 1 else 0 end +
        case when v.Prazo_03 is not null then 1 else 0 end +
        case when v.Prazo_04 is not null then 1 else 0 end +
        case when v.Prazo_05 is not null then 1 else 0 end +
        case when v.Prazo_06 is not null then 1 else 0 end +
        case when v.Prazo_07 is not null then 1 else 0 end +
        case when v.Prazo_08 is not null then 1 else 0 end +
        case when v.Prazo_09 is not null then 1 else 0 end +
        case when v.Prazo_10 is not null then 1 else 0 end +
        case when v.Prazo_11 is not null then 1 else 0 end +
        case when v.Prazo_12 is not null then 1 else 0 end as parcelas
      , v.valor_fpagto
      , v.Formapagto_cod
      , x.Dtfinalizacao_venda
    from TBVENDAS x
      inner join TBVENDAS_FORMAPAGTO v on (v.ano_venda = x.ano and v.controle_venda = x.codcontrol)
    where x.Ano        = :Anovenda
      and x.Codcontrol = :Numvenda
    into
        cliente
      , p01
      , p02
      , p03
      , p04
      , p05
      , p06
      , p07
      , p08
      , p09
      , p10
      , p11
      , p12
      , parcelas
      , valor_total
      , forma_pagto
      , data_finaliz_venda
  do
  begin

    parcela = 0;
    emissao = :Data_finaliz_venda;
    valor_documento = :Valor_total / :Parcelas;

    -- Parcela 1
    if ( :P01 is not null ) then
    begin
      if ( :P01 = 0 ) then
        parcela = 0;
      else
      if ( :P01 > 0 ) then
        parcela = 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P01) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER (
          :Anovenda
        , :Numvenda
        , :Cliente
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 2
    if ( :P02 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P02) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER (
          :Anovenda
        , :Numvenda
        , :Cliente
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 3
    if ( :P03 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P03) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER (
          :Anovenda
        , :Numvenda
        , :Cliente
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 4
    if ( :P04 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P04) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER (
          :Anovenda
        , :Numvenda
        , :Cliente
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 5
    if ( :P05 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P05) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER (
          :Anovenda
        , :Numvenda
        , :Cliente
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 6
    if ( :P06 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P06) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER (
          :Anovenda
        , :Numvenda
        , :Cliente
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 7
    if ( :P07 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P07) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER (
          :Anovenda
        , :Numvenda
        , :Cliente
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 8
    if ( :P08 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P08) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER (
          :Anovenda
        , :Numvenda
        , :Cliente
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 9
    if ( :P09 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P09) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER (
          :Anovenda
        , :Numvenda
        , :Cliente
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 10
    if ( :P10 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P10) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER (
          :Anovenda
        , :Numvenda
        , :Cliente
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 11
    if ( :P11 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P11) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER (
          :Anovenda
        , :Numvenda
        , :Cliente
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 12
    if ( :P12 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P12) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER (
          :Anovenda
        , :Numvenda
        , :Cliente
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Verificar ao valor total das parcelas
    if ( :Parcelas > 1 ) then
    begin
      Select
          sum( coalesce(r.Valorrec, 0) )
      from TBCONTREC r
      where r.Anovenda = :Anovenda
        and r.Numvenda = :Numvenda
        and r.forma_pagto = :forma_pagto
      into
          valor_total_parcelas;

      -- Atualizar o valor da ultima parcela
      if ( :Valor_total_parcelas < :Valor_total ) then
      begin
        Update TBCONTREC r Set
            r.Valorrec = :Valor_documento + (:Valor_total - :Valor_total_parcelas)
        where r.Anovenda = :Anovenda
          and r.Numvenda = :Numvenda
          and r.forma_pagto = :forma_pagto
          and r.Parcela  = :Parcela;
      end 
    end 

  end
end
^

/* Creating trigger... */
CREATE TRIGGER TG_NFE_ATUALIZAR_COMPRA FOR TBNFE_ENVIADA
ACTIVE AFTER INSERT POSITION 1 
AS
begin
  if ( (new.anocompra > 0) and (new.numcompra > 0) ) then
  begin
    Update TBCOMPRAS c Set
        c.nfserie = new.serie
      , c.nf      = new.numero
      , c.verificador_nfe  = new.chave
      , c.xml_nfe_filename = new.xml_filename
      , c.xml_nfe          = new.xml_file
      , c.status  = 4 -- Nota Fiscal Gerada
      , c.dtemiss = new.dataemissao
      , c.hremiss = new.horaemissao
    where c.ano        = new.anocompra
      and c.codcontrol = new.numcompra;
  end 
end
^

CREATE TRIGGER TG_VENDASITENS_TOTAIS_PRODUTO FOR TVENDASITENS
ACTIVE BEFORE INSERT OR UPDATE POSITION 0 
AS
begin
  new.total_bruto    = ( coalesce(new.qtde, 0) * coalesce(new.punit, 0) );
  new.total_desconto = ( coalesce(new.qtde, 0) * coalesce(new.desconto_valor, 0) );
  new.total_liquido  = ( coalesce(new.total_bruto, 0) - coalesce(new.total_desconto, 0) );
end
^


/* Altering existing trigger... */
ALTER TRIGGER TG_COMPRAS_ATUALIZAR_ESTOQUE
AS
  declare variable produto varchar(10);
  declare variable empresa varchar(18);
  declare variable estoque integer;
  declare variable quantidade integer;
  declare variable custo_produto numeric(15,2);
  declare variable custo_compra numeric(15,2);
  declare variable custo_medio numeric(15,2);
begin
  if ( (coalesce(old.Status, 0) <> coalesce(new.Status, 0)) and (new.Status = 2)) then
  begin

    -- Incrimentar Estoque do produto
    for
      Select
          i.Codprod
        , i.Codemp
        , i.Qtde
        , coalesce(p.Qtde, 0)
        , coalesce(i.Customedio, 0)
        , coalesce(p.Customedio, 0)
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
    do
    begin
      if ( (:Custo_compra > 0) and (:Custo_produto > 0) and (:Estoque > 0) ) then
        Custo_medio = (:Custo_compra + :Custo_produto) / 2;
      else
        Custo_medio = :Custo_compra;

      -- Incrementar estoque
      Update TBPRODUTO p Set
          --p.Customedio = :Custo_medio
          p.Customedio = :Custo_compra
        , p.Qtde       = :Estoque + :Quantidade
      where p.Cod    = :Produto
        and p.Codemp = :Empresa;

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
end
^

/* Altering existing trigger... */
ALTER TRIGGER TG_COMPRAS_CANCELAR
AS
  declare variable produto varchar(10);
  declare variable empresa varchar(18);
  declare variable estoque integer;
  declare variable quantidade integer;
  declare variable custo_compra numeric(15,2);
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
    do
    begin
      -- Decrementar estoque
      Update TBPRODUTO p Set
        p.Qtde       = :Estoque - :Quantidade
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
        , 'SAIDA - COMPRA CANCELADA'
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
end
^

/* Altering existing trigger... */
ALTER TRIGGER TG_NFE_ATUALIZAR_VENDA
AS
begin
  if ( (new.anovenda > 0) and (new.numvenda > 0) ) then
  begin
    Update TBVENDAS v Set
        v.serie = new.serie
      , v.nfe   = new.numero
      , v.verificador_nfe  = new.chave
      , v.xml_nfe_filename = new.xml_filename
      , v.xml_nfe          = new.xml_file
      , v.status      = 4 -- Nota Fiscal Gerada
      , v.dataemissao = new.dataemissao
      , v.horaemissao = new.horaemissao
    where v.ano = new.anovenda
      and v.codcontrol = new.numvenda;
  end 
end
^

/* Altering existing trigger... */
ALTER TRIGGER TG_VENDAS_ATUALIZAR_ESTOQUE
AS
  declare variable produto varchar(10);
  declare variable empresa varchar(18);
  declare variable estoque integer;
  declare variable quantidade integer;
  declare variable reserva integer;
  declare variable valor_produto numeric(15,2);
begin
  if ( (coalesce(old.Status, 0) <> coalesce(new.Status, 0)) and (new.Status = 3)) then
  begin

    -- Baixar produto do Estoque
    for
      Select
          i.Codprod
        , i.Codemp
        , i.Qtde
        , coalesce(p.Qtde, 0)
        , coalesce(p.Reserva, 0)
        , coalesce(p.Preco, 0)
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
    do
    begin
      reserva = :reserva - :Quantidade;
      estoque = :Estoque - :Quantidade;

      -- Baixar estoque
      Update TBPRODUTO p Set
          p.Reserva = :Reserva
        , p.Qtde    = :Estoque
      where p.Cod    = :Produto
        and p.Codemp = :Empresa;

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
        , 'SAIDA - VENDA'
        , Current_time
        , :Estoque + :Quantidade
        , :Quantidade
        , :Estoque
        , new.Usuario
        , 'Venda no valor de R$ ' || :Valor_produto
      );
    end
     
  end 
end
^

/* Altering existing trigger... */
ALTER TRIGGER TG_VENDAS_CANCELAR
AS
  declare variable produto varchar(10);
  declare variable empresa varchar(18);
  declare variable estoque integer;
  declare variable quantidade integer;
  declare variable valor_produto numeric(15,2);
begin
  if ( (coalesce(old.Status, 0) <> coalesce(new.Status, 0)) and (new.Status = 5)) then
  begin

    -- Retornar produto do Estoque
    for
      Select
          i.Codprod
        , i.Codemp
        , i.Qtde
        , coalesce(p.Qtde, 0)
        , coalesce(p.Preco, 0)
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
    do
    begin
      estoque = :Estoque + :Quantidade;

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
        , 'ENTRADA - VENDA CANCELADA'
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
end
^

/* Altering existing trigger... */
ALTER TRIGGER TG_VENDASITENS_TOTAL_VENDA
AS
  declare variable anovenda Smallint;
  declare variable numvenda Integer;
  declare variable total_bruto Dmn_money;
  declare variable total_desconto dmn_money;
  declare variable total_liquido Dmn_money;
begin
  if ( (Inserting) or (Updating) ) then
  begin
    anovenda = new.Ano;
    numvenda = new.Codcontrol;
  end
  else
  begin
    anovenda = old.Ano;
    numvenda = old.Codcontrol;
  end

  Select
      sum( coalesce(i.total_bruto,    0) )
    , sum( coalesce(i.total_desconto, 0) )
  from TVENDASITENS i
  where i.Ano = :Anovenda
    and i.Codcontrol = :Numvenda
  into
      Total_bruto
    , Total_desconto;

  Total_bruto    = coalesce(:Total_bruto, 0);
  Total_desconto = coalesce(:Total_desconto, 0);
  total_liquido  = :Total_bruto - :Total_desconto;

  Update TBVENDAS v Set
      v.Totalvenda_bruta = :Total_bruto
    , v.Desconto   = :Total_desconto
    , v.Totalvenda = :Total_liquido
  where v.Ano = :Anovenda
    and v.Codcontrol = :Numvenda;
end
^

SET TERM ; ^

ALTER TABLE TBCOMPRAS ALTER COLUMN ANO POSITION 1;

ALTER TABLE TBCOMPRAS ALTER COLUMN CODCONTROL POSITION 2;

ALTER TABLE TBCOMPRAS ALTER COLUMN CODEMP POSITION 3;

ALTER TABLE TBCOMPRAS ALTER COLUMN CODFORN POSITION 4;

ALTER TABLE TBCOMPRAS ALTER COLUMN NF POSITION 5;

ALTER TABLE TBCOMPRAS ALTER COLUMN NFSERIE POSITION 6;

ALTER TABLE TBCOMPRAS ALTER COLUMN LOTE_NFE_ANO POSITION 7;

ALTER TABLE TBCOMPRAS ALTER COLUMN LOTE_NFE_NUMERO POSITION 8;

ALTER TABLE TBCOMPRAS ALTER COLUMN NFE_ENVIADA POSITION 9;

ALTER TABLE TBCOMPRAS ALTER COLUMN VERIFICADOR_NFE POSITION 10;

ALTER TABLE TBCOMPRAS ALTER COLUMN XML_NFE POSITION 11;

ALTER TABLE TBCOMPRAS ALTER COLUMN XML_NFE_FILENAME POSITION 12;

ALTER TABLE TBCOMPRAS ALTER COLUMN DTLANCAMENTO POSITION 13;

ALTER TABLE TBCOMPRAS ALTER COLUMN DTEMISS POSITION 14;

ALTER TABLE TBCOMPRAS ALTER COLUMN HREMISS POSITION 15;

ALTER TABLE TBCOMPRAS ALTER COLUMN DTENT POSITION 16;

ALTER TABLE TBCOMPRAS ALTER COLUMN NFCFOP POSITION 17;

ALTER TABLE TBCOMPRAS ALTER COLUMN NATUREZA POSITION 18;

ALTER TABLE TBCOMPRAS ALTER COLUMN STATUS POSITION 19;

ALTER TABLE TBCOMPRAS ALTER COLUMN IPI POSITION 20;

ALTER TABLE TBCOMPRAS ALTER COLUMN ICMSBASE POSITION 21;

ALTER TABLE TBCOMPRAS ALTER COLUMN ICMSVALOR POSITION 22;

ALTER TABLE TBCOMPRAS ALTER COLUMN ICMSSUBSTBASE POSITION 23;

ALTER TABLE TBCOMPRAS ALTER COLUMN ICMSSUBSTVALOR POSITION 24;

ALTER TABLE TBCOMPRAS ALTER COLUMN FRETE POSITION 25;

ALTER TABLE TBCOMPRAS ALTER COLUMN OUTROSCUSTOS POSITION 26;

ALTER TABLE TBCOMPRAS ALTER COLUMN DESCONTO POSITION 27;

ALTER TABLE TBCOMPRAS ALTER COLUMN VALORSEGURO POSITION 28;

ALTER TABLE TBCOMPRAS ALTER COLUMN VALORTOTAL_II POSITION 29;

ALTER TABLE TBCOMPRAS ALTER COLUMN VALORTOTAL_IPI POSITION 30;

ALTER TABLE TBCOMPRAS ALTER COLUMN VALORPIS POSITION 31;

ALTER TABLE TBCOMPRAS ALTER COLUMN VALORCOFINS POSITION 32;

ALTER TABLE TBCOMPRAS ALTER COLUMN TOTALPROD POSITION 33;

ALTER TABLE TBCOMPRAS ALTER COLUMN TOTALNF POSITION 34;

ALTER TABLE TBCOMPRAS ALTER COLUMN OBS POSITION 35;

ALTER TABLE TBCOMPRAS ALTER COLUMN USUARIO POSITION 36;

ALTER TABLE TBCOMPRAS ALTER COLUMN FORMAPAGTO_COD POSITION 37;

ALTER TABLE TBCOMPRAS ALTER COLUMN CONDICAOPAGTO_COD POSITION 38;

ALTER TABLE TBCOMPRAS ALTER COLUMN COMPRA_PRAZO POSITION 39;

ALTER TABLE TBCOMPRAS ALTER COLUMN PRAZO_01 POSITION 40;

ALTER TABLE TBCOMPRAS ALTER COLUMN PRAZO_02 POSITION 41;

ALTER TABLE TBCOMPRAS ALTER COLUMN PRAZO_03 POSITION 42;

ALTER TABLE TBCOMPRAS ALTER COLUMN PRAZO_04 POSITION 43;

ALTER TABLE TBCOMPRAS ALTER COLUMN PRAZO_05 POSITION 44;

ALTER TABLE TBCOMPRAS ALTER COLUMN PRAZO_06 POSITION 45;

ALTER TABLE TBCOMPRAS ALTER COLUMN PRAZO_07 POSITION 46;

ALTER TABLE TBCOMPRAS ALTER COLUMN PRAZO_08 POSITION 47;

ALTER TABLE TBCOMPRAS ALTER COLUMN PRAZO_09 POSITION 48;

ALTER TABLE TBCOMPRAS ALTER COLUMN PRAZO_10 POSITION 49;

ALTER TABLE TBCOMPRAS ALTER COLUMN PRAZO_11 POSITION 50;

ALTER TABLE TBCOMPRAS ALTER COLUMN PRAZO_12 POSITION 51;

ALTER TABLE TBCOMPRAS ALTER COLUMN DTFINALIZACAO_COMPRA POSITION 52;

ALTER TABLE TBCOMPRAS ALTER COLUMN CANCEL_USUARIO POSITION 53;

ALTER TABLE TBCOMPRAS ALTER COLUMN CANCEL_DATAHORA POSITION 54;

ALTER TABLE TBCOMPRAS ALTER COLUMN CANCEL_MOTIVO POSITION 55;

ALTER TABLE TBNFE_ENVIADA ALTER COLUMN ANOVENDA POSITION 1;

ALTER TABLE TBNFE_ENVIADA ALTER COLUMN NUMVENDA POSITION 2;

ALTER TABLE TBNFE_ENVIADA ALTER COLUMN ANOCOMPRA POSITION 3;

ALTER TABLE TBNFE_ENVIADA ALTER COLUMN NUMCOMPRA POSITION 4;

ALTER TABLE TBNFE_ENVIADA ALTER COLUMN DATAEMISSAO POSITION 5;

ALTER TABLE TBNFE_ENVIADA ALTER COLUMN HORAEMISSAO POSITION 6;

ALTER TABLE TBNFE_ENVIADA ALTER COLUMN SERIE POSITION 7;

ALTER TABLE TBNFE_ENVIADA ALTER COLUMN NUMERO POSITION 8;

ALTER TABLE TBNFE_ENVIADA ALTER COLUMN CHAVE POSITION 9;

ALTER TABLE TBNFE_ENVIADA ALTER COLUMN PROTOCOLO POSITION 10;

ALTER TABLE TBNFE_ENVIADA ALTER COLUMN RECIBO POSITION 11;

ALTER TABLE TBNFE_ENVIADA ALTER COLUMN XML_FILENAME POSITION 12;

ALTER TABLE TBNFE_ENVIADA ALTER COLUMN XML_FILE POSITION 13;

ALTER TABLE TBNFE_ENVIADA ALTER COLUMN LOTE_ANO POSITION 14;

ALTER TABLE TBNFE_ENVIADA ALTER COLUMN LOTE_NUM POSITION 15;

ALTER TABLE TBVENDAS ALTER COLUMN ANO POSITION 1;

ALTER TABLE TBVENDAS ALTER COLUMN CODCONTROL POSITION 2;

ALTER TABLE TBVENDAS ALTER COLUMN CODEMP POSITION 3;

ALTER TABLE TBVENDAS ALTER COLUMN CODCLI POSITION 4;

ALTER TABLE TBVENDAS ALTER COLUMN DTVENDA POSITION 5;

ALTER TABLE TBVENDAS ALTER COLUMN STATUS POSITION 6;

ALTER TABLE TBVENDAS ALTER COLUMN TOTALVENDA_BRUTA POSITION 7;

ALTER TABLE TBVENDAS ALTER COLUMN DESCONTO POSITION 8;

ALTER TABLE TBVENDAS ALTER COLUMN TOTALVENDA POSITION 9;

ALTER TABLE TBVENDAS ALTER COLUMN DTFINALIZACAO_VENDA POSITION 10;

ALTER TABLE TBVENDAS ALTER COLUMN OBS POSITION 11;

ALTER TABLE TBVENDAS ALTER COLUMN FORMAPAG POSITION 12;

ALTER TABLE TBVENDAS ALTER COLUMN FATDIAS POSITION 13;

ALTER TABLE TBVENDAS ALTER COLUMN SERIE POSITION 14;

ALTER TABLE TBVENDAS ALTER COLUMN NFE POSITION 15;

ALTER TABLE TBVENDAS ALTER COLUMN DATAEMISSAO POSITION 16;

ALTER TABLE TBVENDAS ALTER COLUMN HORAEMISSAO POSITION 17;

ALTER TABLE TBVENDAS ALTER COLUMN CFOP POSITION 18;

ALTER TABLE TBVENDAS ALTER COLUMN VERIFICADOR_NFE POSITION 19;

ALTER TABLE TBVENDAS ALTER COLUMN XML_NFE POSITION 20;

ALTER TABLE TBVENDAS ALTER COLUMN VENDEDOR_COD POSITION 21;

ALTER TABLE TBVENDAS ALTER COLUMN USUARIO POSITION 22;

ALTER TABLE TBVENDAS ALTER COLUMN FORMAPAGTO_COD POSITION 23;

ALTER TABLE TBVENDAS ALTER COLUMN CONDICAOPAGTO_COD POSITION 24;

ALTER TABLE TBVENDAS ALTER COLUMN VENDA_PRAZO POSITION 25;

ALTER TABLE TBVENDAS ALTER COLUMN PRAZO_01 POSITION 26;

ALTER TABLE TBVENDAS ALTER COLUMN PRAZO_02 POSITION 27;

ALTER TABLE TBVENDAS ALTER COLUMN PRAZO_03 POSITION 28;

ALTER TABLE TBVENDAS ALTER COLUMN PRAZO_04 POSITION 29;

ALTER TABLE TBVENDAS ALTER COLUMN PRAZO_05 POSITION 30;

ALTER TABLE TBVENDAS ALTER COLUMN PRAZO_06 POSITION 31;

ALTER TABLE TBVENDAS ALTER COLUMN PRAZO_07 POSITION 32;

ALTER TABLE TBVENDAS ALTER COLUMN PRAZO_08 POSITION 33;

ALTER TABLE TBVENDAS ALTER COLUMN PRAZO_09 POSITION 34;

ALTER TABLE TBVENDAS ALTER COLUMN PRAZO_10 POSITION 35;

ALTER TABLE TBVENDAS ALTER COLUMN PRAZO_11 POSITION 36;

ALTER TABLE TBVENDAS ALTER COLUMN PRAZO_12 POSITION 37;

ALTER TABLE TBVENDAS ALTER COLUMN LOTE_NFE_ANO POSITION 38;

ALTER TABLE TBVENDAS ALTER COLUMN LOTE_NFE_NUMERO POSITION 39;

ALTER TABLE TBVENDAS ALTER COLUMN NFE_ENVIADA POSITION 40;

ALTER TABLE TBVENDAS ALTER COLUMN CANCEL_USUARIO POSITION 41;

ALTER TABLE TBVENDAS ALTER COLUMN CANCEL_DATAHORA POSITION 42;

ALTER TABLE TBVENDAS ALTER COLUMN CANCEL_MOTIVO POSITION 43;

ALTER TABLE TBVENDAS ALTER COLUMN XML_NFE_FILENAME POSITION 44;

ALTER TABLE TBVENDAS ALTER COLUMN NFE_VALOR_BASE_ICMS POSITION 45;

ALTER TABLE TBVENDAS ALTER COLUMN NFE_VALOR_ICMS POSITION 46;

ALTER TABLE TBVENDAS ALTER COLUMN NFE_VALOR_BASE_ICMS_SUBST POSITION 47;

ALTER TABLE TBVENDAS ALTER COLUMN NFE_VALOR_ICMS_SUBST POSITION 48;

ALTER TABLE TBVENDAS ALTER COLUMN NFE_VALOR_TOTAL_PRODUTO POSITION 49;

ALTER TABLE TBVENDAS ALTER COLUMN NFE_VALOR_FRETE POSITION 50;

ALTER TABLE TBVENDAS ALTER COLUMN NFE_VALOR_SEGURO POSITION 51;

ALTER TABLE TBVENDAS ALTER COLUMN NFE_VALOR_DESCONTO POSITION 52;

ALTER TABLE TBVENDAS ALTER COLUMN NFE_VALOR_TOTAL_II POSITION 53;

ALTER TABLE TBVENDAS ALTER COLUMN NFE_VALOR_TOTAL_IPI POSITION 54;

ALTER TABLE TBVENDAS ALTER COLUMN NFE_VALOR_PIS POSITION 55;

ALTER TABLE TBVENDAS ALTER COLUMN NFE_VALOR_COFINS POSITION 56;

ALTER TABLE TBVENDAS ALTER COLUMN NFE_VALOR_OUTROS POSITION 57;

ALTER TABLE TBVENDAS ALTER COLUMN NFE_VALOR_TOTAL_NOTA POSITION 58;

ALTER TABLE TVENDASITENS ALTER COLUMN ANO POSITION 1;

ALTER TABLE TVENDASITENS ALTER COLUMN CODCONTROL POSITION 2;

ALTER TABLE TVENDASITENS ALTER COLUMN SEQ POSITION 3;

ALTER TABLE TVENDASITENS ALTER COLUMN CODPROD POSITION 4;

ALTER TABLE TVENDASITENS ALTER COLUMN CODEMP POSITION 5;

ALTER TABLE TVENDASITENS ALTER COLUMN CODCLI POSITION 6;

ALTER TABLE TVENDASITENS ALTER COLUMN DTVENDA POSITION 7;

ALTER TABLE TVENDASITENS ALTER COLUMN QTDE POSITION 8;

ALTER TABLE TVENDASITENS ALTER COLUMN PUNIT POSITION 9;

ALTER TABLE TVENDASITENS ALTER COLUMN PUNIT_PROMOCAO POSITION 10;

ALTER TABLE TVENDASITENS ALTER COLUMN DESCONTO POSITION 11;

ALTER TABLE TVENDASITENS ALTER COLUMN DESCONTO_VALOR POSITION 12;

ALTER TABLE TVENDASITENS ALTER COLUMN PFINAL POSITION 13;

ALTER TABLE TVENDASITENS ALTER COLUMN QTDEFINAL POSITION 14;

ALTER TABLE TVENDASITENS ALTER COLUMN UNID_COD POSITION 15;

ALTER TABLE TVENDASITENS ALTER COLUMN CFOP_COD POSITION 16;

ALTER TABLE TVENDASITENS ALTER COLUMN ALIQUOTA POSITION 17;

ALTER TABLE TVENDASITENS ALTER COLUMN ALIQUOTA_CSOSN POSITION 18;

ALTER TABLE TVENDASITENS ALTER COLUMN ALIQUOTA_PIS POSITION 19;

ALTER TABLE TVENDASITENS ALTER COLUMN ALIQUOTA_COFINS POSITION 20;

ALTER TABLE TVENDASITENS ALTER COLUMN VALOR_IPI POSITION 21;

ALTER TABLE TVENDASITENS ALTER COLUMN PERCENTUAL_REDUCAO_BC POSITION 22;

ALTER TABLE TVENDASITENS ALTER COLUMN TOTAL_BRUTO POSITION 23;

ALTER TABLE TVENDASITENS ALTER COLUMN TOTAL_DESCONTO POSITION 24;

ALTER TABLE TVENDASITENS ALTER COLUMN TOTAL_LIQUIDO POSITION 25;

/* Create(Add) privilege */
GRANT ALL ON MON$ATTACHMENTS TO PUBLIC;

GRANT ALL ON MON$ATTACHMENTS TO SYSDBA;

GRANT ALL ON MON$CALL_STACK TO PUBLIC;

GRANT ALL ON MON$CALL_STACK TO SYSDBA;

GRANT ALL ON MON$DATABASE TO PUBLIC;

GRANT ALL ON MON$DATABASE TO SYSDBA;

GRANT ALL ON MON$IO_STATS TO PUBLIC;

GRANT ALL ON MON$IO_STATS TO SYSDBA;

GRANT ALL ON MON$RECORD_STATS TO PUBLIC;

GRANT ALL ON MON$RECORD_STATS TO SYSDBA;

GRANT ALL ON MON$STATEMENTS TO PUBLIC;

GRANT ALL ON MON$STATEMENTS TO SYSDBA;

GRANT ALL ON MON$TRANSACTIONS TO PUBLIC;

GRANT ALL ON MON$TRANSACTIONS TO SYSDBA;

GRANT ALL ON VW_TIPO_MOVIMENTO_CAIXA TO PUBLIC;

GRANT ALL ON VW_TIPO_MOVIMENTO_CAIXA TO SYSDBA WITH GRANT OPTION;


