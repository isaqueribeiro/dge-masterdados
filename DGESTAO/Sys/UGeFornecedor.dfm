inherited frmGeFornecedor: TfrmGeFornecedor
  Left = 344
  Top = 165
  Width = 763
  Height = 465
  ActiveControl = dbCodigo
  Caption = 'Cadastro de Fornecedores'
  OldCreateOrder = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Top = 423
    Width = 747
  end
  inherited Bevel3: TBevel
    Top = 384
    Width = 747
  end
  inherited tlbBotoes: TToolBar
    Top = 388
    Width = 747
    inherited bvlToolExpandir: TBevel
      Width = 81
    end
    inherited btbtnSelecionar: TBitBtn
      Left = 622
    end
    inherited bvlTool4: TBevel
      Left = 742
    end
  end
  inherited pgcGuias: TPageControl
    Width = 747
    Height = 384
    ActivePage = tbsCadastro
    inherited tbsTabela: TTabSheet
      inherited Bevel4: TBevel
        Top = 289
        Width = 739
      end
      inherited dbgDados: TDBGrid
        Width = 739
        Height = 289
        Columns = <
          item
            Expanded = False
            FieldName = 'CODFORN'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOMEFORN'
            Width = 250
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CNPJ'
            Width = 140
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'INSCEST'
            Title.Caption = 'RG / Ins. Estadual'
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'INSCMUN'
            Width = 120
            Visible = True
          end>
      end
      inherited pnlFiltros: TPanel
        Top = 293
        Width = 739
        inherited grpBxFiltro: TGroupBox
          Left = 464
          Width = 271
          inherited lbltFiltrar: TLabel
            Width = 67
            Caption = 'Fornecedor:'
          end
          inherited btnFiltrar: TSpeedButton
            Left = 226
          end
          inherited edtFiltrar: TEdit
            Left = 80
            Width = 142
          end
        end
      end
    end
    inherited tbsCadastro: TTabSheet
      inherited Bevel8: TBevel
        Top = 113
        Width = 739
      end
      object Bevel5: TBevel [1]
        Left = 0
        Top = 233
        Width = 739
        Height = 4
        Align = alTop
        Shape = bsSpacer
      end
      inherited GrpBxDadosNominais: TGroupBox
        Width = 739
        Height = 113
        object lblCNPJ: TLabel [1]
          Left = 192
          Top = 24
          Width = 58
          Height = 13
          Caption = 'CPF / CNPJ:'
          FocusControl = dbCNPJ
        end
        object lblRazao: TLabel [2]
          Left = 352
          Top = 24
          Width = 101
          Height = 13
          Caption = 'Nome / Raz'#227'o Social:'
          FocusControl = dbRazao
        end
        object lblIE: TLabel [3]
          Left = 16
          Top = 64
          Width = 115
          Height = 13
          Caption = 'RG / Inscri'#231#227'o Estadual:'
          FocusControl = dbIE
        end
        object lblIM: TLabel [4]
          Left = 192
          Top = 64
          Width = 93
          Height = 13
          Caption = 'Inscri'#231#227'o Municipal:'
          FocusControl = dbIM
        end
        object lblGrupo: TLabel [5]
          Left = 352
          Top = 64
          Width = 33
          Height = 13
          Caption = 'Grupo:'
        end
        inherited dbCodigo: TDBEdit
          Color = clMoneyGreen
          DataField = 'CODFORN'
        end
        object dbPessoaFisica: TDBCheckBox
          Left = 88
          Top = 42
          Width = 97
          Height = 17
          Caption = 'Pessoa F'#237'sica'
          DataField = 'PESSOA_FISICA'
          DataSource = DtSrcTabela
          TabOrder = 1
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbCNPJ: TDBEdit
          Left = 192
          Top = 40
          Width = 153
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CNPJ'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object dbRazao: TDBEdit
          Left = 352
          Top = 40
          Width = 369
          Height = 21
          CharCase = ecUpperCase
          DataField = 'NOMEFORN'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
        object dbIE: TDBEdit
          Left = 16
          Top = 80
          Width = 169
          Height = 21
          CharCase = ecUpperCase
          DataField = 'INSCEST'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
        end
        object dbIM: TDBEdit
          Left = 192
          Top = 80
          Width = 153
          Height = 21
          CharCase = ecUpperCase
          DataField = 'INSCMUN'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
        end
        object dbGrupo: TDBLookupComboBox
          Left = 352
          Top = 80
          Width = 369
          Height = 21
          DataField = 'GRF_COD'
          DataSource = DtSrcTabela
          DropDownRows = 10
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'GRF_COD'
          ListField = 'GRF_DESCRICAO'
          ListSource = dtsGrupo
          ParentFont = False
          TabOrder = 6
        end
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 117
        Width = 739
        Height = 116
        Align = alTop
        Caption = 'Endere'#231'o'
        TabOrder = 1
        object lblCidade: TLabel
          Left = 160
          Top = 24
          Width = 37
          Height = 13
          Caption = 'Cidade:'
        end
        object lblEstado: TLabel
          Left = 16
          Top = 24
          Width = 37
          Height = 13
          Caption = 'Estado:'
        end
        object lblBairro: TLabel
          Left = 416
          Top = 24
          Width = 32
          Height = 13
          Caption = 'Bairro:'
        end
        object lblLogradouro: TLabel
          Left = 16
          Top = 64
          Width = 59
          Height = 13
          Caption = 'Logradouro:'
        end
        object lblCEP: TLabel
          Left = 616
          Top = 24
          Width = 23
          Height = 13
          Caption = 'CEP:'
          FocusControl = dbCEP
        end
        object lblNumero: TLabel
          Left = 416
          Top = 64
          Width = 41
          Height = 13
          Caption = 'N'#250'mero:'
          FocusControl = dbNumero
        end
        object lblComplemento: TLabel
          Left = 488
          Top = 64
          Width = 69
          Height = 13
          Caption = 'Complemento:'
          FocusControl = dbComplemento
        end
        object lblPais: TLabel
          Left = 616
          Top = 64
          Width = 23
          Height = 13
          Caption = 'Pa'#237's:'
        end
        object dbCidade: TRxDBComboEdit
          Left = 160
          Top = 40
          Width = 249
          Height = 21
          ButtonHint = 'Pesquisar Cidade (Ctrl+P)'
          CharCase = ecUpperCase
          ClickKey = 16464
          Color = clMoneyGreen
          DataField = 'CID_NOME'
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
          TabOrder = 1
          OnButtonClick = dbCidadeButtonClick
        end
        object dbEstado: TRxDBComboEdit
          Left = 16
          Top = 40
          Width = 137
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
          TabOrder = 0
          OnButtonClick = dbEstadoButtonClick
        end
        object dbBairro: TRxDBComboEdit
          Left = 416
          Top = 40
          Width = 193
          Height = 21
          ButtonHint = 'Pesquisar Bairro (Ctrl+P)'
          CharCase = ecUpperCase
          ClickKey = 16464
          Color = clMoneyGreen
          DataField = 'BAI_NOME'
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
          TabOrder = 2
          OnButtonClick = dbBairroButtonClick
        end
        object dbLogradouro: TRxDBComboEdit
          Left = 16
          Top = 80
          Width = 393
          Height = 21
          ButtonHint = 'Pesquisar Logradouro (Ctrl+P)'
          CharCase = ecUpperCase
          ClickKey = 16464
          Color = clMoneyGreen
          DataField = 'LOGRADOURO'
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
          TabOrder = 4
          OnButtonClick = dbLogradouroButtonClick
        end
        object dbCEP: TDBEdit
          Left = 616
          Top = 40
          Width = 105
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CEP'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
        object dbNumero: TDBEdit
          Left = 416
          Top = 80
          Width = 65
          Height = 21
          CharCase = ecUpperCase
          DataField = 'NUMERO_END'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
        end
        object dbComplemento: TDBEdit
          Left = 488
          Top = 80
          Width = 121
          Height = 21
          CharCase = ecUpperCase
          DataField = 'COMPLEMENTO'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
        end
        object dbPais: TRxDBComboEdit
          Left = 616
          Top = 80
          Width = 105
          Height = 21
          ButtonHint = 'Pesquisar Pa'#237's (Ctrl+P)'
          CharCase = ecUpperCase
          ClickKey = 16464
          Color = clMoneyGreen
          DataField = 'PAIS_NOME'
          DataSource = DtSrcTabela
          Enabled = False
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
          TabOrder = 7
        end
      end
      object pgcMaisDados: TPageControl
        Left = 0
        Top = 237
        Width = 739
        Height = 118
        ActivePage = tbsContato
        Align = alClient
        TabOrder = 2
        object tbsContato: TTabSheet
          Caption = 'Contato'
          object lblFone: TLabel
            Left = 8
            Top = 0
            Width = 28
            Height = 13
            Caption = 'Fone:'
            FocusControl = dbFone
          end
          object lblEmail: TLabel
            Left = 120
            Top = 0
            Width = 32
            Height = 13
            Caption = 'E-mail:'
            FocusControl = dbEmail
          end
          object lblHome: TLabel
            Left = 8
            Top = 40
            Width = 58
            Height = 13
            Caption = 'Home page:'
            FocusControl = dbHome
          end
          object lblContato: TLabel
            Left = 376
            Top = 0
            Width = 73
            Height = 13
            Caption = 'Nome Contato:'
            FocusControl = dbContato
          end
          object dbFone: TDBEdit
            Left = 8
            Top = 16
            Width = 105
            Height = 21
            CharCase = ecUpperCase
            DataField = 'FONE'
            DataSource = DtSrcTabela
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object dbEmail: TDBEdit
            Left = 120
            Top = 16
            Width = 249
            Height = 21
            CharCase = ecLowerCase
            DataField = 'EMAIL'
            DataSource = DtSrcTabela
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object dbHome: TDBEdit
            Left = 8
            Top = 56
            Width = 361
            Height = 21
            CharCase = ecLowerCase
            DataField = 'SITE'
            DataSource = DtSrcTabela
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            OnKeyPress = ProximoCampoKeyPress
          end
          object dbContato: TDBEdit
            Left = 376
            Top = 16
            Width = 249
            Height = 21
            DataField = 'CONTATO'
            DataSource = DtSrcTabela
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
        end
        object tbsDuplicatas: TTabSheet
          Caption = 'Duplicatas'
          ImageIndex = 1
        end
        object tbsDadosAdcionais: TTabSheet
          Caption = 'Outras Informa'#231#245'es'
          ImageIndex = 2
          object DBCheckBox1: TDBCheckBox
            Left = 8
            Top = 10
            Width = 121
            Height = 17
            Caption = #201' Transportadora'
            DataField = 'TRANSPORTADORA'
            DataSource = DtSrcTabela
            TabOrder = 0
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
      end
    end
  end
  inherited IbDtstTabela: TIBDataSet
    OnNewRecord = IbDtstTabelaNewRecord
    SelectSQL.Strings = (
      'Select'
      '    f.Codforn'
      '  , f.Pessoa_fisica'
      '  , f.Cnpj'
      '  , f.Nomeforn'
      '  , f.Inscest'
      '  , f.Inscmun'
      '  , f.Ender'
      '  , f.Complemento'
      '  , f.Numero_end'
      '  , f.Cep'
      '  , f.Cidade'
      '  , f.Uf'
      '  , f.Fone'
      '  , f.Tlg_tipo'
      '  , f.Log_cod'
      '  , f.Bai_cod'
      '  , f.Cid_cod'
      '  , f.Est_cod'
      '  , f.Email'
      '  , f.Site'
      '  , f.Contato'
      '  , f.Pais_id'
      '  , f.Grf_cod'
      '  , f.Transportadora'
      
        '  , coalesce( cast(coalesce(coalesce(t.Tlg_sigla, t.Tlg_descrica' +
        'o) || '#39' '#39', '#39#39') || l.Log_nome as varchar(250)), f.Ender ) as Logr' +
        'adouro'
      '  , b.Bai_nome'
      '  , coalesce(c.Cid_nome, f.Cidade) as Cid_nome'
      '  , coalesce(u.Est_nome, f.Uf) as Est_nome'
      '  , p.Pais_nome'
      'from TBFORNECEDOR f'
      '  left join TBTIPO_LOGRADOURO t on (t.Tlg_cod = f.Tlg_tipo)'
      '  left join TBLOGRADOURO l on (l.Log_cod = f.Log_cod)'
      '  left join TBBAIRRO b on (b.Bai_cod = f.Bai_cod)'
      '  left join TBCIDADE c on (c.Cid_cod = f.Cid_cod)'
      '  left join TBESTADO u on (u.Est_cod = f.Est_cod)'
      '  left join TBPAIS p on (p.Pais_id = f.Pais_id)')
    GeneratorField.Field = 'CODFORN'
    GeneratorField.Generator = 'GEN_FORNECEDOR_ID'
    Left = 640
    object IbDtstTabelaCODFORN: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODFORN'
      Origin = 'TBFORNECEDOR.CODFORN'
      Required = True
    end
    object IbDtstTabelaPESSOA_FISICA: TSmallintField
      DisplayLabel = 'Pessoa F'#237'sica'
      FieldName = 'PESSOA_FISICA'
      Origin = 'TBFORNECEDOR.PESSOA_FISICA'
      Required = True
    end
    object IbDtstTabelaCNPJ: TIBStringField
      DisplayLabel = 'CPF / CNPJ'
      FieldName = 'CNPJ'
      Origin = 'TBFORNECEDOR.CNPJ'
      Required = True
      Size = 18
    end
    object IbDtstTabelaNOMEFORN: TIBStringField
      DisplayLabel = 'Nome/Raz'#227'o Social'
      FieldName = 'NOMEFORN'
      Origin = 'TBFORNECEDOR.NOMEFORN'
      Required = True
      Size = 60
    end
    object IbDtstTabelaINSCEST: TIBStringField
      DisplayLabel = 'RG / Inscri'#231#227'o Estadual'
      FieldName = 'INSCEST'
      Origin = 'TBFORNECEDOR.INSCEST'
    end
    object IbDtstTabelaINSCMUN: TIBStringField
      DisplayLabel = 'Inscri'#231#227'o Municipal'
      FieldName = 'INSCMUN'
      Origin = 'TBFORNECEDOR.INSCMUN'
    end
    object IbDtstTabelaENDER: TIBStringField
      DisplayLabel = 'Logradouro'
      FieldName = 'ENDER'
      Origin = 'TBFORNECEDOR.ENDER'
      Size = 250
    end
    object IbDtstTabelaCOMPLEMENTO: TIBStringField
      DisplayLabel = 'Complemento'
      FieldName = 'COMPLEMENTO'
      Origin = 'TBFORNECEDOR.COMPLEMENTO'
      Size = 50
    end
    object IbDtstTabelaNUMERO_END: TIBStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NUMERO_END'
      Origin = 'TBFORNECEDOR.NUMERO_END'
      Size = 10
    end
    object IbDtstTabelaCEP: TIBStringField
      FieldName = 'CEP'
      Origin = 'TBFORNECEDOR.CEP'
      EditMask = '99.999-999;0; '
      Size = 8
    end
    object IbDtstTabelaCIDADE: TIBStringField
      DisplayLabel = 'Cidade'
      FieldName = 'CIDADE'
      Origin = 'TBFORNECEDOR.CIDADE'
      Size = 30
    end
    object IbDtstTabelaUF: TIBStringField
      FieldName = 'UF'
      Origin = 'TBFORNECEDOR.UF'
      FixedChar = True
      Size = 2
    end
    object IbDtstTabelaFONE: TIBStringField
      DisplayLabel = 'Fone'
      FieldName = 'FONE'
      Origin = 'TBFORNECEDOR.FONE'
      EditMask = '(99)9999.9999;0; '
      Size = 11
    end
    object IbDtstTabelaTLG_TIPO: TSmallintField
      DisplayLabel = 'Tipo Logradouro'
      FieldName = 'TLG_TIPO'
      Origin = 'TBFORNECEDOR.TLG_TIPO'
    end
    object IbDtstTabelaLOG_COD: TIntegerField
      DisplayLabel = 'Logradouro'
      FieldName = 'LOG_COD'
      Origin = 'TBFORNECEDOR.LOG_COD'
    end
    object IbDtstTabelaBAI_COD: TIntegerField
      DisplayLabel = 'Bairro'
      FieldName = 'BAI_COD'
      Origin = 'TBFORNECEDOR.BAI_COD'
    end
    object IbDtstTabelaCID_COD: TIntegerField
      DisplayLabel = 'Cidade'
      FieldName = 'CID_COD'
      Origin = 'TBFORNECEDOR.CID_COD'
      Required = True
    end
    object IbDtstTabelaEST_COD: TSmallintField
      DisplayLabel = 'Estado'
      FieldName = 'EST_COD'
      Origin = 'TBFORNECEDOR.EST_COD'
      Required = True
    end
    object IbDtstTabelaEMAIL: TIBStringField
      DisplayLabel = 'E-mail'
      FieldName = 'EMAIL'
      Origin = 'TBFORNECEDOR.EMAIL'
      Size = 40
    end
    object IbDtstTabelaSITE: TIBStringField
      DisplayLabel = 'Home page'
      FieldName = 'SITE'
      Origin = 'TBFORNECEDOR.SITE'
      Size = 35
    end
    object IbDtstTabelaCONTATO: TIBStringField
      DisplayLabel = 'Contato'
      FieldName = 'CONTATO'
      Origin = 'TBFORNECEDOR.CONTATO'
    end
    object IbDtstTabelaPAIS_ID: TIBStringField
      DisplayLabel = 'Pa'#237's'
      FieldName = 'PAIS_ID'
      Origin = 'TBFORNECEDOR.PAIS_ID'
      Size = 5
    end
    object IbDtstTabelaGRF_COD: TSmallintField
      DisplayLabel = 'Grupo'
      FieldName = 'GRF_COD'
      Origin = 'TBFORNECEDOR.GRF_COD'
    end
    object IbDtstTabelaTRANSPORTADORA: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'TRANSPORTADORA'
      Origin = '"TBFORNECEDOR"."TRANSPORTADORA"'
    end
    object IbDtstTabelaLOGRADOURO: TIBStringField
      DisplayLabel = 'Logradouro'
      FieldName = 'LOGRADOURO'
      Size = 250
    end
    object IbDtstTabelaBAI_NOME: TIBStringField
      DisplayLabel = 'Bairro'
      FieldName = 'BAI_NOME'
      Origin = 'TBBAIRRO.BAI_NOME'
      Size = 100
    end
    object IbDtstTabelaCID_NOME: TIBStringField
      DisplayLabel = 'Cidade'
      FieldName = 'CID_NOME'
      Size = 100
    end
    object IbDtstTabelaEST_NOME: TIBStringField
      DisplayLabel = 'Estado'
      FieldName = 'EST_NOME'
      Size = 100
    end
    object IbDtstTabelaPAIS_NOME: TIBStringField
      DisplayLabel = 'Pa'#237's'
      FieldName = 'PAIS_NOME'
      Origin = 'TBPAIS.PAIS_NOME'
      Size = 150
    end
  end
  inherited DtSrcTabela: TDataSource
    OnDataChange = DtSrcTabelaDataChange
    Left = 672
  end
  inherited IbUpdTabela: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  CODFORN,'
      '  PESSOA_FISICA,'
      '  NOMEFORN,'
      '  CNPJ,'
      '  INSCEST,'
      '  INSCMUN,'
      '  ENDER,'
      '  COMPLEMENTO,'
      '  NUMERO_END,'
      '  CEP,'
      '  CIDADE,'
      '  UF,'
      '  CONTATO,'
      '  FONE,'
      '  EMAIL,'
      '  SITE,'
      '  TLG_TIPO,'
      '  LOG_COD,'
      '  BAI_COD,'
      '  CID_COD,'
      '  EST_COD,'
      '  PAIS_ID,'
      '  GRF_COD,'
      '  TRANSPORTADORA'
      'from TBFORNECEDOR '
      'where'
      '  CODFORN = :CODFORN')
    ModifySQL.Strings = (
      'update TBFORNECEDOR'
      'set'
      '  BAI_COD = :BAI_COD,'
      '  CEP = :CEP,'
      '  CID_COD = :CID_COD,'
      '  CIDADE = :CIDADE,'
      '  CNPJ = :CNPJ,'
      '  CODFORN = :CODFORN,'
      '  COMPLEMENTO = :COMPLEMENTO,'
      '  CONTATO = :CONTATO,'
      '  EMAIL = :EMAIL,'
      '  ENDER = :ENDER,'
      '  EST_COD = :EST_COD,'
      '  FONE = :FONE,'
      '  GRF_COD = :GRF_COD,'
      '  INSCEST = :INSCEST,'
      '  INSCMUN = :INSCMUN,'
      '  LOG_COD = :LOG_COD,'
      '  NOMEFORN = :NOMEFORN,'
      '  NUMERO_END = :NUMERO_END,'
      '  PAIS_ID = :PAIS_ID,'
      '  PESSOA_FISICA = :PESSOA_FISICA,'
      '  SITE = :SITE,'
      '  TLG_TIPO = :TLG_TIPO,'
      '  TRANSPORTADORA = :TRANSPORTADORA,'
      '  UF = :UF'
      'where'
      '  CODFORN = :OLD_CODFORN')
    InsertSQL.Strings = (
      'insert into TBFORNECEDOR'
      
        '  (BAI_COD, CEP, CID_COD, CIDADE, CNPJ, CODFORN, COMPLEMENTO, CO' +
        'NTATO, '
      
        '   EMAIL, ENDER, EST_COD, FONE, GRF_COD, INSCEST, INSCMUN, LOG_C' +
        'OD, NOMEFORN, '
      
        '   NUMERO_END, PAIS_ID, PESSOA_FISICA, SITE, TLG_TIPO, TRANSPORT' +
        'ADORA, '
      '   UF)'
      'values'
      
        '  (:BAI_COD, :CEP, :CID_COD, :CIDADE, :CNPJ, :CODFORN, :COMPLEME' +
        'NTO, :CONTATO, '
      
        '   :EMAIL, :ENDER, :EST_COD, :FONE, :GRF_COD, :INSCEST, :INSCMUN' +
        ', :LOG_COD, '
      
        '   :NOMEFORN, :NUMERO_END, :PAIS_ID, :PESSOA_FISICA, :SITE, :TLG' +
        '_TIPO, '
      '   :TRANSPORTADORA, :UF)')
    DeleteSQL.Strings = (
      'delete from TBFORNECEDOR'
      'where'
      '  CODFORN = :OLD_CODFORN')
    Left = 640
    Top = 40
  end
  inherited ImgList: TImageList
    Left = 608
  end
  object tblGrupo: TIBTable
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    TableName = 'TBFORNECEDOR_GRUPO'
    Left = 640
    Top = 72
  end
  object dtsGrupo: TDataSource
    DataSet = tblGrupo
    Left = 672
    Top = 72
  end
end
