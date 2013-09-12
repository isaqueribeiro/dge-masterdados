


/*------ SYSDBA 07/02/2013 18:49:09 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_vendasitens_total_venda for tvendasitens
active after insert or update or delete position 10
AS
  declare variable anovenda Smallint;
  declare variable numvenda Integer;
  declare variable total_bruto Dmn_money;
  declare variable total_desconto dmn_money_desconto_4;
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
      sum( coalesce(i.Qtde, 0) * coalesce(i.Punit, 0) )
    --, sum( coalesce(i.Qtde, 0) * (coalesce(i.Punit, 0) - coalesce(i.Pfinal, 0)) )
    , sum( coalesce(i.Qtde, 0) * coalesce(i.desconto_valor, 0) )
    , sum( coalesce(i.Qtde, 0) * coalesce(i.pfinal, 0) )
  from TVENDASITENS i
  where i.Ano = :Anovenda
    and i.Codcontrol = :Numvenda
  into
      Total_bruto
    , Total_desconto
    , total_liquido;

  Total_bruto    = coalesce(:Total_bruto, 0);
  Total_desconto = coalesce(:Total_desconto, 0);

  Update TBVENDAS v Set
      v.Desconto = :Total_desconto
--    , v.Totalvenda = :Total_bruto - :Total_desconto
    , v.Totalvenda = :Total_liquido
  where v.Ano = :Anovenda
    and v.Codcontrol = :Numvenda;
end^

SET TERM ; ^




/*------ SYSDBA 12/09/2013 11:31:47 --------*/

SET STATISTICS INDEX FK_TBAJUSTESTOQ_1;

SET STATISTICS INDEX FK_TBAJUSTESTOQ_2;

SET STATISTICS INDEX FK_TBBAIRRO_CID;

SET STATISTICS INDEX FK_TBBAIRRO_DIS;

SET STATISTICS INDEX FK_TBBANCO_BOLETO_EMPRESA;

SET STATISTICS INDEX FK_TBCAIXA_CONSOLIDACAO;

SET STATISTICS INDEX FK_TBCAIXA_CONSOLIDACAO_FP;

SET STATISTICS INDEX FK_TBCAIXA_CONTA_CORRENTE;

SET STATISTICS INDEX FK_TBCAIXA_MOVIMENTO_CC;

SET STATISTICS INDEX FK_TBCAIXA_MOVIMENTO_CL;

SET STATISTICS INDEX FK_TBCAIXA_MOVIMENTO_CM;

SET STATISTICS INDEX FK_TBCAIXA_MOVIMENTO_CX;

SET STATISTICS INDEX FK_TBCAIXA_MOVIMENTO_EP;

SET STATISTICS INDEX FK_TBCAIXA_MOVIMENTO_FN;

SET STATISTICS INDEX FK_TBCAIXA_MOVIMENTO_FP;

SET STATISTICS INDEX FK_TBCAIXA_MOVIMENTO_PG;

SET STATISTICS INDEX FK_TBCAIXA_MOVIMENTO_RC;

SET STATISTICS INDEX FK_TBCAIXA_MOVIMENTO_US;

SET STATISTICS INDEX FK_TBCAIXA_MOVIMENTO_VD;

SET STATISTICS INDEX FK_TBCAIXA_USUARIO;

SET STATISTICS INDEX FK_TBCAIXA_USUARIO_CANCEL;

SET STATISTICS INDEX FK_TBCIDADE_UF;

SET STATISTICS INDEX FK_TBCLIENTE_BAI;

SET STATISTICS INDEX FK_TBCLIENTE_CID;

SET STATISTICS INDEX FK_TBCLIENTE_EST;

SET STATISTICS INDEX FK_TBCLIENTE_LOG;

SET STATISTICS INDEX FK_TBCLIENTE_PAIS;

SET STATISTICS INDEX FK_TBCLIENTE_TIPO_LOG;

SET STATISTICS INDEX FK_TBCLIENTE_VENDEDOR;

SET STATISTICS INDEX FK_TBCOMPRASITENS_COMPRA;

SET STATISTICS INDEX FK_TBCOMPRASITENS_EMPRESA;

SET STATISTICS INDEX FK_TBCOMPRASITENS_FORNECEDOR;

SET STATISTICS INDEX FK_TBCOMPRASITENS_PRODUTO;

SET STATISTICS INDEX FK_TBCOMPRASITENS_UNID;

SET STATISTICS INDEX FK_TBCOMPRAS_CFOP;

SET STATISTICS INDEX FK_TBCOMPRAS_EMPRESA;

SET STATISTICS INDEX FK_TBCOMPRAS_FORNECEDOR;

SET STATISTICS INDEX FK_TBCONFIGURACAO_EMPRESA;

SET STATISTICS INDEX FK_TBCONTA_CORRENTE_BANCO;

SET STATISTICS INDEX FK_TBCONTA_CORRENTE_SALDO;

SET STATISTICS INDEX FK_TBCONTPAG_1;

SET STATISTICS INDEX FK_TBCONTPAG_BAIXA_BANCO;

SET STATISTICS INDEX FK_TBCONTPAG_BAIXA_CPAG;

SET STATISTICS INDEX FK_TBCONTPAG_BAIXA_FPAGTO;

SET STATISTICS INDEX FK_TBCONTPAG_BAIXA_USUARIO;

SET STATISTICS INDEX FK_TBCONTPAG_BANCO;

SET STATISTICS INDEX FK_TBCONTPAG_COND_PAGTO;

SET STATISTICS INDEX FK_TBCONTPAG_FORMA_PAGTO;

SET STATISTICS INDEX FK_TBCONTPAG_FORNECEDOR;

SET STATISTICS INDEX FK_TBCONTREC_1;

SET STATISTICS INDEX FK_TBCONTREC_BAIXA_BANCO;

SET STATISTICS INDEX FK_TBCONTREC_BAIXA_CREC;

SET STATISTICS INDEX FK_TBCONTREC_BAIXA_FPAGTO;

SET STATISTICS INDEX FK_TBCONTREC_BAIXA_USUARIO;

SET STATISTICS INDEX FK_TBCONTREC_BANCO;

SET STATISTICS INDEX FK_TBCONTREC_FORMA_PGTO;

SET STATISTICS INDEX FK_TBCONTREC_VND;

SET STATISTICS INDEX FK_TBEMPRESA_BAI;

SET STATISTICS INDEX FK_TBEMPRESA_CID;

SET STATISTICS INDEX FK_TBEMPRESA_EST;

SET STATISTICS INDEX FK_TBEMPRESA_LOG;

SET STATISTICS INDEX FK_TBEMPRESA_PAIS;

SET STATISTICS INDEX FK_TBEMPRESA_SEGMENTO;

SET STATISTICS INDEX FK_TBEMPRESA_TIPO_LOG;

SET STATISTICS INDEX FK_TBFORMPAGTO_CCORRENTE;

SET STATISTICS INDEX FK_TBFORNECEDOR_BAI;

SET STATISTICS INDEX FK_TBFORNECEDOR_CID;

SET STATISTICS INDEX FK_TBFORNECEDOR_EST;

SET STATISTICS INDEX FK_TBFORNECEDOR_GRUPO;

SET STATISTICS INDEX FK_TBFORNECEDOR_LOG;

SET STATISTICS INDEX FK_TBFORNECEDOR_PAIS;

SET STATISTICS INDEX FK_TBFORNECEDOR_TIPO_LOG;

SET STATISTICS INDEX FK_TBLANCDEPOS_1;

SET STATISTICS INDEX FK_TBLOGRADOURO_CID;

SET STATISTICS INDEX FK_TBLOGRADOURO_TIP;

SET STATISTICS INDEX FK_TBPEDIDOITENS_1;

SET STATISTICS INDEX FK_TBPEDIDOS_1;

SET STATISTICS INDEX FK_TBPEDIDOS_2;

SET STATISTICS INDEX FK_TBPEDIDOS_3;

SET STATISTICS INDEX FK_TBPRODHIST_1;

SET STATISTICS INDEX FK_TBPRODHIST_EMP;

SET STATISTICS INDEX FK_TBPRODUTO_1;

SET STATISTICS INDEX FK_TBPRODUTO_2;

SET STATISTICS INDEX FK_TBPRODUTO_CFOP;

SET STATISTICS INDEX FK_TBPRODUTO_COMBUSTIVEL;

SET STATISTICS INDEX FK_TBPRODUTO_COR;

SET STATISTICS INDEX FK_TBPRODUTO_FABRICANTE;

SET STATISTICS INDEX FK_TBPRODUTO_ORIGEM;

SET STATISTICS INDEX FK_TBPRODUTO_ROTATIVIDADE;

SET STATISTICS INDEX FK_TBPRODUTO_SECAO;

SET STATISTICS INDEX FK_TBPRODUTO_TIPO_VEI;

SET STATISTICS INDEX FK_TBPRODUTO_UNIDADE;

SET STATISTICS INDEX FK_TBPROMOCAO_PRODUTO_PROD;

SET STATISTICS INDEX FK_TBPROMOCAO_PRODUTO_PROM;

SET STATISTICS INDEX FK_TBUSERS_1;

SET STATISTICS INDEX FK_TBVENDAS_CFOP;

SET STATISTICS INDEX FK_TBVENDAS_CLIENTE;

SET STATISTICS INDEX FK_TBVENDAS_CONDPGTO;

SET STATISTICS INDEX FK_TBVENDAS_EMPRESA;

SET STATISTICS INDEX FK_TBVENDAS_FORMAPAGTO;

SET STATISTICS INDEX FK_TBVENDAS_FORMAPAGTO_CPG;

SET STATISTICS INDEX FK_TBVENDAS_FORMAPAGTO_FPG;

SET STATISTICS INDEX FK_TBVENDAS_FORMAPGTO;

SET STATISTICS INDEX FK_TBVENDAS_VENDEDOR;

SET STATISTICS INDEX FK_TBVENDAS_VOLUME;

SET STATISTICS INDEX FK_TVENDASITENS_CLIENTE;

SET STATISTICS INDEX FK_TVENDASITENS_EMPRESA;

SET STATISTICS INDEX FK_TVENDASITENS_PRODUTO;

SET STATISTICS INDEX FK_TVENDASITENS_VENDA;

SET STATISTICS INDEX IBE$LOG_BLOB_FIELDS_IDX1;

SET STATISTICS INDEX IBE$LOG_FIELDS_IDX1;

SET STATISTICS INDEX IBE$LOG_KEYS_IDX1;

SET STATISTICS INDEX IDX_PRODUTO_ROTATIVIDADE;

SET STATISTICS INDEX IDX_TBCLIENTE_BLOQUEADO;

SET STATISTICS INDEX IDX_TBCOMPRAS_NFE;

SET STATISTICS INDEX IDX_TBCONTREC_NOSSONUMERO;

SET STATISTICS INDEX IDX_TBCONTREC_SITUACAO;

SET STATISTICS INDEX IDX_TBUSERALLOW;

SET STATISTICS INDEX PK_RENAVAM_COBUSTIVEL;

SET STATISTICS INDEX PK_RENAVAM_COR;

SET STATISTICS INDEX PK_RENAVAM_TIPOVEICULO;

SET STATISTICS INDEX PK_TBBAIRRO;

SET STATISTICS INDEX PK_TBBANCO;

SET STATISTICS INDEX PK_TBBANCO_BOLETO;

SET STATISTICS INDEX PK_TBCAIXA;

SET STATISTICS INDEX PK_TBCAIXA_CONSOLIDACAO;

SET STATISTICS INDEX PK_TBCAIXA_MOVIMENTO;

SET STATISTICS INDEX PK_TBCFOP;

SET STATISTICS INDEX PK_TBCIDADE;

SET STATISTICS INDEX PK_TBCLIENTE;

SET STATISTICS INDEX PK_TBCOMPRAS;

SET STATISTICS INDEX PK_TBCOMPRASITENS;

SET STATISTICS INDEX PK_TBCONDICAOPAGTO;

SET STATISTICS INDEX PK_TBCONFIGURACAO;

SET STATISTICS INDEX PK_TBCONTA_CORRENTE;

SET STATISTICS INDEX PK_TBCONTA_CORRENTE_SALDO;

SET STATISTICS INDEX PK_TBCONTPAG;

SET STATISTICS INDEX PK_TBCONTPAG_BAIXA;

SET STATISTICS INDEX PK_TBCONTREC;

SET STATISTICS INDEX PK_TBCONTREC_BAIXA;

SET STATISTICS INDEX PK_TBCST_COFINS;

SET STATISTICS INDEX PK_TBCST_PIS;

SET STATISTICS INDEX PK_TBDISTRITO;

SET STATISTICS INDEX PK_TBEMPRESA;

SET STATISTICS INDEX PK_TBESTADO;

SET STATISTICS INDEX PK_TBFABRICANTE;

SET STATISTICS INDEX PK_TBFORMPAGTO;

SET STATISTICS INDEX PK_TBFORNECEDOR;

SET STATISTICS INDEX PK_TBFORNECEDOR_GRUPO;

SET STATISTICS INDEX PK_TBFUNCAO;

SET STATISTICS INDEX PK_TBGRUPOPROD;

SET STATISTICS INDEX PK_TBLANCDEPOS;

SET STATISTICS INDEX PK_TBLOGRADOURO;

SET STATISTICS INDEX PK_TBLOG_TRANSACAO;

SET STATISTICS INDEX PK_TBNFE_ENVIADA;

SET STATISTICS INDEX PK_TBORIGEMPROD;

SET STATISTICS INDEX PK_TBPAIS;

