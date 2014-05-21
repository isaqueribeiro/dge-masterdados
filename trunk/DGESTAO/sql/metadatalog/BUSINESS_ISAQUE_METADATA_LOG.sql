

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

/*------ 09/05/2014 14:37:52 --------*/

COMMENT ON COLUMN SYS_SISTEMA.SIS_ATUALIZACAO IS
'Data/Hora da ultima atualizacao';

/*------ 09/05/2014 14:37:52 --------*/

COMMENT ON TABLE SYS_SISTEMA IS 'Tabela Sistema.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   25/04/2014

Tabela responsavel por armazenar dados sobre o(s) sistema(s) com conexao a base.';

/*------ 09/05/2014 14:37:52 --------*/

COMMENT ON COLUMN TBPRODUTO.MOVIMENTA_ESTOQUE IS
'Movimenta Estoque:
0 - Nao
1 - Sim';

/*------ 09/05/2014 14:37:52 --------*/

COMMENT ON COLUMN TBTPDESPESA.COD IS
'Codigo';

/*------ 09/05/2014 14:37:52 --------*/

COMMENT ON COLUMN TBTPDESPESA.TIPODESP IS
'Descricao';

/*------ 09/05/2014 14:37:52 --------*/

CREATE TABLE TBPLANO_CONTA (
    EMPRESA DMN_CNPJ NOT NULL,
    CODIGO DMN_BIGINT_NN NOT NULL,
    DESCRICAO_COMPLETA DMN_VCHAR_250,
    DESCRICAO_RESUMIDA DMN_VCHAR_100);

/*------ 09/05/2014 14:37:52 --------*/

ALTER TABLE TBPLANO_CONTA
ADD CONSTRAINT PK_TBPLANO_CONTA
PRIMARY KEY (CODIGO,EMPRESA);

/*------ 09/05/2014 14:37:52 --------*/

COMMENT ON COLUMN TBPLANO_CONTA.EMPRESA IS
'Empresa';

/*------ 09/05/2014 14:37:52 --------*/

COMMENT ON COLUMN TBPLANO_CONTA.CODIGO IS
'Codigo';

/*------ 09/05/2014 14:37:52 --------*/

COMMENT ON COLUMN TBPLANO_CONTA.DESCRICAO_COMPLETA IS
'Descricao completa';

/*------ 09/05/2014 14:37:52 --------*/

COMMENT ON COLUMN TBPLANO_CONTA.DESCRICAO_RESUMIDA IS
'Descricao resumida';

/*------ 09/05/2014 14:37:52 --------*/

COMMENT ON TABLE TBPLANO_CONTA IS 'Tabela Plano de Contas (Contabilidade).

    Autor   :   Isaque Marinho Ribeiro
    Data    :   09/05/2014

Tabela responsavel por armazenar o plano de contas adotado pela empresa. Informacoes estas lancadas pela Contabilidade.';

/*------ 09/05/2014 14:37:52 --------*/

GRANT ALL ON TBPLANO_CONTA TO "PUBLIC";

/*------ 09/05/2014 14:37:52 --------*/

CREATE DOMAIN DMN_BIGINT_N AS
INTEGER;

/*------ 09/05/2014 14:37:52 --------*/

ALTER TABLE TBTPDESPESA
    ADD PLANO_CONTA DMN_BIGINT_N;

/*------ 09/05/2014 14:37:52 --------*/

ALTER TABLE TBPLANO_CONTA DROP CONSTRAINT PK_TBPLANO_CONTA;

/*------ 09/05/2014 14:37:52 --------*/

ALTER TABLE TBPLANO_CONTA DROP EMPRESA;

/*------ 09/05/2014 14:37:52 --------*/

ALTER TABLE TBPLANO_CONTA
ADD CONSTRAINT PK_TBPLANO_CONTA
PRIMARY KEY (CODIGO);

/*------ 09/05/2014 14:37:52 --------*/

ALTER TABLE TBPLANO_CONTA
    ADD EXERCICIO DMN_SMALLINT_NN DEFAULT 0,
    ADD GRUPO DMN_SMALLINT_NN DEFAULT 0;

/*------ 09/05/2014 14:37:52 --------*/

COMMENT ON COLUMN TBPLANO_CONTA.EXERCICIO IS
'Exercicio';

/*------ 09/05/2014 14:37:52 --------*/

COMMENT ON COLUMN TBPLANO_CONTA.GRUPO IS
'Grupo:
0 - A Definir
1 - Ativo
2 - Passivo
3 ...
4 ...
5 ...
6 ...';

/*------ 09/05/2014 14:37:52 --------*/

alter table TBPLANO_CONTA
alter EXERCICIO position 1;

/*------ 09/05/2014 14:37:52 --------*/

alter table TBPLANO_CONTA
alter CODIGO position 2;

/*------ 09/05/2014 14:37:52 --------*/

alter table TBPLANO_CONTA
alter DESCRICAO_COMPLETA position 3;

/*------ 09/05/2014 14:37:52 --------*/

alter table TBPLANO_CONTA
alter DESCRICAO_RESUMIDA position 4;

/*------ 09/05/2014 14:37:52 --------*/

alter table TBPLANO_CONTA
alter GRUPO position 5;

/*------ 09/05/2014 14:37:52 --------*/

alter table TBPLANO_CONTA
alter column CODIGO position 1;

/*------ 09/05/2014 14:37:52 --------*/

alter table TBPLANO_CONTA
alter column EXERCICIO position 2;

/*------ 09/05/2014 14:37:52 --------*/

alter table TBPLANO_CONTA
alter column GRUPO position 3;

/*------ 09/05/2014 14:37:52 --------*/

alter table TBPLANO_CONTA
alter column DESCRICAO_COMPLETA position 4;

/*------ 09/05/2014 14:37:52 --------*/

alter table TBPLANO_CONTA
alter column DESCRICAO_RESUMIDA position 5;

/*------ 09/05/2014 14:37:52 --------*/

CREATE INDEX IDX_PLANO_CONTA_GRUPO
ON TBPLANO_CONTA (GRUPO);

/*------ 09/05/2014 14:37:52 --------*/

CREATE INDEX IDX_PLANO_CONTA_EXERCICIO
ON TBPLANO_CONTA (EXERCICIO);

/*------ 09/05/2014 14:37:52 --------*/

ALTER TABLE TBTPDESPESA
ADD CONSTRAINT FK_TBTPDESPESA_PLANO_CONTA
FOREIGN KEY (PLANO_CONTA)
REFERENCES TBPLANO_CONTA(CODIGO);

/*------ 09/05/2014 14:37:52 --------*/

COMMENT ON COLUMN TBTPDESPESA.PLANO_CONTA IS
'Plano de contas para despesas';

/*------ 09/05/2014 14:37:52 --------*/

CREATE SEQUENCE GEN_PLANO_CONTA;

/*------ 09/05/2014 14:37:52 --------*/

COMMENT ON SEQUENCE GEN_PLANO_CONTA IS 'Sequencializador para o PLANO DE CONTAS';

/*------ 09/05/2014 14:37:52 --------*/

SET TERM ^ ;

CREATE trigger tg_plano_conta_novo for tbplano_conta
active before insert position 0
AS
begin
  if ( new.codigo is null ) then
    new.codigo = GEN_ID(GEN_PLANO_CONTA, 1);

end^

/*------ 09/05/2014 14:37:52 --------*/

SET TERM ; ^

SET TERM ^ ;

CREATE OR ALTER trigger tg_plano_conta_novo for tbplano_conta
active before insert position 0
AS
begin
  if ( new.codigo is null ) then
    new.codigo = GEN_ID(GEN_PLANO_CONTA, 1);

end^

/*------ 09/05/2014 14:37:53 --------*/

SET TERM ; ^

COMMENT ON TRIGGER TG_PLANO_CONTA_NOVO IS 'Trigger Novo Plano de Contas (Contabilidade).

    Autor   :   Isaque Marinho Ribeiro
    Data    :   09/05/2014

Trigger responsavel por gerar o sequencial unico para o registro quando este nao for informado pela aplicacao.';

/*------ 13/05/2014 14:34:20 --------*/

COMMENT ON COLUMN SYS_SISTEMA.SIS_ATUALIZACAO IS
'Data/Hora da ultima atualizacao';

/*------ 13/05/2014 14:34:20 --------*/

COMMENT ON TABLE SYS_SISTEMA IS 'Tabela Sistema.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   25/04/2014

Tabela responsavel por armazenar dados sobre o(s) sistema(s) com conexao a base.';

/*------ 13/05/2014 14:34:20 --------*/

COMMENT ON COLUMN TBPRODUTO.MOVIMENTA_ESTOQUE IS
'Movimenta Estoque:
0 - Nao
1 - Sim';

/*------ 13/05/2014 14:34:20 --------*/

COMMENT ON COLUMN TBTPDESPESA.COD IS
'Codigo';

/*------ 13/05/2014 14:34:20 --------*/

COMMENT ON COLUMN TBTPDESPESA.TIPODESP IS
'Descricao';

/*------ 13/05/2014 14:34:21 --------*/

COMMENT ON COLUMN TBPLANO_CONTA.CODIGO IS
'Codigo';

/*------ 13/05/2014 14:34:21 --------*/

COMMENT ON COLUMN TBPLANO_CONTA.DESCRICAO_COMPLETA IS
'Descricao completa';

/*------ 13/05/2014 14:34:21 --------*/

COMMENT ON COLUMN TBPLANO_CONTA.DESCRICAO_RESUMIDA IS
'Descricao resumida';

/*------ 13/05/2014 14:34:21 --------*/

COMMENT ON TABLE TBPLANO_CONTA IS 'Tabela Plano de Contas (Contabilidade).

    Autor   :   Isaque Marinho Ribeiro
    Data    :   09/05/2014

Tabela responsavel por armazenar o plano de contas adotado pela empresa. Informacoes estas lancadas pela Contabilidade.';

/*------ 13/05/2014 14:34:21 --------*/

GRANT ALL ON TBPLANO_CONTA TO "PUBLIC";

/*------ 13/05/2014 14:34:21 --------*/

COMMENT ON COLUMN TBPLANO_CONTA.EXERCICIO IS
'Exercicio';

/*------ 13/05/2014 14:34:21 --------*/

COMMENT ON COLUMN TBPLANO_CONTA.GRUPO IS
'Grupo:
0 - A Definir
1 - Ativo
2 - Passivo
3 ...
4 ...
5 ...
6 ...';

/*------ 13/05/2014 14:34:21 --------*/

alter table TBPLANO_CONTA
alter EXERCICIO position 1;

/*------ 13/05/2014 14:34:21 --------*/

alter table TBPLANO_CONTA
alter CODIGO position 2;

/*------ 13/05/2014 14:34:21 --------*/

alter table TBPLANO_CONTA
alter DESCRICAO_COMPLETA position 3;

/*------ 13/05/2014 14:34:21 --------*/

alter table TBPLANO_CONTA
alter DESCRICAO_RESUMIDA position 4;

/*------ 13/05/2014 14:34:21 --------*/

alter table TBPLANO_CONTA
alter GRUPO position 5;

/*------ 13/05/2014 14:34:21 --------*/

alter table TBPLANO_CONTA
alter column CODIGO position 1;

/*------ 13/05/2014 14:34:21 --------*/

alter table TBPLANO_CONTA
alter column EXERCICIO position 2;

/*------ 13/05/2014 14:34:21 --------*/

alter table TBPLANO_CONTA
alter column GRUPO position 3;

/*------ 13/05/2014 14:34:21 --------*/

alter table TBPLANO_CONTA
alter column DESCRICAO_COMPLETA position 4;

/*------ 13/05/2014 14:34:21 --------*/

alter table TBPLANO_CONTA
alter column DESCRICAO_RESUMIDA position 5;

/*------ 13/05/2014 14:34:21 --------*/

COMMENT ON COLUMN TBTPDESPESA.PLANO_CONTA IS
'Plano de contas para despesas';

/*------ 13/05/2014 14:34:21 --------*/

COMMENT ON SEQUENCE GEN_PLANO_CONTA IS 'Sequencializador para o PLANO DE CONTAS';

/*------ 13/05/2014 14:34:21 --------*/

SET TERM ^ ;

SET TERM ; ^

SET TERM ^ ;

CREATE OR ALTER trigger tg_plano_conta_novo for tbplano_conta
active before insert position 0
AS
begin
  if ( new.codigo is null ) then
    new.codigo = GEN_ID(GEN_PLANO_CONTA, 1);

end^

/*------ 13/05/2014 14:34:21 --------*/

