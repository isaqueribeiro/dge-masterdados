inherited frmGeCidade: TfrmGeCidade
  Left = 497
  Top = 273
  Caption = 'Tabela de Cidades (Munic'#237'pios)'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcGuias: TPageControl
    inherited tbsTabela: TTabSheet
      inherited dbgDados: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'CID_COD'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CID_NOME'
            Width = 350
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EST_NOME'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EST_SIGLA'
            Width = 40
            Visible = True
          end>
      end
      inherited pnlFiltros: TPanel
        inherited grpBxFiltro: TGroupBox
          inherited lbltFiltrar: TLabel
            Caption = 'Cidade:'
          end
        end
      end
    end
    inherited tbsCadastro: TTabSheet
      inherited GrpBxDadosNominais: TGroupBox
        object lblNome: TLabel [1]
          Left = 88
          Top = 24
          Width = 31
          Height = 13
          Caption = 'Nome:'
        end
        object lblBGE: TLabel [2]
          Left = 432
          Top = 24
          Width = 27
          Height = 13
          Caption = 'IBGE:'
        end
        object lblSIAFI: TLabel [3]
          Left = 536
          Top = 24
          Width = 31
          Height = 13
          Caption = 'SIAFI:'
        end
        object lblEstado: TLabel [4]
          Left = 16
          Top = 64
          Width = 37
          Height = 13
          Caption = 'Estado:'
        end
        object lblDDD: TLabel [5]
          Left = 640
          Top = 24
          Width = 25
          Height = 13
          Caption = 'DDD:'
        end
        object lblCEPInicial: TLabel [6]
          Left = 432
          Top = 64
          Width = 82
          Height = 13
          Caption = 'Faixa Inicial CEP:'
        end
        object lblCEPFinal: TLabel [7]
          Left = 536
          Top = 64
          Width = 77
          Height = 13
          Caption = 'Faixa Final CEP:'
        end
        inherited dbCodigo: TDBEdit
          Color = clMoneyGreen
          DataField = 'CID_COD'
        end
        object dbNome: TDBEdit
          Left = 88
          Top = 40
          Width = 337
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CID_NOME'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object dbIBGE: TDBEdit
          Left = 432
          Top = 40
          Width = 97
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CID_IBGE'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object dbSIAFI: TDBEdit
          Left = 536
          Top = 40
          Width = 97
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CID_SIAFI'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
        object dbEstado: TRxDBComboEdit
          Left = 16
          Top = 80
          Width = 409
          Height = 21
          ButtonHint = 'Pesquisar Estado (Ctrl+P)'
          CharCase = ecUpperCase
          ClickKey = 16464
          Color = clMoneyGreen
          DataField = 'EST_NOME'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000000000000000000000000000000000001DE6B51DE6B5
            1DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B5B1AD
            AC203040ACA5A21DE6B5C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7FACA5A2C3C3C31DE6B5B0A090
            6048306048306048306048306048306048306048306048306048305048403050
            604078C0304860B1ACA6C3C3C37F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
            7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3B1ACA61DE6B5B0A090
            FFFFFFB0A090B0A090B0A090B0A090B0A090B0A090B0A0909088803050703080
            D04098E050B0F0506870C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C39088807F7F7FC3C3C3C3C3C3C3C3C37F7F7F1DE6B5B0A090
            FFFFFFFFFFFFFFF8FFF0F0F0D0D8D090989070686060686050586040709040A0
            E060C8FF7090A0C5BEB5C3C3C37F7F7FFFFFFFFFFFFFFFF8FFF0F0F0D0D8D07F
            7F7F7F7F7F7F7F7F505860C3C3C3C3C3C3C3C3C37090A0C5BEB51DE6B5B0A090
            FFFFFFFFFFFFFFFFFFE0E0E0909090B0A8A0D0C0B0D0B0A08078705058506090
            B07098B0AEAEAA1DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFE0E0E07F7F7F7F
            7F7FD0C0B0D0B0A0807870505850C3C3C37098B0AEAEAAC3C3C31DE6B5B0A090
            FFFFFFFFFFFFFFFFFFB0B0B0C0B8B0FFF0E0FFE8E0F0D8C0F0D0B08078709D8F
            8CAEAFAA1DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFF
            F0E0FFE8E0F0D8C0F0D0B08078709D8F8CAEAFAAC3C3C3C3C3C31DE6B5C0A890
            FFFFFFFFFFFFFFFFFFA09890F0E8E0FFF8F0FFF0F0FFE8E0F0D8D0D0B0A06367
            5E1DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFF
            F8F0FFF0F0FFE8E0F0D8D0D0B0A063675EC3C3C3C3C3C3C3C3C31DE6B5C0A8A0
            FFFFFFFFFFFFFFFFFFA0A090F0E8E0FFFFFFFFF8F0FFF0F0FFE8E0E0C0B0716E
            6C1DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFF
            FFFFFFF8F0FFF0F0FFE8E0E0C0B0716E6CC3C3C3C3C3C3C3C3C31DE6B5C0B0A0
            FFFFFFFFFFFFFFFFFFC0C8C0C0C0C0FFFFFFFFFFFFFFF8F0FFF0E0B0A090A69C
            951DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFF
            FFFFFFFFFFFFF8F0FFF0E0B0A090A69C95C3C3C3C3C3C3C3C3C31DE6B5D0B0A0
            FFFFFFFFFFFFFFFFFFF0F8FFC0B8B0C0C0C0F0E8E0F0E8E0B0B0A07070601DE6
            B51DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFF0F8FF7F7F7F7F
            7F7FF0E8E0F0E8E0B0B0A0707060C3C3C3C3C3C3C3C3C3C3C3C31DE6B5D0B8A0
            FFFFFFFFFFFFFFFFFFFFFFFFF0F8FFC0C8C0A0A0909090809090906050401DE6
            B51DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFFFFFFFF0F8FF7F
            7F7FA0A0907F7F7F909090605040C3C3C3C3C3C3C3C3C3C3C3C31DE6B5D0B8B0
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0A0906048306048306048301DE6
            B51DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF7F7F7F604830604830604830C3C3C3C3C3C3C3C3C3C3C3C31DE6B5D0C0B0
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A890D0C8C06048301DE6B51DE6
            B51DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF7F7F7FC3C3C3604830C3C3C3C3C3C3C3C3C3C3C3C3C3C3C31DE6B5E0C0B0
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A8A0604830E0C6B71DE6B51DE6
            B51DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C31DE6B5E0C0B0
            E0C0B0E0C0B0E0C0B0E0C0B0D0C0B0D0B8B0D0B0A0E0C7B91DE6B51DE6B51DE6
            B51DE6B51DE6B51DE6B5C3C3C37F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
            7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C31DE6B51DE6B5
            1DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6
            B51DE6B51DE6B51DE6B5C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3}
          NumGlyphs = 2
          ParentFont = False
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          TabOrder = 5
          OnButtonClick = dbEstadoButtonClick
        end
        object dbDDD: TDBEdit
          Left = 640
          Top = 40
          Width = 49
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CID_DDD'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
        end
        object dbCEPInicial: TDBEdit
          Left = 432
          Top = 80
          Width = 97
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CID_CEP_INICIAL'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
        end
        object dbCEPFinal: TDBEdit
          Left = 536
          Top = 80
          Width = 97
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CID_CEP_FINAL'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
        end
      end
    end
  end
  inherited IbDtstTabela: TIBDataSet
    OnNewRecord = IbDtstTabelaNewRecord
    SelectSQL.Strings = (
      'Select'
      '    c.Cid_cod'
      '  , c.Cid_nome'
      '  , c.Est_cod'
      '  , c.Cid_siafi'
      '  , c.Cid_ibge'
      '  , c.Cid_ddd'
      '  , c.Cid_cep_inicial'
      '  , c.Cid_cep_final'
      '  , e.Est_nome'
      '  , e.Est_sigla'
      'from TBCIDADE c'
      '  inner join TBESTADO e on (e.Est_cod = c.Est_cod)'
      '')
    GeneratorField.Field = 'CID_COD'
    GeneratorField.Generator = 'GEN_CIDADE_ID'
    object IbDtstTabelaCID_COD: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CID_COD'
      Origin = 'TBCIDADE.CID_COD'
      Required = True
    end
    object IbDtstTabelaCID_NOME: TIBStringField
      DisplayLabel = 'Nome'
      FieldName = 'CID_NOME'
      Origin = 'TBCIDADE.CID_NOME'
      Size = 100
    end
    object IbDtstTabelaEST_COD: TSmallintField
      DisplayLabel = 'Estado'
      FieldName = 'EST_COD'
      Origin = 'TBCIDADE.EST_COD'
      Required = True
    end
    object IbDtstTabelaCID_SIAFI: TIntegerField
      DisplayLabel = 'SIAFI'
      FieldName = 'CID_SIAFI'
      Origin = 'TBCIDADE.CID_SIAFI'
    end
    object IbDtstTabelaCID_IBGE: TIntegerField
      DisplayLabel = 'IBGE'
      FieldName = 'CID_IBGE'
      Origin = 'TBCIDADE.CID_IBGE'
    end
    object IbDtstTabelaCID_DDD: TSmallintField
      DisplayLabel = 'DDD'
      FieldName = 'CID_DDD'
      Origin = 'TBCIDADE.CID_DDD'
    end
    object IbDtstTabelaCID_CEP_INICIAL: TIntegerField
      DisplayLabel = 'CEP Inicial'
      FieldName = 'CID_CEP_INICIAL'
      Origin = 'TBCIDADE.CID_CEP_INICIAL'
      EditFormat = '00.000-000;0; '
    end
    object IbDtstTabelaCID_CEP_FINAL: TIntegerField
      DisplayLabel = 'CEP Final'
      FieldName = 'CID_CEP_FINAL'
      Origin = 'TBCIDADE.CID_CEP_FINAL'
      EditFormat = '00.000-000;0; '
    end
    object IbDtstTabelaEST_NOME: TIBStringField
      DisplayLabel = 'Estado'
      FieldName = 'EST_NOME'
      Origin = 'TBESTADO.EST_NOME'
      Size = 100
    end
    object IbDtstTabelaEST_SIGLA: TIBStringField
      DisplayLabel = 'UF'
      FieldName = 'EST_SIGLA'
      Origin = 'TBESTADO.EST_SIGLA'
      Size = 2
    end
  end
  inherited IbUpdTabela: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  CID_COD,'
      '  CID_NOME,'
      '  EST_COD,'
      '  CID_SIAFI,'
      '  CID_IBGE'
      'from TBCIDADE '
      'where'
      '  CID_COD = :CID_COD')
    ModifySQL.Strings = (
      'update TBCIDADE'
      'set'
      '  CID_COD = :CID_COD,'
      '  CID_NOME = :CID_NOME,'
      '  EST_COD = :EST_COD,'
      '  CID_SIAFI = :CID_SIAFI,'
      '  CID_IBGE = :CID_IBGE'
      'where'
      '  CID_COD = :OLD_CID_COD')
    InsertSQL.Strings = (
      'insert into TBCIDADE'
      '  (CID_COD, CID_NOME, EST_COD, CID_SIAFI, CID_IBGE)'
      'values'
      '  (:CID_COD, :CID_NOME, :EST_COD, :CID_SIAFI, :CID_IBGE)')
    DeleteSQL.Strings = (
      'delete from TBCIDADE'
      'where'
      '  CID_COD = :OLD_CID_COD')
  end
end
