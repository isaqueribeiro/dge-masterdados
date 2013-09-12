object frmGeRemessaBoleto: TfrmGeRemessaBoleto
  Left = 714
  Top = 230
  Width = 928
  Height = 480
  BorderIcons = [biSystemMenu]
  Caption = 'Remessa Boletos'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 438
    Width = 912
    Height = 4
    Align = alBottom
    Shape = bsSpacer
  end
  object Bevel5: TBevel
    Left = 0
    Top = 399
    Width = 912
    Height = 4
    Align = alBottom
    Shape = bsSpacer
  end
  object pnlFiltro: TPanel
    Left = 0
    Top = 0
    Width = 912
    Height = 81
    Align = alTop
    BevelOuter = bvNone
    BorderWidth = 4
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 4
      Top = 4
      Width = 904
      Height = 73
      Align = alClient
      Caption = 'Dados para gerar arquivo de remessa de boletos'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      DesignSize = (
        904
        73)
      object lblBanco: TLabel
        Left = 8
        Top = 24
        Width = 197
        Height = 13
        Caption = 'Selecionar a entidade financeira (Banco):'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblInicio: TLabel
        Left = 272
        Top = 24
        Width = 57
        Height = 13
        Caption = 'Data Inicial:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblFinal: TLabel
        Left = 376
        Top = 24
        Width = 52
        Height = 13
        Caption = 'Data Final:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblArquivoRemessa: TLabel
        Left = 480
        Top = 24
        Width = 143
        Height = 13
        Caption = 'Nome do arquivo de remessa:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object edBanco: TComboBox
        Left = 8
        Top = 40
        Width = 257
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 0
        Text = '001 - Banco do Brasil'
        OnChange = edBancoChange
        Items.Strings = (
          '001 - Banco do Brasil'
          '341 - Ita'#250)
      end
      object edInicio: TDateTimePicker
        Left = 272
        Top = 40
        Width = 97
        Height = 21
        Date = 40608.000000000000000000
        Time = 40608.000000000000000000
        TabOrder = 1
        OnChange = edInicioChange
      end
      object edFinal: TDateTimePicker
        Left = 376
        Top = 40
        Width = 97
        Height = 21
        Date = 40608.000000000000000000
        Time = 40608.000000000000000000
        TabOrder = 2
        OnChange = edInicioChange
      end
      object edArquivoRemessa: TEdit
        Left = 480
        Top = 40
        Width = 409
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
    end
  end
  object pnlTitulos: TPanel
    Left = 0
    Top = 81
    Width = 912
    Height = 318
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 4
    TabOrder = 1
    object Shape1: TShape
      Left = 4
      Top = 4
      Width = 904
      Height = 20
      Align = alTop
      Brush.Color = clMoneyGreen
      Pen.Color = 9355662
    end
    object Bevel2: TBevel
      Left = 4
      Top = 24
      Width = 904
      Height = 4
      Align = alTop
      Shape = bsSpacer
    end
    object Label5: TLabel
      Left = 8
      Top = 8
      Width = 280
      Height = 13
      Caption = 'Rela'#231#227'o de boletos gerados no per'#237'odo informado'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object dbgTitulos: TDBGrid
      Left = 4
      Top = 28
      Width = 904
      Height = 286
      TabStop = False
      Align = alClient
      DataSource = DtsTitulos
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = [fsBold]
      OnDrawColumnCell = dbgTitulosDrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'NUMLANC'
          Title.Caption = 'N'#250'mero Lanc.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PARCELA'
          Title.Alignment = taCenter
          Title.Caption = 'Parc.'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DTEMISS'
          Title.Alignment = taCenter
          Title.Caption = 'Emiss'#227'o'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DTVENC'
          Title.Alignment = taCenter
          Title.Caption = 'Vencimento'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALORREC'
          Title.Caption = 'Valor Documento'
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PERCENTJUROS'
          Title.Alignment = taCenter
          Title.Caption = '% Juros'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PERCENTMULTA'
          Title.Alignment = taCenter
          Title.Caption = '% Multa'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PERCENTDESCONTO'
          Title.Alignment = taCenter
          Title.Caption = '% Desc.'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CODBANCO'
          Title.Caption = 'Banco'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOSSONUMERO'
          Title.Caption = 'Nosso N'#250'mero'
          Width = 120
          Visible = True
        end>
    end
  end
  object tlbBotoes: TToolBar
    Left = 0
    Top = 403
    Width = 912
    Height = 35
    Align = alBottom
    ButtonHeight = 31
    Caption = #39
    TabOrder = 2
    object Bevel3: TBevel
      Left = 0
      Top = 2
      Width = 4
      Height = 31
      Shape = bsSpacer
    end
    object btnFechar: TBitBtn
      Left = 4
      Top = 2
      Width = 75
      Height = 31
      Caption = '&Fechar'
      TabOrder = 0
      TabStop = False
      OnClick = btnFecharClick
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        180000000000000600000000000000000000000000000000000000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF00D5C5C4958DAF565B932C32752C2B66494878837386C9ABA100FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF00C7C7C79898986B6B6B45
        45453D3D3D5656567A7A7AABABAB00FF0000FF0000FF0000FF0000FF0000FF00
        00FF00AFAABF4853A51038A01030B00030C00030C00028B01020802B275C9783
        8700FF0000FF0000FF0000FF0000FF0000FF00B1B1B16A6A6A53535353535356
        56565656564D4D4D3B3B3B37373786868600FF0000FF0000FF0000FF0000FF00
        B5AEC73C51B21038C00030D00030D00030D00030D00030D00030D00028A00E1B
        6496808300FF0000FF0000FF0000FF00B6B6B66C6C6C5D5D5D5B5B5B5B5B5B5B
        5B5B5B5B5B5B5B5B5B5B5B4848482F2F2F83838300FF0000FF0000FF00D9CCD3
        4862B41040D00038E00038E00038E00038E00038D00030D00030D00030D00028
        A02B265BC5A09200FF0000FF00D0D0D078787866666665656565656565656565
        65656060605B5B5B5B5B5B5B5B5B484848363636A0A0A000FF0000FF009EA3CB
        2050C00038F00040F0FFFFFFFFFFFF4070F04068F0FFFFFFFFFFFF0030D00030
        D01020807F697A00FF0000FF00AFAFAF6D6D6D6A6A6A6E6E6EFFFFFFFFFFFF92
        92928D8D8DFFFFFFFFFFFF5B5B5B5B5B5B3B3B3B70707000FF0000FF006E81C5
        2048E00040FF1048FF7098FFFFFFFFFFFFFFFFFFFFFFFFFF6080F00038D00030
        D00028B047427100FF0000FF00949494727272737373797979B3B3B3FFFFFFFF
        FFFFFFFFFFFFFFFF9F9F9F6060605B5B5B4D4D4D50505000FF0000FF004B68C1
        5070FF5078FF3060FF3060FFB0C8FFFFFFFFFFFFFFA0B8FF0038F00038E00030
        D00030C02C296400FF0000FF008080809898989D9D9D8B8B8B8B8B8BD6D6D6FF
        FFFFFFFFFFCBCBCB6A6A6A6565655B5B5B5656563B3B3B00FF0000FF004B68C1
        5078FF5080FF5078FF4070FFB0C8FFFFFFFFFFFFFFA0B8FF0040FF0038E00038
        D00030C02C317300FF0000FF008080809D9D9DA1A1A19D9D9D969696D6D6D6FF
        FFFFFFFFFFCBCBCB73737365656560606056565644444400FF0000FF006E87D1
        5078F06090FF7090FF90B0FFFFFFFFFFFFFFFFFFFFFFFFFF7098FF0038F00038
        E01030B053548900FF0000FF009B9B9B989898ADADADAEAEAEC5C5C5FFFFFFFF
        FFFFFFFFFFFFFFFFB3B3B36A6A6A65656553535364646400FF0000FF009EA7D3
        4068E07098FF80A0FFFFFFFFFFFFFF80A0FF8098FFFFFFFFFFFFFF0040F00038
        E02038A08F7D9A00FF0000FF00B4B4B4888888B3B3B3BABABAFFFFFFFFFFFFBA
        BABAB5B5B5FFFFFFFFFFFF6E6E6E65656555555588888800FF0000FF00DCCFD6
        5677D06080F080A8FF90B0FF80A0FF6080FF4070FF3060FF1048FF0040F01040
        C04750A1CBABA100FF0000FF00D3D3D38E8E8E9F9F9FBEBEBEC5C5C5BABABAA3
        A3A39696968B8B8B7979796E6E6E616161676767ABABAB00FF0000FF0000FF00
        BBB7D35A76D06080F080A0FF80A8FF8098FF6088FF3060FF1048FF1048D03B4F
        B0A898A700FF0000FF0000FF0000FF00C0C0C08E8E8E9F9F9FBABABABEBEBEB5
        B5B5A8A8A88B8B8B7979796B6B6B6A6A6A9E9E9E00FF0000FF0000FF0000FF00
        00FF00BBB6D16477D05070E05078F05080FF5078FF3060E03050D0475FB0AF9E
        B100FF0000FF0000FF0000FF0000FF0000FF00BFBFBF9090908E8E8E989898A1
        A1A19D9D9D828282737373757575A6A6A600FF0000FF0000FF0000FF0000FF00
        00FF0000FF00DBCCD09DA5CF6E86CF4B67C04B67C06D7EC09B9BBFD2BBB900FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF00CFCFCFB1B1B19A9A9A7F
        7F7F7F7F7F909090A6A6A6BDBDBD00FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00}
      NumGlyphs = 2
    end
    object Bevel4: TBevel
      Left = 79
      Top = 2
      Width = 4
      Height = 31
      Shape = bsSpacer
    end
    object btnGerarRemessa: TBitBtn
      Left = 83
      Top = 2
      Width = 118
      Height = 31
      Caption = '&Gerar Remessa'
      Enabled = False
      TabOrder = 1
      OnClick = btnGerarRemessaClick
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000000000000000000000000000000000000000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FFCDA187E5BC9E0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF9D9D9DB7B7B700
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FFAA7457904820B47657F0CEB30000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF707070434343727272C9
        C9C90000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FFA55839D07850D07040B06030CB91730000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF5656567474746B6B6B5959598D
        8D8D0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        A05030D07850F09060E19C75D08860B96F42D3A4860000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF4E4E4E7474748B8B8B97979783838368
        68689F9F9F0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFA56039
        E08050F09060F3AF8E0000FFF2AA86D08860B46739EBC9AF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF5B5B5B7B7B7B8B8B8BABABAB0000FFA6A6A683
        8383606060C4C4C40000FF0000FF0000FF0000FF0000FF0000FF0000FFF1B698
        F0A890F2AC820000FF0000FF0000FFE6AA86D08860AA6841F2C7B40000FF0000
        FF0000FF0000FF0000FF0000FFB2B2B2A8A8A8A6A6A60000FF0000FF0000FFA5
        A5A5838383626262C5C5C50000FF0000FF0000FF0000FF0000FF0000FFFDE0CD
        F7CEB60000FF0000FF0000FF0000FF0000FFE19C75D07850B47D56F2CCB30000
        FF0000FF0000FF0000FF0000FFDDDDDDCACACA0000FF0000FF0000FF0000FF00
        00FF979797747474767676C8C8C80000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FFE19C74C07040C38C74F1CA
        B00000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF9696966969698A8A8AC6C6C60000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFE29F79C07040D29B
        82EBC3A80000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF9A9A9A696969999999BEBEBE0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFF1AF91C070
        50E4B99B0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FFACACAC6E6E6EB4B4B40000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFF1C1
        A7D291720000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FFBEBEBE8E8E8E0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF}
      NumGlyphs = 2
    end
    object Bevel6: TBevel
      Left = 201
      Top = 2
      Width = 4
      Height = 31
      Shape = bsSpacer
    end
  end
  object IbTblBancos: TIBTable
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    FieldDefs = <
      item
        Name = 'BCO_COD'
        DataType = ftSmallint
      end
      item
        Name = 'BCO_CARTEIRA'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'BCO_NOME'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'BCO_CHAVE'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'BCO_AGENCIA'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'BCO_CC'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'BCO_NOSSO_NUM_INICIO'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'BCO_NOSSO_NUM_FINAL'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'BCO_NOSSO_NUM_PROXIMO'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'BCO_CONFG_1'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'BCO_CONFG_2'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'BCO_SEQUENCIAL_REM'
        DataType = ftInteger
      end
      item
        Name = 'BCO_DIRETORIO_REMESSA'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'BCO_DIRETORIO_RETORNO'
        DataType = ftString
        Size = 100
      end>
    IndexDefs = <
      item
        Name = 'PK_TBBANCO_BOLETO'
        Fields = 'BCO_COD'
        Options = [ixUnique]
      end>
    IndexName = 'PK_TBBANCO_BOLETO'
    StoreDefs = True
    TableName = 'TBBANCO_BOLETO'
    Left = 16
    Top = 232
    object IbTblBancosBCO_COD: TSmallintField
      FieldName = 'BCO_COD'
      ProviderFlags = [pfInUpdate, pfInKey]
    end
    object IbTblBancosBCO_CARTEIRA: TIBStringField
      FieldName = 'BCO_CARTEIRA'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object IbTblBancosBCO_NOME: TIBStringField
      FieldName = 'BCO_NOME'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object IbTblBancosBCO_CHAVE: TIBStringField
      FieldName = 'BCO_CHAVE'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object IbTblBancosBCO_AGENCIA: TIBStringField
      FieldName = 'BCO_AGENCIA'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object IbTblBancosBCO_CC: TIBStringField
      FieldName = 'BCO_CC'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object IbTblBancosBCO_NOSSO_NUM_INICIO: TIBStringField
      FieldName = 'BCO_NOSSO_NUM_INICIO'
      Size = 10
    end
    object IbTblBancosBCO_NOSSO_NUM_FINAL: TIBStringField
      FieldName = 'BCO_NOSSO_NUM_FINAL'
      Size = 10
    end
    object IbTblBancosBCO_NOSSO_NUM_PROXIMO: TIBStringField
      FieldName = 'BCO_NOSSO_NUM_PROXIMO'
      Size = 10
    end
    object IbTblBancosBCO_CONFG_1: TIBStringField
      FieldName = 'BCO_CONFG_1'
    end
    object IbTblBancosBCO_CONFG_2: TIBStringField
      FieldName = 'BCO_CONFG_2'
    end
    object IbTblBancosBCO_SEQUENCIAL_REM: TIntegerField
      FieldName = 'BCO_SEQUENCIAL_REM'
    end
    object IbTblBancosBCO_DIRETORIO_REMESSA: TIBStringField
      FieldName = 'BCO_DIRETORIO_REMESSA'
      Size = 100
    end
    object IbTblBancosBCO_DIRETORIO_RETORNO: TIBStringField
      FieldName = 'BCO_DIRETORIO_RETORNO'
      Size = 100
    end
  end
  object IbQryTitulos: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    SQL.Strings = (
      'Select'
      '    r.anolanc'
      '  , r.numlanc'
      '  , r.parcela'
      '  , r.codbanco'
      '  , r.nossonumero'
      '  , r.cnpj'
      '  , r.tippag'
      '  , r.dtemiss'
      '  , r.dtvenc'
      '  , r.valorrec'
      '  , r.percentjuros'
      '  , r.percentmulta'
      '  , r.percentdesconto'
      '  , r.valorrectot'
      '  , r.valorsaldo'
      '  , r.dataprocessoboleto'
      '  , r.anovenda'
      '  , r.numvenda'
      '  , c.inscest'
      '  , c.nome'
      '  , c.fone'
      '  , c.ender'
      '  , c.bairro'
      '  , c.cidade'
      '  , c.uf'
      '  , c.cep'
      '  , c.email'
      'from TBCONTREC r'
      '  inner join TBCLIENTE c on ( r.cnpj = c.cnpj )'
      'where r.baixado = 0'
      '  and r.enviado = 0'
      '  and r.codbanco = :banco'
      '  and r.dataprocessoboleto between :dataInicial and :dataFinal'
      'order by'
      '    r.numlanc'
      '  , r.parcela')
    UniDirectional = True
    Left = 16
    Top = 264
    ParamData = <
      item
        DataType = ftInteger
        Name = 'banco'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftDateTime
        Name = 'dataInicial'
        ParamType = ptInput
        Value = 0d
      end
      item
        DataType = ftDateTime
        Name = 'dataFinal'
        ParamType = ptInput
        Value = 0d
      end>
  end
  object IbUpdTitulos: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  NUMLANC,'
      '  CNPJ,'
      '  TIPPAG,'
      '  HISTORIC,'
      '  NUMREC,'
      '  DTEMISS,'
      '  DTVENC,'
      '  DTREC,'
      '  DOCBAIX,'
      '  VALORREC,'
      '  VALORMULTA,'
      '  VALORRECTOT,'
      '  NUMCONTRATO,'
      '  PARCELA,'
      '  STATUS,'
      '  CODBANCO,'
      '  NOSSONUMERO,'
      '  VALORSALDO,'
      '  PERCENTJUROS,'
      '  PERCENTMULTA,'
      '  PERCENTDESCONTO,'
      '  DATAPROCESSOBOLETO,'
      '  BAIXADO'
      'from TBCONTREC '
      'where'
      '  NUMLANC = :NUMLANC')
    ModifySQL.Strings = (
      'update TBCONTREC'
      'set'
      '  CODBANCO = :CODBANCO,'
      '  NOSSONUMERO = :NOSSONUMERO,'
      '  DATAPROCESSOBOLETO = :DATAPROCESSOBOLETO'
      'where ANOLANC = :OLD_ANOLANC'
      '  AND NUMLANC = :OLD_NUMLANC')
    InsertSQL.Strings = (
      '')
    Left = 48
    Top = 264
  end
  object DspTitulos: TDataSetProvider
    DataSet = IbQryTitulos
    UpdateMode = upWhereChanged
    Left = 80
    Top = 264
  end
  object CdsTitulos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'banco'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftDateTime
        Name = 'dataInicial'
        ParamType = ptInput
        Value = 0d
      end
      item
        DataType = ftDateTime
        Name = 'dataFinal'
        ParamType = ptInput
        Value = 0d
      end>
    ProviderName = 'DspTitulos'
    Left = 112
    Top = 264
    object CdsTitulosANOLANC: TSmallintField
      FieldName = 'ANOLANC'
      Required = True
    end
    object CdsTitulosNUMLANC: TIntegerField
      Alignment = taCenter
      FieldName = 'NUMLANC'
      Required = True
      DisplayFormat = '0000000'
    end
    object CdsTitulosPARCELA: TSmallintField
      Alignment = taCenter
      FieldName = 'PARCELA'
      Origin = 'TBCONTREC.PARCELA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '000'
    end
    object CdsTitulosCODBANCO: TIntegerField
      FieldName = 'CODBANCO'
      Origin = 'TBCONTREC.CODBANCO'
      ProviderFlags = [pfInUpdate]
    end
    object CdsTitulosNOSSONUMERO: TStringField
      FieldName = 'NOSSONUMERO'
      Origin = 'TBCONTREC.NOSSONUMERO'
      ProviderFlags = [pfInUpdate]
    end
    object CdsTitulosCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'TBCONTREC.CNPJ'
      ProviderFlags = [pfInUpdate]
      Size = 18
    end
    object CdsTitulosTIPPAG: TStringField
      FieldName = 'TIPPAG'
      Origin = 'TBCONTREC.TIPPAG'
      ProviderFlags = [pfInUpdate]
      Size = 35
    end
    object CdsTitulosDTEMISS: TDateField
      Alignment = taCenter
      FieldName = 'DTEMISS'
      Origin = 'TBCONTREC.DTEMISS'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = 'dd/mm/yyyy'
    end
    object CdsTitulosDTVENC: TDateField
      Alignment = taCenter
      FieldName = 'DTVENC'
      Origin = 'TBCONTREC.DTVENC'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = 'dd/mm/yyyy'
    end
    object CdsTitulosVALORREC: TBCDField
      FieldName = 'VALORREC'
      Origin = 'TBCONTREC.VALORREC'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object CdsTitulosPERCENTJUROS: TBCDField
      FieldName = 'PERCENTJUROS'
      Origin = 'TBCONTREC.PERCENTJUROS'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '0.00'
      Precision = 9
      Size = 2
    end
    object CdsTitulosPERCENTMULTA: TBCDField
      FieldName = 'PERCENTMULTA'
      Origin = 'TBCONTREC.PERCENTMULTA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '0.00'
      Precision = 9
      Size = 2
    end
    object CdsTitulosPERCENTDESCONTO: TBCDField
      FieldName = 'PERCENTDESCONTO'
      Origin = 'TBCONTREC.PERCENTDESCONTO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '0.00'
      Precision = 9
      Size = 2
    end
    object CdsTitulosVALORRECTOT: TBCDField
      FieldName = 'VALORRECTOT'
      Origin = 'TBCONTREC.VALORRECTOT'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object CdsTitulosVALORSALDO: TBCDField
      FieldName = 'VALORSALDO'
      Origin = 'TBCONTREC.VALORSALDO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object CdsTitulosDATAPROCESSOBOLETO: TDateField
      FieldName = 'DATAPROCESSOBOLETO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = 'dd/mm/yyyy'
    end
    object CdsTitulosINSCEST: TStringField
      FieldName = 'INSCEST'
    end
    object CdsTitulosNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 60
    end
    object CdsTitulosFONE: TStringField
      FieldName = 'FONE'
      Size = 11
    end
    object CdsTitulosENDER: TStringField
      FieldName = 'ENDER'
      Size = 80
    end
    object CdsTitulosBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 25
    end
    object CdsTitulosCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 30
    end
    object CdsTitulosUF: TStringField
      FieldName = 'UF'
      Required = True
      FixedChar = True
      Size = 2
    end
    object CdsTitulosCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object CdsTitulosEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 100
    end
    object CdsTitulosANOVENDA: TSmallintField
      FieldName = 'ANOVENDA'
    end
    object CdsTitulosNUMVENDA: TIntegerField
      FieldName = 'NUMVENDA'
    end
  end
  object DtsTitulos: TDataSource
    DataSet = CdsTitulos
    Left = 144
    Top = 264
  end
  object UpdateLanc: TIBSQL
    Database = DMBusiness.ibdtbsBusiness
    SQL.Strings = (
      'Update TBCONTREC set'
      '    nossonumero = :nossonumero'
      '  , codbanco    = :banco'
      '  , dataprocessoboleto = :data'
      'where numlanc = :lancamento')
    Transaction = DMBusiness.ibtrnsctnBusiness
    Left = 176
    Top = 264
  end
  object frrRemessa: TfrxReport
    Version = '4.9.72'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40617.958282361100000000
    ReportOptions.LastChange = 40617.990347060190000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    OnGetValue = frrRemessaGetValue
    Left = 144
    Top = 297
    Datasets = <
      item
        DataSet = frdRemessa
        DataSetName = 'Remessa'
      end>
    Variables = <
      item
        Name = ' Local'
        Value = Null
      end
      item
        Name = 'Banco'
        Value = #39'000 - Entidade Financeira'#39
      end
      item
        Name = 'Arquivo'
        Value = #39'Remessa.rem'#39
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object bndReportTitle: TfrxReportTitle
        Height = 90.708720000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 529.134200000000000000
          Top = 18.897650000000000000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'P'#195#161'gina [Page#] / [TotalPages#]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'Rela'#195#167#195#163'o de T'#195#173'tulos de Arquivos de Remessa')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Top = 37.795300000000000000
          Width = 718.110700000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            'Banco: [Banco]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Top = 60.472480000000000000
          Width = 718.110700000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            'Arquivo: [Arquivo]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object bndMasterData: TfrxMasterData
        Height = 18.897650000000000000
        Top = 215.433210000000000000
        Width = 718.110700000000000000
        DataSet = frdRemessa
        DataSetName = 'Remessa'
        RowCount = 0
        object RemessaCNPJ: TfrxMemoView
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'CNPJ'
          DataSet = frdRemessa
          DataSetName = 'Remessa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8 = (
            '[Remessa."CNPJ"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 102.047310000000000000
          Width = 287.244280000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdRemessa
          DataSetName = 'Remessa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8 = (
            '[Remessa."Sacado"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 389.291590000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdRemessa
          DataSetName = 'Remessa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[FormatFloat('#39'00000000'#39',<Remessa."Lancamento">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 453.543600000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdRemessa
          DataSetName = 'Remessa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[FormatFloat('#39'000'#39',<Remessa."Parcela">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 563.149970000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdRemessa
          DataSetName = 'Remessa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[Remessa."Data Vencimento"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 627.401980000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdRemessa
          DataSetName = 'Remessa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[FormatFloat('#39'###,###,##0.00'#39',<Remessa."Valor Documento">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 480.000310000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdRemessa
          DataSetName = 'Remessa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[Remessa."Nosso Numero"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object bndPageFooter: TfrxPageFooter
        Height = 7.559060000000000000
        Top = 343.937230000000000000
        Width = 718.110700000000000000
      end
      object bndHeader: TfrxHeader
        Height = 22.677180000000000000
        Top = 170.078850000000000000
        Width = 718.110700000000000000
        object Memo11: TfrxMemoView
          Top = 3.779530000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          DataSet = frdRemessa
          DataSetName = 'Remessa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            'CNPJ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 102.047310000000000000
          Top = 3.779530000000000000
          Width = 287.244280000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          DataSet = frdRemessa
          DataSetName = 'Remessa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' Sacado')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 389.291590000000000000
          Top = 3.779530000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          DataSet = frdRemessa
          DataSetName = 'Remessa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'Lan'#195#167'amento')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 453.543600000000000000
          Top = 3.779530000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          DataSet = frdRemessa
          DataSetName = 'Remessa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'Parc.')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 563.149970000000000000
          Top = 3.779530000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          DataSet = frdRemessa
          DataSetName = 'Remessa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'Vencimento')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 627.401980000000000000
          Top = 3.779530000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          DataSet = frdRemessa
          DataSetName = 'Remessa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            'Valor Documento')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 480.000310000000000000
          Top = 3.779530000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          DataSet = frdRemessa
          DataSetName = 'Remessa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'Nosso N'#195#186'mero')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object bndReportSummary: TfrxReportSummary
        Height = 26.456710000000000000
        Top = 294.803340000000000000
        Width = 718.110700000000000000
        object SysMemo1: TfrxSysMemoView
          Left = 563.149970000000000000
          Top = 3.779530000000000000
          Width = 154.960730000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<Remessa."Valor Documento">,bndMasterData,2)]')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo2: TfrxSysMemoView
          Top = 3.779530000000000000
          Width = 563.149970000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            '[COUNT(bndMasterData,2)] lan'#195#167'amento(s) presente(s) no arquivo')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object frdRemessa: TfrxDBDataset
    UserName = 'Remessa'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ANOLANC=Ano'
      'NUMLANC=Lancamento'
      'PARCELA=Parcela'
      'CODBANCO=Banco'
      'NOSSONUMERO=Nosso Numero'
      'CNPJ=CNPJ'
      'TIPPAG=TipoPagto'
      'DTEMISS=Data Emissao'
      'DTVENC=Data Vencimento'
      'VALORREC=Valor Documento'
      'PERCENTJUROS=% Juros'
      'PERCENTMULTA=% Multa'
      'PERCENTDESCONTO=% Desconto'
      'VALORRECTOT=VALORRECTOT'
      'VALORSALDO=Valor Saldo'
      'DATAPROCESSOBOLETO=Data Geracao Boleto'
      'INSCEST=INSCEST'
      'NOME=Sacado'
      'FONE=Fone'
      'ENDER=Endereco'
      'BAIRRO=Bairro'
      'CIDADE=Cidade'
      'UF=UF'
      'CEP=CEP'
      'EMAIL=E-mail'
      'ANOVENDA=AnoVenda'
      'NUMVENDA=NumVenda')
    DataSet = CdsTitulos
    BCDToCurrency = False
    Left = 112
    Top = 297
  end
end