SET STATISTICS INDEX PK_TBPEDIDOITENS;

SET STATISTICS INDEX PK_TBPEDIDOS;

SET STATISTICS INDEX PK_TBPRODUTO;

SET STATISTICS INDEX PK_TBPRODUTO_ROTATIVIDADE;

SET STATISTICS INDEX PK_TBPROMOCAO;

SET STATISTICS INDEX PK_TBPROMOCAO_PRODUTO;

SET STATISTICS INDEX PK_TBSECAOPROD;

SET STATISTICS INDEX PK_TBSEGMENTO;

SET STATISTICS INDEX PK_TBSENHA_AUTORIZACAO;

SET STATISTICS INDEX PK_TBTIPO_LOGRADOURO;

SET STATISTICS INDEX PK_TBTPDESPESA;

SET STATISTICS INDEX PK_TBTRIBUTACAO_TIPO;

SET STATISTICS INDEX PK_TBUNIDADEPROD;

SET STATISTICS INDEX PK_TBUSERALLOW;

SET STATISTICS INDEX PK_TBUSERS;

SET STATISTICS INDEX PK_TBVENDAS;

SET STATISTICS INDEX PK_TBVENDAS_FORMAPAGTO;

SET STATISTICS INDEX PK_TBVENDAS_VOLUME;

SET STATISTICS INDEX PK_TBVENDEDOR;

SET STATISTICS INDEX RDB$INDEX_0;

SET STATISTICS INDEX RDB$INDEX_1;

SET STATISTICS INDEX RDB$INDEX_10;

SET STATISTICS INDEX RDB$INDEX_11;

SET STATISTICS INDEX RDB$INDEX_12;

SET STATISTICS INDEX RDB$INDEX_13;

SET STATISTICS INDEX RDB$INDEX_14;

SET STATISTICS INDEX RDB$INDEX_15;

SET STATISTICS INDEX RDB$INDEX_16;

SET STATISTICS INDEX RDB$INDEX_17;

SET STATISTICS INDEX RDB$INDEX_18;

SET STATISTICS INDEX RDB$INDEX_19;

SET STATISTICS INDEX RDB$INDEX_2;

SET STATISTICS INDEX RDB$INDEX_20;

SET STATISTICS INDEX RDB$INDEX_21;

SET STATISTICS INDEX RDB$INDEX_22;

SET STATISTICS INDEX RDB$INDEX_23;

SET STATISTICS INDEX RDB$INDEX_24;

SET STATISTICS INDEX RDB$INDEX_25;

SET STATISTICS INDEX RDB$INDEX_26;

SET STATISTICS INDEX RDB$INDEX_27;

SET STATISTICS INDEX RDB$INDEX_28;

SET STATISTICS INDEX RDB$INDEX_29;

SET STATISTICS INDEX RDB$INDEX_3;

SET STATISTICS INDEX RDB$INDEX_30;

SET STATISTICS INDEX RDB$INDEX_31;

SET STATISTICS INDEX RDB$INDEX_32;

SET STATISTICS INDEX RDB$INDEX_33;

SET STATISTICS INDEX RDB$INDEX_34;

SET STATISTICS INDEX RDB$INDEX_35;

SET STATISTICS INDEX RDB$INDEX_36;

SET STATISTICS INDEX RDB$INDEX_37;

SET STATISTICS INDEX RDB$INDEX_38;

SET STATISTICS INDEX RDB$INDEX_39;

SET STATISTICS INDEX RDB$INDEX_4;

SET STATISTICS INDEX RDB$INDEX_40;

SET STATISTICS INDEX RDB$INDEX_41;

SET STATISTICS INDEX RDB$INDEX_42;

SET STATISTICS INDEX RDB$INDEX_43;

SET STATISTICS INDEX RDB$INDEX_44;

SET STATISTICS INDEX RDB$INDEX_45;

SET STATISTICS INDEX RDB$INDEX_5;

SET STATISTICS INDEX RDB$INDEX_6;

SET STATISTICS INDEX RDB$INDEX_7;

SET STATISTICS INDEX RDB$INDEX_8;

SET STATISTICS INDEX RDB$INDEX_9;

SET STATISTICS INDEX RDB$PRIMARY1;

SET STATISTICS INDEX UNQ1_TBFUNCAO;

SET STATISTICS INDEX UNQ_PRODUTO_CODIGO;

SET STATISTICS INDEX UNQ_TBCLIENTE_CODIGO;

SET STATISTICS INDEX UNQ_TBEMPRESA_CODIGO;

SET STATISTICS INDEX UNQ_TBVENDAS_NFE;




/*------ SYSDBA 12/09/2013 11:31:53 --------*/

SET TERM ^ ;

ALTER PROCEDURE GET_CAIXA_ABERTO(
    USUARIO VARCHAR(12),
    DATA DATE,
    FORMA_PAGTO SMALLINT)
RETURNS (
    ANO_CAIXA SMALLINT,
    NUM_CAIXA INTEGER,
    CONTA_CORRENTE INTEGER)
AS
begin

  Select First 1
      c.Ano
    , c.Numero
    , c.Conta_corrente
  from TBCAIXA c
    Inner join TBCONTA_CORRENTE cc on (cc.Codigo = c.Conta_corrente)
  where c.Situacao = 0
    and c.Usuario = :Usuario
    and ( (c.Data_abertura = :Data) or (cc.Tipo = 2) )
    and c.Conta_corrente in (
      Select
        f.Conta_corrente
      from TBFORMPAGTO f
      where f.Cod = :Forma_pagto
    )
  into
      Ano_caixa
    , Num_caixa
    , Conta_corrente;

  Suspend;

end
^

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE GET_CAIXA_ABERTO_DETALHE(
    USUARIO_IN VARCHAR(12),
    DATA DATE,
    FORMA_PAGTO SMALLINT)
RETURNS (
    ANO SMALLINT,
    NUMERO INTEGER,
    USUARIO VARCHAR(12),
    DATA_ABERTURA DATE,
    CONTA_CORRENTE INTEGER,
    VALOR_TOTAL_CREDITO NUMERIC(15,2),
    VALOR_TOTAL_DEBITO NUMERIC(15,2))
AS
begin

  Select
      gc.Ano_caixa
    , gc.Num_caixa
    , gc.Conta_corrente
  from GET_CAIXA_ABERTO(:Usuario_in, :Data, :Forma_pagto) gc
  into
      Ano
    , Numero
    , Conta_corrente;

  Select
      c.Usuario
    , c.Data_abertura
    , sum( Case when upper(cm.Tipo) = 'C' then cm.Valor else 0 end ) as Valor_total_credito
    , sum( Case when upper(cm.Tipo) = 'D' then cm.Valor else 0 end ) as Valor_total_debito
  from TBCAIXA c
    inner join TBCAIXA_MOVIMENTO cm on (cm.Caixa_ano = c.Ano and cm.Caixa_num = c.Numero)
  where c.Ano    = :Ano
    and c.Numero = :Numero
  Group by
      c.Usuario
    , c.Data_abertura
  into
      Usuario
    , Data_abertura
    , Valor_total_credito
    , Valor_total_debito;

  Valor_total_credito = coalesce(:Valor_total_credito, 0);
  Valor_total_debito  = coalesce(:Valor_total_debito,  0);

  suspend;
end
^

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE GET_CONTA_CORRENTE_SALDO(
    CONTA_CORRENTE INTEGER,
    DATA_INICIAL DATE,
    DATA_FINAL DATE)
RETURNS (
    SALDO_ANTERIOR_DATA DATE,
    SALDO_ANTERIOR_VALOR NUMERIC(15,2),
    SALDO_INICIAL_DATA DATE,
    SALDO_INICIAL_VALOR NUMERIC(15,2),
    SALDO_FINAL_DATA DATE,
    SALDO_FINAL_VALOR NUMERIC(15,2))
AS
declare variable TMP_DATA date;
begin
  -- Buscar data anterior de saldo
  Select
    max(s.Data_saldo)
  from TBCONTA_CORRENTE_SALDO s
  where s.Codigo = :Conta_corrente
    and s.Data_saldo < :Data_inicial
  into
    Tmp_data;

  -- Buscar valor (SALDO ANTERIOR)
  Select
      s1.Data_saldo
    , s1.Valor_saldo
  from TBCONTA_CORRENTE_SALDO s1
  where s1.Codigo = :Conta_corrente
    and s1.Data_saldo = :Tmp_data
  into
      Saldo_anterior_data
    , Saldo_anterior_valor;

  -- Buscar valor (SALDO INICIAL)
  Select
      s2.Data_saldo
    , s2.Valor_saldo
  from TBCONTA_CORRENTE_SALDO s2
  where s2.Codigo = :Conta_corrente
    and s2.Data_saldo = :Data_inicial
  into
      Saldo_inicial_data
    , Saldo_inicial_valor;

  -- Buscar valor (SALDO FINAL)
  Select
      s3.Data_saldo
    , s3.Valor_saldo
  from TBCONTA_CORRENTE_SALDO s3
  where s3.Codigo = :Conta_corrente
    and s3.Data_saldo = :Data_final
  into
      Saldo_final_data
    , Saldo_final_valor;

  Saldo_anterior_data = coalesce(:Saldo_anterior_data, :Data_inicial - 1);
  Saldo_inicial_data  = coalesce(:Saldo_inicial_data,  :Data_inicial);
  Saldo_final_data    = coalesce(:Saldo_final_data,    :Data_final);

  Saldo_anterior_valor = coalesce(:Saldo_anterior_valor, 0);
  Saldo_inicial_valor  = coalesce(:Saldo_inicial_valor,  0);
  Saldo_final_valor    = coalesce(:Saldo_final_valor,    0);

  suspend;
end
^

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE GET_DIA_UTIL(
    DATA DATE,
    DIAS INTEGER)
RETURNS (
    DIA_UTIL DATE)
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

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE GET_FLUXO_CAIXA(
    IDCONTA INTEGER,
    DATA_INICIAL DATE,
    DATA_FINAL DATE)
RETURNS (
    DATA DATE,
    CONTA_CORRENTE INTEGER,
    CONTA_CORRENTE_DESC VARCHAR(50),
    FORMA_PAGTO INTEGER,
    FORMA_PAGTO_DESC VARCHAR(50),
    HISTORICO VARCHAR(250),
    TIPO VARCHAR(1),
    ENTRADA NUMERIC(18,2),
    SAIDA NUMERIC(18,2),
    SALDO NUMERIC(18,2),
    CAIXA_ANO INTEGER,
    CAIXA_NUM INTEGER)
AS
begin
  IDConta = coalesce(:IDConta, 0);
  Data_Inicial = Coalesce(:Data_Inicial, Current_date);
  Data_final   = Coalesce(:Data_Final,   Current_date);

  /* Buscar Conta Corrente */
  for
    Select
        c.Codigo
      , c.Descricao
    from TBCONTA_CORRENTE c
    where (c.Codigo = :IDConta)
       or (:IDConta = 0)
    into
        Conta_Corrente
      , Conta_Corrente_Desc
  do
  begin

    -- Buscar Saldo Anterior da Conta Corrente
    Select
        sc.SALDO_ANTERIOR_DATA
      , 0
      , 'SALDO'
      , 'SALDO ANTERIOR DA C/C ' || :Conta_corrente_desc
      , 'S'
      , sc.SALDO_ANTERIOR_VALOR
    from GET_CONTA_CORRENTE_SALDO(:Conta_corrente, :Data_inicial, :Data_final) sc
    into
        Data
      , Forma_Pagto
      , Forma_Pagto_Desc
      , Historico
      , Tipo
      , Saldo;

    Saldo = coalesce(Saldo, 0);

    Suspend;

      /* Buscar Movimento do Caixa por Conta Corrente e Periodo */
    for
      Select
          cast(m.Datahora as Date)
        , m.Forma_pagto
        , f.Descri
        , m.Historico
        , m.Tipo
        , Case when upper(m.Tipo) = 'C' then m.Valor else 0 end
        , Case when upper(m.Tipo) = 'D' then m.Valor else 0 end
        , m.Caixa_ano
        , m.Caixa_num
      from TBCAIXA_MOVIMENTO m
        left join TBFORMPAGTO f on (f.Cod = m.Forma_pagto)
      where m.Situacao = 1 -- Confirmado
        and m.Conta_corrente = :Conta_corrente
        and cast(m.Datahora as Date) between :Data_inicial and :Data_final
      into
          Data
        , Forma_Pagto
        , Forma_Pagto_Desc
        , Historico
        , Tipo
        , Entrada
        , Saida
        , Caixa_ano
        , Caixa_num
    do
    begin

      Saldo = coalesce(:Saldo, 0) + coalesce(:Entrada, 0) - coalesce(:Saida, 0);

      Suspend;

    end 

  end 
end
^

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE GET_LIMITE_DISPONIVEL_CLIENTE(
    CPF_CNPJ VARCHAR(18))
RETURNS (
    VALOR_LIMITE NUMERIC(15,2),
    VALOR_COMPRAS_ABERTAS NUMERIC(15,2),
    VALOR_LIMITE_DISPONIVEL NUMERIC(15,2))