SET TERM ; ^

COMMENT ON TRIGGER TG_PLANO_CONTA_NOVO IS 'Trigger Novo Plano de Contas (Contabilidade).

    Autor   :   Isaque Marinho Ribeiro
    Data    :   09/05/2014

Trigger responsavel por gerar o sequencial unico para o registro quando este nao for informado pela aplicacao.';

/*------ 13/05/2014 14:34:21 --------*/

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

/*------ 13/05/2014 14:34:22 --------*/

ALTER TABLE TBAUTORIZA_COMPRA
ADD CONSTRAINT PK_TBAUTORIZA_COMPRA
PRIMARY KEY (ANO,CODIGO);

/*------ 13/05/2014 14:34:22 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.ANO IS
'Ano';

/*------ 13/05/2014 14:34:22 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.CODIGO IS
'Codigo';

/*------ 13/05/2014 14:34:22 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.EMPRESA IS
'Empresa';

/*------ 13/05/2014 14:34:22 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.FORNECEDOR IS
'Fornecedor';

/*------ 13/05/2014 14:34:22 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.TIPO IS
'Tipo:
0 - A Definir
1 - Compra
2 - Servico
3 - Compra/Servico';

/*------ 13/05/2014 14:34:22 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.EMISSAO_DATA IS
'Data de Emissao';

/*------ 13/05/2014 14:34:22 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.EMISSAO_USUARIO IS
'Usuario de Emissao';

/*------ 13/05/2014 14:34:22 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.VALIDADE IS
'Data de Validade';

/*------ 13/05/2014 14:34:22 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.MOVITO IS
'Motivo';

/*------ 13/05/2014 14:34:22 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.OBSERVACAO IS
'Observacoes';

/*------ 13/05/2014 14:34:22 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.ENDERECO_ENTREGA IS
'Endereco de Entrega';

/*------ 13/05/2014 14:34:22 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.STATUS IS
'Status:
0 - Em edicao
1 - Aberta
2 - Autorizada
3 - Cancelada';

/*------ 13/05/2014 14:34:22 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.AUTORIZADO_DATA IS
'Data de Autorizacao';

/*------ 13/05/2014 14:34:22 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.AUTORIZADO_USUARIO IS
'Usuario de Autorizacao';

/*------ 13/05/2014 14:34:22 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.RECEBEDOR_NOME IS
'Recebedor (Nome)';

/*------ 13/05/2014 14:34:22 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.RECEBEDOR_CPF IS
'Recebedor (CPF)';

/*------ 13/05/2014 14:34:22 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.FORMA_PAGTO IS
'Forma de Pagamento';

/*------ 13/05/2014 14:34:22 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.CONDICAO_PAGTO IS
'Condicao de Pagamento';

/*------ 13/05/2014 14:34:22 --------*/

GRANT ALL ON TBAUTORIZA_COMPRA TO "PUBLIC";

/*------ 13/05/2014 14:34:22 --------*/

CREATE SEQUENCE GEN_AUTORIZA_COMPRA_2014;

/*------ 13/05/2014 14:34:22 --------*/

CREATE SEQUENCE GEN_AUTORIZA_COMPRA_2015;

/*------ 13/05/2014 14:34:22 --------*/

CREATE SEQUENCE GEN_AUTORIZA_COMPRA_2016;

/*------ 13/05/2014 14:34:22 --------*/

CREATE SEQUENCE GEN_AUTORIZA_COMPRA_2017;

/*------ 13/05/2014 14:34:22 --------*/

CREATE SEQUENCE GEN_AUTORIZA_COMPRA_2018;

/*------ 13/05/2014 14:34:22 --------*/

CREATE SEQUENCE GEN_AUTORIZA_COMPRA_2019;

/*------ 13/05/2014 14:34:22 --------*/

CREATE SEQUENCE GEN_AUTORIZA_COMPRA_2020;

/*------ 13/05/2014 14:34:22 --------*/

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

/*------ 13/05/2014 14:34:22 --------*/

SET TERM ; ^

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

/*------ 13/05/2014 14:34:22 --------*/

SET TERM ; ^

COMMENT ON TRIGGER TG_AUTORIZA_COMPRA_CODIGO IS 'Trigger Nova Autorizacao de Compra.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   13/05/2014

Trigger responsavel por gerar um sequencial unico para cada novo registro de autorizacao de compra no ano.';

/*------ 13/05/2014 14:34:22 --------*/

COMMENT ON TABLE TBAUTORIZA_COMPRA IS 'Tabela Autorizacao de Compras

    Autor   :   Isaque Marinho Ribeiro
    Data    :   13/05/2014

Tabela responsavel por armazenar as autorizacoes de compras da empresa.';

/*------ 13/05/2014 14:34:22 --------*/

ALTER TABLE TBAUTORIZA_COMPRA
ADD CONSTRAINT FK_TBAUTORIZA_COMPRA_EMP
FOREIGN KEY (EMPRESA)
REFERENCES TBEMPRESA(CNPJ)
ON UPDATE CASCADE;

/*------ 13/05/2014 14:34:22 --------*/

ALTER TABLE TBAUTORIZA_COMPRA
ADD CONSTRAINT FK_TBAUTORIZA_COMPRA_FRN
FOREIGN KEY (FORNECEDOR)
REFERENCES TBFORNECEDOR(CODFORN);

/*------ 13/05/2014 14:34:22 --------*/

ALTER TABLE TBAUTORIZA_COMPRA
ADD CONSTRAINT FK_TBAUTORIZA_COMPRA_FPAGTO
FOREIGN KEY (FORMA_PAGTO)
REFERENCES TBFORMPAGTO(COD);

/*------ 13/05/2014 14:34:22 --------*/

ALTER TABLE TBAUTORIZA_COMPRA
ADD CONSTRAINT FK_TBAUTORIZA_COMPRA_CPAGTO
FOREIGN KEY (CONDICAO_PAGTO)
REFERENCES TBCONDICAOPAGTO(COND_COD);

/*------ 13/05/2014 14:34:23 --------*/

ALTER TABLE TBCONTREC_BAIXA DROP CONSTRAINT FK_TBCONTREC_BAIXA_USUARIO;

/*------ 13/05/2014 14:34:23 --------*/

ALTER TABLE TBCONTPAG_BAIXA DROP CONSTRAINT FK_TBCONTPAG_BAIXA_USUARIO;

/*------ 13/05/2014 14:34:23 --------*/

ALTER TABLE TBCAIXA_MOVIMENTO DROP CONSTRAINT FK_TBCAIXA_MOVIMENTO_US;

/*------ 13/05/2014 14:34:23 --------*/

ALTER TABLE TBCAIXA DROP CONSTRAINT FK_TBCAIXA_USUARIO;

/*------ 13/05/2014 14:34:23 --------*/

ALTER TABLE TBCAIXA DROP CONSTRAINT FK_TBCAIXA_USUARIO_CANCEL;

/*------ 13/05/2014 14:34:23 --------*/

ALTER TABLE TBUSERS DROP CONSTRAINT PK_TBUSERS;

/*------ 13/05/2014 14:34:23 --------*/

ALTER TABLE TBUSERS
ADD CONSTRAINT PK_TBUSERS
PRIMARY KEY (NOME);

/*------ 13/05/2014 14:34:23 --------*/

ALTER TABLE TBCAIXA
ADD CONSTRAINT FK_TBCAIXA_USUARIO
FOREIGN KEY (USUARIO)
REFERENCES TBUSERS(NOME);

/*------ 13/05/2014 14:34:23 --------*/

ALTER TABLE TBCAIXA
ADD CONSTRAINT FK_TBCAIXA_USUARIO_CANCEL
FOREIGN KEY (USUARIO_CANCEL)
REFERENCES TBUSERS(NOME);

/*------ 13/05/2014 14:34:24 --------*/

ALTER TABLE TBCAIXA_MOVIMENTO
ADD CONSTRAINT FK_TBCAIXA_MOVIMENTO_US
FOREIGN KEY (USUARIO)
REFERENCES TBUSERS(NOME);

/*------ 13/05/2014 14:34:24 --------*/

ALTER TABLE TBCONTPAG_BAIXA
ADD CONSTRAINT FK_TBCONTPAG_BAIXA_USUARIO
FOREIGN KEY (USUARIO)
REFERENCES TBUSERS(NOME);

/*------ 13/05/2014 14:34:25 --------*/

ALTER TABLE TBCONTREC_BAIXA
ADD CONSTRAINT FK_TBCONTREC_BAIXA_USUARIO
FOREIGN KEY (USUARIO)
REFERENCES TBUSERS(NOME);

/*------ 13/05/2014 14:34:25 --------*/

ALTER TABLE TBAUTORIZA_COMPRA
ADD CONSTRAINT FK_TBAUTORIZA_COMPRA_EMISSOR
FOREIGN KEY (EMISSAO_USUARIO)
REFERENCES TBUSERS(NOME);

/*------ 13/05/2014 14:34:26 --------*/

ALTER TABLE TBAUTORIZA_COMPRA
ADD CONSTRAINT FK_TBAUTORIZA_COMPRA_USR_AUT
FOREIGN KEY (AUTORIZADO_USUARIO)
REFERENCES TBUSERS(NOME);

/*------ 13/05/2014 14:34:26 --------*/

ALTER TABLE TBAUTORIZA_COMPRA DROP CONSTRAINT FK_TBAUTORIZA_COMPRA_EMISSOR;

/*------ 13/05/2014 14:34:26 --------*/

ALTER TABLE TBAUTORIZA_COMPRA
ADD CONSTRAINT FK_TBAUTORIZA_COMPRA_USR_EMISS
FOREIGN KEY (EMISSAO_USUARIO)
REFERENCES TBUSERS(NOME)
USING INDEX FK_TBAUTORIZA_COMPRA_EMISSOR;

/*------ 13/05/2014 14:34:26 --------*/

ALTER TABLE TBAUTORIZA_COMPRA
    ADD CANCELADO_DATA DMN_DATE,
    ADD CANCELADO_USUARIO DMN_USUARIO,
    ADD CANCELADO_MOTIVO DMN_TEXTO;

/*------ 13/05/2014 14:34:26 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.CANCELADO_DATA IS
'Data de Cancelamento';

/*------ 13/05/2014 14:34:26 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.CANCELADO_USUARIO IS
'Usuario de Cancelamento';

/*------ 13/05/2014 14:34:26 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.CANCELADO_MOTIVO IS
'Motivo de Cancelamento';

/*------ 13/05/2014 14:34:26 --------*/

alter table TBAUTORIZA_COMPRA
alter ANO position 1;

/*------ 13/05/2014 14:34:26 --------*/

alter table TBAUTORIZA_COMPRA
alter CODIGO position 2;

/*------ 13/05/2014 14:34:26 --------*/

alter table TBAUTORIZA_COMPRA
alter EMPRESA position 3;

/*------ 13/05/2014 14:34:26 --------*/

alter table TBAUTORIZA_COMPRA
alter FORNECEDOR position 4;

/*------ 13/05/2014 14:34:26 --------*/

alter table TBAUTORIZA_COMPRA
alter TIPO position 5;

/*------ 13/05/2014 14:34:26 --------*/

alter table TBAUTORIZA_COMPRA
alter EMISSAO_DATA position 6;

/*------ 13/05/2014 14:34:26 --------*/

alter table TBAUTORIZA_COMPRA
alter EMISSAO_USUARIO position 7;

/*------ 13/05/2014 14:34:26 --------*/

alter table TBAUTORIZA_COMPRA
alter VALIDADE position 8;

/*------ 13/05/2014 14:34:26 --------*/

alter table TBAUTORIZA_COMPRA
alter MOVITO position 9;

/*------ 13/05/2014 14:34:26 --------*/

alter table TBAUTORIZA_COMPRA
alter OBSERVACAO position 10;

/*------ 13/05/2014 14:34:26 --------*/

alter table TBAUTORIZA_COMPRA
alter ENDERECO_ENTREGA position 11;

/*------ 13/05/2014 14:34:26 --------*/

alter table TBAUTORIZA_COMPRA
alter STATUS position 12;

/*------ 13/05/2014 14:34:26 --------*/

alter table TBAUTORIZA_COMPRA
alter AUTORIZADO_DATA position 13;

/*------ 13/05/2014 14:34:26 --------*/

alter table TBAUTORIZA_COMPRA
alter AUTORIZADO_USUARIO position 14;

/*------ 13/05/2014 14:34:26 --------*/

alter table TBAUTORIZA_COMPRA
alter CANCELADO_DATA position 15;

/*------ 13/05/2014 14:34:26 --------*/

