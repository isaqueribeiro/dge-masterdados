/*------ SYSDBA 16/01/2014 20:13:32 --------*/

CREATE TABLE TBFUNCAO_PERMISSAO (
    SISTEMA DMN_SMALLINT_NN NOT NULL,
    FUNCAO DMN_SMALLINT_NN NOT NULL,
    ROTINA DMN_VCHAR_10_KEY NOT NULL,
    ACESSO DMN_LOGICO DEFAULT 1);

ALTER TABLE TBFUNCAO_PERMISSAO
ADD CONSTRAINT PK_TBFUNCAO_PERMISSAO
PRIMARY KEY (SISTEMA,FUNCAO,ROTINA);




/*------ SYSDBA 16/01/2014 20:13:42 --------*/

COMMENT ON COLUMN TBFUNCAO_PERMISSAO.SISTEMA IS
'Sistema';




/*------ SYSDBA 16/01/2014 20:13:51 --------*/

COMMENT ON COLUMN TBFUNCAO_PERMISSAO.FUNCAO IS
'Funcao/Perfil';




/*------ SYSDBA 16/01/2014 20:13:55 --------*/

COMMENT ON COLUMN TBFUNCAO_PERMISSAO.ROTINA IS
'Rotina';




/*------ SYSDBA 16/01/2014 20:14:07 --------*/

COMMENT ON COLUMN TBFUNCAO_PERMISSAO.ACESSO IS
'Acesso permitido:
0 - Nao
1 - Sim';

GRANT ALL ON TBFUNCAO_PERMISSAO TO "PUBLIC";



/*------ SYSDBA 16/01/2014 20:20:13 --------*/

SET TERM ^ ;

create or alter procedure SET_FUNCAO_PERMISSAO (
    SIS_CODIGO DMN_SMALLINT_NN,
    FUN_CODIGO DMN_SMALLINT_NN,
    ROT_CODIGO DMN_VCHAR_10_KEY,
    ACESSO DMN_LOGICO)
as
begin
  if (not exists(
    Select
      fp.sistema
    from TBFUNCAO_PERMISSAO fp
    where fp.sistema = :sis_codigo
      and fp.funcao  = :fun_codigo
      and fp.rotina  = :rot_codigo
  )) then
    Insert Into TBFUNCAO_PERMISSAO values (:sis_codigo, :fun_codigo, :rot_codigo, :acesso);
  else
    Update TBFUNCAO_PERMISSAO fp Set
      fp.acesso = :acesso
    where fp.sistema = :sis_codigo
      and fp.funcao  = :fun_codigo
      and fp.rotina  = :rot_codigo;
end^

SET TERM ; ^

COMMENT ON PARAMETER SET_FUNCAO_PERMISSAO.SIS_CODIGO IS
'Sistema';

COMMENT ON PARAMETER SET_FUNCAO_PERMISSAO.FUN_CODIGO IS
'Funcao';

COMMENT ON PARAMETER SET_FUNCAO_PERMISSAO.ROT_CODIGO IS
'Rotina';

COMMENT ON PARAMETER SET_FUNCAO_PERMISSAO.ACESSO IS
'Acesso';