AS
begin
  Select
      coalesce(c.Valor_limite_compra, 0)
    , sum( coalesce(r.Valorrec, 0) - coalesce(r.Valorrectot, 0) )
  from TBCLIENTE c
    left join TBCONTREC r on ( (r.Cnpj = c.Cnpj and r.Baixado = 0 and r.Parcela > 0) and ((r.Status is null) or (r.Situacao = 1)) )
    left join TBFORMPAGTO f on (f.Cod = r.Forma_pagto and f.Debitar_limite_cliente = 1)
  where c.Cnpj = :Cpf_cnpj
  Group by 1
  into
      Valor_limite
    , Valor_compras_abertas;

  Valor_limite            = coalesce(:Valor_limite, 0);
  Valor_limite_disponivel = 0;

  if ( coalesce(:Valor_compras_abertas, 0) <= 0 ) then
    Valor_compras_abertas = 0;

  if ( :Valor_limite > 0 ) then
    Valor_limite_disponivel = :Valor_limite - :Valor_compras_abertas;

  suspend;
end
^

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE GET_PRODUTO_ROTATIVIDADE(
    PRODUTO VARCHAR(10),
    DATA_INICIAL DATE,
    DATA_FINAL DATE)
RETURNS (
    COMPRA_QTDE NUMERIC(18,4),
    COMPRA_VALOR NUMERIC(18,4),
    VENDA_QTDE NUMERIC(18,4),
    VENDA_VALOR NUMERIC(18,4))
AS
begin
  /* Buscar compras */
  Select
      sum(c.qtde)
    , sum(c.qtde * c.customedio)
  from TBCOMPRAS cc
    inner join TBCOMPRASITENS c on (c.ano = cc.ano and c.codcontrol = cc.codcontrol)
  where cc.dtent between :data_inicial and :data_final
    and cc.status in (2, 4) -- Finalizada, NF-e
    and c.codprod = :produto
  Into
      compra_qtde
    , compra_valor;

  /* Buscar vendas */
  Select
      sum(v.qtde)
    , sum(v.qtde * v.pfinal)
  from TBVENDAS vv
    inner join TVENDASITENS v on (v.ano = vv.ano and v.codcontrol = vv.codcontrol)
  where cast(vv.dtvenda as date) between :data_inicial and :data_final
    and vv.status in (3, 4) -- Finalizada, NF-e
    and v.codprod = :produto
  Into
      venda_qtde
    , venda_valor;

  suspend;
end
^

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE SET_CAIXA_CONSOLIDAR(
    ANO_CAIXA SMALLINT,
    NUM_CAIXA INTEGER)
AS
declare variable FORMA_PAGTO smallint;
declare variable FORMA_PAGTO_DESC varchar(50);
declare variable TOTAL_CREDITO numeric(18,2);
declare variable TOTAL_DEBITO numeric(18,2);
declare variable SEQUENCIAL integer;
begin
  -- Limpar Tabela
  Delete from TBCAIXA_CONSOLIDACAO c
  where c.Ano    = :Ano_caixa
    and c.Numero = :Num_caixa
    and c.Forma_pagto is not null;

  for
    Select
        m.Forma_pagto
      , f.Descri
      , sum( case when upper(m.Tipo) = 'C' then coalesce(m.Valor, 0) else 0 end )
      , sum( case when upper(m.Tipo) = 'D' then coalesce(m.Valor, 0) else 0 end )
    from TBCAIXA_MOVIMENTO m
      inner join TBFORMPAGTO f on (f.Cod = m.Forma_pagto)
    where m.Caixa_ano = :Ano_caixa
      and m.Caixa_num = :Num_caixa
      and m.Situacao  = 1 -- Confirmado
    Group by
        m.Forma_pagto
      , f.Descri
    into
        Forma_pagto
      , Forma_pagto_desc
      , Total_credito
      , Total_debito
  do
  begin

    Select
      max(c.Seq)
    from TBCAIXA_CONSOLIDACAO c
    where c.Ano    = :Ano_caixa
      and c.Numero = :Num_caixa
    into
      Sequencial;

    Sequencial = coalesce(:Sequencial, 0) + 1;

    Insert Into TBCAIXA_CONSOLIDACAO (
        Ano
      , Numero
      , Seq
      , Forma_pagto
      , Descricao
      , Total_credito
      , Total_debito
    ) values (
        :Ano_caixa
      , :Num_caixa
      , :Sequencial
      , :Forma_pagto
      , :Forma_pagto_desc
      , coalesce(:Total_credito, 0)
      , coalesce(:Total_debito, 0)
    );

  end 
end
^

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE SET_CAIXA_MOVIMENTO_PAG(
    USUARIO VARCHAR(12),
    DATA_PAGTO TIMESTAMP,
    FORMA_PAGTO SMALLINT,
    ANOLANC SMALLINT,
    NUMLANC INTEGER,
    SEQ SMALLINT,
    VALOR_BAIXA NUMERIC(18,2))
AS
declare variable EMPRESA varchar(18);
declare variable FORNECEDOR integer;
declare variable ANO_CAIXA smallint;
declare variable NUM_CAIXA integer;
declare variable CCR_CAIXA integer;
declare variable HISTORICO varchar(250);
declare variable ANO_COMPRA smallint;
declare variable NUM_COMPRA integer;
begin
  -- Buscar Numero do Caixa Aberto
  Select
      cx.Ano_caixa
    , cx.Num_caixa
    , cx.Conta_corrente
  from GET_CAIXA_ABERTO(:Usuario, :Data_pagto, :Forma_pagto) cx
  into
      Ano_caixa
    , Num_caixa
    , Ccr_caixa;

  -- Montar Historico
  Select
      cc.Codemp
    , cc.Codforn
    , 'COMPRA No. ' || r.Anocompra || '/' || r.Numcompra || ' - ' || f.Nomeforn
    , r.Anocompra
    , r.Numcompra
  from TBCONTPAG r
    left join TBFORNECEDOR f on (f.Codforn = r.Codforn)
    left join TBCOMPRAS cc on (cc.Ano = r.Anocompra and cc.Codcontrol = r.Numcompra)
  where r.Anolanc = :Anolanc
    and r.Numlanc = :Numlanc
  into
      Empresa
    , Fornecedor
    , Historico
    , Ano_compra
    , Num_compra;

  Historico = coalesce(:Historico, 'PAGTO. DA DUPLICATA No. ' || :Anolanc || '/' || :Numlanc || ' P' || :Seq);

  -- Inserir Movimento Caixa
  Insert Into TBCAIXA_MOVIMENTO (
      Ano
    , Numero
    , Caixa_ano
    , Caixa_num
    , Conta_corrente
    , Forma_pagto
    , Datahora
    , Tipo
    , Historico
    , Valor
    , Situacao
    , Venda_ano
    , Venda_num
    , Cliente
    , Compra_ano
    , Compra_num
    , Empresa
    , Fornecedor
    , Usuario
    , Apagar_ano
    , Apagar_num
  ) values (
      Extract(Year from :Data_pagto)
    , Null
    , :Ano_caixa
    , :Num_caixa
    , :Ccr_caixa
    , :Forma_pagto
    , :Data_pagto
    , 'D'
    , :Historico
    , :Valor_baixa
    , 1
    , Null
    , Null
    , Null
    , :Ano_compra
    , :Num_compra
    , :Empresa
    , :Fornecedor
    , :Usuario
    , :Anolanc
    , :Numlanc
  );

end
^

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE SET_CAIXA_MOVIMENTO_PAG_ESTORNO(
    USUARIO VARCHAR(12),
    DATA_PAGTO TIMESTAMP,
    FORMA_PAGTO SMALLINT,
    ANOLANC SMALLINT,
    NUMLANC INTEGER,
    SEQ SMALLINT,
    VALOR_BAIXA NUMERIC(18,2))
AS
declare variable EMPRESA varchar(18);
declare variable FORNECEDOR integer;
declare variable ANO_CAIXA smallint;
declare variable NUM_CAIXA integer;
declare variable CCR_CAIXA integer;
declare variable HISTORICO varchar(250);
declare variable ANO_COMPRA smallint;
declare variable NUM_COMPRA integer;
begin
  -- Buscar Numero do Caixa Aberto
  Select
      cx.Ano_caixa
    , cx.Num_caixa
    , cx.Conta_corrente
  from GET_CAIXA_ABERTO(:Usuario, :Data_pagto, :Forma_pagto) cx
  into
      Ano_caixa
    , Num_caixa
    , Ccr_caixa;

  -- Montar Historico
  Select
      cc.Codemp
    , cc.Codforn
    , 'COMPRA No. ' || r.Anocompra || '/' || r.Numcompra || ' - ' || f.Nomeforn
    , r.Anocompra
    , r.Numcompra
  from TBCONTPAG r
    left join TBFORNECEDOR f on (f.Codforn = r.Codforn)
    left join TBCOMPRAS cc on (cc.Ano = r.Anocompra and cc.Codcontrol = r.Numcompra)
  where r.Anolanc = :Anolanc
    and r.Numlanc = :Numlanc
  into
      Empresa
    , Fornecedor
    , Historico
    , Ano_compra
    , Num_compra;

  Historico = coalesce(:Historico, 'ESTORNO DO PAGTO. DA DUPLICATA No. ' || :Anolanc || '/' || :Numlanc || ' P' || :Seq);

  -- Inserir Movimento Caixa
  Insert Into TBCAIXA_MOVIMENTO (
      Ano
    , Numero
    , Caixa_ano
    , Caixa_num
    , Conta_corrente
    , Forma_pagto
    , Datahora
    , Tipo
    , Historico
    , Valor
    , Situacao
    , Venda_ano
    , Venda_num
    , Cliente
    , Compra_ano
    , Compra_num
    , Empresa
    , Fornecedor
    , Usuario
    , Apagar_ano
    , Apagar_num
  ) values (
      Extract(Year from :Data_pagto)
    , Null
    , :Ano_caixa
    , :Num_caixa
    , :Ccr_caixa
    , :Forma_pagto
    , :Data_pagto
    , 'C'
    , :Historico
    , :Valor_baixa
    , 1
    , Null
    , Null
    , Null
    , :Ano_compra
    , :Num_compra
    , :Empresa
    , :Fornecedor
    , :Usuario
    , :Anolanc
    , :Numlanc
  );

end
^

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE SET_CAIXA_MOVIMENTO_REC(
    USUARIO VARCHAR(12),
    DATA_PAGTO TIMESTAMP,
    FORMA_PAGTO SMALLINT,
    ANOLANC SMALLINT,
    NUMLANC INTEGER,
    SEQ SMALLINT,
    VALOR_BAIXA NUMERIC(18,2))
AS
declare variable EMPRESA varchar(18);
declare variable CLIENTE varchar(18);
declare variable ANO_CAIXA smallint;
declare variable NUM_CAIXA integer;
declare variable CCR_CAIXA integer;
declare variable HISTORICO varchar(250);
declare variable ANO_VENDA smallint;
declare variable NUM_VENDA integer;
begin
  -- Buscar Numero do Caixa Aberto
  Select
      cx.Ano_caixa
    , cx.Num_caixa
    , cx.Conta_corrente
  from GET_CAIXA_ABERTO(:Usuario, :Data_pagto, :Forma_pagto) cx
  into
      Ano_caixa
    , Num_caixa
    , Ccr_caixa;

  -- Montar Historico
  Select
      v.Codemp
    , r.Cnpj
    , 'VENDA No. ' || r.Anovenda || '/' || r.Numvenda || ' - ' || c.Nome
    , r.Anovenda
    , r.Numvenda
  from TBCONTREC r
    left join TBCLIENTE c on (c.Cnpj = r.Cnpj)
    left join TBVENDAS v on (v.Ano = r.Anovenda and v.Codcontrol = r.Numvenda)
  where r.Anolanc = :Anolanc
    and r.Numlanc = :Numlanc
  into
      Empresa
    , Cliente
    , Historico
    , Ano_venda
    , Num_venda;

  Historico = coalesce(:Historico, 'RECEBIMENTO DO TITULO No. ' || :Anolanc || '/' || :Numlanc || ' P' || :Seq);

  -- Inserir Movimento Caixa
  Insert Into TBCAIXA_MOVIMENTO (
      Ano
    , Numero
    , Caixa_ano
    , Caixa_num
    , Conta_corrente
    , Forma_pagto
    , Datahora
    , Tipo
    , Historico
    , Valor
    , Situacao
    , Venda_ano
    , Venda_num
    , Cliente
    , Compra_ano
    , Compra_num
    , Empresa
    , Fornecedor
    , Usuario
    , Areceber_ano
    , Areceber_num
  ) values (
      Extract(Year from :Data_pagto)
    , Null
    , :Ano_caixa
    , :Num_caixa
    , :Ccr_caixa
    , :Forma_pagto
    , :Data_pagto
    , 'C'
    , :Historico
    , :Valor_baixa
    , 1
    , :Ano_venda
    , :Num_venda
    , :Cliente
    , Null
    , Null
    , :Empresa
    , Null
    , :Usuario
    , :Anolanc
    , :Numlanc
  );

end
^

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE SET_CAIXA_MOVIMENTO_REC_ESTORNO(
    USUARIO VARCHAR(12),
    DATA_PAGTO TIMESTAMP,
    FORMA_PAGTO SMALLINT,
    ANOLANC SMALLINT,
    NUMLANC INTEGER,
    SEQ SMALLINT,
    VALOR_BAIXA NUMERIC(18,2))
