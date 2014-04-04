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

end ^

SET TERM ; ^




/*------ SYSDBA 03/04/2014 16:55:08 --------*/

CREATE DOMAIN DMN_QUANTIDADE_FRACAO AS
NUMERIC(18,3);COMMENT ON DOMAIN DMN_QUANTIDADE_FRACAO IS 'Quantidade (Com 3 casas decimais de fracao).';




/*------ SYSDBA 03/04/2014 16:55:26 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_QUANTIDADE_D3'
where (RDB$FIELD_NAME = 'QTDE') and
(RDB$RELATION_NAME = 'TVENDASITENS')
;




/*------ SYSDBA 03/04/2014 16:56:49 --------*/

DROP DOMAIN DMN_QUANTIDADE_FRACAO;




/*------ SYSDBA 03/04/2014 16:57:44 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_QUANTIDADE_D3'
where (RDB$FIELD_NAME = 'QTDE') and
(RDB$RELATION_NAME = 'TBPRODUTO')
;




/*------ SYSDBA 03/04/2014 16:57:59 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_QUANTIDADE_D3'
where (RDB$FIELD_NAME = 'RESERVA') and
(RDB$RELATION_NAME = 'TBPRODUTO')
;




/*------ SYSDBA 03/04/2014 16:58:15 --------*/

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
      reserva = 0; -- :reserva - :Quantidade;  -- Descontinuada RESERVA
      estoque = :Estoque - :Quantidade;

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




/*------ SYSDBA 03/04/2014 16:58:59 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_QUANTIDADE_D3'
where (RDB$FIELD_NAME = 'QUANTIDADE') and
(RDB$RELATION_NAME = 'TBCLIENTE_ESTOQUE')
;




/*------ SYSDBA 03/04/2014 16:59:17 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_cliente_requisicao_estoque for tbcliente_requisicao
active before update position 1
AS
  declare variable item       Smallint;
  declare variable produto    Varchar(10);
  declare variable quantidade DMN_QUANTIDADE_D3;
  declare variable estoque    DMN_QUANTIDADE_D3;
begin
  /* 2. AUTORIZADA - Decrementar estoque satelite do cliente quando a requisicao for autorizada  */

  if ( (old.situacao <> new.situacao) and (new.situacao = 2) ) then
  begin
    for
      Select
          i.numero
        , i.codproduto
        , i.quantidade
        , e.quantidade as estoque
      from TBCLIENTE_REQUISICAO_ITEM i
        left join TBCLIENTE_ESTOQUE e on (e.cod_cliente = new.codcliente and e.cod_produto = i.codproduto)
      where i.ano    = new.ano
        and i.numero = new.numero
      Into
          item
        , produto
        , quantidade
        , estoque
    do
    begin

      -- Baixar estoque
      Update TBCLIENTE_ESTOQUE e Set
        e.quantidade = coalesce(:estoque, 0) - coalesce(:quantidade, 0) -- Retirar estoque
      where e.cod_cliente = new.codcliente
        and e.cod_produto = :produto;

      -- Guardar historico estoque satelite
      Update TBCLIENTE_REQUISICAO_ITEM i Set
        i.quantidade_final = coalesce(:estoque, 0) - coalesce(:quantidade, 0)
      where i.ano    = new.ano
        and i.numero = new.numero
        and i.item   = :item;

    end 
  end 

  else

  /* 4. CANCELADA - Incfementar estoque satelite do cliente quando a requisicao for cancelada  */

  if ( (old.situacao <> new.situacao) and (new.situacao = 4) ) then
  begin
    for
      Select
          i.codproduto
        , i.quantidade
        , e.quantidade as estoque
      from TBCLIENTE_REQUISICAO_ITEM i
        left join TBCLIENTE_ESTOQUE e on (e.cod_cliente = new.codcliente and e.cod_produto = i.codproduto)
      where i.ano    = new.ano
        and i.numero = new.numero
      Into
          produto
        , quantidade
        , estoque
    do
    begin

      Update TBCLIENTE_ESTOQUE e Set
        e.quantidade = coalesce(:estoque, 0) + coalesce(:quantidade, 0) -- Devolver estoque
      where e.cod_cliente = new.codcliente
        and e.cod_produto = :produto;

    end 
  end