alter table TBAUTORIZA_COMPRA
alter CANCELADO_USUARIO position 16;

/*------ 13/05/2014 14:34:26 --------*/

alter table TBAUTORIZA_COMPRA
alter CANCELADO_MOTIVO position 17;

/*------ 13/05/2014 14:34:26 --------*/

alter table TBAUTORIZA_COMPRA
alter RECEBEDOR_NOME position 18;

/*------ 13/05/2014 14:34:26 --------*/

alter table TBAUTORIZA_COMPRA
alter RECEBEDOR_CPF position 19;

/*------ 13/05/2014 14:34:26 --------*/

alter table TBAUTORIZA_COMPRA
alter FORMA_PAGTO position 20;

/*------ 13/05/2014 14:34:26 --------*/

alter table TBAUTORIZA_COMPRA
alter CONDICAO_PAGTO position 21;

/*------ 13/05/2014 14:34:26 --------*/

ALTER TABLE TBAUTORIZA_COMPRA
ADD CONSTRAINT FK_TBAUTORIZA_COMPRA_USR_CANCEL
FOREIGN KEY (CANCELADO_USUARIO)
REFERENCES TBUSERS(NOME);

/*------ 13/05/2014 14:34:26 --------*/

ALTER TABLE TBAUTORIZA_COMPRA
    ADD EMPRESA_NFE DMN_CNPJ,
    ADD VALOR_BRUTO DMN_MONEY,
    ADD VALOR_DESCONTO DMN_MONEY,
    ADD VALOR_TOTAL DMN_MONEY;

/*------ 13/05/2014 14:34:26 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.EMPRESA_NFE IS
'Empresa para Nota Fiscal';

/*------ 13/05/2014 14:34:26 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.VALOR_BRUTO IS
'Valor Total Bruto (Total Produtos)';

/*------ 13/05/2014 14:34:26 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.VALOR_DESCONTO IS
'Valor Total de Descontos';

/*------ 13/05/2014 14:34:26 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.VALOR_TOTAL IS
'Valor Total (Valor Bruto - Valor Desconto)';

/*------ 13/05/2014 14:34:26 --------*/

alter table TBAUTORIZA_COMPRA
alter ANO position 1;

/*------ 13/05/2014 14:34:26 --------*/

alter table TBAUTORIZA_COMPRA
alter CODIGO position 2;

/*------ 13/05/2014 14:34:26 --------*/

alter table TBAUTORIZA_COMPRA
alter EMPRESA position 3;

/*------ 13/05/2014 14:34:26 --------*/

alter table TBAUTORIZA_COMPRA
alter EMPRESA_NFE position 4;

/*------ 13/05/2014 14:34:26 --------*/

alter table TBAUTORIZA_COMPRA
alter FORNECEDOR position 5;

/*------ 13/05/2014 14:34:26 --------*/

alter table TBAUTORIZA_COMPRA
alter TIPO position 6;

/*------ 13/05/2014 14:34:26 --------*/

alter table TBAUTORIZA_COMPRA
alter EMISSAO_DATA position 7;

/*------ 13/05/2014 14:34:26 --------*/

alter table TBAUTORIZA_COMPRA
alter EMISSAO_USUARIO position 8;

/*------ 13/05/2014 14:34:26 --------*/

alter table TBAUTORIZA_COMPRA
alter VALIDADE position 9;

/*------ 13/05/2014 14:34:26 --------*/

alter table TBAUTORIZA_COMPRA
alter MOVITO position 10;

/*------ 13/05/2014 14:34:26 --------*/

alter table TBAUTORIZA_COMPRA
alter OBSERVACAO position 11;

/*------ 13/05/2014 14:34:26 --------*/

alter table TBAUTORIZA_COMPRA
alter ENDERECO_ENTREGA position 12;

/*------ 13/05/2014 14:34:26 --------*/

alter table TBAUTORIZA_COMPRA
alter STATUS position 13;

/*------ 13/05/2014 14:34:26 --------*/

alter table TBAUTORIZA_COMPRA
alter AUTORIZADO_DATA position 14;

/*------ 13/05/2014 14:34:26 --------*/

alter table TBAUTORIZA_COMPRA
alter AUTORIZADO_USUARIO position 15;

/*------ 13/05/2014 14:34:26 --------*/

alter table TBAUTORIZA_COMPRA
alter CANCELADO_DATA position 16;

/*------ 13/05/2014 14:34:26 --------*/

alter table TBAUTORIZA_COMPRA
alter CANCELADO_USUARIO position 17;

/*------ 13/05/2014 14:34:26 --------*/

alter table TBAUTORIZA_COMPRA
alter CANCELADO_MOTIVO position 18;

/*------ 13/05/2014 14:34:26 --------*/

alter table TBAUTORIZA_COMPRA
alter RECEBEDOR_NOME position 19;

/*------ 13/05/2014 14:34:26 --------*/

alter table TBAUTORIZA_COMPRA
alter RECEBEDOR_CPF position 20;

/*------ 13/05/2014 14:34:26 --------*/

alter table TBAUTORIZA_COMPRA
alter FORMA_PAGTO position 21;

/*------ 13/05/2014 14:34:26 --------*/

alter table TBAUTORIZA_COMPRA
alter CONDICAO_PAGTO position 22;

/*------ 13/05/2014 14:34:26 --------*/

alter table TBAUTORIZA_COMPRA
alter VALOR_BRUTO position 23;

/*------ 13/05/2014 14:34:26 --------*/

alter table TBAUTORIZA_COMPRA
alter VALOR_DESCONTO position 24;

/*------ 13/05/2014 14:34:26 --------*/

alter table TBAUTORIZA_COMPRA
alter VALOR_TOTAL position 25;

/*------ 13/05/2014 14:34:26 --------*/

ALTER TABLE TBAUTORIZA_COMPRA DROP EMPRESA_NFE;

/*------ 13/05/2014 14:34:26 --------*/

CREATE DOMAIN DMN_CNPJ_NN AS
VARCHAR(18)
NOT NULL;

/*------ 13/05/2014 14:34:26 --------*/

ALTER TABLE TBAUTORIZA_COMPRA DROP CONSTRAINT FK_TBAUTORIZA_COMPRA_EMP;

/*------ 13/05/2014 14:34:26 --------*/

ALTER TABLE TBAUTORIZA_COMPRA
ADD CONSTRAINT FK_TBAUTORIZA_COMPRA_EMPRESA
FOREIGN KEY (EMPRESA)
REFERENCES TBEMPRESA(CNPJ)
ON UPDATE CASCADE;

/*------ 13/05/2014 14:34:26 --------*/

ALTER TABLE TBAUTORIZA_COMPRA DROP CONSTRAINT FK_TBAUTORIZA_COMPRA_EMPRESA;

/*------ 13/05/2014 14:34:27 --------*/

ALTER TABLE TBAUTORIZA_COMPRA
ADD CONSTRAINT FK_TBAUTORIZA_COMPRA_EMPRESA
FOREIGN KEY (EMPRESA)
REFERENCES TBEMPRESA(CNPJ)
USING INDEX FK_TBAUTORIZA_COMPRA_EMPRESA;

/*------ 13/05/2014 14:34:27 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.VALOR_BRUTO IS
'Valor Total Bruto';

/*------ 13/05/2014 14:34:27 --------*/

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

/*------ 13/05/2014 14:34:27 --------*/

ALTER TABLE TBAUTORIZA_COMPRAITEM
ADD CONSTRAINT PK_TBAUTORIZA_COMPRAITEM
PRIMARY KEY (ANO,CODIGO,EMPRESA,SEQ);

/*------ 13/05/2014 14:34:27 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRAITEM.ANO IS
'Ano da Autorizacao';

/*------ 13/05/2014 14:34:27 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRAITEM.CODIGO IS
'Codigo da Autorizacao';

/*------ 13/05/2014 14:34:27 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRAITEM.EMPRESA IS
'Empresa da Autorizacao';

/*------ 13/05/2014 14:34:27 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRAITEM.SEQ IS
'Sequencial';

/*------ 13/05/2014 14:34:27 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRAITEM.FORNECEDOR IS
'Fornecedor';

/*------ 13/05/2014 14:34:27 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRAITEM.PRODUTO IS
'Produto/Servico';

/*------ 13/05/2014 14:34:27 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRAITEM.QUANTIDADE IS
'Quantidade

(Aceita valores decimais)';

/*------ 13/05/2014 14:34:27 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRAITEM.VALOR_UNITARIO IS
'Valor Unitario';

/*------ 13/05/2014 14:34:27 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRAITEM.VALOR_TOTAL IS
'Valor Total (Quantidade * Valor Unitario)';

/*------ 13/05/2014 14:34:27 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRAITEM.CONFIRMADO_RECEBIMENTO IS
'Confirmado recebimento do produto/servico pela empresa:
0 - Nao
1 - Sim';

/*------ 13/05/2014 14:34:27 --------*/

ALTER TABLE TBAUTORIZA_COMPRAITEM
ADD CONSTRAINT FK_TBAUTORIZA_COMPRAITEM_PRD
FOREIGN KEY (PRODUTO)
REFERENCES TBPRODUTO(COD);

/*------ 13/05/2014 14:34:27 --------*/

GRANT ALL ON TBAUTORIZA_COMPRAITEM TO "PUBLIC";

/*------ 13/05/2014 14:34:27 --------*/

COMMENT ON TABLE TBAUTORIZA_COMPRAITEM IS 'Tabela de Produtos/Servicos da Autorizacao de Compra/Servico.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   13/05/2014

Tabela responsavel por armazenar os itens (produtos eou servicos) das autorizacoes de compras/servicos.';

/*------ 13/05/2014 14:34:27 --------*/

COMMENT ON TABLE TBAUTORIZA_COMPRA IS 'Tabela Autorizacao de Compras/Servicos

    Autor   :   Isaque Marinho Ribeiro
    Data    :   13/05/2014

Tabela responsavel por armazenar as autorizacoes de compras/servicos da empresa.';

/*------ 13/05/2014 14:34:27 --------*/

CREATE INDEX IDX_TBAUTORIZA_COMPRAITEM_REC
ON TBAUTORIZA_COMPRAITEM (CONFIRMADO_RECEBIMENTO);

/*------ 13/05/2014 14:34:27 --------*/

ALTER TABLE TBAUTORIZA_COMPRA
    ADD RECEBEDOR_FUNCAO DMN_VCHAR_50;

/*------ 13/05/2014 14:34:27 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.RECEBEDOR_FUNCAO IS
'Recebedor (Funcao)';

/*------ 13/05/2014 14:34:27 --------*/

alter table TBAUTORIZA_COMPRA
alter ANO position 1;

/*------ 13/05/2014 14:34:27 --------*/

alter table TBAUTORIZA_COMPRA
alter CODIGO position 2;

/*------ 13/05/2014 14:34:27 --------*/

alter table TBAUTORIZA_COMPRA
alter EMPRESA position 3;

/*------ 13/05/2014 14:34:27 --------*/

alter table TBAUTORIZA_COMPRA
alter FORNECEDOR position 4;

/*------ 13/05/2014 14:34:27 --------*/

alter table TBAUTORIZA_COMPRA
alter TIPO position 5;

/*------ 13/05/2014 14:34:27 --------*/

alter table TBAUTORIZA_COMPRA
alter EMISSAO_DATA position 6;

/*------ 13/05/2014 14:34:27 --------*/

alter table TBAUTORIZA_COMPRA
alter EMISSAO_USUARIO position 7;

/*------ 13/05/2014 14:34:27 --------*/

alter table TBAUTORIZA_COMPRA
alter VALIDADE position 8;

/*------ 13/05/2014 14:34:27 --------*/

alter table TBAUTORIZA_COMPRA
alter MOVITO position 9;

/*------ 13/05/2014 14:34:27 --------*/

alter table TBAUTORIZA_COMPRA
alter OBSERVACAO position 10;

/*------ 13/05/2014 14:34:27 --------*/

alter table TBAUTORIZA_COMPRA
alter ENDERECO_ENTREGA position 11;

/*------ 13/05/2014 14:34:27 --------*/

alter table TBAUTORIZA_COMPRA
alter STATUS position 12;

/*------ 13/05/2014 14:34:27 --------*/

alter table TBAUTORIZA_COMPRA
alter AUTORIZADO_DATA position 13;

/*------ 13/05/2014 14:34:27 --------*/

alter table TBAUTORIZA_COMPRA
alter AUTORIZADO_USUARIO position 14;

/*------ 13/05/2014 14:34:27 --------*/