/*------ SYSDBA 16/01/2014 20:20:20 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_FUNCAO_PERMISSAO (
    SIS_CODIGO DMN_SMALLINT_NN,
    FUN_CODIGO DMN_SMALLINT_NN,
    ROT_CODIGO DMN_VCHAR_10_KEY,
    ACESSO DMN_LOGICO)
as
begin
  if (not exists(
    Select
      fp.sistema
    from TBFUNCAO_PERMISSAO fp
    where fp.sistema = :sis_codigo
      and fp.funcao  = :fun_codigo
      and fp.rotina  = :rot_codigo
  )) then
    Insert Into TBFUNCAO_PERMISSAO values (:sis_codigo, :fun_codigo, :rot_codigo, :acesso);
  else
    Update TBFUNCAO_PERMISSAO fp Set
      fp.acesso = :acesso
    where fp.sistema = :sis_codigo
      and fp.funcao  = :fun_codigo
      and fp.rotina  = :rot_codigo;
end^

SET TERM ; ^

COMMENT ON PARAMETER SET_FUNCAO_PERMISSAO.SIS_CODIGO IS
'Sistema';

COMMENT ON PARAMETER SET_FUNCAO_PERMISSAO.FUN_CODIGO IS
'Funcao';

COMMENT ON PARAMETER SET_FUNCAO_PERMISSAO.ROT_CODIGO IS
'Rotina';

COMMENT ON PARAMETER SET_FUNCAO_PERMISSAO.ACESSO IS
'Acesso';




/*------ SYSDBA 16/01/2014 20:21:59 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_FUNCAO_PERMISSAO (
    SIS_CODIGO DMN_SMALLINT_NN,
    FUN_CODIGO DMN_SMALLINT_NN,
    ROT_CODIGO DMN_VCHAR_10_KEY,
    ACESSO DMN_LOGICO)
as
begin
  if (not exists(
    Select
      fp.sistema
    from TBFUNCAO_PERMISSAO fp
    where fp.sistema = :sis_codigo
      and fp.funcao  = :fun_codigo
      and fp.rotina  = :rot_codigo
  )) then
    Insert Into TBFUNCAO_PERMISSAO values (:sis_codigo, :fun_codigo, :rot_codigo, :acesso);
  else
    Update TBFUNCAO_PERMISSAO fp Set
      fp.acesso = :acesso
    where fp.sistema = :sis_codigo
      and fp.funcao  = :fun_codigo
      and fp.rotina  = :rot_codigo;
end^

SET TERM ; ^

COMMENT ON PROCEDURE SET_FUNCAO_PERMISSAO IS 'Autor   :   Isaque Marinho Ribeiro
Data    :   16/01/2014

Store procedure responsavel pela insercao e/ou atualizacao de permissoes de acesso a rotinas dos sistemas
por funcao/perfil de acesso.';

COMMENT ON PARAMETER SET_FUNCAO_PERMISSAO.SIS_CODIGO IS
'Sistema';

COMMENT ON PARAMETER SET_FUNCAO_PERMISSAO.FUN_CODIGO IS
'Funcao';

COMMENT ON PARAMETER SET_FUNCAO_PERMISSAO.ROT_CODIGO IS
'Rotina';

COMMENT ON PARAMETER SET_FUNCAO_PERMISSAO.ACESSO IS
'Acesso';




/*------ SYSDBA 16/01/2014 20:22:58 --------*/

ALTER TABLE TBFUNCAO_PERMISSAO
ADD CONSTRAINT FK_TBFUNCAO_PERMISSAO_FUN
FOREIGN KEY (FUNCAO)
REFERENCES TBFUNCAO(COD)
ON DELETE CASCADE
ON UPDATE CASCADE;




/*------ SYSDBA 13/02/2014 20:56:36 --------*/

CREATE TABLE SYS_ROTINA (
    ROT_COD DMN_VCHAR_10_KEY NOT NULL,
    ROT_TIPO DMN_SMALLINT_NN DEFAULT 1,
    ROT_DESCRICAO DMN_VCHAR_250,
    ROT_COD_PAI DMN_VCHAR_10);

ALTER TABLE SYS_ROTINA
ADD CONSTRAINT PK_SYS_ROTINA
PRIMARY KEY (ROT_COD);

COMMENT ON COLUMN SYS_ROTINA.ROT_COD IS
'Codigo';

COMMENT ON COLUMN SYS_ROTINA.ROT_TIPO IS
'Tipo:
0 - Menu
1 - Rotina    (Tela)
2 - Subrotina (Funcoes de tela)';

COMMENT ON COLUMN SYS_ROTINA.ROT_DESCRICAO IS
'Descricao';

COMMENT ON COLUMN SYS_ROTINA.ROT_COD_PAI IS
'Rotina pai';




/*------ SYSDBA 13/02/2014 20:57:11 --------*/

ALTER TABLE SYS_ROTINA
ADD CONSTRAINT FK_SYS_ROTINA_PAI
FOREIGN KEY (ROT_COD_PAI)
REFERENCES SYS_ROTINA(ROT_COD)
ON DELETE CASCADE
ON UPDATE CASCADE;



/*------ 13/02/2014 20:58:36 --------*/