AS
declare variable EMPRESA varchar(18);
declare variable CLIENTE varchar(18);
declare variable ANO_CAIXA smallint;
declare variable NUM_CAIXA integer;
declare variable CCR_CAIXA integer;
declare variable HISTORICO varchar(250);
declare variable ANO_VENDA smallint;
declare variable NUM_VENDA integer;
begin
  -- Buscar Numero do Caixa Aberto
  Select
      cx.Ano_caixa
    , cx.Num_caixa
    , cx.Conta_corrente
  from GET_CAIXA_ABERTO(:Usuario, :Data_pagto, :Forma_pagto) cx
  into
      Ano_caixa
    , Num_caixa
    , Ccr_caixa;

  -- Montar Historico
  Select
      v.Codemp
    , r.Cnpj
    , 'VENDA No. ' || r.Anovenda || '/' || r.Numvenda || ' - ' || c.Nome
    , r.Anovenda
    , r.Numvenda
  from TBCONTREC r
    left join TBCLIENTE c on (c.Cnpj = r.Cnpj)
    left join TBVENDAS v on (v.Ano = r.Anovenda and v.Codcontrol = r.Numvenda)
  where r.Anolanc = :Anolanc
    and r.Numlanc = :Numlanc
  into
      Empresa
    , Cliente
    , Historico
    , Ano_venda
    , Num_venda;

  Historico = coalesce(:Historico, 'ESTORNO DO RECEBIMENTO DO TITULO No. ' || :Anolanc || '/' || :Numlanc || ' P' || :Seq);

  -- Inserir Movimento Caixa
  Insert Into TBCAIXA_MOVIMENTO (
      Ano
    , Numero
    , Caixa_ano
    , Caixa_num
    , Conta_corrente
    , Forma_pagto
    , Datahora
    , Tipo
    , Historico
    , Valor
    , Situacao
    , Venda_ano
    , Venda_num
    , Cliente
    , Compra_ano
    , Compra_num
    , Empresa
    , Fornecedor
    , Usuario
    , Areceber_ano
    , Areceber_num
  ) values (
      Extract(Year from :Data_pagto)
    , Null
    , :Ano_caixa
    , :Num_caixa
    , :Ccr_caixa
    , :Forma_pagto
    , :Data_pagto
    , 'D'
    , :Historico
    , :Valor_baixa
    , 1
    , :Ano_venda
    , :Num_venda
    , :Cliente
    , Null
    , Null
    , :Empresa
    , Null
    , :Usuario
    , :Anolanc
    , :Numlanc
  );

