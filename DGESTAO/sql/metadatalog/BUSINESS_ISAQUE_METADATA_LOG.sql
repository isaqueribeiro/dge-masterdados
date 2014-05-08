

/*------ 14/03/2014 12:10:30 --------*/

SET TERM ^ ;

CREATE PROCEDURE GET_ARQUIVO_NFC(DATA_INICIAL DMN_DATE,
DATA_FINAL DMN_DATE,
TIPO_ARQUIVO DMN_SMALLINT_N,
CNPJ_EMITENTE DMN_CNPJ,
STATUS_VENDA DMN_SMALLINT_N)
 RETURNS(TIPO VARCHAR(2),
LINHA VARCHAR(250))
 AS
 BEGIN SUSPEND; END^

/*------ 14/03/2014 12:10:30 --------*/

ALTER PROCEDURE GET_CST_NORMAL RETURNS(CODIGO VARCHAR(3),
DESCRICAO VARCHAR(250),
DESCRICAO_FULL VARCHAR(250))
 AS
declare variable CODIGO_TMP varchar(1);
declare variable DESCRI_TMP varchar(50);
begin
  for
    Select
        o.orp_cod
      , o.orp_descricao
    from TBORIGEMPROD o
    Into
        codigo_tmp
      , descri_tmp
  do
  begin

    for
      Select
          t.tpt_cod
        , t.tpt_descricao
      from TBTRIBUTACAO_TIPO t
      where t.crt = 0
      Into
          Codigo
        , Descricao
    do
    begin

      Codigo    = Trim(:codigo_tmp) || Trim(:Codigo);
      Descricao = Trim(:Descricao) || ' (' || Trim(:descri_tmp) || ')';

      Descricao_Full = :Codigo || ' - ' || :Descricao;

      suspend;

    end 

  end 
end^

/*------ 14/03/2014 12:10:30 --------*/

ALTER PROCEDURE GET_ARQUIVO_NFC(DATA_INICIAL DMN_DATE,
DATA_FINAL DMN_DATE,
TIPO_ARQUIVO DMN_SMALLINT_N,
CNPJ_EMITENTE DMN_CNPJ,
STATUS_VENDA DMN_SMALLINT_N)
 RETURNS(TIPO VARCHAR(2),
LINHA VARCHAR(250))
 AS
declare variable INSC_ESTADUAL varchar(11);
declare variable QTDE_REGISTRO integer;
begin

  tipo_arquivo  = coalesce(:tipo_arquivo, 1); -- 1. Normal, 2. Retificador
  status_venda  = coalesce(:status_venda, 4); -- 4. NF-e Emitida
  qtde_registro = 0;

  if ( :cnpj_emitente is null ) then
    Select first 1
        e.cnpj
      , replace(trim(e.ie), '-', '')
    from TBEMPRESA e
    Into
        cnpj_emitente
      , insc_estadual;

  /* 1. Definir Identificação do Arquivo (Cabeçalho) */

  tipo  = '10';

  linha =
       :tipo
    || '|' || :tipo_arquivo
    || '|' || '1.00'
    || '|' || trim(:cnpj_emitente)
    || '|' || trim(substring(:insc_estadual from 1 for 9))
    || '|' || trim(right('00' || extract(month from :data_inicial), 2) || right('00' || extract(year from :data_inicial), 4));

  suspend;
  linha = null;

  /* 2. Definir Identificação e Discriminação de Valores da Nota Fiscal */

  tipo = '20';

  for
    Select
         :tipo                                         -- Tipo Registro
      || '|' || '1'                                    -- Modelo da Nota Fiscal
      || '|' || '1'                                    -- Tipo da Operacao
      || '|' || trim(substring(v.serie from 1 for 3))  -- Serie
      || '|' || trim('   ')                            -- Subserie
      || '|' || v.nfe                                  -- Numero NF-e
      || '|' || right('00' ||   extract(day   from v.dataemissao), 2)
             || right('00' ||   extract(month from v.dataemissao), 2)
             || right('0000' || extract(year  from v.dataemissao), 4)  -- Data de Emissao
      || '|' || right('00' ||   extract(day   from n.dataemissao), 2)
             || right('00' ||   extract(month from n.dataemissao), 2)
             || right('0000' || extract(year  from n.dataemissao), 4)  -- Data de Saida (Temporario)
      || '|' || coalesce(trim(substring(v.codcli  from 1 for 14)), '') -- CPF/CNPJ do Cliente
      || '|' || coalesce(trim(substring(c.inscest from 1 for 9)), '')  -- IE do Cliente
      || '|' || coalesce(v.nfe_valor_base_icms, 0)                     -- Valor Base do ICMS
      || '|' || coalesce(v.nfe_valor_icms, 0)                          -- Valor Total do ICMS
      || '|' || coalesce(v.nfe_valor_total_produto, 0)                 -- Valor Total dos Produtos/Servicos
      || '|' || coalesce(v.nfe_valor_desconto, 0)                      -- Valor Total dos Descontos
      || '|' || coalesce(v.nfe_valor_outros, 0)                        -- Valor Total de Outras Despesas
      || '|' || coalesce(v.nfe_valor_total_nota, 0)                    -- Valor Total da Nota Fiscal
    from TBVENDAS v
      inner join TBNFE_ENVIADA n on (n.anovenda = v.ano and n.numvenda = v.codcontrol)
      inner join TBCLIENTE c on (c.codigo = v.codcliente)
    where v.codemp  = :cnpj_emitente
      and v.status  = :status_venda
      and v.dataemissao between :data_inicial and :data_final
    Order by
      v.serie, v.nfe
    Into
      linha
  do
  begin

    linha = replace(:linha, '.', ',');
    suspend;
    linha = null;
    qtde_registro = :qtde_registro + 1;

  end

  /* 3. Definir Totalizador dos registros */

  tipo = '90';

  linha =
       :tipo
    || '|' || :qtde_registro
    || '|' || (:qtde_registro + 2);

  suspend;
  linha = null;