alter table TBAUTORIZA_COMPRA
alter CANCELADO_DATA position 15;

/*------ 13/05/2014 14:34:27 --------*/

alter table TBAUTORIZA_COMPRA
alter CANCELADO_USUARIO position 16;

/*------ 13/05/2014 14:34:27 --------*/

alter table TBAUTORIZA_COMPRA
alter CANCELADO_MOTIVO position 17;

/*------ 13/05/2014 14:34:27 --------*/

alter table TBAUTORIZA_COMPRA
alter RECEBEDOR_NOME position 18;

/*------ 13/05/2014 14:34:27 --------*/

alter table TBAUTORIZA_COMPRA
alter RECEBEDOR_CPF position 19;

/*------ 13/05/2014 14:34:27 --------*/

alter table TBAUTORIZA_COMPRA
alter RECEBEDOR_FUNCAO position 20;

/*------ 13/05/2014 14:34:27 --------*/

alter table TBAUTORIZA_COMPRA
alter FORMA_PAGTO position 21;

/*------ 13/05/2014 14:34:27 --------*/

alter table TBAUTORIZA_COMPRA
alter CONDICAO_PAGTO position 22;

/*------ 13/05/2014 14:34:27 --------*/

alter table TBAUTORIZA_COMPRA
alter VALOR_BRUTO position 23;

/*------ 13/05/2014 14:34:28 --------*/

alter table TBAUTORIZA_COMPRA
alter VALOR_DESCONTO position 24;

/*------ 13/05/2014 14:34:28 --------*/

alter table TBAUTORIZA_COMPRA
alter VALOR_TOTAL position 25;

/*------ 13/05/2014 14:34:28 --------*/

ALTER TABLE TBPRODUTO
    ADD CUST_DESP_OFIC DMN_MONEY,
    ADD CUST_DESP_GERAIS DMN_MONEY,
    ADD CUST_DESP_ADM DMN_MONEY,
    ADD CUST_COMISSAO DMN_MONEY,
    ADD CUST_IMPOSTO DMN_MONEY,
    ADD FI_RET_FINANC DMN_MONEY,
    ADD FI_RET_PLANO DMN_MONEY;

/*------ 13/05/2014 14:34:28 --------*/

CREATE DOMAIN DMN_COMISSAOVALOR AS
NUMERIC(6,2)
DEFAULT 0
NOT NULL;

/*------ 13/05/2014 14:34:28 --------*/

COMMENT ON DOMAIN DMN_COMISSAOVALOR IS 'Valor de Comissao';

/*------ 13/05/2014 14:34:28 --------*/

ALTER TABLE TBVENDEDOR
    ADD COMISSAO_VL DMN_COMISSAOVALOR;

/*------ 13/05/2014 14:34:28 --------*/

COMMENT ON COLUMN TBVENDEDOR.COMISSAO_VL IS
'Valor de Comissao';

/*------ 13/05/2014 14:34:28 --------*/

COMMENT ON COLUMN TBPRODUTO.CUST_DESP_OFIC IS
'Custo Veiculo - Despesas Oficina';

/*------ 13/05/2014 14:34:28 --------*/

COMMENT ON COLUMN TBPRODUTO.CUST_DESP_GERAIS IS
'Custo Veiculo - Despesas Gerais';

/*------ 13/05/2014 14:34:28 --------*/

COMMENT ON COLUMN TBPRODUTO.CUST_DESP_ADM IS
'Custo Veiculo - Despesas Administrativas';

/*------ 13/05/2014 14:34:28 --------*/

COMMENT ON COLUMN TBPRODUTO.CUST_COMISSAO IS
'Custo Veiculo - Despesas Comissao';

/*------ 13/05/2014 14:34:28 --------*/

COMMENT ON COLUMN TBPRODUTO.CUST_IMPOSTO IS
'Custo Veiculo - Despesas Impostos';

/*------ 13/05/2014 14:34:28 --------*/

COMMENT ON COLUMN TBPRODUTO.FI_RET_FINANC IS
'Retorno Financeiro - Financiadora';

/*------ 13/05/2014 14:34:28 --------*/

COMMENT ON COLUMN TBPRODUTO.FI_RET_PLANO IS
'Retorno Financeiro - Por Plano';

/*------ 13/05/2014 14:34:28 --------*/

ALTER TABLE TBVENDEDOR
    ADD ATIVO DMN_LOGICO DEFAULT 1;

/*------ 13/05/2014 14:34:28 --------*/

COMMENT ON COLUMN TBVENDEDOR.ATIVO IS
'Usuario ativo:
0 - Nao
1 - Sim';

/*------ 13/05/2014 14:34:28 --------*/

COMMENT ON COLUMN TBVENDEDOR.ATIVO IS
'Vendedor ativo:
0 - Nao
1 - Sim';

/*------ 13/05/2014 15:23:12 --------*/

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

/*------ 13/05/2014 15:23:12 --------*/

SET TERM ; ^

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

/*------ 13/05/2014 15:23:12 --------*/

SET TERM ; ^

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

/*------ 13/05/2014 15:23:12 --------*/

SET TERM ; ^

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

/*------ 13/05/2014 15:23:12 --------*/

SET TERM ; ^

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

/*------ 13/05/2014 15:23:12 --------*/

SET TERM ; ^

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

/*------ 13/05/2014 15:23:12 --------*/

SET TERM ; ^

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

/*------ 13/05/2014 15:23:12 --------*/

SET TERM ; ^

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

/*------ 13/05/2014 15:23:13 --------*/

SET TERM ; ^

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

/*------ 13/05/2014 15:23:13 --------*/

SET TERM ; ^

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

/*------ 13/05/2014 15:23:13 --------*/

SET TERM ; ^

/*------ 15/05/2014 14:21:15 --------*/

COMMENT ON COLUMN SYS_SISTEMA.SIS_ATUALIZACAO IS
'Data/Hora da ultima atualizacao';

/*------ 15/05/2014 14:21:15 --------*/

COMMENT ON TABLE SYS_SISTEMA IS 'Tabela Sistema.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   25/04/2014

Tabela responsavel por armazenar dados sobre o(s) sistema(s) com conexao a base.';

/*------ 15/05/2014 14:21:15 --------*/

COMMENT ON COLUMN TBPRODUTO.MOVIMENTA_ESTOQUE IS
'Movimenta Estoque:
0 - Nao
1 - Sim';

/*------ 15/05/2014 14:21:15 --------*/

COMMENT ON COLUMN TBTPDESPESA.COD IS
'Codigo';

/*------ 15/05/2014 14:21:15 --------*/

COMMENT ON COLUMN TBTPDESPESA.TIPODESP IS
'Descricao';

/*------ 15/05/2014 14:21:15 --------*/

COMMENT ON COLUMN TBPLANO_CONTA.CODIGO IS
'Codigo';

/*------ 15/05/2014 14:21:15 --------*/

COMMENT ON COLUMN TBPLANO_CONTA.DESCRICAO_COMPLETA IS
'Descricao completa';

/*------ 15/05/2014 14:21:15 --------*/

COMMENT ON COLUMN TBPLANO_CONTA.DESCRICAO_RESUMIDA IS
'Descricao resumida';

/*------ 15/05/2014 14:21:15 --------*/

COMMENT ON TABLE TBPLANO_CONTA IS 'Tabela Plano de Contas (Contabilidade).

    Autor   :   Isaque Marinho Ribeiro
    Data    :   09/05/2014

Tabela responsavel por armazenar o plano de contas adotado pela empresa. Informacoes estas lancadas pela Contabilidade.';

/*------ 15/05/2014 14:21:15 --------*/

GRANT ALL ON TBPLANO_CONTA TO "PUBLIC";

/*------ 15/05/2014 14:21:15 --------*/

COMMENT ON COLUMN TBPLANO_CONTA.EXERCICIO IS
'Exercicio';

/*------ 15/05/2014 14:21:15 --------*/

COMMENT ON COLUMN TBPLANO_CONTA.GRUPO IS
'Grupo:
0 - A Definir
1 - Ativo
2 - Passivo
3 ...
4 ...
5 ...
6 ...';

/*------ 15/05/2014 14:21:15 --------*/

alter table TBPLANO_CONTA
alter EXERCICIO position 1;

/*------ 15/05/2014 14:21:15 --------*/

alter table TBPLANO_CONTA
alter CODIGO position 2;

/*------ 15/05/2014 14:21:15 --------*/

alter table TBPLANO_CONTA
alter DESCRICAO_COMPLETA position 3;

/*------ 15/05/2014 14:21:15 --------*/

alter table TBPLANO_CONTA
alter DESCRICAO_RESUMIDA position 4;

/*------ 15/05/2014 14:21:15 --------*/

alter table TBPLANO_CONTA
alter GRUPO position 5;

/*------ 15/05/2014 14:21:15 --------*/

alter table TBPLANO_CONTA
alter column CODIGO position 1;

/*------ 15/05/2014 14:21:15 --------*/

alter table TBPLANO_CONTA
alter column EXERCICIO position 2;

/*------ 15/05/2014 14:21:15 --------*/

alter table TBPLANO_CONTA
alter column GRUPO position 3;

/*------ 15/05/2014 14:21:15 --------*/

alter table TBPLANO_CONTA
alter column DESCRICAO_COMPLETA position 4;

/*------ 15/05/2014 14:21:15 --------*/

alter table TBPLANO_CONTA
alter column DESCRICAO_RESUMIDA position 5;

/*------ 15/05/2014 14:21:16 --------*/

COMMENT ON COLUMN TBTPDESPESA.PLANO_CONTA IS
'Plano de contas para despesas';

/*------ 15/05/2014 14:21:16 --------*/

COMMENT ON SEQUENCE GEN_PLANO_CONTA IS 'Sequencializador para o PLANO DE CONTAS';

/*------ 15/05/2014 14:21:16 --------*/

SET TERM ^ ;

SET TERM ; ^

SET TERM ^ ;

CREATE OR ALTER trigger tg_plano_conta_novo for tbplano_conta
active before insert position 0
AS
begin
  if ( new.codigo is null ) then
    new.codigo = GEN_ID(GEN_PLANO_CONTA, 1);

end^

/*------ 15/05/2014 14:21:16 --------*/

SET TERM ; ^

COMMENT ON TRIGGER TG_PLANO_CONTA_NOVO IS 'Trigger Novo Plano de Contas (Contabilidade).

    Autor   :   Isaque Marinho Ribeiro
    Data    :   09/05/2014

Trigger responsavel por gerar o sequencial unico para o registro quando este nao for informado pela aplicacao.';

/*------ 15/05/2014 14:21:16 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.ANO IS
'Ano';

/*------ 15/05/2014 14:21:16 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.CODIGO IS
'Codigo';

/*------ 15/05/2014 14:21:16 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.EMPRESA IS
'Empresa';

/*------ 15/05/2014 14:21:16 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.FORNECEDOR IS
'Fornecedor';

/*------ 15/05/2014 14:21:16 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.TIPO IS
'Tipo:
0 - A Definir
1 - Compra
2 - Servico
3 - Compra/Servico';

/*------ 15/05/2014 14:21:16 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.EMISSAO_DATA IS
'Data de Emissao';

/*------ 15/05/2014 14:21:16 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.EMISSAO_USUARIO IS
'Usuario de Emissao';

/*------ 15/05/2014 14:21:16 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.VALIDADE IS
'Data de Validade';

/*------ 15/05/2014 14:21:16 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.MOVITO IS
'Motivo';

/*------ 15/05/2014 14:21:16 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.OBSERVACAO IS
'Observacoes';

/*------ 15/05/2014 14:21:16 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.ENDERECO_ENTREGA IS
'Endereco de Entrega';

/*------ 15/05/2014 14:21:16 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.STATUS IS
'Status:
0 - Em edicao
1 - Aberta
2 - Autorizada
3 - Cancelada';

/*------ 15/05/2014 14:21:16 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.AUTORIZADO_DATA IS
'Data de Autorizacao';

/*------ 15/05/2014 14:21:16 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.AUTORIZADO_USUARIO IS
'Usuario de Autorizacao';

/*------ 15/05/2014 14:21:16 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.RECEBEDOR_NOME IS
'Recebedor (Nome)';

/*------ 15/05/2014 14:21:16 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.RECEBEDOR_CPF IS
'Recebedor (CPF)';

/*------ 15/05/2014 14:21:16 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.FORMA_PAGTO IS
'Forma de Pagamento';

/*------ 15/05/2014 14:21:16 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.CONDICAO_PAGTO IS
'Condicao de Pagamento';

/*------ 15/05/2014 14:21:16 --------*/