CREATE TABLE SYS_FUNCAO_PERMISSAO (
    SISTEMA  DMN_SMALLINT_NN NOT NULL /* DMN_SMALLINT_NN = SMALLINT DEFAULT 0 */,
    FUNCAO   DMN_SMALLINT_NN NOT NULL /* DMN_SMALLINT_NN = SMALLINT DEFAULT 0 */,
    ROTINA   DMN_VCHAR_10_KEY NOT NULL /* DMN_VCHAR_10_KEY = VARCHAR(10) NOT NULL */,
    ACESSO   DMN_LOGICO DEFAULT 1 /* DMN_LOGICO = SMALLINT DEFAULT 0 NOT NULL CHECK (value between 0 and 1) */
);

/*------ 13/02/2014 20:58:36 --------*/

ALTER TABLE SYS_FUNCAO_PERMISSAO ADD CONSTRAINT PK_SYS_FUNCAO_PERMISSAO PRIMARY KEY (SISTEMA, FUNCAO, ROTINA);

/*------ 13/02/2014 20:58:36 --------*/

ALTER TABLE SYS_FUNCAO_PERMISSAO ADD CONSTRAINT FK_SYS_FUNCAO_PERMISSAO_FUN FOREIGN KEY (FUNCAO) REFERENCES TBFUNCAO (COD) ON DELETE CASCADE ON UPDATE CASCADE;

/*------ 13/02/2014 20:58:36 --------*/

COMMENT ON COLUMN SYS_FUNCAO_PERMISSAO.SISTEMA IS 
'Sistema';

/*------ 13/02/2014 20:58:36 --------*/

COMMENT ON COLUMN SYS_FUNCAO_PERMISSAO.FUNCAO IS 
'Funcao/Perfil';

/*------ 13/02/2014 20:58:36 --------*/

COMMENT ON COLUMN SYS_FUNCAO_PERMISSAO.ROTINA IS 
'Rotina';

/*------ 13/02/2014 20:58:36 --------*/

COMMENT ON COLUMN SYS_FUNCAO_PERMISSAO.ACESSO IS 
'Acesso permitido:
0 - Nao
1 - Sim';

/*------ 13/02/2014 20:58:36 --------*/

GRANT ALL ON SYS_FUNCAO_PERMISSAO TO PUBLIC;


/*------ SYSDBA 13/02/2014 21:00:05 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_FUNCAO_PERMISSAO (
    SIS_CODIGO DMN_SMALLINT_NN,
    FUN_CODIGO DMN_SMALLINT_NN,
    ROT_CODIGO DMN_VCHAR_10_KEY,
    ACESSO DMN_LOGICO)
as
begin
  if (not exists(
    Select
      fp.sistema
    from SYS_FUNCAO_PERMISSAO fp
    where fp.sistema = :sis_codigo
      and fp.funcao  = :fun_codigo
      and fp.rotina  = :rot_codigo
  )) then
    Insert Into SYS_FUNCAO_PERMISSAO values (:sis_codigo, :fun_codigo, :rot_codigo, :acesso);
  else
    Update SYS_FUNCAO_PERMISSAO fp Set
      fp.acesso = :acesso
    where fp.sistema = :sis_codigo
      and fp.funcao  = :fun_codigo
      and fp.rotina  = :rot_codigo;
end^

SET TERM ; ^

COMMENT ON PARAMETER SET_FUNCAO_PERMISSAO.SIS_CODIGO IS
'Sistema';

COMMENT ON PARAMETER SET_FUNCAO_PERMISSAO.FUN_CODIGO IS
'Funcao';

COMMENT ON PARAMETER SET_FUNCAO_PERMISSAO.ROT_CODIGO IS
'Rotina';

COMMENT ON PARAMETER SET_FUNCAO_PERMISSAO.ACESSO IS
'Acesso';




/*------ SYSDBA 13/02/2014 21:00:27 --------*/

DROP TABLE TBFUNCAO_PERMISSAO;

GRANT ALL ON SYS_ROTINA TO "PUBLIC";



/*------ SYSDBA 13/02/2014 21:01:07 --------*/

COMMENT ON COLUMN SYS_ROTINA.ROT_TIPO IS
'Tipo:
0 - Menu
1 - Rotina    (Tela)
2 - Subrotina (Funcoes de tela)
4 - Processos';




/*------ SYSDBA 13/02/2014 21:02:23 --------*/