end^

SET TERM ; ^




/*------ SYSDBA 03/04/2014 16:59:38 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_vendas_estoque_cliente for tbvendas
active after update position 2
AS
  declare variable produto varchar(10);
  declare variable quantidade DMN_QUANTIDADE_D3;
  declare variable estoque    DMN_QUANTIDADE_D3;
  declare variable valor_medio numeric(15,4);
  declare variable valor_venda numeric(15,2);
begin

  /* Gerar Estoque para o Cliente na Finalizacao da Venda */

  if ( (coalesce(old.Status, 0) <> coalesce(new.Status, 0)) and (new.Status = 3)) then /* 3. Finalizada */
  begin
    if ( new.gerar_estoque_cliente = 1 ) then
    begin

      for
        Select
            i.Codprod
          , i.Qtde                    -- Quantidade vendida
          , coalesce(c.quantidade, 0) -- Estoque
          , (coalesce(c.valor_medio, 0) * coalesce(c.quantidade, 0))
          , i.total_liquido
        from TVENDASITENS i
          left join TBCLIENTE_ESTOQUE c on (c.cod_cliente = new.codcliente and c.cod_produto = i.codprod)
        where i.Ano        = new.Ano
          and i.Codcontrol = new.Codcontrol
        into
            produto
          , quantidade
          , estoque
          , valor_medio
          , valor_venda
      do
      begin

        -- Recalcular valor medio ja existente
        if ( :estoque <= 0 ) then
          valor_medio = 0.0;

        -- Gerar novo valor medio
        valor_medio = (:valor_medio + :valor_venda) / (:quantidade + :estoque);

        if (not exists(
          Select
            ec.cod_cliente
          from TBCLIENTE_ESTOQUE ec
          where ec.cod_cliente = new.codcliente
            and ec.cod_produto = :produto
        )) then
        begin

          -- Gerar Estoque
          Insert Into TBCLIENTE_ESTOQUE (
              cod_cliente
            , cod_produto
            , quantidade
            , valor_medio
            , usuario
            , ano_venda_ult
            , cod_venda_ult
          ) values (
              new.codcliente
            , :produto
            , :quantidade
            , :valor_medio
            , new.usuario
            , new.ano
            , new.codcontrol
          );

        end
        else
        begin

          -- Atualizar estoque cliente
          Update TBCLIENTE_ESTOQUE ec Set
              ec.quantidade  = coalesce(:quantidade, 0) + coalesce(:estoque, 0)
            , ec.valor_medio = :valor_medio
          where ec.cod_cliente = new.codcliente
            and ec.cod_produto = :produto;

        end 

      end 

    end
  end

  else

  /* Atualizar Estoque do Cliente no Cancelamento da Venda */

  if ( (coalesce(old.Status, 0) in (3, 4)) and (new.Status = 5)) then /* 5. Cancelada */
  begin

    if ( new.gerar_estoque_cliente = 1 ) then
    begin

      for
        Select
            i.Codprod
          , i.Qtde                    -- Quantidade vendida cancelada
          , coalesce(c.quantidade, 0) -- Estoque
        from TVENDASITENS i
          left join TBCLIENTE_ESTOQUE c on (c.cod_cliente = new.codcliente and c.cod_produto = i.codprod)
        where i.Ano        = new.Ano
          and i.Codcontrol = new.Codcontrol
        into
            produto
          , quantidade
          , estoque
      do
      begin

          -- Atualizar estoque cliente
          Update TBCLIENTE_ESTOQUE ec Set
            ec.quantidade = coalesce(:estoque, 0) - coalesce(:quantidade, 0)
          where ec.cod_cliente = new.codcliente
            and ec.cod_produto = :produto;

      end

    end

  end

end^

SET TERM ; ^