end^

/*------ 14/03/2014 12:10:30 --------*/

SET TERM ; ^

GRANT EXECUTE ON PROCEDURE GET_ARQUIVO_NFC TO PUBLIC;

/*------ 14/03/2014 12:38:03 --------*/

SET TERM ^ ;

ALTER PROCEDURE GET_ARQUIVO_NFC(DATA_INICIAL DMN_DATE,
DATA_FINAL DMN_DATE,
TIPO_ARQUIVO DMN_SMALLINT_N,
CNPJ_EMITENTE DMN_CNPJ,
STATUS_VENDA DMN_SMALLINT_N)
 RETURNS(TIPO VARCHAR(2),
LINHA VARCHAR(250))
 AS
declare variable INSC_ESTADUAL varchar(11);
declare variable QTDE_REGISTRO integer;
begin

  tipo_arquivo  = coalesce(:tipo_arquivo, 1); -- 1. Normal, 2. Retificador
  status_venda  = coalesce(:status_venda, 4); -- 4. NF-e Emitida
  qtde_registro = 0;

  if ( :cnpj_emitente is null ) then
    Select first 1
        e.cnpj
      , replace(trim(e.ie), '-', '')
    from TBEMPRESA e
    Into
        cnpj_emitente
      , insc_estadual;
  else
    Select
        replace(trim(e.ie), '-', '')
    from TBEMPRESA e
    where e.cnpj = :cnpj_emitente
    Into
        insc_estadual;

  /* 1. Definir Identificação do Arquivo (Cabeçalho) */

  tipo  = '10';

  linha =
       :tipo
    || '|' || :tipo_arquivo
    || '|' || '1.00'
    || '|' || trim(:cnpj_emitente)
    || '|' || trim(substring(:insc_estadual from 1 for 9))
    || '|' || trim(right('00' || extract(month from :data_inicial), 2) || right('00' || extract(year from :data_inicial), 4));

  suspend;
  linha = null;

  /* 2. Definir Identificação e Discriminação de Valores da Nota Fiscal */

  tipo = '20';

  for
    Select
         :tipo                                         -- Tipo Registro
      || '|' || '1'                                    -- Modelo da Nota Fiscal
      || '|' || '1'                                    -- Tipo da Operacao
      || '|' || trim(substring(v.serie from 1 for 3))  -- Serie
      || '|' || trim('   ')                            -- Subserie
      || '|' || v.nfe                                  -- Numero NF-e
      || '|' || right('00' ||   extract(day   from v.dataemissao), 2)
             || right('00' ||   extract(month from v.dataemissao), 2)
             || right('0000' || extract(year  from v.dataemissao), 4)  -- Data de Emissao
      || '|' || right('00' ||   extract(day   from n.dataemissao), 2)
             || right('00' ||   extract(month from n.dataemissao), 2)
             || right('0000' || extract(year  from n.dataemissao), 4)  -- Data de Saida (Temporario)
      || '|' || coalesce(trim(substring(v.codcli  from 1 for 14)), '') -- CPF/CNPJ do Cliente
      || '|' || coalesce(trim(substring(c.inscest from 1 for 9)), '')  -- IE do Cliente
      || '|' || coalesce(v.nfe_valor_base_icms, 0)                     -- Valor Base do ICMS
      || '|' || coalesce(v.nfe_valor_icms, 0)                          -- Valor Total do ICMS
      || '|' || coalesce(v.nfe_valor_total_produto, 0)                 -- Valor Total dos Produtos/Servicos
      || '|' || coalesce(v.nfe_valor_desconto, 0)                      -- Valor Total dos Descontos
      || '|' || coalesce(v.nfe_valor_outros, 0)                        -- Valor Total de Outras Despesas
      || '|' || coalesce(v.nfe_valor_total_nota, 0)                    -- Valor Total da Nota Fiscal
    from TBVENDAS v
      inner join TBNFE_ENVIADA n on (n.anovenda = v.ano and n.numvenda = v.codcontrol)
      inner join TBCLIENTE c on (c.codigo = v.codcliente)
    where v.codemp  = :cnpj_emitente
      and v.status  = :status_venda
      and v.dataemissao between :data_inicial and :data_final
    Order by
      v.serie, v.nfe
    Into
      linha
  do
  begin

    linha = replace(:linha, '.', ',');
    suspend;
    linha = null;
    qtde_registro = :qtde_registro + 1;

  end

  /* 3. Definir Totalizador dos registros */

  tipo = '90';

  linha =
       :tipo
    || '|' || :qtde_registro
    || '|' || (:qtde_registro + 2);

  suspend;
  linha = null;