GRANT ALL ON TBAUTORIZA_COMPRA TO "PUBLIC";

/*------ 15/05/2014 14:21:16 --------*/

SET TERM ^ ;

SET TERM ; ^

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

/*------ 15/05/2014 14:21:16 --------*/

SET TERM ; ^

COMMENT ON TRIGGER TG_AUTORIZA_COMPRA_CODIGO IS 'Trigger Nova Autorizacao de Compra.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   13/05/2014

Trigger responsavel por gerar um sequencial unico para cada novo registro de autorizacao de compra no ano.';

/*------ 15/05/2014 14:21:16 --------*/

COMMENT ON TABLE TBAUTORIZA_COMPRA IS 'Tabela Autorizacao de Compras

    Autor   :   Isaque Marinho Ribeiro
    Data    :   13/05/2014

Tabela responsavel por armazenar as autorizacoes de compras da empresa.';

/*------ 15/05/2014 14:21:16 --------*/

ALTER TABLE TBAUTORIZA_COMPRA
ADD CONSTRAINT FK_TBAUTORIZA_COMPRA_EMP
FOREIGN KEY (EMPRESA)
REFERENCES TBEMPRESA(CNPJ)
ON UPDATE CASCADE;

/*------ 15/05/2014 14:21:17 --------*/

ALTER TABLE TBCONTREC_BAIXA DROP CONSTRAINT FK_TBCONTREC_BAIXA_USUARIO;

/*------ 15/05/2014 14:21:17 --------*/

ALTER TABLE TBCONTPAG_BAIXA DROP CONSTRAINT FK_TBCONTPAG_BAIXA_USUARIO;

/*------ 15/05/2014 14:21:17 --------*/

ALTER TABLE TBCAIXA_MOVIMENTO DROP CONSTRAINT FK_TBCAIXA_MOVIMENTO_US;

/*------ 15/05/2014 14:21:17 --------*/

ALTER TABLE TBCAIXA DROP CONSTRAINT FK_TBCAIXA_USUARIO;

/*------ 15/05/2014 14:21:17 --------*/

ALTER TABLE TBCAIXA DROP CONSTRAINT FK_TBCAIXA_USUARIO_CANCEL;

/*------ 15/05/2014 14:21:17 --------*/

ALTER TABLE TBCAIXA
ADD CONSTRAINT FK_TBCAIXA_USUARIO
FOREIGN KEY (USUARIO)
REFERENCES TBUSERS(NOME);

/*------ 15/05/2014 14:21:17 --------*/

ALTER TABLE TBCAIXA
ADD CONSTRAINT FK_TBCAIXA_USUARIO_CANCEL
FOREIGN KEY (USUARIO_CANCEL)
REFERENCES TBUSERS(NOME);

/*------ 15/05/2014 14:21:18 --------*/

ALTER TABLE TBCAIXA_MOVIMENTO
ADD CONSTRAINT FK_TBCAIXA_MOVIMENTO_US
FOREIGN KEY (USUARIO)
REFERENCES TBUSERS(NOME);

/*------ 15/05/2014 14:21:19 --------*/

ALTER TABLE TBCONTPAG_BAIXA
ADD CONSTRAINT FK_TBCONTPAG_BAIXA_USUARIO
FOREIGN KEY (USUARIO)
REFERENCES TBUSERS(NOME);

/*------ 15/05/2014 14:21:20 --------*/

ALTER TABLE TBCONTREC_BAIXA
ADD CONSTRAINT FK_TBCONTREC_BAIXA_USUARIO
FOREIGN KEY (USUARIO)
REFERENCES TBUSERS(NOME);

/*------ 15/05/2014 14:21:20 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.CANCELADO_DATA IS
'Data de Cancelamento';

/*------ 15/05/2014 14:21:20 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.CANCELADO_USUARIO IS
'Usuario de Cancelamento';

/*------ 15/05/2014 14:21:20 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.CANCELADO_MOTIVO IS
'Motivo de Cancelamento';

/*------ 15/05/2014 14:21:20 --------*/

alter table TBAUTORIZA_COMPRA
alter ANO position 1;

/*------ 15/05/2014 14:21:20 --------*/

alter table TBAUTORIZA_COMPRA
alter CODIGO position 2;

/*------ 15/05/2014 14:21:20 --------*/

alter table TBAUTORIZA_COMPRA
alter EMPRESA position 3;

/*------ 15/05/2014 14:21:20 --------*/

alter table TBAUTORIZA_COMPRA
alter FORNECEDOR position 4;

/*------ 15/05/2014 14:21:20 --------*/

alter table TBAUTORIZA_COMPRA
alter TIPO position 5;

/*------ 15/05/2014 14:21:20 --------*/

alter table TBAUTORIZA_COMPRA
alter EMISSAO_DATA position 6;

/*------ 15/05/2014 14:21:20 --------*/

alter table TBAUTORIZA_COMPRA
alter EMISSAO_USUARIO position 7;

/*------ 15/05/2014 14:21:20 --------*/

alter table TBAUTORIZA_COMPRA
alter VALIDADE position 8;

/*------ 15/05/2014 14:21:20 --------*/

alter table TBAUTORIZA_COMPRA
alter MOVITO position 9;

/*------ 15/05/2014 14:21:20 --------*/

alter table TBAUTORIZA_COMPRA
alter OBSERVACAO position 10;

/*------ 15/05/2014 14:21:20 --------*/

alter table TBAUTORIZA_COMPRA
alter ENDERECO_ENTREGA position 11;

/*------ 15/05/2014 14:21:20 --------*/

alter table TBAUTORIZA_COMPRA
alter STATUS position 12;

/*------ 15/05/2014 14:21:20 --------*/

alter table TBAUTORIZA_COMPRA
alter AUTORIZADO_DATA position 13;

/*------ 15/05/2014 14:21:20 --------*/

alter table TBAUTORIZA_COMPRA
alter AUTORIZADO_USUARIO position 14;

/*------ 15/05/2014 14:21:20 --------*/

alter table TBAUTORIZA_COMPRA
alter CANCELADO_DATA position 15;

/*------ 15/05/2014 14:21:20 --------*/

alter table TBAUTORIZA_COMPRA
alter CANCELADO_USUARIO position 16;

/*------ 15/05/2014 14:21:20 --------*/

alter table TBAUTORIZA_COMPRA
alter CANCELADO_MOTIVO position 17;

/*------ 15/05/2014 14:21:20 --------*/

alter table TBAUTORIZA_COMPRA
alter RECEBEDOR_NOME position 18;

/*------ 15/05/2014 14:21:20 --------*/

alter table TBAUTORIZA_COMPRA
alter RECEBEDOR_CPF position 19;

/*------ 15/05/2014 14:21:20 --------*/

alter table TBAUTORIZA_COMPRA
alter FORMA_PAGTO position 20;

/*------ 15/05/2014 14:21:20 --------*/

alter table TBAUTORIZA_COMPRA
alter CONDICAO_PAGTO position 21;

/*------ 15/05/2014 14:21:20 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.VALOR_BRUTO IS
'Valor Total Bruto (Total Produtos)';

/*------ 15/05/2014 14:21:20 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.VALOR_DESCONTO IS
'Valor Total de Descontos';

/*------ 15/05/2014 14:21:20 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.VALOR_TOTAL IS
'Valor Total (Valor Bruto - Valor Desconto)';

/*------ 15/05/2014 14:21:20 --------*/

alter table TBAUTORIZA_COMPRA
alter ANO position 1;

/*------ 15/05/2014 14:21:20 --------*/

alter table TBAUTORIZA_COMPRA
alter CODIGO position 2;

/*------ 15/05/2014 14:21:20 --------*/

alter table TBAUTORIZA_COMPRA
alter EMPRESA position 3;

/*------ 15/05/2014 14:21:20 --------*/

alter table TBAUTORIZA_COMPRA
alter FORNECEDOR position 5;

/*------ 15/05/2014 14:21:20 --------*/

alter table TBAUTORIZA_COMPRA
alter TIPO position 6;

/*------ 15/05/2014 14:21:20 --------*/

alter table TBAUTORIZA_COMPRA
alter EMISSAO_DATA position 7;

/*------ 15/05/2014 14:21:20 --------*/

alter table TBAUTORIZA_COMPRA
alter EMISSAO_USUARIO position 8;

/*------ 15/05/2014 14:21:20 --------*/

alter table TBAUTORIZA_COMPRA
alter VALIDADE position 9;

/*------ 15/05/2014 14:21:20 --------*/

alter table TBAUTORIZA_COMPRA
alter MOVITO position 10;

/*------ 15/05/2014 14:21:20 --------*/

alter table TBAUTORIZA_COMPRA
alter OBSERVACAO position 11;

/*------ 15/05/2014 14:21:20 --------*/

alter table TBAUTORIZA_COMPRA
alter ENDERECO_ENTREGA position 12;

/*------ 15/05/2014 14:21:20 --------*/

alter table TBAUTORIZA_COMPRA
alter STATUS position 13;

/*------ 15/05/2014 14:21:20 --------*/

alter table TBAUTORIZA_COMPRA
alter AUTORIZADO_DATA position 14;

/*------ 15/05/2014 14:21:20 --------*/

alter table TBAUTORIZA_COMPRA
alter AUTORIZADO_USUARIO position 15;

/*------ 15/05/2014 14:21:20 --------*/

alter table TBAUTORIZA_COMPRA
alter CANCELADO_DATA position 16;

/*------ 15/05/2014 14:21:20 --------*/

alter table TBAUTORIZA_COMPRA
alter CANCELADO_USUARIO position 17;

/*------ 15/05/2014 14:21:20 --------*/

alter table TBAUTORIZA_COMPRA
alter CANCELADO_MOTIVO position 18;

/*------ 15/05/2014 14:21:20 --------*/

alter table TBAUTORIZA_COMPRA
alter RECEBEDOR_NOME position 19;

/*------ 15/05/2014 14:21:20 --------*/

alter table TBAUTORIZA_COMPRA
alter RECEBEDOR_CPF position 20;

/*------ 15/05/2014 14:21:20 --------*/

alter table TBAUTORIZA_COMPRA
alter FORMA_PAGTO position 21;

/*------ 15/05/2014 14:21:20 --------*/

alter table TBAUTORIZA_COMPRA
alter CONDICAO_PAGTO position 22;

/*------ 15/05/2014 14:21:20 --------*/

alter table TBAUTORIZA_COMPRA
alter VALOR_BRUTO position 23;

/*------ 15/05/2014 14:21:20 --------*/

alter table TBAUTORIZA_COMPRA
alter VALOR_DESCONTO position 24;

/*------ 15/05/2014 14:21:21 --------*/

alter table TBAUTORIZA_COMPRA
alter VALOR_TOTAL position 25;

/*------ 15/05/2014 14:21:21 --------*/

ALTER TABLE TBAUTORIZA_COMPRA DROP CONSTRAINT FK_TBAUTORIZA_COMPRA_EMP;

/*------ 15/05/2014 14:21:21 --------*/

ALTER TABLE TBAUTORIZA_COMPRA DROP CONSTRAINT FK_TBAUTORIZA_COMPRA_EMPRESA;

/*------ 15/05/2014 14:21:21 --------*/

ALTER TABLE TBAUTORIZA_COMPRA
ADD CONSTRAINT FK_TBAUTORIZA_COMPRA_EMPRESA
FOREIGN KEY (EMPRESA)
REFERENCES TBEMPRESA(CNPJ)
USING INDEX FK_TBAUTORIZA_COMPRA_EMPRESA;

/*------ 15/05/2014 14:21:21 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.VALOR_BRUTO IS
'Valor Total Bruto';

/*------ 15/05/2014 14:21:21 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRAITEM.ANO IS
'Ano da Autorizacao';

/*------ 15/05/2014 14:21:21 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRAITEM.CODIGO IS
'Codigo da Autorizacao';

/*------ 15/05/2014 14:21:21 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRAITEM.EMPRESA IS
'Empresa da Autorizacao';

/*------ 15/05/2014 14:21:21 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRAITEM.SEQ IS
'Sequencial';

/*------ 15/05/2014 14:21:21 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRAITEM.FORNECEDOR IS
'Fornecedor';

/*------ 15/05/2014 14:21:21 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRAITEM.PRODUTO IS
'Produto/Servico';

/*------ 15/05/2014 14:21:21 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRAITEM.QUANTIDADE IS
'Quantidade

(Aceita valores decimais)';

/*------ 15/05/2014 14:21:21 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRAITEM.VALOR_UNITARIO IS
'Valor Unitario';

/*------ 15/05/2014 14:21:21 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRAITEM.VALOR_TOTAL IS
'Valor Total (Quantidade * Valor Unitario)';

/*------ 15/05/2014 14:21:21 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRAITEM.CONFIRMADO_RECEBIMENTO IS
'Confirmado recebimento do produto/servico pela empresa:
0 - Nao
1 - Sim';

/*------ 15/05/2014 14:21:21 --------*/