/*------ SYSDBA 03/04/2014 17:00:15 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_QUANTIDADE_D3'
where (RDB$FIELD_NAME = 'QTDEATUAL') and
(RDB$RELATION_NAME = 'TBPRODHIST')
;




/*------ SYSDBA 03/04/2014 17:00:22 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_QUANTIDADE_D3'
where (RDB$FIELD_NAME = 'QTDENOVA') and
(RDB$RELATION_NAME = 'TBPRODHIST')
;




/*------ SYSDBA 03/04/2014 17:00:28 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_QUANTIDADE_D3'
where (RDB$FIELD_NAME = 'QTDEFINAL') and
(RDB$RELATION_NAME = 'TBPRODHIST')
;




/*------ SYSDBA 03/04/2014 17:01:03 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_QUANTIDADE_D3'
where (RDB$FIELD_NAME = 'QTDEANTES') and
(RDB$RELATION_NAME = 'TBCOMPRASITENS')
;




/*------ SYSDBA 03/04/2014 17:01:10 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_QUANTIDADE_D3'
where (RDB$FIELD_NAME = 'QTDEFINAL') and
(RDB$RELATION_NAME = 'TBCOMPRASITENS')
;




/*------ SYSDBA 03/04/2014 17:01:51 --------*/

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
          --p.Customedio = Case when :alterar_custo = 1 then :Custo_medio else p.Customedio end
          p.Customedio = Case when :alterar_custo = 1 then :Custo_compra else p.Customedio end
        , p.Qtde       = :Estoque + :Quantidade
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




/*------ SYSDBA 03/04/2014 17:02:07 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_compras_cancelar for tbcompras
active after update position 2
AS
  declare variable produto varchar(10);
  declare variable empresa varchar(18);
  declare variable estoque    DMN_QUANTIDADE_D3;
  declare variable quantidade DMN_QUANTIDADE_D3;
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




/*------ SYSDBA 03/04/2014 17:02:22 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_vendas_cancelar for tbvendas
active after update position 3
AS
  declare variable produto varchar(10);
  declare variable empresa varchar(18);
  declare variable estoque    DMN_QUANTIDADE_D3;
  declare variable quantidade DMN_QUANTIDADE_D3;
  declare variable valor_produto numeric(15,2);
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




/*------ SYSDBA 03/04/2014 17:03:02 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_QUANTIDADE_D3'
where (RDB$FIELD_NAME = 'QTDE') and
(RDB$RELATION_NAME = 'TBCOMPRASITENS')
;




/*------ SYSDBA 03/04/2014 17:35:46 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_QUANTIDADE_D3'
where (RDB$FIELD_NAME = 'QTDEATUAL') and
(RDB$RELATION_NAME = 'TBAJUSTESTOQ')
;




/*------ SYSDBA 03/04/2014 17:35:52 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_QUANTIDADE_D3'
where (RDB$FIELD_NAME = 'QTDENOVA') and
(RDB$RELATION_NAME = 'TBAJUSTESTOQ')
;




/*------ SYSDBA 03/04/2014 17:35:57 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_QUANTIDADE_D3'
where (RDB$FIELD_NAME = 'QTDEFINAL') and
(RDB$RELATION_NAME = 'TBAJUSTESTOQ')
;




/*------ SYSDBA 03/04/2014 17:42:59 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_QUANTIDADE_D3'
where (RDB$FIELD_NAME = 'QTDEFINAL') and
(RDB$RELATION_NAME = 'TVENDASITENS')
;




/*------ SYSDBA 04/04/2014 19:09:43 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_QUANTIDADE_D3'
where (RDB$FIELD_NAME = 'ESTOQMIN') and
(RDB$RELATION_NAME = 'TBPRODUTO')
;




/*------ SYSDBA 04/04/2014 19:30:39 --------*/

CREATE DOMAIN DMN_QUANTIDADE_D3_N AS
NUMERIC(18,3);COMMENT ON DOMAIN DMN_QUANTIDADE_D3_N IS 'Quantidade';