end^

/*------ 14/03/2014 12:38:03 --------*/

SET TERM ; ^

/*------ 08/05/2014 17:56:25 --------*/

COMMENT ON COLUMN TBCLIENTE.CODIGO IS
'Codigo

Obs.: CONSUMIDOR FINAL = 1';

/*------ 08/05/2014 17:56:25 --------*/

COMMENT ON COLUMN TBCLIENTE.CODIGO IS
'Codigo

Obs.: CONSUMIDOR FINAL (99999999999999) = 1';

/*------ 08/05/2014 17:56:25 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_vendasitens_totais_produto for tvendasitens
inactive before insert or update position 0
AS
begin
  new.total_bruto    = ( coalesce(new.qtde, 0) * coalesce(new.punit, 0) );
  new.total_desconto = ( coalesce(new.qtde, 0) * coalesce(new.desconto_valor, 0) );
  new.total_liquido  = ( coalesce(new.total_bruto, 0) - coalesce(new.total_desconto, 0) );
end^

/*------ 08/05/2014 17:56:25 --------*/

SET TERM ; ^

COMMENT ON TRIGGER TG_VENDASITENS_TOTAIS_PRODUTO IS 'IMR - Trigger desativada em 10/04/2014 por apresentar inconsistencia no calculo.';

/*------ 08/05/2014 17:56:26 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_vendasitens_totais_produto for tvendasitens
inactive before insert or update position 0
AS
begin
  Exit;

  new.total_bruto    = ( coalesce(new.qtde, 0) * coalesce(new.punit, 0) );
  new.total_desconto = ( coalesce(new.qtde, 0) * coalesce(new.desconto_valor, 0) );
  new.total_liquido  = ( coalesce(new.total_bruto, 0) - coalesce(new.total_desconto, 0) );
end^

/*------ 08/05/2014 17:56:26 --------*/

SET TERM ; ^

SET TERM ^ ;

CREATE OR ALTER trigger tg_vendasitens_totais_produto for tvendasitens
inactive before insert or update position 0
AS
begin
  Exit;

  new.total_bruto    = ( coalesce(new.qtde, 0.0) * coalesce(new.punit, 0.0) );
  new.total_desconto = ( coalesce(new.qtde, 0.0) * coalesce(new.desconto_valor, 0.0) );
  new.total_liquido  = ( coalesce(new.total_bruto, 0.0) - coalesce(new.total_desconto, 0.0) );
end^

/*------ 08/05/2014 17:56:26 --------*/

SET TERM ; ^

CREATE TABLE SYS_LICENCA (
    LINHA_CONTROLE DMN_VCHAR_250 NOT NULL);

/*------ 08/05/2014 17:56:26 --------*/

ALTER TABLE SYS_LICENCA
ADD CONSTRAINT PK_SYS_LICENCA
PRIMARY KEY (LINHA_CONTROLE);

/*------ 08/05/2014 17:56:26 --------*/

GRANT ALL ON SYS_LICENCA TO "PUBLIC";

/*------ 08/05/2014 17:56:26 --------*/

ALTER TABLE SYS_SISTEMA
    ADD SIS_ATUALIZACAO DMN_DATETIME;

/*------ 08/05/2014 17:56:26 --------*/

COMMENT ON COLUMN SYS_SISTEMA.SIS_ATUALIZACAO IS
'Data/Hora da ultima atualizacao';

/*------ 08/05/2014 17:56:26 --------*/

COMMENT ON TABLE SYS_SISTEMA IS 'Tabela Sistema.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   25/04/2014

Tabela responsavel por armazenar dados sobre o(s) sistema(s) com conexao a base.';

/*------ 08/05/2014 17:56:26 --------*/

ALTER TABLE TBPRODUTO
    ADD MOVIMENTA_ESTOQUE DMN_LOGICO DEFAULT 1;

/*------ 08/05/2014 17:56:26 --------*/

COMMENT ON COLUMN TBPRODUTO.MOVIMENTA_ESTOQUE IS
'Movimenta Estoque:
0 - Nao
1 - Sim';