ALTER TABLE SYS_FUNCAO_PERMISSAO
ADD CONSTRAINT FK_SYS_FUNCAO_PERMISSAO_ROT
FOREIGN KEY (ROTINA)
REFERENCES SYS_ROTINA(ROT_COD)
ON DELETE CASCADE
ON UPDATE CASCADE;




/*------ SYSDBA 13/02/2014 21:03:49 --------*/

CREATE TABLE SYS_SISTEMA (
    SIS_COD DMN_SMALLINT_NN NOT NULL,
    SIS_NOME DMN_VCHAR_100,
    SIS_VERSAO DMN_VCHAR_30);

ALTER TABLE SYS_SISTEMA
ADD CONSTRAINT PK_SYS_SISTEMA
PRIMARY KEY (SIS_COD);

COMMENT ON COLUMN SYS_SISTEMA.SIS_COD IS
'Codigo';

COMMENT ON COLUMN SYS_SISTEMA.SIS_NOME IS
'Nome';

COMMENT ON COLUMN SYS_SISTEMA.SIS_VERSAO IS
'Versao';

GRANT ALL ON SYS_SISTEMA TO "PUBLIC";



/*------ SYSDBA 13/02/2014 21:04:31 --------*/

ALTER TABLE SYS_FUNCAO_PERMISSAO
ADD CONSTRAINT FK_SYS_FUNCAO_PERMISSAO_SIS
FOREIGN KEY (SISTEMA)
REFERENCES SYS_SISTEMA(SIS_COD)
ON DELETE CASCADE
ON UPDATE CASCADE;




/*------ SYSDBA 13/02/2014 21:07:05 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_FUNCAO_PERMISSAO (
    SIS_CODIGO DMN_SMALLINT_NN,
    FUN_CODIGO DMN_SMALLINT_NN,
    ROT_CODIGO DMN_VCHAR_10_KEY,
    ACESSO DMN_LOGICO)
as
begin
  if (not exists(
    Select
      s.sis_cod
    from SYS_SISTEMA s
    where s.sis_cod = :sis_codigo
  )) then
    Exit;

  if (not exists(
    Select
      f.cod
    from TBFUNCAO f
    where f.cod = :fun_codigo
  )) then
    Exit;

  if (not exists(
    Select
      r.rot_cod
    from SYS_ROTINA r
    where r.rot_cod = :rot_codigo
  )) then
    Exit;

  if (not exists(
    Select
      fp.sistema
    from SYS_FUNCAO_PERMISSAO fp
    where fp.sistema = :sis_codigo
      and fp.funcao  = :fun_codigo
      and fp.rotina  = :rot_codigo
  )) then
    Insert Into SYS_FUNCAO_PERMISSAO values (:sis_codigo, :fun_codigo, :rot_codigo, :acesso);
  else
    Update SYS_FUNCAO_PERMISSAO fp Set
      fp.acesso = :acesso
    where fp.sistema = :sis_codigo
      and fp.funcao  = :fun_codigo
      and fp.rotina  = :rot_codigo;
end^

SET TERM ; ^

COMMENT ON PARAMETER SET_FUNCAO_PERMISSAO.SIS_CODIGO IS
'Sistema';

COMMENT ON PARAMETER SET_FUNCAO_PERMISSAO.FUN_CODIGO IS
'Funcao';

COMMENT ON PARAMETER SET_FUNCAO_PERMISSAO.ROT_CODIGO IS
'Rotina';

COMMENT ON PARAMETER SET_FUNCAO_PERMISSAO.ACESSO IS
'Acesso';




/*------ SYSDBA 13/02/2014 21:07:38 --------*/

ALTER TABLE SYS_SISTEMA
ADD CONSTRAINT UNQ_SYS_SISTEMA
UNIQUE (SIS_NOME);




/*------ SYSDBA 14/02/2014 11:18:26 --------*/

SET TERM ^ ;

create or alter procedure SET_SISTEMA (
    CODIGO DMN_SMALLINT_NN,
    NOME DMN_VCHAR_100,
    VERSAO DMN_VCHAR_10)
as
begin
  /* Procedure Text */
  suspend;
end^

SET TERM ; ^




