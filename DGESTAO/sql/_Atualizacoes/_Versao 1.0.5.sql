


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