end
^

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE SET_CONTA_CORRENTE_SALDO(
    CONTA_CORRENTE INTEGER,
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

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE SET_CST_COFINS(
    CODIGO VARCHAR(3),
    DESCRICAO VARCHAR(250),
    INDICE_ACBR SMALLINT)
AS
begin
  if ( Trim(coalesce(:Codigo, '')) <> '' ) then
  begin
    Codigo      = Trim(:Codigo);
    Descricao   = Trim(:Descricao);
    Indice_acbr = coalesce(:Indice_acbr, 99);

    if (not Exists(
      Select
        p.Codigo
      from TBCST_COFINS p
      where p.Codigo = :Codigo
    )) then
    begin

      /* Inserir CST, caso nao exista */

      Insert Into TBCST_COFINS (
          Codigo
        , Descricao
        , Indice_acbr
      ) values (
          :Codigo
        , :Descricao
        , :Indice_acbr
      );

    end
    else
    begin

      /* Atualizar CST, caso exista */

      Update TBCST_COFINS Set
          Descricao   = :Descricao
        , Indice_acbr = :Indice_acbr
      where Codigo = :Codigo;

    end 

  end 
end
^

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE SET_CST_PIS(
    CODIGO VARCHAR(3),
    DESCRICAO VARCHAR(250),
    INDICE_ACBR SMALLINT)
AS
begin
  if ( Trim(coalesce(:Codigo, '')) <> '' ) then
  begin
    Codigo      = Trim(:Codigo);
    Descricao   = Trim(:Descricao);
    Indice_acbr = coalesce(:Indice_acbr, 99);

    if (not Exists(
      Select
        p.Codigo
      from TBCST_PIS p
      where p.Codigo = :Codigo
    )) then
    begin

      /* Inserir CST, caso nao exista */

      Insert Into TBCST_PIS (
          Codigo
        , Descricao
        , Indice_acbr
      ) values (
          :Codigo
        , :Descricao
        , :Indice_acbr
      );

    end
    else
    begin

      /* Atualizar CST, caso exista */

      Update TBCST_PIS Set
          Descricao   = :Descricao
        , Indice_acbr = :Indice_acbr
      where Codigo = :Codigo;

    end 

  end 
end
^

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE SET_DUPLICATA_PAGAR(
    ANOCOMPRA SMALLINT,
    NUMCOMPRA INTEGER,
    FORNECEDOR INTEGER,
    NF INTEGER,
    FORMA_PAGTO SMALLINT,
    CONDICAO_PAGTO SMALLINT,
    EMISSAO DATE,
    VENCIMENTO DATE,
    VALOR_DOCUMENTO NUMERIC(15,2),
    PARCELA SMALLINT)
RETURNS (
    ANOLANCAMENTO SMALLINT,
    NUMLANCAMENTO INTEGER)
AS
declare variable FORMA_PAGTO_DESC varchar(30);
begin
  if ( Exists(
    Select
      p.Numlanc
    from TBCONTPAG p
    where p.Anocompra = :Anocompra
      and p.Numcompra = :Numcompra
      and p.Parcela  = :Parcela
  ) ) then
    Exit;

  Select
    f.Descri
  from TBFORMPAGTO f
  where f.Cod = :Forma_pagto
  into
    Forma_pagto_desc;

  Anolancamento = :Anocompra;

  if ( :Anolancamento = 2011 ) then
    Numlancamento = gen_id(Gen_contapag_num_2011, 1);
  else
  if ( :Anolancamento = 2012 ) then
    Numlancamento = gen_id(Gen_contapag_num_2012, 1);
  else
  if ( :Anolancamento = 2013 ) then
    Numlancamento = gen_id(Gen_contapag_num_2013, 1);
  else
  if ( :Anolancamento = 2014 ) then
    Numlancamento = gen_id(Gen_contapag_num_2014, 1);
  else
  if ( :Anolancamento = 2015 ) then
    Numlancamento = gen_id(Gen_contapag_num_2015, 1);
  else
  if ( :Anolancamento = 2016 ) then
    Numlancamento = gen_id(Gen_contapag_num_2016, 1);
  else
  if ( :Anolancamento = 2017 ) then
    Numlancamento = gen_id(Gen_contapag_num_2017, 1);
  else
  if ( :Anolancamento = 2018 ) then
    Numlancamento = gen_id(Gen_contapag_num_2018, 1);
  else
  if ( :Anolancamento = 2019 ) then
    Numlancamento = gen_id(Gen_contapag_num_2019, 1);
  else
  if ( :Anolancamento = 2020 ) then
    Numlancamento = gen_id(Gen_contapag_num_2020, 1);

  Insert Into TBCONTPAG (
      Anolanc
    , Numlanc
    , Anocompra
    , Numcompra
    , Parcela
    , Codforn
    , Tippag
    , Forma_pagto
    , Condicao_pagto
    , Notfisc
    , Dtemiss
    , Dtvenc
    , Valorpag
    , Quitado
  ) values (
      :Anolancamento
    , :Numlancamento
    , :Anocompra
    , :Numcompra
    , :Parcela
    , :Fornecedor
    , :Forma_pagto_desc
    , :Forma_pagto
    , :Condicao_pagto
    , :Nf
    , :Emissao
    , :Vencimento
    , :Valor_documento
    , 0
  );

  suspend;
end
^

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE SET_GERAR_DUPLICATAS(
    ANOCOMPRA SMALLINT,
    NUMCOMPRA INTEGER)
RETURNS (
    FORNECEDOR INTEGER,
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

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE SET_GERAR_TITULOS(
    ANOVENDA SMALLINT,
    NUMVENDA INTEGER)
RETURNS (
    CLIENTE VARCHAR(18),
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

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE SET_PRODUTO_ROTATIVIDADE(
    DATA DATE,
    USUARIO VARCHAR(30),
    PRODUTO VARCHAR(10),
    EXCLUIR_ROT SMALLINT,
    TIPO_ROTATI SMALLINT,
    ULTIMA_COMPRA DATE,
    ULTIMA_VENDA DATE)
AS
declare variable TMP_DATA_INI date;
declare variable TMP_DATA_FIM date;
declare variable TMP_COMPRA_QTDE numeric(18,4);
declare variable TMP_COMPRA_VALOR numeric(18,4);
declare variable TMP_VENDA_QTDE numeric(18,4);
declare variable TMP_VENDA_VALOR numeric(18,4);
declare variable UM integer;
declare variable TRES integer;
declare variable SEIS integer;
declare variable NOVE integer;
declare variable DOZE integer;
declare variable NNNN integer;
begin
  um   = 30 * 1;
  tres = 30 * 3;
  seis = 30 * 6;
  nove = 30 * 9;
  doze = 30 * 12;
  nnnn = 30 * 36;

  excluir_rot = coalesce(:excluir_rot, 0);
  tipo_rotati = coalesce(:tipo_rotati, 0); /* 0. Compra | 1. Venda */

  -- Excluir processamento antigo
  if ( :excluir_rot = 1 ) then
    Delete from TBPRODUTO_ROTATIVIDADE x
    where x.cod_produto  = :produto;

  /************************************* MES 0-1 *************************************/

  tmp_data_fim = :data;
  tmp_data_ini = :tmp_data_fim - :um;

  Select
      r.compra_qtde
    , r.compra_valor
    , r.venda_qtde
    , r.venda_valor
  from GET_PRODUTO_ROTATIVIDADE(:produto, :tmp_data_ini, :tmp_data_fim) r
  Into
      tmp_compra_qtde
    , tmp_compra_valor
    , tmp_venda_qtde
    , tmp_venda_valor;

  if (not exists(
    Select
      x.cod_produto
    from TBPRODUTO_ROTATIVIDADE x
    where x.cod_produto = :produto
  )) then
  begin

    if ( :tipo_rotati = 0 ) then -- Compra
    begin

      Insert Into TBPRODUTO_ROTATIVIDADE (
          cod_produto
        , compra_qtde_01
        , compra_valor_01
        , processo_data
        , processo_hora
        , processo_usuario
      ) values (
          :produto
        , :tmp_compra_qtde
        , :tmp_compra_valor
        , current_date
        , current_time
        , :usuario
      );

    end
    else
    if ( :tipo_rotati = 1 ) then -- Venda
    begin

      Insert Into TBPRODUTO_ROTATIVIDADE (
          cod_produto
        , venda_qtde_01
        , venda_valor_01
        , processo_data
        , processo_hora
        , processo_usuario
      ) values (
          :produto
        , :tmp_venda_qtde
        , :tmp_venda_valor
        , current_date
        , current_time
        , :usuario
      );

    end

  end 
  else
  begin

    if ( :tipo_rotati = 0 ) then -- Compra
    begin

      Update TBPRODUTO_ROTATIVIDADE rp Set
          rp.compra_qtde_01  = :tmp_compra_qtde
        , rp.compra_valor_01 = :tmp_compra_valor
      where rp.cod_produto = :produto;

    end
    else
    if ( :tipo_rotati = 1 ) then -- Venda
    begin

      Update TBPRODUTO_ROTATIVIDADE rp Set
          rp.venda_qtde_01   = :tmp_venda_qtde
        , rp.venda_valor_01  = :tmp_venda_valor
      where rp.cod_produto = :produto;

    end

  end 

  /************************************* MES 1-3 *************************************/

  tmp_data_fim = :tmp_data_ini - 1;
  tmp_data_ini = :tmp_data_fim - :tres;

  Select
      r.compra_qtde
    , r.compra_valor
    , r.venda_qtde
    , r.venda_valor
  from GET_PRODUTO_ROTATIVIDADE(:produto, :tmp_data_ini, :tmp_data_fim) r
  Into
      tmp_compra_qtde
    , tmp_compra_valor
    , tmp_venda_qtde
    , tmp_venda_valor;

  if (not exists(
    Select
      x.cod_produto
    from TBPRODUTO_ROTATIVIDADE x
    where x.cod_produto = :produto
  )) then
  begin

    if ( :tipo_rotati = 0 ) then -- Compra
    begin

      Insert Into TBPRODUTO_ROTATIVIDADE (
          cod_produto
        , compra_qtde_03
        , compra_valor_03
        , processo_data
        , processo_hora
        , processo_usuario
      ) values (
          :produto
        , :tmp_compra_qtde
        , :tmp_compra_valor
        , current_date
        , current_time
        , :usuario
      );

    end
    else
    if ( :tipo_rotati = 1 ) then -- Venda
    begin

      Insert Into TBPRODUTO_ROTATIVIDADE (
          cod_produto
        , venda_qtde_03
        , venda_valor_03
        , processo_data
        , processo_hora
        , processo_usuario
      ) values (
          :produto
        , :tmp_venda_qtde
        , :tmp_venda_valor
        , current_date
        , current_time
        , :usuario
      );

    end

  end 
  else
  begin

    if ( :tipo_rotati = 0 ) then -- Compra
    begin

      Update TBPRODUTO_ROTATIVIDADE rp Set
          rp.compra_qtde_03  = :tmp_compra_qtde
        , rp.compra_valor_03 = :tmp_compra_valor
      where rp.cod_produto = :produto;

    end
    else
    if ( :tipo_rotati = 1 ) then -- Venda
    begin

      Update TBPRODUTO_ROTATIVIDADE rp Set
          rp.venda_qtde_03   = :tmp_venda_qtde
        , rp.venda_valor_03  = :tmp_venda_valor
      where rp.cod_produto = :produto;

    end

  end 

  /************************************* MES 3-6 *************************************/

  tmp_data_fim = :tmp_data_ini - 1;
  tmp_data_ini = :tmp_data_fim - :seis;

  Select
      r.compra_qtde
    , r.compra_valor
    , r.venda_qtde
    , r.venda_valor
  from GET_PRODUTO_ROTATIVIDADE(:produto, :tmp_data_ini, :tmp_data_fim) r
  Into
      tmp_compra_qtde
    , tmp_compra_valor
    , tmp_venda_qtde
    , tmp_venda_valor;

  if (not exists(
    Select
      x.cod_produto
    from TBPRODUTO_ROTATIVIDADE x
    where x.cod_produto = :produto
  )) then
  begin

    if ( :tipo_rotati = 0 ) then -- Compra
    begin

      Insert Into TBPRODUTO_ROTATIVIDADE (
          cod_produto
        , compra_qtde_06
        , compra_valor_06
        , processo_data
        , processo_hora
        , processo_usuario
      ) values (
          :produto
        , :tmp_compra_qtde
        , :tmp_compra_valor
        , current_date
        , current_time
        , :usuario
      );

    end
    else
    if ( :tipo_rotati = 1 ) then -- Venda
    begin

      Insert Into TBPRODUTO_ROTATIVIDADE (
          cod_produto
        , venda_qtde_06
        , venda_valor_06
        , processo_data
        , processo_hora
        , processo_usuario
      ) values (
          :produto
        , :tmp_venda_qtde
        , :tmp_venda_valor
        , current_date
        , current_time
        , :usuario
      );

    end

  end 
  else
  begin

    if ( :tipo_rotati = 0 ) then -- Compra
    begin

      Update TBPRODUTO_ROTATIVIDADE rp Set
          rp.compra_qtde_06  = :tmp_compra_qtde
        , rp.compra_valor_06 = :tmp_compra_valor
      where rp.cod_produto = :produto;

    end
    else
    if ( :tipo_rotati = 1 ) then -- Venda
    begin

      Update TBPRODUTO_ROTATIVIDADE rp Set
          rp.venda_qtde_06   = :tmp_venda_qtde
        , rp.venda_valor_06  = :tmp_venda_valor
      where rp.cod_produto = :produto;

    end

  end 

  /************************************* MES 6-9 *************************************/

  tmp_data_fim = :tmp_data_ini - 1;
  tmp_data_ini = :tmp_data_fim - :nove;

  Select
      r.compra_qtde
    , r.compra_valor
    , r.venda_qtde
    , r.venda_valor
  from GET_PRODUTO_ROTATIVIDADE(:produto, :tmp_data_ini, :tmp_data_fim) r
  Into
      tmp_compra_qtde
    , tmp_compra_valor
    , tmp_venda_qtde
    , tmp_venda_valor;

  if (not exists(
    Select
      x.cod_produto
    from TBPRODUTO_ROTATIVIDADE x
    where x.cod_produto = :produto
  )) then
  begin

    if ( :tipo_rotati = 0 ) then -- Compra
    begin

      Insert Into TBPRODUTO_ROTATIVIDADE (
          cod_produto
        , compra_qtde_09
        , compra_valor_09
        , processo_data
        , processo_hora
        , processo_usuario
      ) values (
          :produto
        , :tmp_compra_qtde
        , :tmp_compra_valor
        , current_date
        , current_time
        , :usuario
      );

    end
    else
    if ( :tipo_rotati = 1 ) then -- Venda
    begin

      Insert Into TBPRODUTO_ROTATIVIDADE (
          cod_produto
        , venda_qtde_09
        , venda_valor_09
        , processo_data
        , processo_hora
        , processo_usuario
      ) values (
          :produto
        , :tmp_venda_qtde
        , :tmp_venda_valor
        , current_date
        , current_time
        , :usuario
      );

    end

  end 
  else
  begin

    if ( :tipo_rotati = 0 ) then -- Compra
    begin

      Update TBPRODUTO_ROTATIVIDADE rp Set
          rp.compra_qtde_09  = :tmp_compra_qtde
        , rp.compra_valor_09 = :tmp_compra_valor
      where rp.cod_produto = :produto;

    end
    else
    if ( :tipo_rotati = 1 ) then -- Venda
    begin

      Update TBPRODUTO_ROTATIVIDADE rp Set
          rp.venda_qtde_09   = :tmp_venda_qtde
        , rp.venda_valor_09  = :tmp_venda_valor
      where rp.cod_produto = :produto;

    end

  end 

  /************************************* MES 9-12 *************************************/

  tmp_data_fim = :tmp_data_ini - 1;
  tmp_data_ini = :tmp_data_fim - :doze;

  Select
      r.compra_qtde
    , r.compra_valor
    , r.venda_qtde
    , r.venda_valor
  from GET_PRODUTO_ROTATIVIDADE(:produto, :tmp_data_ini, :tmp_data_fim) r
  Into
      tmp_compra_qtde
    , tmp_compra_valor
    , tmp_venda_qtde
    , tmp_venda_valor;

  if (not exists(
    Select
      x.cod_produto
    from TBPRODUTO_ROTATIVIDADE x
    where x.cod_produto = :produto
  )) then
  begin

    if ( :tipo_rotati = 0 ) then -- Compra
    begin

      Insert Into TBPRODUTO_ROTATIVIDADE (
          cod_produto
        , compra_qtde_12
        , compra_valor_12
        , processo_data
        , processo_hora
        , processo_usuario
      ) values (
          :produto
        , :tmp_compra_qtde
        , :tmp_compra_valor
        , current_date
        , current_time
        , :usuario
      );

    end
    else
    if ( :tipo_rotati = 1 ) then -- Venda
    begin

      Insert Into TBPRODUTO_ROTATIVIDADE (
          cod_produto
        , venda_qtde_12
        , venda_valor_12
        , processo_data
        , processo_hora
        , processo_usuario
      ) values (
          :produto
        , :tmp_venda_qtde
        , :tmp_venda_valor
        , current_date
        , current_time
        , :usuario
      );

    end

  end 
  else
  begin

    if ( :tipo_rotati = 0 ) then -- Compra
    begin

      Update TBPRODUTO_ROTATIVIDADE rp Set
          rp.compra_qtde_12  = :tmp_compra_qtde
        , rp.compra_valor_12 = :tmp_compra_valor
      where rp.cod_produto = :produto;

    end
    else
    if ( :tipo_rotati = 1 ) then -- Venda
    begin

      Update TBPRODUTO_ROTATIVIDADE rp Set
          rp.venda_qtde_12   = :tmp_venda_qtde
        , rp.venda_valor_12  = :tmp_venda_valor
      where rp.cod_produto = :produto;

    end

  end 

  /************************************* MES 12-nn *************************************/

  tmp_data_fim = :tmp_data_ini - 1;
  tmp_data_ini = :tmp_data_fim - :nnnn;

  Select
      r.compra_qtde
    , r.compra_valor
    , r.venda_qtde
    , r.venda_valor
  from GET_PRODUTO_ROTATIVIDADE(:produto, :tmp_data_ini, :tmp_data_fim) r
  Into
      tmp_compra_qtde
    , tmp_compra_valor
    , tmp_venda_qtde
    , tmp_venda_valor;

  if (not exists(
    Select
      x.cod_produto
    from TBPRODUTO_ROTATIVIDADE x
    where x.cod_produto = :produto
  )) then
  begin

    if ( :tipo_rotati = 0 ) then -- Compra
    begin

      Insert Into TBPRODUTO_ROTATIVIDADE (
          cod_produto
        , compra_qtde_99
        , compra_valor_99
        , processo_data
        , processo_hora
        , processo_usuario
      ) values (
          :produto
        , :tmp_compra_qtde
        , :tmp_compra_valor
        , current_date
        , current_time
        , :usuario
      );

    end
    else
    if ( :tipo_rotati = 1 ) then -- Venda
    begin

      Insert Into TBPRODUTO_ROTATIVIDADE (
          cod_produto
        , venda_qtde_99
        , venda_valor_99
        , processo_data
        , processo_hora
        , processo_usuario
      ) values (
          :produto
        , :tmp_venda_qtde
        , :tmp_venda_valor
        , current_date
        , current_time
        , :usuario
      );

    end

  end 
  else
  begin

    if ( :tipo_rotati = 0 ) then -- Compra
    begin

      Update TBPRODUTO_ROTATIVIDADE rp Set
          rp.compra_qtde_99  = :tmp_compra_qtde
        , rp.compra_valor_99 = :tmp_compra_valor
      where rp.cod_produto = :produto;

    end
    else
    if ( :tipo_rotati = 1 ) then -- Venda
    begin

      Update TBPRODUTO_ROTATIVIDADE rp Set
          rp.venda_qtde_99   = :tmp_venda_qtde
        , rp.venda_valor_99  = :tmp_venda_valor
      where rp.cod_produto = :produto;

    end

  end 

  -- Atualizar das Datas de Compra e Venda
  Update TBPRODUTO_ROTATIVIDADE rp Set
      rp.data_ultima_compra = :ultima_compra
    , rp.data_ultima_venda = :ultima_venda
  where rp.cod_produto = :produto;

end
^

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE SET_SEGMENTO(
    SEG_ID SMALLINT,
    SEG_DESCRICAO VARCHAR(60))
AS
begin
  if ( (:Seg_id is null) or (:Seg_descricao is null)  ) then
    Exit;

  if ( exists(
    Select
      s.Seg_id
    from TBSEGMENTO s
    where s.Seg_id = :Seg_id
  ) ) then
    Update TBSEGMENTO u Set
      u.Seg_descricao = :Seg_descricao
    where u.Seg_id = :Seg_id;
  else
    Insert Into TBSEGMENTO (
        Seg_id
      , Seg_descricao
    ) values (
        :Seg_id
      , :Seg_descricao
    );
end
^

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE SET_TITULO_RECEBER(
    ANOVENDA SMALLINT,
    NUMVENDA INTEGER,
    CLIENTE VARCHAR(18),
    FORMA_PAGTO SMALLINT,
    EMISSAO DATE,
    VENCIMENTO DATE,
    VALOR_DOCUMENTO NUMERIC(15,2),
    PARCELA SMALLINT)
RETURNS (
    ANOLANCAMENTO SMALLINT,
    NUMLANCAMENTO INTEGER)
AS
declare variable FORMA_PAGTO_DESC varchar(30);
begin
  if ( Exists(
    Select
      r.Numlanc
    from TBCONTREC r
    where r.Anovenda = :Anovenda
      and r.Numvenda = :Numvenda
      and r.Parcela  = :Parcela
  ) ) then
    Exit;

  Select
    f.Descri
  from TBFORMPAGTO f
  where f.Cod = :Forma_pagto
  into
    Forma_pagto_desc;

  Anolancamento = :Anovenda;

  if ( :Anolancamento = 2011 ) then
    Numlancamento = gen_id(Gen_contarec_num_2011, 1);
  else
  if ( :Anolancamento = 2012 ) then
    Numlancamento = gen_id(Gen_contarec_num_2012, 1);
  else
  if ( :Anolancamento = 2013 ) then
    Numlancamento = gen_id(Gen_contarec_num_2013, 1);
  else
  if ( :Anolancamento = 2014 ) then
    Numlancamento = gen_id(Gen_contarec_num_2014, 1);
  else
  if ( :Anolancamento = 2015 ) then
    Numlancamento = gen_id(Gen_contarec_num_2015, 1);
  else
  if ( :Anolancamento = 2016 ) then
    Numlancamento = gen_id(Gen_contarec_num_2016, 1);
  else
  if ( :Anolancamento = 2017 ) then
    Numlancamento = gen_id(Gen_contarec_num_2017, 1);
  else
  if ( :Anolancamento = 2018 ) then
    Numlancamento = gen_id(Gen_contarec_num_2018, 1);
  else
  if ( :Anolancamento = 2019 ) then
    Numlancamento = gen_id(Gen_contarec_num_2019, 1);
  else
  if ( :Anolancamento = 2020 ) then
    Numlancamento = gen_id(Gen_contarec_num_2020, 1);

  Insert Into TBCONTREC (
      Anolanc
    , numlanc
    , Anovenda
    , Numvenda
    , Cnpj
    , Tippag
    , Forma_pagto
    , Dtemiss
    , Dtvenc
    , Valorrec
    , Parcela
    , Percentjuros
    , Percentmulta
    , Percentdesconto
    , Baixado
    , Enviado
    , Situacao
  ) values (
      :Anolancamento
    , :Numlancamento
    , :Anovenda
    , :Numvenda
    , :Cliente
    , :Forma_pagto_desc
    , :Forma_pagto
    , :Emissao
    , :Vencimento
    , :Valor_documento
    , :Parcela
    , 0
    , 0
    , 0
    , 0
    , 0
    , 1
  );

  suspend;
end
^

SET TERM ; ^




/*------ SYSDBA 12/09/2013 11:32:00 --------*/

SET TERM ^ ;

ALTER TRIGGER IBE$TBCLIENTE_AD
as
declare variable tid integer;
begin
  tid = gen_id(ibe$log_tables_gen,1);

  insert into ibe$log_tables (id, table_name, operation, date_time, user_name)
         values (:tid, 'TBCLIENTE', 'D', 'NOW', user);

  insert into ibe$log_keys (log_tables_id, key_field, key_value)
         values (:tid, 'CNPJ', old.cnpj);

  insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
         values (:tid, 'CODIGO', old.codigo, null);

  insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
         values (:tid, 'PESSOA_FISICA', old.pessoa_fisica, null);

  insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
         values (:tid, 'CNPJ', old.cnpj, null);

  insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
         values (:tid, 'NOME', old.nome, null);

  insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
         values (:tid, 'INSCEST', old.inscest, null);

  insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
         values (:tid, 'INSCMUN', old.inscmun, null);

  insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
         values (:tid, 'ENDER', old.ender, null);

  insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
         values (:tid, 'COMPLEMENTO', old.complemento, null);

  insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
         values (:tid, 'BAIRRO', old.bairro, null);

  insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
         values (:tid, 'CEP', old.cep, null);

  insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
         values (:tid, 'CIDADE', old.cidade, null);

  insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
         values (:tid, 'UF', old.uf, null);

  insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
         values (:tid, 'FONE', old.fone, null);

  insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
         values (:tid, 'FONECEL', old.fonecel, null);

  insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
         values (:tid, 'FONECOMERC', old.fonecomerc, null);

  insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
         values (:tid, 'EMAIL', old.email, null);

  insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
         values (:tid, 'SITE', old.site, null);

  insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
         values (:tid, 'NUMERO_END', old.numero_end, null);

  insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
         values (:tid, 'PAIS_ID', old.pais_id, null);

  insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
         values (:tid, 'VALOR_LIMITE_COMPRA', old.valor_limite_compra, null);

  insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
         values (:tid, 'BLOQUEADO', old.bloqueado, null);

  insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
         values (:tid, 'BLOQUEADO_DATA', old.bloqueado_data, null);

  insert into ibe$log_blob_fields (log_tables_id, field_name, old_blob_value, new_blob_value)
         values (:tid, 'BLOQUEADO_MOTIVO', old.bloqueado_motivo, null);

  insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
         values (:tid, 'BLOQUEADO_USUARIO', old.bloqueado_usuario, null);

  insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
         values (:tid, 'DESBLOQUEADO_DATA', old.desbloqueado_data, null);

  insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
         values (:tid, 'DTCAD', old.dtcad, null);

  insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
         values (:tid, 'VENDEDOR_COD', old.vendedor_cod, null);

  insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
         values (:tid, 'USUARIO', old.usuario, null);


end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER IBE$TBCLIENTE_AI
as
declare variable tid integer;
begin
  tid = gen_id(ibe$log_tables_gen,1);

  insert into ibe$log_tables (id, table_name, operation, date_time, user_name)
         values (:tid, 'TBCLIENTE', 'I', 'NOW', user);

  insert into ibe$log_keys (log_tables_id, key_field, key_value)
         values (:tid, 'CNPJ', new.cnpj);

  if (new.codigo is not null) then
    insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
           values (:tid, 'CODIGO', null, new.codigo);

  if (new.pessoa_fisica is not null) then
    insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
           values (:tid, 'PESSOA_FISICA', null, new.pessoa_fisica);

  if (new.cnpj is not null) then
    insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
           values (:tid, 'CNPJ', null, new.cnpj);

  if (new.nome is not null) then
    insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
           values (:tid, 'NOME', null, new.nome);

  if (new.inscest is not null) then
    insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
           values (:tid, 'INSCEST', null, new.inscest);

  if (new.inscmun is not null) then
    insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
           values (:tid, 'INSCMUN', null, new.inscmun);

  if (new.ender is not null) then
    insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
           values (:tid, 'ENDER', null, new.ender);

  if (new.complemento is not null) then
    insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
           values (:tid, 'COMPLEMENTO', null, new.complemento);

  if (new.bairro is not null) then
    insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
           values (:tid, 'BAIRRO', null, new.bairro);

  if (new.cep is not null) then
    insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
           values (:tid, 'CEP', null, new.cep);

  if (new.cidade is not null) then
    insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
           values (:tid, 'CIDADE', null, new.cidade);

  if (new.uf is not null) then
    insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
           values (:tid, 'UF', null, new.uf);

  if (new.fone is not null) then
    insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
           values (:tid, 'FONE', null, new.fone);

  if (new.fonecel is not null) then
    insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
           values (:tid, 'FONECEL', null, new.fonecel);

  if (new.fonecomerc is not null) then
    insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
           values (:tid, 'FONECOMERC', null, new.fonecomerc);

  if (new.email is not null) then
    insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
           values (:tid, 'EMAIL', null, new.email);

  if (new.site is not null) then
    insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
           values (:tid, 'SITE', null, new.site);

  if (new.numero_end is not null) then
    insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
           values (:tid, 'NUMERO_END', null, new.numero_end);

  if (new.pais_id is not null) then
    insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
           values (:tid, 'PAIS_ID', null, new.pais_id);

  if (new.valor_limite_compra is not null) then
    insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
           values (:tid, 'VALOR_LIMITE_COMPRA', null, new.valor_limite_compra);

  if (new.bloqueado is not null) then
    insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
           values (:tid, 'BLOQUEADO', null, new.bloqueado);

  if (new.bloqueado_data is not null) then
    insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
           values (:tid, 'BLOQUEADO_DATA', null, new.bloqueado_data);

  if (not (new.bloqueado_motivo is null)) then
    insert into ibe$log_blob_fields (log_tables_id, field_name, old_blob_value, new_blob_value)
           values (:tid,'BLOQUEADO_MOTIVO',null, new.bloqueado_motivo);

  if (new.bloqueado_usuario is not null) then
    insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
           values (:tid, 'BLOQUEADO_USUARIO', null, new.bloqueado_usuario);

  if (new.desbloqueado_data is not null) then
    insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
           values (:tid, 'DESBLOQUEADO_DATA', null, new.desbloqueado_data);

  if (new.dtcad is not null) then
    insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
           values (:tid, 'DTCAD', null, new.dtcad);

  if (new.vendedor_cod is not null) then
    insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
           values (:tid, 'VENDEDOR_COD', null, new.vendedor_cod);

  if (new.usuario is not null) then
    insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
           values (:tid, 'USUARIO', null, new.usuario);


end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER IBE$TBCLIENTE_AU
as
declare variable tid integer;
begin
  tid = gen_id(ibe$log_tables_gen,1);

  insert into ibe$log_tables (id, table_name, operation, date_time, user_name)
         values (:tid, 'TBCLIENTE', 'U', 'NOW', user);

  insert into ibe$log_keys (log_tables_id, key_field, key_value)
         values (:tid, 'CNPJ', old.cnpj);

  if ((old.codigo is null and new.codigo is not null) or
      (new.codigo is null and old.codigo is not null) or
      (new.codigo is not null and old.codigo is not null and new.codigo <> old.codigo)) then
     insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
            values (:tid, 'CODIGO', old.codigo, new.codigo);

  if ((old.pessoa_fisica is null and new.pessoa_fisica is not null) or
      (new.pessoa_fisica is null and old.pessoa_fisica is not null) or
      (new.pessoa_fisica is not null and old.pessoa_fisica is not null and new.pessoa_fisica <> old.pessoa_fisica)) then
     insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
            values (:tid, 'PESSOA_FISICA', old.pessoa_fisica, new.pessoa_fisica);

  if ((old.nome is null and new.nome is not null) or
      (new.nome is null and old.nome is not null) or
      (new.nome is not null and old.nome is not null and new.nome <> old.nome)) then
     insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
            values (:tid, 'NOME', old.nome, new.nome);

  if ((old.inscest is null and new.inscest is not null) or
      (new.inscest is null and old.inscest is not null) or
      (new.inscest is not null and old.inscest is not null and new.inscest <> old.inscest)) then
     insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
            values (:tid, 'INSCEST', old.inscest, new.inscest);

  if ((old.inscmun is null and new.inscmun is not null) or
      (new.inscmun is null and old.inscmun is not null) or
      (new.inscmun is not null and old.inscmun is not null and new.inscmun <> old.inscmun)) then
     insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
            values (:tid, 'INSCMUN', old.inscmun, new.inscmun);

  if ((old.ender is null and new.ender is not null) or
      (new.ender is null and old.ender is not null) or
      (new.ender is not null and old.ender is not null and new.ender <> old.ender)) then
     insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
            values (:tid, 'ENDER', old.ender, new.ender);

  if ((old.complemento is null and new.complemento is not null) or
      (new.complemento is null and old.complemento is not null) or
      (new.complemento is not null and old.complemento is not null and new.complemento <> old.complemento)) then
     insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
            values (:tid, 'COMPLEMENTO', old.complemento, new.complemento);

  if ((old.bairro is null and new.bairro is not null) or
      (new.bairro is null and old.bairro is not null) or
      (new.bairro is not null and old.bairro is not null and new.bairro <> old.bairro)) then
     insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
            values (:tid, 'BAIRRO', old.bairro, new.bairro);

  if ((old.cep is null and new.cep is not null) or
      (new.cep is null and old.cep is not null) or
      (new.cep is not null and old.cep is not null and new.cep <> old.cep)) then
     insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
            values (:tid, 'CEP', old.cep, new.cep);

  if ((old.cidade is null and new.cidade is not null) or
      (new.cidade is null and old.cidade is not null) or
      (new.cidade is not null and old.cidade is not null and new.cidade <> old.cidade)) then
     insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
            values (:tid, 'CIDADE', old.cidade, new.cidade);

  if ((old.uf is null and new.uf is not null) or
      (new.uf is null and old.uf is not null) or
      (new.uf is not null and old.uf is not null and new.uf <> old.uf)) then
     insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
            values (:tid, 'UF', old.uf, new.uf);

  if ((old.fone is null and new.fone is not null) or
      (new.fone is null and old.fone is not null) or
      (new.fone is not null and old.fone is not null and new.fone <> old.fone)) then
     insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
            values (:tid, 'FONE', old.fone, new.fone);

  if ((old.fonecel is null and new.fonecel is not null) or
      (new.fonecel is null and old.fonecel is not null) or
      (new.fonecel is not null and old.fonecel is not null and new.fonecel <> old.fonecel)) then
     insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
            values (:tid, 'FONECEL', old.fonecel, new.fonecel);

  if ((old.fonecomerc is null and new.fonecomerc is not null) or
      (new.fonecomerc is null and old.fonecomerc is not null) or
      (new.fonecomerc is not null and old.fonecomerc is not null and new.fonecomerc <> old.fonecomerc)) then
     insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
            values (:tid, 'FONECOMERC', old.fonecomerc, new.fonecomerc);

  if ((old.email is null and new.email is not null) or
      (new.email is null and old.email is not null) or
      (new.email is not null and old.email is not null and new.email <> old.email)) then
     insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
            values (:tid, 'EMAIL', old.email, new.email);

  if ((old.site is null and new.site is not null) or
      (new.site is null and old.site is not null) or
      (new.site is not null and old.site is not null and new.site <> old.site)) then
     insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
            values (:tid, 'SITE', old.site, new.site);

  if ((old.numero_end is null and new.numero_end is not null) or
      (new.numero_end is null and old.numero_end is not null) or
      (new.numero_end is not null and old.numero_end is not null and new.numero_end <> old.numero_end)) then
     insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
            values (:tid, 'NUMERO_END', old.numero_end, new.numero_end);

  if ((old.pais_id is null and new.pais_id is not null) or
      (new.pais_id is null and old.pais_id is not null) or
      (new.pais_id is not null and old.pais_id is not null and new.pais_id <> old.pais_id)) then
     insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
            values (:tid, 'PAIS_ID', old.pais_id, new.pais_id);

  if ((old.valor_limite_compra is null and new.valor_limite_compra is not null) or
      (new.valor_limite_compra is null and old.valor_limite_compra is not null) or
      (new.valor_limite_compra is not null and old.valor_limite_compra is not null and new.valor_limite_compra <> old.valor_limite_compra)) then
     insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
            values (:tid, 'VALOR_LIMITE_COMPRA', old.valor_limite_compra, new.valor_limite_compra);

  if ((old.bloqueado is null and new.bloqueado is not null) or
      (new.bloqueado is null and old.bloqueado is not null) or
      (new.bloqueado is not null and old.bloqueado is not null and new.bloqueado <> old.bloqueado)) then
     insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
            values (:tid, 'BLOQUEADO', old.bloqueado, new.bloqueado);

  if ((old.bloqueado_data is null and new.bloqueado_data is not null) or
      (new.bloqueado_data is null and old.bloqueado_data is not null) or
      (new.bloqueado_data is not null and old.bloqueado_data is not null and new.bloqueado_data <> old.bloqueado_data)) then
     insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
            values (:tid, 'BLOQUEADO_DATA', old.bloqueado_data, new.bloqueado_data);

  if ((old.bloqueado_motivo is null and new.bloqueado_motivo is not null) or
      (new.bloqueado_motivo is null and old.bloqueado_motivo is not null) or
      (new.bloqueado_motivo is not null and old.bloqueado_motivo is not null and new.bloqueado_motivo <> old.bloqueado_motivo)) then
     insert into ibe$log_blob_fields (log_tables_id, field_name, old_blob_value, new_blob_value)
            values (:tid, 'BLOQUEADO_MOTIVO', old.bloqueado_motivo, new.bloqueado_motivo);

  if ((old.bloqueado_usuario is null and new.bloqueado_usuario is not null) or
      (new.bloqueado_usuario is null and old.bloqueado_usuario is not null) or
      (new.bloqueado_usuario is not null and old.bloqueado_usuario is not null and new.bloqueado_usuario <> old.bloqueado_usuario)) then
     insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
            values (:tid, 'BLOQUEADO_USUARIO', old.bloqueado_usuario, new.bloqueado_usuario);

  if ((old.desbloqueado_data is null and new.desbloqueado_data is not null) or
      (new.desbloqueado_data is null and old.desbloqueado_data is not null) or
      (new.desbloqueado_data is not null and old.desbloqueado_data is not null and new.desbloqueado_data <> old.desbloqueado_data)) then
     insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
            values (:tid, 'DESBLOQUEADO_DATA', old.desbloqueado_data, new.desbloqueado_data);

  if ((old.dtcad is null and new.dtcad is not null) or
      (new.dtcad is null and old.dtcad is not null) or
      (new.dtcad is not null and old.dtcad is not null and new.dtcad <> old.dtcad)) then
     insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
            values (:tid, 'DTCAD', old.dtcad, new.dtcad);

  if ((old.vendedor_cod is null and new.vendedor_cod is not null) or
      (new.vendedor_cod is null and old.vendedor_cod is not null) or
      (new.vendedor_cod is not null and old.vendedor_cod is not null and new.vendedor_cod <> old.vendedor_cod)) then
     insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
            values (:tid, 'VENDEDOR_COD', old.vendedor_cod, new.vendedor_cod);

  if ((old.usuario is null and new.usuario is not null) or
      (new.usuario is null and old.usuario is not null) or
      (new.usuario is not null and old.usuario is not null and new.usuario <> old.usuario)) then
     insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
            values (:tid, 'USUARIO', old.usuario, new.usuario);


end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TB_TESTE_CODIGO
As
Begin
  If (New.Codigo Is Null) Then
    New.Codigo = Gen_id(Gen_tb_teste_codigo, 1);
End^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_BAIRRO_COD
As
Begin
  If (New.Bai_cod Is Null) Then
    New.Bai_cod = Gen_id(Gen_bairro_id,1);
End^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_CAIXA_CONSOLIDACAO_SEQ
AS
  declare variable sequencial Smallint;
begin
  if ( coalesce(new.Seq, 0) = 0 ) then
  begin
    Select
      max(c.Seq)
    from TBCAIXA_CONSOLIDACAO c
    where c.Ano = new.Ano
      and c.Numero = new.Numero
    into
      sequencial;

    new.Seq = coalesce(Sequencial, 0) + 1;
  end
end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_CAIXA_FECHAR
AS
  declare variable total_credito Dmn_money;
  declare variable total_debito Dmn_money;
begin
  if ( (old.Situacao = 0) and (new.Situacao = 1) ) then
  begin
    Execute procedure SET_CAIXA_CONSOLIDAR(new.Ano, new.Numero);

    Select
        sum(c.Total_credito)
      , sum(c.Total_debito)
    from TBCAIXA_CONSOLIDACAO c
    where c.Ano = new.Ano
      and c.Numero = new.Numero
    into
        Total_credito
      , Total_debito;

    new.Valor_total_credito = coalesce(:Total_credito, 0);
    new.Valor_total_debito  = coalesce(:Total_debito, 0);
  end 
end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_CAIXA_MOVIMENTO_NUMERO
AS
begin
  IF (New.Numero IS NULL) Then
    if ( new.Ano = 2012 ) then
      NEW.Numero = GEN_ID(GEN_CX_MOVIMENTO_2012, 1);
    else
    if ( new.Ano = 2013 ) then
      NEW.Numero = GEN_ID(GEN_CX_MOVIMENTO_2013, 1);
    else
    if ( new.Ano = 2014 ) then
      NEW.Numero = GEN_ID(GEN_CX_MOVIMENTO_2014, 1);
    else
    if ( new.Ano = 2015 ) then
      NEW.Numero = GEN_ID(GEN_CX_MOVIMENTO_2015, 1);
    else
    if ( new.Ano = 2016 ) then
      NEW.Numero = GEN_ID(GEN_CX_MOVIMENTO_2016, 1);
    else
    if ( new.Ano = 2017 ) then
      NEW.Numero = GEN_ID(GEN_CX_MOVIMENTO_2017, 1);
    else
    if ( new.Ano = 2018 ) then
      NEW.Numero = GEN_ID(GEN_CX_MOVIMENTO_2018, 1);
    else
    if ( new.Ano = 2019 ) then
      NEW.Numero = GEN_ID(GEN_CX_MOVIMENTO_2019, 1);
    else
    if ( new.Ano = 2020 ) then
      NEW.Numero = GEN_ID(GEN_CX_MOVIMENTO_2020, 1);
end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_CAIXA_NUMERO
AS
begin
  IF (New.Numero IS NULL) Then
    if ( new.Ano = 2012 ) then
      NEW.Numero = GEN_ID(GEN_CAIXA_2012, 1);
    else
    if ( new.Ano = 2013 ) then
      NEW.Numero = GEN_ID(GEN_CAIXA_2013, 1);
    else
    if ( new.Ano = 2014 ) then
      NEW.Numero = GEN_ID(GEN_CAIXA_2014, 1);
    else
    if ( new.Ano = 2015 ) then
      NEW.Numero = GEN_ID(GEN_CAIXA_2015, 1);
    else
    if ( new.Ano = 2016 ) then
      NEW.Numero = GEN_ID(GEN_CAIXA_2016, 1);
    else
    if ( new.Ano = 2017 ) then
      NEW.Numero = GEN_ID(GEN_CAIXA_2017, 1);
    else
    if ( new.Ano = 2018 ) then
      NEW.Numero = GEN_ID(GEN_CAIXA_2018, 1);
    else
    if ( new.Ano = 2019 ) then
      NEW.Numero = GEN_ID(GEN_CAIXA_2019, 1);
    else
    if ( new.Ano = 2020 ) then
      NEW.Numero = GEN_ID(GEN_CAIXA_2020, 1);
end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_CIDADE_COD
As
Begin
  If (New.Cid_cod Is Null) Then
    New.Cid_cod = Gen_id(Gen_cidade_id,1);
End^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_CLIENTE_COD
As
Begin
  If (New.Codigo Is Null) Then
    New.Codigo = Gen_id(Gen_CLIENTE_id, 1);
End^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_COMPRAS_ATUALIZAR_ESTOQUE
AS
  declare variable produto varchar(10);
  declare variable empresa varchar(18);
  declare variable estoque integer;
  declare variable quantidade integer;
  declare variable custo_produto numeric(15,2);
  declare variable custo_compra numeric(15,2);
  declare variable custo_medio numeric(15,2);
  declare variable preco_venda dmn_money;
  declare variable percentual_markup dmn_percentual_3;
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
        , p.percentual_marckup
        , p.preco
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
          --p.Customedio = :Custo_medio
          p.Customedio = :Custo_compra
        , p.Qtde       = :Estoque + :Quantidade
        , p.percentual_marckup = :Percentual_markup
--        , p.preco_sugerido     = cast( (:Custo_medio + (:Custo_medio * :Percentual_markup / 100)) as numeric(15,2) )
        , p.preco_sugerido     = cast( (:Custo_compra + (:Custo_compra * :Percentual_markup / 100)) as numeric(15,2) )
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
end^

SET TERM ; ^

SET TERM ^ ;

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
end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_COMPRAS_CONTROLE
AS
BEGIN
  IF (NEW.CODCONTROL IS NULL) THEN
    if ( new.Ano = 2011 ) then
      NEW.CODCONTROL = GEN_ID(GEN_COMPRAS_CONTROLE_2011, 1);
    else
    if ( new.Ano = 2012 ) then
      NEW.CODCONTROL = GEN_ID(GEN_COMPRAS_CONTROLE_2012, 1);
    else
    if ( new.Ano = 2013 ) then
      NEW.CODCONTROL = GEN_ID(GEN_COMPRAS_CONTROLE_2013, 1);
    else
    if ( new.Ano = 2014 ) then
      NEW.CODCONTROL = GEN_ID(GEN_COMPRAS_CONTROLE_2014, 1);
    else
    if ( new.Ano = 2015 ) then
      NEW.CODCONTROL = GEN_ID(GEN_COMPRAS_CONTROLE_2015, 1);
    else
    if ( new.Ano = 2016 ) then
      NEW.CODCONTROL = GEN_ID(GEN_COMPRAS_CONTROLE_2016, 1);
    else
    if ( new.Ano = 2017 ) then
      NEW.CODCONTROL = GEN_ID(GEN_COMPRAS_CONTROLE_2017, 1);
    else
    if ( new.Ano = 2018 ) then
      NEW.CODCONTROL = GEN_ID(GEN_COMPRAS_CONTROLE_2018, 1);
    else
    if ( new.Ano = 2019 ) then
      NEW.CODCONTROL = GEN_ID(GEN_COMPRAS_CONTROLE_2019, 1);
    else
    if ( new.Ano = 2020 ) then
      NEW.CODCONTROL = GEN_ID(GEN_COMPRAS_CONTROLE_2020, 1);
END^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_CONDICAOPAGTO_COD
As
Begin
  If (New.Cond_cod Is Null) Then
    New.Cond_cod = Gen_id(Gen_condicaopagto_cod, 1);
End^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_CONTPAG_NUMLANC
AS
begin
  IF (NEW.Numlanc IS NULL) THEN
    if ( new.Anolanc = 2011 ) then
      NEW.Numlanc = GEN_ID(GEN_CONTAPAG_NUM_2011, 1);
    else
    if ( new.Anolanc = 2012 ) then
      NEW.Numlanc = GEN_ID(GEN_CONTAPAG_NUM_2012, 1);
    else
    if ( new.Anolanc = 2013 ) then
      NEW.Numlanc = GEN_ID(GEN_CONTAPAG_NUM_2013, 1);
    else
    if ( new.Anolanc = 2014 ) then
      NEW.Numlanc = GEN_ID(GEN_CONTAPAG_NUM_2014, 1);
    else
    if ( new.Anolanc = 2015 ) then
      NEW.Numlanc = GEN_ID(GEN_CONTAPAG_NUM_2015, 1);
    else
    if ( new.Anolanc = 2016 ) then
      NEW.Numlanc = GEN_ID(GEN_CONTAPAG_NUM_2016, 1);
    else
    if ( new.Anolanc = 2017 ) then
      NEW.Numlanc = GEN_ID(GEN_CONTAPAG_NUM_2017, 1);
    else
    if ( new.Anolanc = 2018 ) then
      NEW.Numlanc = GEN_ID(GEN_CONTAPAG_NUM_2018, 1);
    else
    if ( new.Anolanc = 2019 ) then
      NEW.Numlanc = GEN_ID(GEN_CONTAPAG_NUM_2019, 1);
    else
    if ( new.Anolanc = 2020 ) then
      NEW.Numlanc = GEN_ID(GEN_CONTAPAG_NUM_2020, 1);
end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_CONTPAG_QUITAR
AS
  declare variable forma_pagto varchar(30);
  declare variable total_pago numeric(15,2);
  declare variable valor_pagar numeric(15,2);
begin
  /* Quitar contas a pagar */

  -- Buscar descricao da Forma de Pagamento
  Select
    f.Descri
  from TBFORMPAGTO f
  where f.Cod = new.Forma_pagto
  into
    Forma_pagto;

  -- Totalizar os Valores pagos
  Select
    sum( coalesce(b.Valor_baixa, 0) )
  from TBCONTPAG_BAIXA b
  where b.Anolanc = new.Anolanc
    and b.Numlanc = new.Numlanc
  into
    Total_pago;

  -- Buscar o Valor da divida
  Select
    coalesce(p.Valorpag, 0)
  from TBCONTPAG p
  where p.Anolanc = new.Anolanc
    and p.Numlanc = new.Numlanc
  Into
    Valor_pagar;

  -- Quitar divida caso o Total Pago seja maior ou igual ao Total da divida
  if ( :Total_pago >= :Valor_pagar ) then
  begin
    Update TBCONTPAG p Set
        p.Quitado  = 1
      , p.Historic = p.Historic || ' --> HISTORICO DE PAGAMENTO : ' || new.Historico
      , p.Dtpag    = new.Data_pagto
      , p.Docbaix  = new.Documento_baixa
      , p.Tippag   = :Forma_pagto
      , p.Numchq   = new.Numero_cheque
      , p.Banco    = new.Banco
    where p.Anolanc = new.Anolanc
      and p.Numlanc = new.Numlanc;
  end
end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_CONTREC_NUM
as
begin
  if (new.Numlanc is null) then
    if ( new.Anolanc = 2011 ) then
      new.Numlanc = gen_id(Gen_contarec_num_2011, 1);
    else
    if ( new.Anolanc = 2012 ) then
      new.Numlanc = gen_id(Gen_contarec_num_2012, 1);
    else
    if ( new.Anolanc = 2013 ) then
      new.Numlanc = gen_id(Gen_contarec_num_2013, 1);
    else
    if ( new.Anolanc = 2014 ) then
      new.Numlanc = gen_id(Gen_contarec_num_2014, 1);
    else
    if ( new.Anolanc = 2015 ) then
      new.Numlanc = gen_id(Gen_contarec_num_2015, 1);
    else
    if ( new.Anolanc = 2016 ) then
      new.Numlanc = gen_id(Gen_contarec_num_2016, 1);
    else
    if ( new.Anolanc = 2017 ) then
      new.Numlanc = gen_id(Gen_contarec_num_2017, 1);
    else
    if ( new.Anolanc = 2018 ) then
      new.Numlanc = gen_id(Gen_contarec_num_2018, 1);
    else
    if ( new.Anolanc = 2019 ) then
      new.Numlanc = gen_id(Gen_contarec_num_2019, 1);
    else
    if ( new.Anolanc = 2020 ) then
      new.Numlanc = gen_id(Gen_contarec_num_2020, 1);
end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_CONTREC_QUITAR
AS
  declare variable forma_pagto varchar(30);
  declare variable total_pago numeric(15,2);
  declare variable valor_pagar numeric(15,2);
  declare variable valor_saldo numeric(15,2);
  declare variable quitado Smallint;
begin
  /* Quitar contas a receber */

  -- Buscar descricao da Forma de Pagamento
  Select
    f.Descri
  from TBFORMPAGTO f
  where f.Cod = new.Forma_pagto
  into
    Forma_pagto;

  -- Totalizar os Valores pagos
  Select
    sum( coalesce(b.Valor_baixa, 0) )
  from TBCONTREC_BAIXA b
  where b.Anolanc = new.Anolanc
    and b.Numlanc = new.Numlanc
  into
    Total_pago;

  -- Buscar o Valor da divida
  Select
    coalesce(r.Valorrec, 0) + coalesce(r.Valormulta, 0) - ( coalesce(r.Valorrec, 0) * coalesce(r.Percentdesconto, 0) / 100 )
  from TBCONTREC r
  where r.Anolanc = new.Anolanc
    and r.Numlanc = new.Numlanc
  Into
    Valor_pagar;

  -- Quitar divida caso o Total Pago seja maior ou igual ao Total da divida
  if ( :Total_pago >= :Valor_pagar ) then
    quitado = 1;
  else
    quitado = 0;

  Valor_saldo = :Valor_pagar - :Total_pago;
  if ( :Valor_saldo < 0 ) then
    Valor_saldo = 0;

  Update TBCONTREC r Set
      r.Baixado  = :Quitado
    , r.Historic = r.Historic || ' --> HISTORICO DA BAIXA : ' || new.Historico
    , r.Dtrec    = new.Data_pagto
    , r.Docbaix  = new.Documento_baixa
    , r.Tippag   = :Forma_pagto
    , r.Codbanco = new.Banco
    , r.Valorsaldo  = :Valor_saldo
    , r.Valorrectot = :Total_pago
  where r.Anolanc = new.Anolanc
    and r.Numlanc = new.Numlanc;
end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_DISTRITO_BI
As
Begin
  If (New.Dis_cod Is Null) Then
    New.Dis_cod = Gen_id(Gen_distrito_id,1);
End^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_EMPRESA_COD
As
Begin
  If (New.Codigo Is Null) Then
    New.Codigo = Gen_id(Gen_empresa_id, 1);
End^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_FABRICANTE_COD
AS
BEGIN
  IF (NEW.COD IS NULL) THEN
    NEW.COD = GEN_ID(GEN_FABRICANTE_ID, 1);
END^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_FORNECEDOR_COD
As
Begin
  If (New.CODFORN Is Null) Then
    New.CODFORN = Gen_id(GEN_FORNECEDOR_ID, 1);
End^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_GRUPOPRODUTO_COD
AS
BEGIN
  IF (NEW.COD IS NULL) THEN
    NEW.COD = GEN_ID(GEN_GRUPOPRODUTO_COD,1);
END^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_LOGRADOURO_COD
As
Begin
  If (New.Log_cod Is Null) Then
    New.Log_cod = Gen_id(Gen_logradouro_id,1);
End^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_NFE_ATUALIZAR_COMPRA
AS
begin
  if ( (new.anocompra > 0) and (new.numcompra > 0) ) then
  begin
    Update TBCOMPRAS c Set
        c.nfserie = new.serie
      , c.nf      = new.numero
      , c.nfe_enviada      = 1
      , c.verificador_nfe  = new.chave
      , c.xml_nfe_filename = new.xml_filename
      , c.xml_nfe          = new.xml_file
      , c.lote_nfe_ano     = new.lote_ano
      , c.lote_nfe_numero  = new.lote_num
      , c.lote_nfe_recibo  = new.recibo
      , c.status  = 4 -- Nota Fiscal Gerada
      , c.dtemiss = new.dataemissao
      , c.hremiss = new.horaemissao
    where c.ano        = new.anocompra
      and c.codcontrol = new.numcompra;
  end 
end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_NFE_ATUALIZAR_VENDA
AS
begin
  if ( (new.anovenda > 0) and (new.numvenda > 0) ) then
  begin
    Update TBVENDAS v Set
        v.serie = new.serie
      , v.nfe   = new.numero
      , v.nfe_enviada      = 1
      , v.verificador_nfe  = new.chave
      , v.xml_nfe_filename = new.xml_filename
      , v.xml_nfe          = new.xml_file
      , v.lote_nfe_ano     = new.lote_ano
      , v.lote_nfe_numero  = new.lote_num
      , v.lote_nfe_recibo  = new.recibo
      , v.status      = 4 -- Nota Fiscal Gerada
      , v.dataemissao = new.dataemissao
      , v.horaemissao = new.horaemissao
    where v.ano = new.anovenda
      and v.codcontrol = new.numvenda;
  end 
end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_NFE_ENVIADA_EMPRESA
AS
begin
  if (new.empresa is null) then
  begin

    /* Identificando a Empresa da Venda (Saida) */

    if (new.anovenda is not null) then
    begin
      Select
        v.codemp
      from TBVENDAS v
      where v.ano        = new.anovenda
        and v.codcontrol = new.numvenda
      Into
        new.empresa;

    end

    else

    /* Identificando a Empresa da Compra (Entrada) */

    if (new.anovenda is not null) then
    begin

      Select
        v.codemp
      from TBVENDAS v
      where v.ano        = new.anovenda
        and v.codcontrol = new.numvenda
      Into
        new.empresa;

    end

  end
end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_PRODUTO_COD
As
Begin
  If (New.Codigo Is Null) Then
    New.Codigo = Gen_id(Gen_produto_id,1);
End^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_PRODUTO_ROTATIVIDADE_MOV
AS
  declare variable movimento numeric(18,4);
begin
  movimento =
    coalesce(new.compra_qtde_01, 0) + coalesce(new.venda_qtde_01, 0) +
    coalesce(new.compra_qtde_03, 0) + coalesce(new.venda_qtde_03, 0) +
    coalesce(new.compra_qtde_06, 0) + coalesce(new.venda_qtde_06, 0) +
    coalesce(new.compra_qtde_09, 0) + coalesce(new.venda_qtde_09, 0) +
    coalesce(new.compra_qtde_12, 0) + coalesce(new.venda_qtde_12, 0) +
    coalesce(new.compra_qtde_99, 0) + coalesce(new.venda_qtde_99, 0);

  if ( :movimento > 0 ) then
    new.movimentado = 1;
  else
    new.movimentado = 0;

  if ( new.data_ultima_compra = '1899.12.30' ) then
    new.data_ultima_compra = null;

  if ( new.data_ultima_venda = '1899.12.30' ) then
    new.data_ultima_venda = null;
end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_PROMOCAO_NOVA
AS
BEGIN
  IF (NEW.CODIGO IS NULL) THEN
    NEW.CODIGO = GEN_ID(GEN_TBPROMOCAO_ID, 1);
END^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_PROMOCAO_PRODUTO
AS
  declare variable produto varchar(10);
  declare variable valor_prom numeric(15,2);
begin
  if ( coalesce(old.Ativa, 0) <> coalesce(new.Ativa, 0) ) then
  begin

    for
      Select
          p.Codigo_prod
        , case when new.Ativa = 1 then p.Preco_promocao else null end
      from TBPROMOCAO_PRODUTO p
      where p.Codigo_prom = new.Codigo
      into
          produto
        , valor_prom
    do
    begin
      Update TBPRODUTO x Set
        x.Preco_promocao = :Valor_prom
      where x.Cod = :Produto;
    end 

  end 
end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_PROMOCAO_PRODUTO_RETIRAR
AS
begin
  /* Retirar Preco de Promocao da Ficha do Produto */
  Update TBPRODUTO p Set
    p.Preco_promocao = null
  where p.Cod = old.Codigo_prod;
end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_SECAOPRODUTO_COD
As
Begin
  If (New.Scp_cod Is Null) Then
    New.Scp_cod = Gen_id(Gen_secaoproduto_id,1);
End^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_TBCONTREC_SALDO
AS
begin
  new.valorsaldo = ( coalesce(new.valorrec, 0) + coalesce(new.valormulta, 0) - ( coalesce(new.valorrec, 0) * coalesce(new.percentdesconto, 0) / 100 ) ) - coalesce(new.valorrectot, 0);
end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_TIPO_LOGRADOURO_COD
As
Begin
  If (New.Tlg_cod Is Null) Then
    New.Tlg_cod = Gen_id(Gen_tipo_logradouro_id,1);
End^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_UNIDADEPRODUTO_COD
As
Begin
  If (New.Unp_cod Is Null) Then
    New.Unp_cod = Gen_id(Gen_unidadeproduto_id,1);
End^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_VENDASITENS_RESERVAR
AS
  --declare variable status_venda Smallint;
  declare variable reserva integer;
begin
  /*
  Select
    v.Status
  from TBVENDAS v
  where v.Ano = new.Ano
    and v.Codcontrol = new.Codcontrol
  into
    status_venda;
  */

  Exit; -- Descontinuada RESERVA

  if ( Inserting or Updating  ) then
  begin
      Select
         coalesce(p.Reserva, 0) - coalesce(old.Qtde, 0) + coalesce(new.Qtde, 0)
      from TBPRODUTO p
      where p.Cod    = new.Codprod
        and p.Codemp = new.Codemp
      into
        Reserva;
  end

  else

  if ( Deleting  ) then
  begin
      Select
         coalesce(p.Reserva, 0) - coalesce(old.Qtde, 0)
      from TBPRODUTO p
      where p.Cod    = old.Codprod
        and p.Codemp = old.Codemp
      into
        Reserva;
  end

  Update TBPRODUTO Set
    Reserva = :Reserva
  where Cod    = new.Codprod
    and Codemp = new.Codemp;
end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_VENDASITENS_TOTAIS_PRODUTO
AS
begin
  new.total_bruto    = ( coalesce(new.qtde, 0) * coalesce(new.punit, 0) );
  new.total_desconto = ( coalesce(new.qtde, 0) * coalesce(new.desconto_valor, 0) );
  new.total_liquido  = ( coalesce(new.total_bruto, 0) - coalesce(new.total_desconto, 0) );
end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_VENDASITENS_TOTAL_VENDA
AS
  declare variable anovenda Smallint;
  declare variable numvenda Integer;
  declare variable total_bruto Dmn_money;
  declare variable total_desconto dmn_money;
  declare variable total_liquido Dmn_money;
  declare variable total_custo Dmn_money;
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
    , sum( coalesce(i.qtde, 0) * coalesce(p.customedio, 0) )
  from TVENDASITENS i
    inner join TBPRODUTO p on (p.cod = i.codprod)
  where i.Ano = :Anovenda
    and i.Codcontrol = :Numvenda
  into
      Total_bruto
    , Total_desconto
    , Total_custo;

  Total_bruto    = coalesce(:Total_bruto, 0);
  Total_desconto = coalesce(:Total_desconto, 0);
  total_liquido  = :Total_bruto - :Total_desconto;

  Update TBVENDAS v Set
      v.Totalvenda_bruta = :Total_bruto
    , v.Desconto   = :Total_desconto
    , v.Totalvenda = :Total_liquido
    , v.Totalcusto = :Total_custo
  where v.Ano = :Anovenda
    and v.Codcontrol = :Numvenda;
end^

SET TERM ; ^

SET TERM ^ ;

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
end^

SET TERM ; ^

SET TERM ^ ;

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
end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_VENDAS_CONTROLE
AS
BEGIN
  IF (NEW.CODCONTROL IS NULL) THEN
    if ( new.Ano = 2011 ) then
      NEW.CODCONTROL = GEN_ID(GEN_VENDAS_CONTROLE_2011, 1);
    else
    if ( new.Ano = 2012 ) then
      NEW.CODCONTROL = GEN_ID(GEN_VENDAS_CONTROLE_2012, 1);
    else
    if ( new.Ano = 2013 ) then
      NEW.CODCONTROL = GEN_ID(GEN_VENDAS_CONTROLE_2013, 1);
    else
    if ( new.Ano = 2014 ) then
      NEW.CODCONTROL = GEN_ID(GEN_VENDAS_CONTROLE_2014, 1);
    else
    if ( new.Ano = 2015 ) then
      NEW.CODCONTROL = GEN_ID(GEN_VENDAS_CONTROLE_2015, 1);
    else
    if ( new.Ano = 2016 ) then
      NEW.CODCONTROL = GEN_ID(GEN_VENDAS_CONTROLE_2016, 1);
    else
    if ( new.Ano = 2017 ) then
      NEW.CODCONTROL = GEN_ID(GEN_VENDAS_CONTROLE_2017, 1);
    else
    if ( new.Ano = 2018 ) then
      NEW.CODCONTROL = GEN_ID(GEN_VENDAS_CONTROLE_2018, 1);
    else
    if ( new.Ano = 2019 ) then
      NEW.CODCONTROL = GEN_ID(GEN_VENDAS_CONTROLE_2019, 1);
    else
    if ( new.Ano = 2020 ) then
      NEW.CODCONTROL = GEN_ID(GEN_VENDAS_CONTROLE_2020, 1);
END^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TRGAJUSTESTOQ
AS
begin
  update TBPRODUTO p set
    qtde = coalesce(qtde, 0) + coalesce(new.qtdenova, 0)
  where cod = new.codprod;

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
      Null
    , new.codprod
    , new.doc
    , 'AJUSTE DE ESTOQUE - ENTRADA'
    , new.dtajust
    , new.qtdeatual
    , new.qtdenova
    , new.qtdefinal
    , coalesce(new.Usuario, 'DORIVAS')
    , new.motivo
  );
end^

SET TERM ; ^