/*------ SYSDBA 14/02/2014 14:11:46 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_SISTEMA (
    CODIGO DMN_SMALLINT_NN,
    NOME DMN_VCHAR_100,
    VERSAO DMN_VCHAR_10)
as
begin
  if (not exists(
    Select
      s.sis_cod
    from SYS_SISTEMA s
    where s.sis_cod = :codigo
  )) then
    Insert Into SYS_SISTEMA (
        sis_cod
      , sis_nome
      , sis_versao
    ) values (
        :codigo
      , trim(:nome)
      , trim(:versao)
    );
  else
    Update SYS_SISTEMA s Set
        s.sis_nome   = trim(:nome)
      , s.sis_versao = trim(:versao)
    where s.sis_cod = :codigo;
end^

SET TERM ; ^

GRANT EXECUTE ON PROCEDURE SET_SISTEMA TO "PUBLIC";

/*!!! Error occured !!!
Column does not belong to referenced table.
Dynamic SQL Error.
SQL error code = -206.
Column unknown.
E.RZSOC.
At line 16, column 7.

*/

/*!!! Error occured !!!
Column does not belong to referenced table.
Dynamic SQL Error.
SQL error code = -206.
Column unknown.
VERSION.
At line 2, column 4.

*/

/*!!! Error occured !!!
Invalid token.
Dynamic SQL Error.
SQL error code = -104.
Token unknown - line 2, column 5.
current.

*/

/*!!! Error occured !!!
Invalid token.
Dynamic SQL Error.
SQL error code = -104.
Token unknown - line 2, column 5.
current.

*/



/*------ SYSDBA 14/02/2014 14:20:53 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_SISTEMA (
    CODIGO DMN_SMALLINT_NN,
    NOME DMN_VCHAR_100,
    VERSAO DMN_VCHAR_10)
as
begin
  if (not exists(
    Select
      s.sis_cod
    from SYS_SISTEMA s
    where s.sis_cod = :codigo
  )) then
    Insert Into SYS_SISTEMA (
        sis_cod
      , sis_nome
      , sis_versao
    ) values (
        :codigo
      , trim(:nome)
      , trim(:versao)
    );
  else
    Update SYS_SISTEMA s Set
        s.sis_nome   = trim(:nome)
      , s.sis_versao = trim(:versao)
    where s.sis_cod = :codigo;
end^

SET TERM ; ^

COMMENT ON PARAMETER SET_SISTEMA.CODIGO IS
'Codigo';

COMMENT ON PARAMETER SET_SISTEMA.NOME IS
'Nome do Sistema';

COMMENT ON PARAMETER SET_SISTEMA.VERSAO IS
'Versao';




/*------ SYSDBA 14/02/2014 14:21:37 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_FUNCAO_PERMISSAO (
    SIS_CODIGO DMN_SMALLINT_NN,
    FUN_CODIGO DMN_SMALLINT_NN,
    ROT_CODIGO DMN_VCHAR_10_KEY,
    ACESSO DMN_LOGICO)
as
begin
  if (not exists(
    Select
      s.sis_cod
    from SYS_SISTEMA s
    where s.sis_cod = :sis_codigo
  )) then
    Exit;

  if (not exists(
    Select
      f.cod
    from TBFUNCAO f
    where f.cod = :fun_codigo
  )) then
    Exit;

  if (not exists(
    Select
      r.rot_cod
    from SYS_ROTINA r
    where r.rot_cod = :rot_codigo
  )) then
    Exit;

  if (not exists(
    Select
      fp.sistema
    from SYS_FUNCAO_PERMISSAO fp
    where fp.sistema = :sis_codigo
      and fp.funcao  = :fun_codigo
      and fp.rotina  = :rot_codigo
  )) then
    Insert Into SYS_FUNCAO_PERMISSAO values (:sis_codigo, :fun_codigo, :rot_codigo, :acesso);
  else
    Update SYS_FUNCAO_PERMISSAO fp Set
      fp.acesso = :acesso
    where fp.sistema = :sis_codigo
      and fp.funcao  = :fun_codigo
      and fp.rotina  = :rot_codigo;
end^

SET TERM ; ^

COMMENT ON PARAMETER SET_FUNCAO_PERMISSAO.SIS_CODIGO IS
'Codigo do Sistema';

COMMENT ON PARAMETER SET_FUNCAO_PERMISSAO.FUN_CODIGO IS
'Codigo da Funcao';

COMMENT ON PARAMETER SET_FUNCAO_PERMISSAO.ROT_CODIGO IS
'Codigo da Rotina';

COMMENT ON PARAMETER SET_FUNCAO_PERMISSAO.ACESSO IS
'Permissao de Acesso (0 - Nao, 1 - Sim)';




/*------ SYSDBA 14/02/2014 14:21:41 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_SISTEMA (
    CODIGO DMN_SMALLINT_NN,
    NOME DMN_VCHAR_100,
    VERSAO DMN_VCHAR_10)
as
begin
  if (not exists(
    Select
      s.sis_cod
    from SYS_SISTEMA s
    where s.sis_cod = :codigo
  )) then
    Insert Into SYS_SISTEMA (
        sis_cod
      , sis_nome
      , sis_versao
    ) values (
        :codigo
      , trim(:nome)
      , trim(:versao)
    );
  else
    Update SYS_SISTEMA s Set
        s.sis_nome   = trim(:nome)
      , s.sis_versao = trim(:versao)
    where s.sis_cod = :codigo;
end^

SET TERM ; ^

COMMENT ON PARAMETER SET_SISTEMA.CODIGO IS
'Codigo';

COMMENT ON PARAMETER SET_SISTEMA.NOME IS
'Nome do Sistema';

COMMENT ON PARAMETER SET_SISTEMA.VERSAO IS
'Versao';




/*------ SYSDBA 14/02/2014 14:30:00 --------*/

