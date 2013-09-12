inherited frmGeConfiguracaoEmpresa: TfrmGeConfiguracaoEmpresa
  Left = 523
  Top = 210
  Width = 767
  Height = 495
  ActiveControl = nil
  Caption = 'Configura'#231#245'es da Empresa'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Top = 453
    Width = 751
  end
  inherited Bevel3: TBevel
    Top = 414
    Width = 751
  end
  inherited tlbBotoes: TToolBar
    Top = 418
    Width = 751
  end
  inherited pgcGuias: TPageControl
    Width = 751
    Height = 414
    ActivePage = tbsCadastro
    inherited tbsTabela: TTabSheet
      inherited Bevel4: TBevel
        Top = 319
        Width = 743
      end
      inherited dbgDados: TDBGrid
        Width = 743
        Height = 319
        Columns = <
          item
            Expanded = False
            FieldName = 'EMPRESA'
            Title.Caption = 'CNPJ'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RZSOC'
            Title.Caption = 'Raz'#227'o Social'
            Width = 400
            Visible = True
          end
          item
            Expanded = False
            Visible = False
          end
          item
            Expanded = False
            Visible = False
          end>
      end
      inherited pnlFiltros: TPanel
        Top = 323
        Width = 743
        inherited grpBxFiltro: TGroupBox
          Left = 417
          Width = 322
          inherited lbltFiltrar: TLabel
            Left = 14
            Width = 52
            Caption = 'Empresa:'
          end
          inherited btnFiltrar: TSpeedButton
            Left = 277
          end
          inherited edtFiltrar: TEdit
            Left = 72
            Width = 201
          end
        end
      end
    end
    inherited tbsCadastro: TTabSheet
      inherited Bevel8: TBevel
        Top = 81
        Width = 743
      end
      inherited GrpBxDadosNominais: TGroupBox
        Width = 743
        Height = 81
        Caption = 'Empresa'
        inherited lblCodigo: TLabel
          Width = 30
          Caption = 'CNPJ:'
        end
        object lblEmpresa: TLabel [1]
          Left = 240
          Top = 24
          Width = 64
          Height = 13
          Caption = 'Raz'#227'o Social:'
          FocusControl = dbEmpresa
        end
        inherited dbCodigo: TDBEdit
          Width = 217
          Color = clMoneyGreen
          DataField = 'EMPRESA'
        end
        object dbEmpresa: TDBLookupComboBox
          Left = 240
          Top = 40
          Width = 489
          Height = 21
          DataField = 'EMPRESA'
          DataSource = DtSrcTabela
          DropDownRows = 10
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'CNPJ'
          ListField = 'RZSOC'
          ListSource = dtsEmpresa
          ParentFont = False
          TabOrder = 1
        end
      end
      object pgcConfigurar: TPageControl
        Left = 0
        Top = 85
        Width = 743
        Height = 300
        ActivePage = tbsContaEmail
        Align = alClient
        TabOrder = 1
        object tbsContaEmail: TTabSheet
          Caption = 'Conta de E-mail'
          object lblEmailConta: TLabel
            Left = 16
            Top = 8
            Width = 32
            Height = 13
            Caption = 'E-mail:'
            FocusControl = dbEmailConta
          end
          object lblEmailSenha: TLabel
            Left = 312
            Top = 8
            Width = 34
            Height = 13
            Caption = 'Senha:'
            FocusControl = dbEmailSenha
          end
          object lblEmailPOP: TLabel
            Left = 16
            Top = 48
            Width = 67
            Height = 13
            Caption = 'Servidor POP:'
            FocusControl = dbEmailPOP
          end
          object lblEmailSMTP: TLabel
            Left = 224
            Top = 48
            Width = 73
            Height = 13
            Caption = 'Servidor SMTP:'
            FocusControl = dbEmailSMTP
          end
          object lblEmailPorta: TLabel
            Left = 432
            Top = 48
            Width = 30
            Height = 13
            Caption = 'Porta:'
            FocusControl = dbEmailPorta
          end
          object dbEmailConta: TDBEdit
            Left = 16
            Top = 24
            Width = 289
            Height = 21
            CharCase = ecLowerCase
            DataField = 'EMAIL_CONTA'
            DataSource = DtSrcTabela
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object dbEmailSenha: TDBEdit
            Left = 312
            Top = 24
            Width = 177
            Height = 21
            DataField = 'EMAIL_SENHA'
            DataSource = DtSrcTabela
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            PasswordChar = '*'
            TabOrder = 1
          end
          object dbEmailPOP: TDBEdit
            Left = 16
            Top = 64
            Width = 201
            Height = 21
            CharCase = ecLowerCase
            DataField = 'EMAIL_POP'
            DataSource = DtSrcTabela
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object dbEmailSMTP: TDBEdit
            Left = 224
            Top = 64
            Width = 201
            Height = 21
            CharCase = ecLowerCase
            DataField = 'EMAIL_SMTP'
            DataSource = DtSrcTabela
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
          end
          object dbEmailPorta: TDBEdit
            Left = 432
            Top = 64
            Width = 57
            Height = 21
            DataField = 'EMAIL_SMTP_PORTA'
            DataSource = DtSrcTabela
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
          end
          object dbEmailAutentica: TDBCheckBox
            Left = 16
            Top = 88
            Width = 201
            Height = 17
            Caption = 'Servidor requer autentica'#231#227'o'
            DataField = 'EMAIL_REQUER_AUTENTICACAO'
            DataSource = DtSrcTabela
            TabOrder = 5
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbEmailConexaoSSL: TDBCheckBox
            Left = 16
            Top = 112
            Width = 201
            Height = 17
            Caption = 'Conex'#227'o Segura (SSL)'
            DataField = 'EMAIL_CONEXAO_SSL'
            DataSource = DtSrcTabela
            TabOrder = 6
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
      end
    end
  end
  inherited IbDtstTabela: TIBDataSet
    SelectSQL.Strings = (
      'Select'
      '    c.empresa'
      '  , c.email_conta'
      '  , c.email_senha'
      '  , c.email_pop'
      '  , c.email_smtp'
      '  , c.email_smtp_porta'
      '  , c.email_requer_autenticacao'
      '  , c.email_conexao_ssl'
      '  , c.email_assunto_padrao'
      '  , c.email_mensagem_padrao'
      '  , e.rzsoc'
      '  , e.nmfant'
      'from TBCONFIGURACAO c'
      '  inner join TBEMPRESA e on (e.cnpj = c.empresa)'
      '')
    object IbDtstTabelaEMPRESA: TIBStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      Origin = '"TBCONFIGURACAO"."EMPRESA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      OnGetText = IbDtstTabelaEMPRESAGetText
      Size = 18
    end
    object IbDtstTabelaEMAIL_CONTA: TIBStringField
      DisplayLabel = 'Conta de E-mail'
      FieldName = 'EMAIL_CONTA'
      Origin = '"TBCONFIGURACAO"."EMAIL_CONTA"'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object IbDtstTabelaEMAIL_SENHA: TIBStringField
      DisplayLabel = 'Senha da Conta de e-mail'
      FieldName = 'EMAIL_SENHA'
      Origin = '"TBCONFIGURACAO"."EMAIL_SENHA"'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object IbDtstTabelaEMAIL_POP: TIBStringField
      DisplayLabel = 'Servidor POP'
      FieldName = 'EMAIL_POP'
      Origin = '"TBCONFIGURACAO"."EMAIL_POP"'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object IbDtstTabelaEMAIL_SMTP: TIBStringField
      DisplayLabel = 'Servidor SMTP'
      FieldName = 'EMAIL_SMTP'
      Origin = '"TBCONFIGURACAO"."EMAIL_SMTP"'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object IbDtstTabelaEMAIL_SMTP_PORTA: TIntegerField
      DisplayLabel = 'Porta'
      FieldName = 'EMAIL_SMTP_PORTA'
      Origin = '"TBCONFIGURACAO"."EMAIL_SMTP_PORTA"'
      ProviderFlags = [pfInUpdate]
    end
    object IbDtstTabelaEMAIL_REQUER_AUTENTICACAO: TSmallintField
      FieldName = 'EMAIL_REQUER_AUTENTICACAO'
      Origin = '"TBCONFIGURACAO"."EMAIL_REQUER_AUTENTICACAO"'
      ProviderFlags = [pfInUpdate]
    end
    object IbDtstTabelaEMAIL_CONEXAO_SSL: TSmallintField
      FieldName = 'EMAIL_CONEXAO_SSL'
      Origin = '"TBCONFIGURACAO"."EMAIL_CONEXAO_SSL"'
      ProviderFlags = [pfInUpdate]
    end
    object IbDtstTabelaEMAIL_ASSUNTO_PADRAO: TIBStringField
      FieldName = 'EMAIL_ASSUNTO_PADRAO'
      Origin = '"TBCONFIGURACAO"."EMAIL_ASSUNTO_PADRAO"'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object IbDtstTabelaEMAIL_MENSAGEM_PADRAO: TIBStringField
      FieldName = 'EMAIL_MENSAGEM_PADRAO'
      Origin = '"TBCONFIGURACAO"."EMAIL_MENSAGEM_PADRAO"'
      ProviderFlags = [pfInUpdate]
      Size = 250
    end
    object IbDtstTabelaRZSOC: TIBStringField
      FieldName = 'RZSOC'
      Origin = '"TBEMPRESA"."RZSOC"'
      ProviderFlags = []
      Size = 60
    end
    object IbDtstTabelaNMFANT: TIBStringField
      FieldName = 'NMFANT'
      Origin = '"TBEMPRESA"."NMFANT"'
      ProviderFlags = []
      Size = 25
    end
  end
  inherited IbUpdTabela: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  EMPRESA,'
      '  EMAIL_CONTA,'
      '  EMAIL_SENHA,'
      '  EMAIL_POP,'
      '  EMAIL_SMTP,'
      '  EMAIL_ASSUNTO_PADRAO,'
      '  EMAIL_MENSAGEM_PADRAO'
      'from TBCONFIGURACAO '
      'where'
      '  EMPRESA = :EMPRESA')
    ModifySQL.Strings = (
      'update TBCONFIGURACAO'
      'set'
      '  EMAIL_ASSUNTO_PADRAO = :EMAIL_ASSUNTO_PADRAO,'
      '  EMAIL_CONTA = :EMAIL_CONTA,'
      '  EMAIL_MENSAGEM_PADRAO = :EMAIL_MENSAGEM_PADRAO,'
      '  EMAIL_POP = :EMAIL_POP,'
      '  EMAIL_SENHA = :EMAIL_SENHA,'
      '  EMAIL_SMTP = :EMAIL_SMTP,'
      '  EMPRESA = :EMPRESA'
      'where'
      '  EMPRESA = :OLD_EMPRESA')
    InsertSQL.Strings = (
      'insert into TBCONFIGURACAO'
      
        '  (EMAIL_ASSUNTO_PADRAO, EMAIL_CONTA, EMAIL_MENSAGEM_PADRAO, EMA' +
        'IL_POP, '
      '   EMAIL_SENHA, EMAIL_SMTP, EMPRESA)'
      'values'
      
        '  (:EMAIL_ASSUNTO_PADRAO, :EMAIL_CONTA, :EMAIL_MENSAGEM_PADRAO, ' +
        ':EMAIL_POP, '
      '   :EMAIL_SENHA, :EMAIL_SMTP, :EMPRESA)')
    DeleteSQL.Strings = (
      'delete from TBCONFIGURACAO'
      'where'
      '  EMPRESA = :OLD_EMPRESA')
  end
  object tblEmpresa: TIBTable
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    TableName = 'TBEMPRESA'
    Left = 656
    Top = 208
  end
  object dtsEmpresa: TDataSource
    DataSet = tblEmpresa
    Left = 688
    Top = 208
  end
  object qryConfiguracoes: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    SQL.Strings = (
      'Select'
      '  c.Empresa'
      'from TBCONFIGURACAO c'
      'where c.empresa = :empresa')
    Left = 656
    Top = 240
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'empresa'
        ParamType = ptUnknown
      end>
  end
end