GRANT ALL ON TBAUTORIZA_COMPRAITEM TO "PUBLIC";

/*------ 15/05/2014 14:21:21 --------*/

COMMENT ON TABLE TBAUTORIZA_COMPRAITEM IS 'Tabela de Produtos/Servicos da Autorizacao de Compra/Servico.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   13/05/2014

Tabela responsavel por armazenar os itens (produtos eou servicos) das autorizacoes de compras/servicos.';

/*------ 15/05/2014 14:21:21 --------*/

COMMENT ON TABLE TBAUTORIZA_COMPRA IS 'Tabela Autorizacao de Compras/Servicos

    Autor   :   Isaque Marinho Ribeiro
    Data    :   13/05/2014

Tabela responsavel por armazenar as autorizacoes de compras/servicos da empresa.';

/*------ 15/05/2014 14:21:21 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.RECEBEDOR_FUNCAO IS
'Recebedor (Funcao)';

/*------ 15/05/2014 14:21:21 --------*/

alter table TBAUTORIZA_COMPRA
alter ANO position 1;

/*------ 15/05/2014 14:21:21 --------*/

alter table TBAUTORIZA_COMPRA
alter CODIGO position 2;

/*------ 15/05/2014 14:21:21 --------*/

alter table TBAUTORIZA_COMPRA
alter EMPRESA position 3;

/*------ 15/05/2014 14:21:21 --------*/

alter table TBAUTORIZA_COMPRA
alter FORNECEDOR position 4;

/*------ 15/05/2014 14:21:21 --------*/

alter table TBAUTORIZA_COMPRA
alter TIPO position 5;

/*------ 15/05/2014 14:21:21 --------*/

alter table TBAUTORIZA_COMPRA
alter EMISSAO_DATA position 6;

/*------ 15/05/2014 14:21:21 --------*/

alter table TBAUTORIZA_COMPRA
alter EMISSAO_USUARIO position 7;

/*------ 15/05/2014 14:21:21 --------*/

alter table TBAUTORIZA_COMPRA
alter VALIDADE position 8;

/*------ 15/05/2014 14:21:21 --------*/

alter table TBAUTORIZA_COMPRA
alter MOVITO position 9;

/*------ 15/05/2014 14:21:21 --------*/

alter table TBAUTORIZA_COMPRA
alter OBSERVACAO position 10;

/*------ 15/05/2014 14:21:21 --------*/

alter table TBAUTORIZA_COMPRA
alter ENDERECO_ENTREGA position 11;

/*------ 15/05/2014 14:21:21 --------*/

alter table TBAUTORIZA_COMPRA
alter STATUS position 12;

/*------ 15/05/2014 14:21:21 --------*/

alter table TBAUTORIZA_COMPRA
alter AUTORIZADO_DATA position 13;

/*------ 15/05/2014 14:21:21 --------*/

alter table TBAUTORIZA_COMPRA
alter AUTORIZADO_USUARIO position 14;

/*------ 15/05/2014 14:21:21 --------*/

alter table TBAUTORIZA_COMPRA
alter CANCELADO_DATA position 15;

/*------ 15/05/2014 14:21:21 --------*/

alter table TBAUTORIZA_COMPRA
alter CANCELADO_USUARIO position 16;

/*------ 15/05/2014 14:21:21 --------*/

alter table TBAUTORIZA_COMPRA
alter CANCELADO_MOTIVO position 17;

/*------ 15/05/2014 14:21:21 --------*/

alter table TBAUTORIZA_COMPRA
alter RECEBEDOR_NOME position 18;

/*------ 15/05/2014 14:21:21 --------*/

alter table TBAUTORIZA_COMPRA
alter RECEBEDOR_CPF position 19;

/*------ 15/05/2014 14:21:21 --------*/

alter table TBAUTORIZA_COMPRA
alter RECEBEDOR_FUNCAO position 20;

/*------ 15/05/2014 14:21:22 --------*/

alter table TBAUTORIZA_COMPRA
alter FORMA_PAGTO position 21;

/*------ 15/05/2014 14:21:22 --------*/

alter table TBAUTORIZA_COMPRA
alter CONDICAO_PAGTO position 22;

/*------ 15/05/2014 14:21:22 --------*/

alter table TBAUTORIZA_COMPRA
alter VALOR_BRUTO position 23;

/*------ 15/05/2014 14:21:22 --------*/

alter table TBAUTORIZA_COMPRA
alter VALOR_DESCONTO position 24;

/*------ 15/05/2014 14:21:22 --------*/

alter table TBAUTORIZA_COMPRA
alter VALOR_TOTAL position 25;

/*------ 15/05/2014 14:21:22 --------*/

COMMENT ON DOMAIN DMN_COMISSAOVALOR IS 'Valor de Comissao';

/*------ 15/05/2014 14:21:22 --------*/

COMMENT ON COLUMN TBVENDEDOR.COMISSAO_VL IS
'Valor de Comissao';

/*------ 15/05/2014 14:21:22 --------*/

COMMENT ON COLUMN TBPRODUTO.CUST_DESP_OFIC IS
'Custo Veiculo - Despesas Oficina';

/*------ 15/05/2014 14:21:22 --------*/

COMMENT ON COLUMN TBPRODUTO.CUST_DESP_GERAIS IS
'Custo Veiculo - Despesas Gerais';

/*------ 15/05/2014 14:21:22 --------*/

COMMENT ON COLUMN TBPRODUTO.CUST_DESP_ADM IS
'Custo Veiculo - Despesas Administrativas';

/*------ 15/05/2014 14:21:22 --------*/

COMMENT ON COLUMN TBPRODUTO.CUST_COMISSAO IS
'Custo Veiculo - Despesas Comissao';

/*------ 15/05/2014 14:21:22 --------*/

COMMENT ON COLUMN TBPRODUTO.CUST_IMPOSTO IS
'Custo Veiculo - Despesas Impostos';

/*------ 15/05/2014 14:21:22 --------*/

COMMENT ON COLUMN TBPRODUTO.FI_RET_FINANC IS
'Retorno Financeiro - Financiadora';

/*------ 15/05/2014 14:21:22 --------*/

COMMENT ON COLUMN TBPRODUTO.FI_RET_PLANO IS
'Retorno Financeiro - Por Plano';

/*------ 15/05/2014 14:21:22 --------*/

COMMENT ON COLUMN TBVENDEDOR.ATIVO IS
'Usuario ativo:
0 - Nao
1 - Sim';

/*------ 15/05/2014 14:21:22 --------*/

COMMENT ON COLUMN TBVENDEDOR.ATIVO IS
'Vendedor ativo:
0 - Nao
1 - Sim';

/*------ 15/05/2014 14:21:22 --------*/

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

/*------ 15/05/2014 14:21:22 --------*/

SET TERM ; ^

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

/*------ 15/05/2014 14:21:22 --------*/

SET TERM ; ^

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

/*------ 15/05/2014 14:21:23 --------*/

SET TERM ; ^

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

/*------ 15/05/2014 14:21:23 --------*/

SET TERM ; ^

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

/*------ 15/05/2014 14:21:23 --------*/

SET TERM ; ^

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

/*------ 15/05/2014 14:21:23 --------*/

SET TERM ; ^

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

/*------ 15/05/2014 14:21:23 --------*/

SET TERM ; ^

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

/*------ 15/05/2014 14:21:23 --------*/

SET TERM ; ^

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

/*------ 15/05/2014 14:21:23 --------*/

SET TERM ; ^

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

/*------ 15/05/2014 14:21:23 --------*/

SET TERM ; ^

ALTER TABLE TBAUTORIZA_COMPRA
    ADD COMPETENCIA DMN_INTEGER_N,
    ADD DATA_FATURA DMN_DATE;

/*------ 15/05/2014 14:21:23 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.COMPETENCIA IS
'Competencia';

/*------ 15/05/2014 14:21:23 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.DATA_FATURA IS
'Data de faturamento (Entrada)';

/*------ 15/05/2014 14:21:23 --------*/

alter table TBAUTORIZA_COMPRA
alter ANO position 1;

/*------ 15/05/2014 14:21:23 --------*/

alter table TBAUTORIZA_COMPRA
alter CODIGO position 2;

/*------ 15/05/2014 14:21:23 --------*/

alter table TBAUTORIZA_COMPRA
alter EMPRESA position 3;

/*------ 15/05/2014 14:21:23 --------*/

alter table TBAUTORIZA_COMPRA
alter FORNECEDOR position 4;

/*------ 15/05/2014 14:21:23 --------*/

alter table TBAUTORIZA_COMPRA
alter TIPO position 5;

/*------ 15/05/2014 14:21:23 --------*/

alter table TBAUTORIZA_COMPRA
alter EMISSAO_DATA position 6;

/*------ 15/05/2014 14:21:23 --------*/

alter table TBAUTORIZA_COMPRA
alter EMISSAO_USUARIO position 7;

/*------ 15/05/2014 14:21:23 --------*/

alter table TBAUTORIZA_COMPRA
alter VALIDADE position 8;

/*------ 15/05/2014 14:21:23 --------*/

alter table TBAUTORIZA_COMPRA
alter COMPETENCIA position 9;

/*------ 15/05/2014 14:21:23 --------*/

alter table TBAUTORIZA_COMPRA
alter DATA_FATURA position 10;

/*------ 15/05/2014 14:21:23 --------*/

alter table TBAUTORIZA_COMPRA
alter MOVITO position 11;

/*------ 15/05/2014 14:21:23 --------*/

alter table TBAUTORIZA_COMPRA
alter OBSERVACAO position 12;

/*------ 15/05/2014 14:21:23 --------*/

alter table TBAUTORIZA_COMPRA
alter ENDERECO_ENTREGA position 13;

/*------ 15/05/2014 14:21:23 --------*/

alter table TBAUTORIZA_COMPRA
alter STATUS position 14;

/*------ 15/05/2014 14:21:23 --------*/

alter table TBAUTORIZA_COMPRA
alter AUTORIZADO_DATA position 15;

/*------ 15/05/2014 14:21:23 --------*/

alter table TBAUTORIZA_COMPRA
alter AUTORIZADO_USUARIO position 16;

/*------ 15/05/2014 14:21:23 --------*/

alter table TBAUTORIZA_COMPRA
alter CANCELADO_DATA position 17;

/*------ 15/05/2014 14:21:23 --------*/

alter table TBAUTORIZA_COMPRA
alter CANCELADO_USUARIO position 18;

/*------ 15/05/2014 14:21:23 --------*/

alter table TBAUTORIZA_COMPRA
alter CANCELADO_MOTIVO position 19;

/*------ 15/05/2014 14:21:23 --------*/

alter table TBAUTORIZA_COMPRA
alter RECEBEDOR_NOME position 20;

/*------ 15/05/2014 14:21:23 --------*/

alter table TBAUTORIZA_COMPRA
alter RECEBEDOR_CPF position 21;

/*------ 15/05/2014 14:21:23 --------*/

alter table TBAUTORIZA_COMPRA
alter RECEBEDOR_FUNCAO position 22;

/*------ 15/05/2014 14:21:23 --------*/

alter table TBAUTORIZA_COMPRA
alter FORMA_PAGTO position 23;

/*------ 15/05/2014 14:21:23 --------*/

alter table TBAUTORIZA_COMPRA
alter CONDICAO_PAGTO position 24;

/*------ 15/05/2014 14:21:23 --------*/

alter table TBAUTORIZA_COMPRA
alter VALOR_BRUTO position 25;

/*------ 15/05/2014 14:21:23 --------*/

alter table TBAUTORIZA_COMPRA
alter VALOR_DESCONTO position 26;

/*------ 15/05/2014 14:21:23 --------*/

alter table TBAUTORIZA_COMPRA
alter VALOR_TOTAL position 27;

/*------ 15/05/2014 14:21:23 --------*/

alter table TBAUTORIZA_COMPRA
alter column ANO position 1;

/*------ 15/05/2014 14:21:23 --------*/

alter table TBAUTORIZA_COMPRA
alter column CODIGO position 2;

/*------ 15/05/2014 14:21:23 --------*/

alter table TBAUTORIZA_COMPRA
alter column EMPRESA position 3;