SET TERM ^ ;

create or alter procedure SET_ROTINA (
    CODIGO DMN_VCHAR_10,
    TIPO DMN_SMALLINT_N,
    DESCRICAO DMN_VCHAR_250,
    ROTINA_PAI DMN_VCHAR_10)
as
begin
  if (not exists(
    Select
      r.rot_cod
    from SYS_ROTINA r
    where r.rot_cod = trim(:codigo)
  )) then
    Insert Into SYS_ROTINA (
        rot_cod
      , rot_tipo
      , rot_descricao
      , rot_cod_pai
    ) values (
        trim(:codigo)
      , coalesce(:tipo, 0)
      , trim(:descricao)
      , case when trim(:rotina_pai) = '' then trim(:rotina_pai) else null end
    );
  else
    Update SYS_ROTINA r Set
        r.rot_tipo      = coalesce(:tipo, 0)
      , r.rot_descricao = trim(:descricao)
      , r.rot_cod_pai   = case when trim(:rotina_pai) = '' then trim(:rotina_pai) else null end
    where r.rot_cod = trim(:codigo);
end^

SET TERM ; ^

GRANT EXECUTE ON PROCEDURE SET_ROTINA TO "PUBLIC";



/*------ SYSDBA 14/02/2014 16:12:54 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_ROTINA (
    CODIGO DMN_VCHAR_10,
    TIPO DMN_SMALLINT_N,
    DESCRICAO DMN_VCHAR_250,
    ROTINA_PAI DMN_VCHAR_10)
as
begin
  if (not exists(
    Select
      r.rot_cod
    from SYS_ROTINA r
    where r.rot_cod = trim(:rotina_pai)
  )) then
    rotina_pai = '';

  if (not exists(
    Select
      r.rot_cod
    from SYS_ROTINA r
    where r.rot_cod = trim(:codigo)
  )) then
    Insert Into SYS_ROTINA (
        rot_cod
      , rot_tipo
      , rot_descricao
      , rot_cod_pai
    ) values (
        trim(:codigo)
      , coalesce(:tipo, 0)
      , trim(:descricao)
      , case when trim(:rotina_pai) = '' then trim(:rotina_pai) else null end
    );
  else
    Update SYS_ROTINA r Set
        r.rot_tipo      = coalesce(:tipo, 0)
      , r.rot_descricao = trim(:descricao)
      , r.rot_cod_pai   = case when trim(:rotina_pai) = '' then trim(:rotina_pai) else null end
    where r.rot_cod = trim(:codigo);
end^

SET TERM ; ^




/*------ SYSDBA 17/02/2014 11:29:36 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_ROTINA (
    CODIGO DMN_VCHAR_10,
    TIPO DMN_SMALLINT_N,
    DESCRICAO DMN_VCHAR_250,
    ROTINA_PAI DMN_VCHAR_10)
as
begin
  if (not exists(
    Select
      r.rot_cod
    from SYS_ROTINA r
    where r.rot_cod = trim(:rotina_pai)
  )) then
    rotina_pai = '';

  if (not exists(
    Select
      r.rot_cod
    from SYS_ROTINA r
    where r.rot_cod = trim(:codigo)
  )) then
    Insert Into SYS_ROTINA (
        rot_cod
      , rot_tipo
      , rot_descricao
      , rot_cod_pai
    ) values (
        trim(:codigo)
      , coalesce(:tipo, 0)
      , trim(:descricao)
      , case when trim(:rotina_pai) <> '' then trim(:rotina_pai) else null end
    );
  else
    Update SYS_ROTINA r Set
        r.rot_tipo      = coalesce(:tipo, 0)
      , r.rot_descricao = trim(:descricao)
      , r.rot_cod_pai   = case when trim(:rotina_pai) <> '' then trim(:rotina_pai) else null end
    where r.rot_cod = trim(:codigo);
end^

SET TERM ; ^




/*------ SYSDBA 05/03/2014 19:05:20 --------*/

