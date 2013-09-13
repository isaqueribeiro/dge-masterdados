object DMBusiness: TDMBusiness
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  Left = 431
  Top = 187
  Height = 426
  Width = 706
  object ibdtbsBusiness: TIBDatabase
    DatabaseName = 'localhost:BUSINESS'
    Params.Strings = (
      'user_name=SYSDBA'
      'Password=masterkey'
      'lc_ctype=ISO8859_2')
    LoginPrompt = False
    DefaultTransaction = ibtrnsctnBusiness
    Left = 40
    Top = 8
  end
  object ibtrnsctnBusiness: TIBTransaction
    DefaultDatabase = ibdtbsBusiness
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saCommit
    Left = 40
    Top = 64
  end
  object dtsrcAjustEstoq: TDataSource
    DataSet = ibdtstAjustEstoq
    Left = 144
    Top = 64
  end
  object ibdtstAjustEstoq: TIBDataSet
    Database = ibdtbsBusiness
    Transaction = ibtrnsctnBusiness
    DeleteSQL.Strings = (
      'delete from TBAJUSTESTOQ'
      'where'
      '  CODPROD = :OLD_CODPROD')
    InsertSQL.Strings = (
      'insert into TBAJUSTESTOQ'
      
        '  (CODPROD, CODFORN, QTDEATUAL, QTDENOVA, QTDEFINAL, MOTIVO, DOC' +
        ', DTAJUST)'
      'values'
      
        '  (:CODPROD, :CODFORN, :QTDEATUAL, :QTDENOVA, :QTDEFINAL, :MOTIV' +
        'O, :DOC, '
      '   :DTAJUST)')
    RefreshSQL.Strings = (
      'Select '
      '  CODPROD,'
      '  CODFORN,'
      '  QTDEATUAL,'
      '  QTDENOVA,'
      '  QTDEFINAL,'
      '  MOTIVO,'
      '  DOC,'
      '  DTAJUST'
      'from TBAJUSTESTOQ '
      'where'
      '  CODPROD = :CODPROD')
    SelectSQL.Strings = (
      'select * from TBAJUSTESTOQ')
    ModifySQL.Strings = (
      'update TBAJUSTESTOQ'
      'set'
      '  CODPROD = :CODPROD,'
      '  CODFORN = :CODFORN,'
      '  QTDEATUAL = :QTDEATUAL,'
      '  QTDENOVA = :QTDENOVA,'
      '  QTDEFINAL = :QTDEFINAL,'
      '  MOTIVO = :MOTIVO,'
      '  DOC = :DOC,'
      '  DTAJUST = :DTAJUST'
      'where'
      '  CODPROD = :OLD_CODPROD')
    Left = 144
    Top = 8
    object ibdtstAjustEstoqCODPROD: TIBStringField
      FieldName = 'CODPROD'
      Origin = 'TBAJUSTESTOQ.CODPROD'
      Required = True
      Size = 10
    end
    object ibdtstAjustEstoqCODFORN: TIntegerField
      FieldName = 'CODFORN'
      Origin = 'TBAJUSTESTOQ.CODFORN'
    end
    object ibdtstAjustEstoqQTDEATUAL: TIntegerField
      FieldName = 'QTDEATUAL'
      Origin = 'TBAJUSTESTOQ.QTDEATUAL'
    end
    object ibdtstAjustEstoqQTDENOVA: TIntegerField
      FieldName = 'QTDENOVA'
      Origin = 'TBAJUSTESTOQ.QTDENOVA'
    end
    object ibdtstAjustEstoqQTDEFINAL: TIntegerField
      FieldName = 'QTDEFINAL'
      Origin = 'TBAJUSTESTOQ.QTDEFINAL'
    end
    object ibdtstAjustEstoqMOTIVO: TIBStringField
      FieldName = 'MOTIVO'
      Origin = 'TBAJUSTESTOQ.MOTIVO'
      Size = 40
    end
    object ibdtstAjustEstoqDOC: TIBStringField
      FieldName = 'DOC'
      Origin = 'TBAJUSTESTOQ.DOC'
      Size = 10
    end
    object ibdtstAjustEstoqDTAJUST: TDateTimeField
      FieldName = 'DTAJUST'
      Origin = 'TBAJUSTESTOQ.DTAJUST'
    end
    object ibdtstAjustEstoqLookProdNome: TStringField
      FieldKind = fkLookup
      FieldName = 'LookProdNome'
      LookupDataSet = ibdtstProduto
      LookupKeyFields = 'COD'
      LookupResultField = 'DESCRI'
      KeyFields = 'CODPROD'
      Lookup = True
    end
    object ibdtstAjustEstoqLookProdQtde: TIntegerField
      FieldKind = fkLookup
      FieldName = 'LookProdQtde'
      LookupDataSet = ibdtstProduto
      LookupKeyFields = 'COD'
      LookupResultField = 'QTDE'
      KeyFields = 'CODPROD'
      Lookup = True
    end
    object ibdtstAjustEstoqLookFornec: TStringField
      FieldKind = fkLookup
      FieldName = 'LookFornec'
      LookupDataSet = ibdtstFornec
      LookupKeyFields = 'CODFORN'
      LookupResultField = 'NOMEFORN'
      KeyFields = 'CODFORN'
      Lookup = True
    end
  end
  object ibdtstProduto: TIBDataSet
    Database = ibdtbsBusiness
    Transaction = ibtrnsctnBusiness
    SelectSQL.Strings = (
      'select COD, DESCRI, QTDE from TBPRODUTO'
      'order by cod')
    Left = 232
    Top = 8
  end
  object ibdtstFornec: TIBDataSet
    Database = ibdtbsBusiness
    Transaction = ibtrnsctnBusiness
    SelectSQL.Strings = (
      'select CODFORN, NOMEFORN from TBFORNECEDOR'
      'order by NOMEFORN')
    Left = 312
    Top = 8
  end
  object qryBusca: TIBQuery
    Database = ibdtbsBusiness
    Transaction = ibtrnsctnBusiness
    Left = 232
    Top = 56
  end
  object ibdtstUsers: TIBDataSet
    Database = ibdtbsBusiness
    Transaction = ibtrnsctnBusiness
    DeleteSQL.Strings = (
      'delete from TBUSERS'
      'where'
      '  NOME = :OLD_NOME')
    InsertSQL.Strings = (
      'insert into TBUSERS'
      '  (NOME, SENHA, NOMECOMPLETO, CODFUNCAO, LIMIDESC)'
      'values'
      '  (:NOME, :SENHA, :NOMECOMPLETO, :CODFUNCAO, :LIMIDESC)')
    RefreshSQL.Strings = (
      'Select '
      '  NOME,'
      '  SENHA,'
      '  NOMECOMPLETO,'
      '  CODFUNCAO,'
      '  LIMIDESC'
      'from TBUSERS '
      'where'
      '  NOME = :NOME')
    SelectSQL.Strings = (
      'select * from TBUSERS')
    ModifySQL.Strings = (
      'update TBUSERS'
      'set'
      '  NOME = :NOME,'
      '  SENHA = :SENHA,'
      '  NOMECOMPLETO = :NOMECOMPLETO,'
      '  CODFUNCAO = :CODFUNCAO,'
      '  LIMIDESC = :LIMIDESC'
      'where'
      '  NOME = :OLD_NOME')
    Left = 144
    Top = 120
    object ibdtstUsersNOME: TIBStringField
      FieldName = 'NOME'
      Origin = 'TBUSERS.NOME'
      Required = True
      Size = 12
    end
    object ibdtstUsersSENHA: TIBStringField
      FieldName = 'SENHA'
      Origin = 'TBUSERS.SENHA'
      Required = True
      Size = 16
    end
    object ibdtstUsersNOMECOMPLETO: TIBStringField
      FieldName = 'NOMECOMPLETO'
      Origin = 'TBUSERS.NOMECOMPLETO'
      Required = True
      Size = 60
    end
    object ibdtstUsersCODFUNCAO: TSmallintField
      FieldName = 'CODFUNCAO'
      Origin = 'TBUSERS.CODFUNCAO'
      Required = True
    end
    object ibdtstUsersLIMIDESC: TIBBCDField
      FieldName = 'LIMIDESC'
      Origin = 'TBUSERS.LIMIDESC'
      Precision = 9
      Size = 2
    end
  end
  object EvMsgDialog: TEvMsgDlg
    ButtonFont.Charset = ANSI_CHARSET
    ButtonFont.Color = clWindowText
    ButtonFont.Height = -11
    ButtonFont.Name = 'Tahoma'
    ButtonFont.Style = []
    MessageFont.Charset = DEFAULT_CHARSET
    MessageFont.Color = clWindowText
    MessageFont.Height = -11
    MessageFont.Name = 'MS Sans Serif'
    MessageFont.Style = []
    Left = 312
    Top = 56
  end
  object dtsrcUsers: TDataSource
    DataSet = ibdtstUsers
    Left = 208
    Top = 120
  end
  object raveReport: TRvProject
    Left = 40
    Top = 120
  end
  object IdIPWatch: TIdIPWatch
    Active = True
    HistoryFilename = 'NetWorkActiveDGE.dat'
    Left = 312
    Top = 104
  end
  object qryCaixaAberto: TIBDataSet
    Database = ibdtbsBusiness
    Transaction = ibtrnsctnBusiness
    DeleteSQL.Strings = (
      'delete from TBUSERS'
      'where'
      '  NOME = :OLD_NOME')
    InsertSQL.Strings = (
      'insert into TBUSERS'
      '  (NOME, SENHA, NOMECOMPLETO, CODFUNCAO, LIMIDESC)'
      'values'
      '  (:NOME, :SENHA, :NOMECOMPLETO, :CODFUNCAO, :LIMIDESC)')
    RefreshSQL.Strings = (
      'Select '
      '  NOME,'
      '  SENHA,'
      '  NOMECOMPLETO,'
      '  CODFUNCAO,'
      '  LIMIDESC'
      'from TBUSERS '
      'where'
      '  NOME = :NOME')
    SelectSQL.Strings = (
      'Select'
      '    c.Ano'
      '  , c.Numero'
      '  , c.Usuario'
      '  , c.Data_abertura'
      '  , c.Conta_corrente'
      '  , c.Valor_total_credito'
      '  , c.Valor_total_debito'
      'from GET_CAIXA_ABERTO_DETALHE(:Usuario, :Data, :FormaPagto) c')
    ModifySQL.Strings = (
      'update TBUSERS'
      'set'
      '  NOME = :NOME,'
      '  SENHA = :SENHA,'
      '  NOMECOMPLETO = :NOMECOMPLETO,'
      '  CODFUNCAO = :CODFUNCAO,'
      '  LIMIDESC = :LIMIDESC'
      'where'
      '  NOME = :OLD_NOME')
    Left = 144
    Top = 168
    object qryCaixaAbertoANO: TSmallintField
      FieldName = 'ANO'
      Origin = 'TBCAIXA.ANO'
      Required = True
    end
    object qryCaixaAbertoNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'TBCAIXA.NUMERO'
      Required = True
    end
    object qryCaixaAbertoUSUARIO: TIBStringField
      FieldName = 'USUARIO'
      Origin = 'TBCAIXA.USUARIO'
      Size = 12
    end
    object qryCaixaAbertoDATA_ABERTURA: TDateField
      FieldName = 'DATA_ABERTURA'
      Origin = 'TBCAIXA.DATA_ABERTURA'
    end
    object qryCaixaAbertoCONTA_CORRENTE: TIntegerField
      FieldName = 'CONTA_CORRENTE'
      Origin = 'TBCAIXA.CONTA_CORRENTE'
    end
    object qryCaixaAbertoVALOR_TOTAL_CREDITO: TIBBCDField
      FieldName = 'VALOR_TOTAL_CREDITO'
      Precision = 18
      Size = 2
    end
    object qryCaixaAbertoVALOR_TOTAL_DEBITO: TIBBCDField
      FieldName = 'VALOR_TOTAL_DEBITO'
      Precision = 18
      Size = 2
    end
  end
  object stpCaixaMovimentoREC: TIBStoredProc
    Database = ibdtbsBusiness
    Transaction = ibtrnsctnBusiness
    StoredProcName = 'SET_CAIXA_MOVIMENTO_REC'
    Left = 144
    Top = 216
  end
  object stpCaixaMovimentoPAG: TIBStoredProc
    Database = ibdtbsBusiness
    Transaction = ibtrnsctnBusiness
    StoredProcName = 'SET_CAIXA_MOVIMENTO_PAG'
    Left = 144
    Top = 264
  end
  object stpContaCorrenteSaldo: TIBStoredProc
    Database = ibdtbsBusiness
    Transaction = ibtrnsctnBusiness
    StoredProcName = 'SET_CONTA_CORRENTE_SALDO'
    Left = 144
    Top = 312
  end
  object stpCaixaMovimentoREC_ESTORNO: TIBStoredProc
    Database = ibdtbsBusiness
    Transaction = ibtrnsctnBusiness
    StoredProcName = 'SET_CAIXA_MOVIMENTO_REC_ESTORNO'
    Left = 176
    Top = 216
  end
  object stpCaixaMovimentoPAG_ESTORNO: TIBStoredProc
    Database = ibdtbsBusiness
    Transaction = ibtrnsctnBusiness
    StoredProcName = 'SET_CAIXA_MOVIMENTO_PAG_ESTORNO'
    Left = 176
    Top = 264
  end
  object qryEvAcessUser: TIBDataSet
    Database = ibdtbsBusiness
    Transaction = ibtrnsctnBusiness
    ForcedRefresh = True
    CachedUpdates = True
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'Select'
      '    ev.form_name'
      '  , ev.object_name'
      '  , ev.consents_string'
      'from TBUSERALLOW ev'
      'where ev.form_name   = :formulario'
      '  and ev.object_name = :objeto')
    ModifySQL.Strings = (
      '')
    UpdateObject = updEvAcessUser
    Left = 376
    Top = 216
    object qryEvAcessUserFORM_NAME: TIBStringField
      FieldName = 'FORM_NAME'
      Origin = '"TBUSERALLOW"."FORM_NAME"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 250
    end
    object qryEvAcessUserOBJECT_NAME: TIBStringField
      FieldName = 'OBJECT_NAME'
      Origin = '"TBUSERALLOW"."OBJECT_NAME"'
      Size = 50
    end
    object qryEvAcessUserCONSENTS_STRING: TMemoField
      FieldName = 'CONSENTS_STRING'
      Origin = '"TBUSERALLOW"."CONSENTS_STRING"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
  end
  object updEvAcessUser: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  FORM_NAME,'
      '  OBJECT_NAME,'
      '  CONSENTS_STRING'
      'from TBUSERALLOW '
      'where'
      '  FORM_NAME = :FORM_NAME')
    ModifySQL.Strings = (
      'update TBUSERALLOW'
      'set'
      '  CONSENTS_STRING = :CONSENTS_STRING,'
      '  FORM_NAME = :FORM_NAME,'
      '  OBJECT_NAME = :OBJECT_NAME'
      'where'
      '  FORM_NAME = :OLD_FORM_NAME')
    InsertSQL.Strings = (
      'insert into TBUSERALLOW'
      '  (CONSENTS_STRING, FORM_NAME, OBJECT_NAME)'
      'values'
      '  (:CONSENTS_STRING, :FORM_NAME, :OBJECT_NAME)')
    DeleteSQL.Strings = (
      'delete from TBUSERALLOW'
      'where'
      '  FORM_NAME = :OLD_FORM_NAME')
    Left = 408
    Top = 216
  end
  object ibqryEmpresa: TIBQuery
    Database = ibdtbsBusiness
    Transaction = ibtrnsctnBusiness
    SQL.Strings = (
      'select CNPJ, NMFANT from TBEMPRESA')
    Left = 312
    Top = 160
    object ibqryEmpresaCNPJ: TIBStringField
      FieldName = 'CNPJ'
      Origin = 'TBEMPRESA.CNPJ'
      Required = True
      Size = 18
    end
    object ibqryEmpresaNMFANT: TIBStringField
      FieldName = 'NMFANT'
      Origin = 'TBEMPRESA.NMFANT'
      Size = 25
    end
  end
  object qryConfiguracoes: TIBQuery
    Database = ibdtbsBusiness
    Transaction = ibtrnsctnBusiness
    SQL.Strings = (
      'Select'
      '    c.empresa as empresa_cnpj'
      '  , e.rzsoc   as empresa_razao'
      '  , e.nmfant  as empresa_fantasia'
      '  , e.ender   as empresa_end'
      '  , e.numero_end  as empresa_end_nro'
      '  , e.complemento as empresa_end_compl'
      '  , e.bairro      as empresa_end_bairro'
      '  , e.cep         as empresa_end_cep'
      '  , e.cidade      as empresa_end_cidade'
      '  , e.uf          as empresa_end_uf'
      
        '  , '#39'+55 ('#39' || substring(e.fone  from 1 for 2) || '#39')'#39' || substri' +
        'ng(e.fone  from 3 for 4) || '#39'.'#39' || substring(e.fone  from 7 for ' +
        '4) as empresa_fone_1'
      
        '  , '#39'+55 ('#39' || substring(e.fone2 from 1 for 2) || '#39')'#39' || substri' +
        'ng(e.fone2 from 3 for 4) || '#39'.'#39' || substring(e.fone2 from 7 for ' +
        '4) as empresa_fone_2'
      '  , e.email       as empresa_email'
      '  , e.home_page   as empresa_homepage'
      '  , c.email_conta'
      '  , c.email_senha'
      '  , c.email_pop'
      '  , c.email_smtp'
      '  , c.email_smtp_porta'
      '  , c.email_requer_autenticacao'
      '  , c.email_conexao_ssl'
      '  , c.email_assunto_padrao'
      '  , c.email_mensagem_padrao'
      'from TBCONFIGURACAO c'
      '  inner join TBEMPRESA e on (e.cnpj = c.empresa)'
      'where c.empresa = :empresa')
    Left = 504
    Top = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'empresa'
        ParamType = ptUnknown
      end>
  end
end