/*------ 15/05/2014 14:21:23 --------*/

alter table TBAUTORIZA_COMPRA
alter column FORNECEDOR position 4;

/*------ 15/05/2014 14:21:23 --------*/

alter table TBAUTORIZA_COMPRA
alter column TIPO position 5;

/*------ 15/05/2014 14:21:23 --------*/

alter table TBAUTORIZA_COMPRA
alter column EMISSAO_DATA position 6;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRA
alter column EMISSAO_USUARIO position 7;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRA
alter column VALIDADE position 8;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRA
alter column DATA_FATURA position 9;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRA
alter column COMPETENCIA position 10;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRA
alter column MOVITO position 11;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRA
alter column OBSERVACAO position 12;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRA
alter column ENDERECO_ENTREGA position 13;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRA
alter column STATUS position 14;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRA
alter column AUTORIZADO_DATA position 15;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRA
alter column AUTORIZADO_USUARIO position 16;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRA
alter column CANCELADO_DATA position 17;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRA
alter column CANCELADO_USUARIO position 18;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRA
alter column CANCELADO_MOTIVO position 19;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRA
alter column RECEBEDOR_NOME position 20;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRA
alter column RECEBEDOR_CPF position 21;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRA
alter column RECEBEDOR_FUNCAO position 22;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRA
alter column FORMA_PAGTO position 23;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRA
alter column CONDICAO_PAGTO position 24;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRA
alter column VALOR_BRUTO position 25;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRA
alter column VALOR_DESCONTO position 26;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRA
alter column VALOR_TOTAL position 27;

/*------ 15/05/2014 14:21:24 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.COMPETENCIA IS
'Competencia de faturamento';

/*------ 15/05/2014 14:21:24 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.COMPETENCIA IS
'Competencia';

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRA
alter column ANO position 1;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRA
alter column CODIGO position 2;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRA
alter column EMPRESA position 3;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRA
alter column FORNECEDOR position 4;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRA
alter column TIPO position 5;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRA
alter column EMISSAO_DATA position 6;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRA
alter column EMISSAO_USUARIO position 7;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRA
alter column VALIDADE position 8;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRA
alter column COMPETENCIA position 9;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRA
alter column DATA_FATURA position 10;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRA
alter column MOVITO position 11;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRA
alter column OBSERVACAO position 12;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRA
alter column ENDERECO_ENTREGA position 13;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRA
alter column STATUS position 14;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRA
alter column AUTORIZADO_DATA position 15;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRA
alter column AUTORIZADO_USUARIO position 16;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRA
alter column CANCELADO_DATA position 17;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRA
alter column CANCELADO_USUARIO position 18;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRA
alter column CANCELADO_MOTIVO position 19;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRA
alter column RECEBEDOR_NOME position 20;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRA
alter column RECEBEDOR_CPF position 21;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRA
alter column RECEBEDOR_FUNCAO position 22;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRA
alter column FORMA_PAGTO position 23;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRA
alter column CONDICAO_PAGTO position 24;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRA
alter column VALOR_BRUTO position 25;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRA
alter column VALOR_DESCONTO position 26;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRA
alter column VALOR_TOTAL position 27;

/*------ 15/05/2014 14:21:24 --------*/

SET TERM ^ ;

CREATE trigger tg_autoriza_compra_competencia for tbautoriza_compra
active before insert or update position 1
AS
begin
  Select
    c.cmp_num
  from TBCOMPETENCIA c
  where c.cmp_num = extract(year from new.emissao_data) || right('00' || extract(month from new.emissao_data), 2)
  Into
    new.competencia;
end^

/*------ 15/05/2014 14:21:24 --------*/

SET TERM ; ^

SET TERM ^ ;

CREATE OR ALTER trigger tg_autoriza_compra_competencia for tbautoriza_compra
active before insert or update position 1
AS
begin
  Select
    c.cmp_num
  from TBCOMPETENCIA c
  where c.cmp_num = extract(year from new.emissao_data) || right('00' || extract(month from new.emissao_data), 2)
  Into
    new.competencia;
end^

/*------ 15/05/2014 14:21:24 --------*/

SET TERM ; ^

COMMENT ON TRIGGER TG_AUTORIZA_COMPRA_COMPETENCIA IS 'Trigger Competencia Autorizacao

    Autor   :   Isaque Marinho Ribeiro
    Data    :   13/05/2014

Trigger responsavel por identificar a competencia da autorizacao quando esta nao for informada, baseando-se na data de
emissao.';

/*------ 15/05/2014 14:21:24 --------*/

ALTER TABLE TBAUTORIZA_COMPRA
ADD CONSTRAINT FK_TBAUTORIZA_COMPRA_COMPET
FOREIGN KEY (COMPETENCIA)
REFERENCES TBCOMPETENCIA(CMP_NUM);

/*------ 15/05/2014 14:21:24 --------*/

ALTER TABLE TBAUTORIZA_COMPRA
    ADD NUMERO DMN_VCHAR_20;

/*------ 15/05/2014 14:21:24 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.NUMERO IS
'Numero da Autorizacao (Livre)';

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRA
alter ANO position 1;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRA
alter CODIGO position 2;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRA
alter EMPRESA position 3;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRA
alter NUMERO position 4;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRA
alter FORNECEDOR position 5;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRA
alter TIPO position 6;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRA
alter EMISSAO_DATA position 7;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRA
alter EMISSAO_USUARIO position 8;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRA
alter VALIDADE position 9;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRA
alter COMPETENCIA position 10;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRA
alter DATA_FATURA position 11;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRA
alter MOVITO position 12;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRA
alter OBSERVACAO position 13;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRA
alter ENDERECO_ENTREGA position 14;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRA
alter STATUS position 15;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRA
alter AUTORIZADO_DATA position 16;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRA
alter AUTORIZADO_USUARIO position 17;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRA
alter CANCELADO_DATA position 18;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRA
alter CANCELADO_USUARIO position 19;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRA
alter CANCELADO_MOTIVO position 20;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRA
alter RECEBEDOR_NOME position 21;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRA
alter RECEBEDOR_CPF position 22;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRA
alter RECEBEDOR_FUNCAO position 23;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRA
alter FORMA_PAGTO position 24;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRA
alter CONDICAO_PAGTO position 25;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRA
alter VALOR_BRUTO position 26;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRA
alter VALOR_DESCONTO position 27;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRA
alter VALOR_TOTAL position 28;

/*------ 15/05/2014 14:21:24 --------*/

CREATE INDEX IDX_TBAUTORIZA_COMPRA_NUMERO
ON TBAUTORIZA_COMPRA (NUMERO);

/*------ 15/05/2014 14:21:24 --------*/

CREATE DOMAIN DMN_VCHAR_20_NN AS
VARCHAR(20)
NOT NULL;

/*------ 15/05/2014 14:21:24 --------*/

ALTER TABLE TBAUTORIZA_COMPRAITEM
    ADD UNIDADE DMN_SMALLINT_N;

/*------ 15/05/2014 14:21:24 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRAITEM.UNIDADE IS
'Unidade de Medida';

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRAITEM
alter ANO position 1;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRAITEM
alter CODIGO position 2;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRAITEM
alter EMPRESA position 3;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRAITEM
alter SEQ position 4;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRAITEM
alter FORNECEDOR position 5;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRAITEM
alter PRODUTO position 6;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRAITEM
alter QUANTIDADE position 7;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRAITEM
alter UNIDADE position 8;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRAITEM
alter VALOR_UNITARIO position 9;

/*------ 15/05/2014 14:21:24 --------*/

alter table TBAUTORIZA_COMPRAITEM
alter VALOR_TOTAL position 10;

/*------ 15/05/2014 14:21:25 --------*/

alter table TBAUTORIZA_COMPRAITEM
alter CONFIRMADO_RECEBIMENTO position 11;

/*------ 15/05/2014 14:21:25 --------*/

ALTER TABLE TBAUTORIZA_COMPRAITEM
ADD CONSTRAINT FK_TBAUTORIZA_COMPRAITEM_UND
FOREIGN KEY (UNIDADE)
REFERENCES TBUNIDADEPROD(UNP_COD);

/*------ 15/05/2014 14:21:25 --------*/

CREATE INDEX IDX_TBUNIDADEPROD_SIGLA
ON TBUNIDADEPROD (UNP_SIGLA);

/*------ 15/05/2014 14:21:25 --------*/

ALTER TABLE TBCOMPRAS
    ADD AUTORIZACAO_ANO DMN_SMALLINT_N,
    ADD AUTORIZACAO_CODIGO DMN_BIGINT_N;

/*------ 15/05/2014 14:21:25 --------*/

COMMENT ON COLUMN TBCOMPRAS.AUTORIZACAO_ANO IS
'Autorizacao - Ano.';

/*------ 15/05/2014 14:21:25 --------*/

COMMENT ON COLUMN TBCOMPRAS.AUTORIZACAO_CODIGO IS
'Autorizacao - Codigo.';

/*------ 15/05/2014 14:21:25 --------*/

ALTER TABLE TBCOMPRAS
    ADD AUTORIZACAO_EMPRESA INTEGER;

/*------ 15/05/2014 14:21:25 --------*/

COMMENT ON COLUMN TBCOMPRAS.AUTORIZACAO_EMPRESA IS
'Autorizacao - Empresa.';

/*------ 15/05/2014 14:21:25 --------*/

ALTER TABLE TBCOMPRAS
    ALTER AUTORIZACAO_EMPRESA TYPE DMN_CNPJ;

/*------ 15/05/2014 14:21:25 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.STATUS IS
'Status:
0 - Em edicao
1 - Aberta
2 - Autorizada
3 - Faturada
4 - Cancelada';

/*------ 15/05/2014 14:21:25 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.STATUS IS
'Status:
0 - Em edicao
1 - Aberta
2 - Autorizada
3 - Faturada (NF/NFS registrada no sistema referente a autorizacao)
4 - Cancelada';

/*------ 15/05/2014 14:42:16 --------*/

ALTER TABLE TBAUTORIZA_COMPRA
    ADD INSERCAO_DATA DMN_DATETIME;

/*------ 15/05/2014 14:42:16 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.INSERCAO_DATA IS
'Data/hora de insercao';


/*------ SYSDBA 15/05/2014 14:42:28 --------*/

alter table TBAUTORIZA_COMPRA
alter column ANO position 1;


/*------ SYSDBA 15/05/2014 14:42:28 --------*/

alter table TBAUTORIZA_COMPRA
alter column CODIGO position 2;


/*------ SYSDBA 15/05/2014 14:42:28 --------*/

alter table TBAUTORIZA_COMPRA
alter column EMPRESA position 3;


/*------ SYSDBA 15/05/2014 14:42:28 --------*/

alter table TBAUTORIZA_COMPRA
alter column NUMERO position 4;


/*------ SYSDBA 15/05/2014 14:42:28 --------*/

alter table TBAUTORIZA_COMPRA
alter column FORNECEDOR position 5;


/*------ SYSDBA 15/05/2014 14:42:28 --------*/

alter table TBAUTORIZA_COMPRA
alter column TIPO position 6;


/*------ SYSDBA 15/05/2014 14:42:28 --------*/

alter table TBAUTORIZA_COMPRA
alter column INSERCAO_DATA position 7;


/*------ SYSDBA 15/05/2014 14:42:28 --------*/

alter table TBAUTORIZA_COMPRA
alter column EMISSAO_DATA position 8;


/*------ SYSDBA 15/05/2014 14:42:28 --------*/

alter table TBAUTORIZA_COMPRA
alter column EMISSAO_USUARIO position 9;


/*------ SYSDBA 15/05/2014 14:42:28 --------*/

alter table TBAUTORIZA_COMPRA
alter column VALIDADE position 10;


/*------ SYSDBA 15/05/2014 14:42:28 --------*/

alter table TBAUTORIZA_COMPRA
alter column COMPETENCIA position 11;


/*------ SYSDBA 15/05/2014 14:42:28 --------*/

alter table TBAUTORIZA_COMPRA
alter column DATA_FATURA position 12;


/*------ SYSDBA 15/05/2014 14:42:28 --------*/

alter table TBAUTORIZA_COMPRA
alter column MOVITO position 13;


/*------ SYSDBA 15/05/2014 14:42:28 --------*/

alter table TBAUTORIZA_COMPRA
alter column OBSERVACAO position 14;


/*------ SYSDBA 15/05/2014 14:42:28 --------*/

alter table TBAUTORIZA_COMPRA
alter column ENDERECO_ENTREGA position 15;


/*------ SYSDBA 15/05/2014 14:42:28 --------*/