ALTER TABLE TBCFOP
    ADD CFOP_CST_PADRAO_ENTRADA DMN_VCHAR_03,
    ADD CFOP_CST_PADRAO_SAIDA DMN_VCHAR_03;

COMMENT ON COLUMN TBCFOP.CFOP_CST_PADRAO_ENTRADA IS
'CST Padrao para Entrada de Produtos';

COMMENT ON COLUMN TBCFOP.CFOP_CST_PADRAO_SAIDA IS
'CST Padrao para Saida de Produtos';




/*------ SYSDBA 05/03/2014 19:24:11 --------*/

SET TERM ^ ;

create or alter procedure GET_CST_NORMAL
returns (
    CODIGO varchar(3),
    DESCRICAO varchar(250),
    DESCRICAO_FULL varchar(250))
as
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

      Codigo    = Trim(:codigo_tmp)    || Trim(:Codigo);
      Descricao = Trim(:Descricao) || ' (' || Trim(:descri_tmp) || ')';

      Descricao_Full = :Codigo || ' - ' || :Descricao;

      suspend;

    end 

  end 
end ^

SET TERM ; ^

GRANT EXECUTE ON PROCEDURE GET_CST_NORMAL TO "PUBLIC";



/*------ SYSDBA 05/03/2014 19:26:41 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_CST_NORMAL
returns (
    CODIGO varchar(3),
    DESCRICAO varchar(250),
    DESCRICAO_FULL varchar(250))
as
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

SET TERM ; ^




/*------ SYSDBA 14/03/2014 12:09:24 --------*/

SET TERM ^ ;

create or alter procedure GET_ARQUIVO_NFC (
    DATA_INICIAL DMN_DATE,
    DATA_FINAL DMN_DATE,
    TIPO_ARQUIVO DMN_SMALLINT_N,
    CNPJ_EMITENTE DMN_CNPJ,
    STATUS_VENDA DMN_SMALLINT_N)
returns (
    TIPO varchar(2),
    LINHA varchar(250))
as
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

  /* 1. Definir Identifica��o do Arquivo (Cabe�alho) */

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

  /* 2. Definir Identifica��o e Discrimina��o de Valores da Nota Fiscal */

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

end ^

SET TERM ; ^

GRANT EXECUTE ON PROCEDURE GET_ARQUIVO_NFC TO "PUBLIC";



/*------ SYSDBA 14/03/2014 12:37:03 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_ARQUIVO_NFC (
    DATA_INICIAL DMN_DATE,
    DATA_FINAL DMN_DATE,
    TIPO_ARQUIVO DMN_SMALLINT_N,
    CNPJ_EMITENTE DMN_CNPJ,
    STATUS_VENDA DMN_SMALLINT_N)
returns (
    TIPO varchar(2),
    LINHA varchar(250))
as
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

  /* 1. Definir Identifica��o do Arquivo (Cabe�alho) */

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

  /* 2. Definir Identifica��o e Discrimina��o de Valores da Nota Fiscal */

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

end ^

SET TERM ; ^