alter table TBAUTORIZA_COMPRA
alter column STATUS position 16;


/*------ SYSDBA 15/05/2014 14:42:28 --------*/

alter table TBAUTORIZA_COMPRA
alter column AUTORIZADO_DATA position 17;


/*------ SYSDBA 15/05/2014 14:42:28 --------*/

alter table TBAUTORIZA_COMPRA
alter column AUTORIZADO_USUARIO position 18;


/*------ SYSDBA 15/05/2014 14:42:28 --------*/

alter table TBAUTORIZA_COMPRA
alter column CANCELADO_DATA position 19;


/*------ SYSDBA 15/05/2014 14:42:28 --------*/

alter table TBAUTORIZA_COMPRA
alter column CANCELADO_USUARIO position 20;


/*------ SYSDBA 15/05/2014 14:42:28 --------*/

alter table TBAUTORIZA_COMPRA
alter column CANCELADO_MOTIVO position 21;


/*------ SYSDBA 15/05/2014 14:42:28 --------*/

alter table TBAUTORIZA_COMPRA
alter column RECEBEDOR_NOME position 22;


/*------ SYSDBA 15/05/2014 14:42:28 --------*/

alter table TBAUTORIZA_COMPRA
alter column RECEBEDOR_CPF position 23;


/*------ SYSDBA 15/05/2014 14:42:28 --------*/

alter table TBAUTORIZA_COMPRA
alter column RECEBEDOR_FUNCAO position 24;


/*------ SYSDBA 15/05/2014 14:42:28 --------*/

alter table TBAUTORIZA_COMPRA
alter column FORMA_PAGTO position 25;


/*------ SYSDBA 15/05/2014 14:42:28 --------*/

alter table TBAUTORIZA_COMPRA
alter column CONDICAO_PAGTO position 26;


/*------ SYSDBA 15/05/2014 14:42:28 --------*/

alter table TBAUTORIZA_COMPRA
alter column VALOR_BRUTO position 27;


/*------ SYSDBA 15/05/2014 14:42:28 --------*/

alter table TBAUTORIZA_COMPRA
alter column VALOR_DESCONTO position 28;


/*------ SYSDBA 15/05/2014 14:42:28 --------*/

alter table TBAUTORIZA_COMPRA
alter column VALOR_TOTAL position 29;

/*------ 15/05/2014 15:16:02 --------*/

CREATE VIEW VW_TIPO_AUTORIZACAO(
    CODIGO,
    DESCRICAO)
AS
Select 1 as Codigo , 'Compra'         as Descricao from RDB$DATABASE Union
Select 2 as Codigo , 'Serviço'        as Descricao from RDB$DATABASE Union
Select 3 as Codigo , 'Compra/Serviço' as Descricao from RDB$DATABASE;

/*------ 15/05/2014 15:16:02 --------*/

GRANT ALL ON VW_TIPO_AUTORIZACAO TO PUBLIC;


/*------ SYSDBA 16/05/2014 00:35:12 --------*/

ALTER TABLE TBAUTORIZA_COMPRAITEM
    ADD USUARIO DMN_USUARIO;

COMMENT ON COLUMN TBAUTORIZA_COMPRAITEM.USUARIO IS
'Usuario de lancamento';



/*------ 16/05/2014 04:34:56 --------*/

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

    -- Marcar como FATURADA a Autorizacao de Compra associada a Entrada
    Update TBAUTORIZA_COMPRA ac Set
      ac.status = 3 -- 3. Faturada (NF/NFS registrada no sistema referente a autorizacao)
    where ac.ano     = coalesce(new.autorizacao_ano, 0)
      and ac.codigo  = coalesce(new.autorizacao_codigo, 0)
      and ac.empresa = coalesce(new.autorizacao_empresa, '0');

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

      -- Confirmar recebimento dos produtos autorizados na Autorizacao de Compras
      Update TBAUTORIZA_COMPRAITEM aci Set
        aci.confirmado_recebimento = 1
      where aci.ano     = coalesce(new.autorizacao_ano, 0)
        and aci.codigo  = coalesce(new.autorizacao_codigo, 0)
        and aci.empresa = coalesce(new.autorizacao_empresa, '0')
        and aci.produto = :Produto;

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

/*------ 16/05/2014 04:34:56 --------*/

SET TERM ; ^

/*------ 16/05/2014 10:30:41 --------*/

ALTER TABLE TBCONFIGURACAO
    ADD CLIENTE_PERMITIR_DUPLICAR_CNPJ DMN_LOGICO DEFAULT 0;

/*------ 16/05/2014 10:30:41 --------*/

COMMENT ON COLUMN TBCONFIGURACAO.CLIENTE_PERMITIR_DUPLICAR_CNPJ IS
'Cliente: Permitir duplicar CPF/CNPJ no Cadastro:
0 - Nao
1 - Sim';

/*------ 16/05/2014 10:30:41 --------*/

alter table TBCONFIGURACAO
alter EMPRESA position 1;

/*------ 16/05/2014 10:30:41 --------*/

alter table TBCONFIGURACAO
alter EMAIL_CONTA position 2;

/*------ 16/05/2014 10:30:41 --------*/

alter table TBCONFIGURACAO
alter EMAIL_SENHA position 3;

/*------ 16/05/2014 10:30:41 --------*/

alter table TBCONFIGURACAO
alter EMAIL_POP position 4;

/*------ 16/05/2014 10:30:41 --------*/

alter table TBCONFIGURACAO
alter EMAIL_SMTP position 5;

/*------ 16/05/2014 10:30:41 --------*/

alter table TBCONFIGURACAO
alter EMAIL_SMTP_PORTA position 6;

/*------ 16/05/2014 10:30:41 --------*/

alter table TBCONFIGURACAO
alter EMAIL_REQUER_AUTENTICACAO position 7;

/*------ 16/05/2014 10:30:41 --------*/

alter table TBCONFIGURACAO
alter EMAIL_CONEXAO_SSL position 8;

/*------ 16/05/2014 10:30:41 --------*/

alter table TBCONFIGURACAO
alter EMAIL_ASSUNTO_PADRAO position 9;

/*------ 16/05/2014 10:30:41 --------*/

alter table TBCONFIGURACAO
alter EMAIL_MENSAGEM_PADRAO position 10;

/*------ 16/05/2014 10:30:41 --------*/

alter table TBCONFIGURACAO
alter NFE_SOLICITA_DH_SAIDA position 11;

/*------ 16/05/2014 10:30:41 --------*/

alter table TBCONFIGURACAO
alter NFE_IMPRIMIR_COD_CLIENTE position 12;

/*------ 16/05/2014 10:30:41 --------*/

alter table TBCONFIGURACAO
alter CLIENTE_PERMITIR_DUPLICAR_CNPJ position 13;

/*------ 16/05/2014 10:30:41 --------*/

alter table TBCONFIGURACAO
alter CUSTO_OPER_CALCULAR position 14;

/*------ 16/05/2014 10:30:41 --------*/

alter table TBCONFIGURACAO
alter PERMITIR_VENDA_ESTOQUE_INS position 15;

/*------ 16/05/2014 10:30:41 --------*/

alter table TBCONFIGURACAO
alter ESTOQUE_UNICO_EMPRESAS position 16;

/*------ 16/05/2014 10:30:41 --------*/

alter table TBCONFIGURACAO
alter ESTOQUE_SATELITE_CLIENTE position 17;

/*------ 16/05/2014 10:30:41 --------*/

alter table TBCONFIGURACAO
alter USUARIO position 18;

/*------ 20/05/2014 12:01:58 --------*/

ALTER TABLE TBAUTORIZA_COMPRA
    ADD NOME_CONTATO DMN_VCHAR_100;

/*------ 20/05/2014 12:01:58 --------*/

COMMENT ON COLUMN TBAUTORIZA_COMPRA.NOME_CONTATO IS
'Nome do Contato';

/*------ 20/05/2014 12:01:58 --------*/

alter table TBAUTORIZA_COMPRA
alter ANO position 1;

/*------ 20/05/2014 12:01:58 --------*/

alter table TBAUTORIZA_COMPRA
alter CODIGO position 2;

/*------ 20/05/2014 12:01:58 --------*/

alter table TBAUTORIZA_COMPRA
alter EMPRESA position 3;

/*------ 20/05/2014 12:01:58 --------*/

alter table TBAUTORIZA_COMPRA
alter NUMERO position 4;

/*------ 20/05/2014 12:01:58 --------*/

alter table TBAUTORIZA_COMPRA
alter FORNECEDOR position 5;

/*------ 20/05/2014 12:01:58 --------*/

alter table TBAUTORIZA_COMPRA
alter NOME_CONTATO position 6;

/*------ 20/05/2014 12:01:58 --------*/

alter table TBAUTORIZA_COMPRA
alter TIPO position 7;

/*------ 20/05/2014 12:01:58 --------*/

alter table TBAUTORIZA_COMPRA
alter INSERCAO_DATA position 8;

/*------ 20/05/2014 12:01:58 --------*/

alter table TBAUTORIZA_COMPRA
alter EMISSAO_DATA position 9;

/*------ 20/05/2014 12:01:58 --------*/

alter table TBAUTORIZA_COMPRA
alter EMISSAO_USUARIO position 10;

/*------ 20/05/2014 12:01:58 --------*/

alter table TBAUTORIZA_COMPRA
alter VALIDADE position 11;

/*------ 20/05/2014 12:01:58 --------*/

alter table TBAUTORIZA_COMPRA
alter COMPETENCIA position 12;

/*------ 20/05/2014 12:01:58 --------*/

alter table TBAUTORIZA_COMPRA
alter DATA_FATURA position 13;

/*------ 20/05/2014 12:01:58 --------*/

alter table TBAUTORIZA_COMPRA
alter MOVITO position 14;

/*------ 20/05/2014 12:01:58 --------*/

alter table TBAUTORIZA_COMPRA
alter OBSERVACAO position 15;

/*------ 20/05/2014 12:01:58 --------*/

alter table TBAUTORIZA_COMPRA
alter ENDERECO_ENTREGA position 16;

/*------ 20/05/2014 12:01:58 --------*/

alter table TBAUTORIZA_COMPRA
alter STATUS position 17;

/*------ 20/05/2014 12:01:59 --------*/

alter table TBAUTORIZA_COMPRA
alter AUTORIZADO_DATA position 18;

/*------ 20/05/2014 12:01:59 --------*/

alter table TBAUTORIZA_COMPRA
alter AUTORIZADO_USUARIO position 19;

/*------ 20/05/2014 12:01:59 --------*/

alter table TBAUTORIZA_COMPRA
alter CANCELADO_DATA position 20;

/*------ 20/05/2014 12:01:59 --------*/

alter table TBAUTORIZA_COMPRA
alter CANCELADO_USUARIO position 21;

/*------ 20/05/2014 12:01:59 --------*/

alter table TBAUTORIZA_COMPRA
alter CANCELADO_MOTIVO position 22;

/*------ 20/05/2014 12:01:59 --------*/

alter table TBAUTORIZA_COMPRA
alter RECEBEDOR_NOME position 23;

/*------ 20/05/2014 12:01:59 --------*/

alter table TBAUTORIZA_COMPRA
alter RECEBEDOR_CPF position 24;

/*------ 20/05/2014 12:01:59 --------*/

alter table TBAUTORIZA_COMPRA
alter RECEBEDOR_FUNCAO position 25;

/*------ 20/05/2014 12:01:59 --------*/

alter table TBAUTORIZA_COMPRA
alter FORMA_PAGTO position 26;

/*------ 20/05/2014 12:01:59 --------*/

alter table TBAUTORIZA_COMPRA
alter CONDICAO_PAGTO position 27;

/*------ 20/05/2014 12:01:59 --------*/

alter table TBAUTORIZA_COMPRA
alter TRANSPORTADOR position 28;

/*------ 20/05/2014 12:01:59 --------*/

alter table TBAUTORIZA_COMPRA
alter VALOR_BRUTO position 29;

/*------ 20/05/2014 12:01:59 --------*/

alter table TBAUTORIZA_COMPRA
alter VALOR_DESCONTO position 30;

/*------ 20/05/2014 12:01:59 --------*/

alter table TBAUTORIZA_COMPRA
alter VALOR_TOTAL_FRETE position 31;

/*------ 20/05/2014 12:01:59 --------*/

alter table TBAUTORIZA_COMPRA
alter VALOR_TOTAL_IPI position 32;

/*------ 20/05/2014 12:01:59 --------*/

alter table TBAUTORIZA_COMPRA
alter VALOR_TOTAL position 33;