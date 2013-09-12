inherited frmGeContasAPagar: TfrmGeContasAPagar
  Left = 331
  Top = 111
  Width = 950
  Height = 600
  Caption = 'Controle de Contas A Pagar'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Top = 558
    Width = 934
  end
  inherited Bevel3: TBevel
    Top = 519
    Width = 934
  end
  inherited tlbBotoes: TToolBar
    Top = 523
    Width = 934
    object btbtnEfetuarPagto: TBitBtn
      Left = 726
      Top = 2
      Width = 120
      Height = 31
      Hint = 'Efetuar Pagamento'
      Caption = '&Efetuar Pagto.'
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      OnClick = btbtnEfetuarPagtoClick
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
    object Bevel7: TBevel
      Left = 846
      Top = 2
      Width = 4
      Height = 31
      Shape = bsSpacer
    end
  end
  inherited pgcGuias: TPageControl
    Width = 934
    Height = 519
    OnChange = pgcGuiasChange
    inherited tbsTabela: TTabSheet
      inherited Bevel4: TBevel
        Top = 424
        Width = 926
      end
      inherited dbgDados: TDBGrid
        Width = 926
        Height = 424
        Columns = <
          item
            Expanded = False
            FieldName = 'NUMLANC'
            Title.Caption = 'No. Lan'#231'.'
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
            FieldName = 'NOMEFORN'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALORPAG'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clBlue
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 110
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DTEMISS'
            Title.Alignment = taCenter
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DTVENC'
            Title.Alignment = taCenter
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QUITADO'
            Title.Caption = 'Situa'#231#227'o'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DTPAG'
            Title.Alignment = taCenter
            Width = 80
            Visible = True
          end>
      end
      inherited pnlFiltros: TPanel
        Top = 428
        Width = 926
        object lblLancamentoAberto: TLabel [0]
          Left = 2
          Top = 4
          Width = 148
          Height = 13
          Caption = '* Lan'#231'amentos em aberto'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblCaixaCancelado: TLabel [1]
          Left = 2
          Top = 24
          Width = 16
          Height = 13
          Caption = '* ?'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
        end
        object Label1: TLabel [2]
          Left = 2
          Top = 44
          Width = 16
          Height = 13
          Caption = '* ?'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
        end
        inherited grpBxFiltro: TGroupBox
          Left = 328
          Width = 594
          inherited lbltFiltrar: TLabel
            Left = 310
            Width = 73
            Caption = 'Lan'#231'amento:'
          end
          inherited btnFiltrar: TSpeedButton
            Left = 549
          end
          object lblData: TLabel [2]
            Left = 14
            Top = 25
            Width = 70
            Height = 13
            Caption = 'Vencimento:'
            FocusControl = e1Data
          end
          inherited edtFiltrar: TEdit
            Left = 392
            Width = 153
            TabOrder = 2
          end
          object e1Data: TDateEdit
            Left = 88
            Top = 21
            Width = 103
            Height = 21
            GlyphKind = gkCustom
            Glyph.Data = {
              76050000424D760500000000000036000000280000001C0000000C0000000100
              2000000000004005000000000000000000000000000000000000FF00FF00FF00
              FF00FF00FF008080800080808000808080008080800080808000808080008080
              800080808000808080008080800080808000FF00FF00FF00FF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FF00FF00FF00FF000000000000000000800000000000
              0000800000008000000000000000800000000000000000000000800000008080
              8000FF00FF008080800080808000808080008080800080808000808080008080
              80008080800080808000808080008080800080808000FFFFFF00FF00FF00FF00
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
              FF00FFFFFF00FFFFFF00FFFFFF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FF00
              FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF0000000000000000000000
              0000FFFFFF00000000000000000000000000C0C0C000FFFFFF00800000008080
              8000FF00FF0080808000FFFFFF00808080008080800080808000FF00FF008080
              80008080800080808000FF00FF00FFFFFF0080808000FFFFFF00FF00FF00FF00
              FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00C0C0C000FFFFFF00C0C0
              C00000000000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
              FF0080808000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF0080808000FFFF
              FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF00FFFFFF0000000000FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00800000008080
              8000FF00FF0080808000FFFFFF00FF00FF0080808000FFFFFF00FF00FF00FF00
              FF00FFFFFF00FFFFFF0080808000FF00FF0080808000FFFFFF00FF00FF00FF00
              FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0000000000000000000000
              0000C0C0C000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
              FF0080808000FFFFFF00FF00FF00808080008080800080808000FF00FF00FF00
              FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF000000000000000000FFFF
              FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00800000008080
              8000FF00FF0080808000FFFFFF008080800080808000FFFFFF00FF00FF008080
              8000FFFFFF00FFFFFF00FFFFFF00FFFFFF0080808000FFFFFF00FF00FF00FF00
              FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0000000000000000000000
              000000000000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
              FF0080808000FF00FF00FF00FF0080808000808080008080800080808000FF00
              FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00800000008080
              8000FF00FF0080808000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF0080808000FFFFFF00FF00FF00FF00
              FF00FFFFFF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
              C000C0C0C000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF0080808000FFFFFF00FF00FF00FF00FF000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000FF00FF00FF00
              FF00FF00FF008080800080808000808080008080800080808000808080008080
              80008080800080808000808080008080800080808000FF00FF00}
            NumGlyphs = 2
            TabOrder = 0
            Text = '01/01/2012'
          end
          object e2Data: TDateEdit
            Left = 200
            Top = 21
            Width = 104
            Height = 21
            NumGlyphs = 2
            TabOrder = 1
            Text = '01/01/2012'
          end
        end
      end
    end
    inherited tbsCadastro: TTabSheet
      inherited Bevel8: TBevel
        Top = 201
        Width = 926
      end
      object Bevel5: TBevel [1]
        Left = 0
        Top = 81
        Width = 926
        Height = 4
        Align = alTop
        Shape = bsSpacer
      end
      object Bevel6: TBevel [2]
        Left = 0
        Top = 340
        Width = 926
        Height = 4
        Align = alBottom
        Shape = bsSpacer
      end
      inherited GrpBxDadosNominais: TGroupBox
        Width = 926
        Height = 81
        object lblEmpresa: TLabel [1]
          Left = 88
          Top = 24
          Width = 45
          Height = 13
          Caption = 'Empresa:'
          FocusControl = dbEmpresa
        end
        object lblFornecedor: TLabel [2]
          Left = 423
          Top = 24
          Width = 59
          Height = 13
          Caption = 'Fornecedor:'
          FocusControl = dbFornecedor
        end
        object lblQuitado: TLabel [3]
          Left = 775
          Top = 24
          Width = 52
          Height = 13
          Caption = 'Situa'#231#227'o:'
          FocusControl = dbQuitado
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        inherited dbCodigo: TDBEdit
          Color = clMoneyGreen
          DataField = 'NUMLANC'
        end
        object dbEmpresa: TDBEdit
          Left = 88
          Top = 40
          Width = 329
          Height = 21
          TabStop = False
          CharCase = ecUpperCase
          Color = clMoneyGreen
          DataField = 'NOMEEMP'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object dbFornecedor: TRxDBComboEdit
          Left = 423
          Top = 40
          Width = 348
          Height = 21
          ButtonHint = 'Pesquisar Cliente (Ctrl+P)'
          CharCase = ecUpperCase
          ClickKey = 16464
          Color = clMoneyGreen
          DataField = 'NOMEFORN'
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
          OnButtonClick = dbFornecedorButtonClick
        end
        object dbQuitado: TDBEdit
          Left = 776
          Top = 40
          Width = 129
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'QUITADO'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
      end
      object GrpBxDadosValores: TGroupBox
        Left = 0
        Top = 85
        Width = 926
        Height = 116
        Align = alTop
        Caption = 'A Pagar'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object lblNotaFiscal: TLabel
          Left = 16
          Top = 24
          Width = 63
          Height = 13
          Caption = 'Nota Fiscal:'
          FocusControl = dbNotaFiscal
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblParcela: TLabel
          Left = 112
          Top = 24
          Width = 45
          Height = 13
          Caption = 'Parcela:'
          FocusControl = dbParcela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblEmissao: TLabel
          Left = 168
          Top = 24
          Width = 49
          Height = 13
          Caption = 'Emiss'#227'o:'
          FocusControl = dbEmissao
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblVencimento: TLabel
          Left = 272
          Top = 24
          Width = 70
          Height = 13
          Caption = 'Vencimento:'
          FocusControl = dbVencimento
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblValorAPagar: TLabel
          Left = 376
          Top = 24
          Width = 107
          Height = 13
          Caption = 'Valor A Pagar (R$):'
          FocusControl = dbValorAPagar
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblFormaPagto: TLabel
          Left = 16
          Top = 64
          Width = 124
          Height = 13
          Caption = '&Forma de Pagamento:'
          FocusControl = dbFormaPagto
        end
        object lblCondicaoPagto: TLabel
          Left = 168
          Top = 64
          Width = 139
          Height = 13
          Caption = 'Condi'#231#227'o de Pagamento:'
          FocusControl = dbCondicaoPagto
        end
        object lblTipoDespesa: TLabel
          Left = 496
          Top = 24
          Width = 95
          Height = 13
          Caption = 'Tipo de Despesa:'
          FocusControl = dbNotaFiscal
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbNotaFiscal: TDBEdit
          Left = 16
          Top = 40
          Width = 89
          Height = 21
          DataField = 'NOTFISC'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object dbParcela: TDBEdit
          Left = 112
          Top = 40
          Width = 49
          Height = 21
          DataField = 'PARCELA'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
        object dbEmissao: TDBEdit
          Left = 168
          Top = 40
          Width = 97
          Height = 21
          DataField = 'DTEMISS'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
        end
        object dbVencimento: TDBEdit
          Left = 272
          Top = 40
          Width = 97
          Height = 21
          DataField = 'DTVENC'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
        end
        object dbValorAPagar: TDBEdit
          Left = 376
          Top = 40
          Width = 113
          Height = 21
          DataField = 'VALORPAG'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
        end
        object dbFormaPagto: TDBLookupComboBox
          Left = 16
          Top = 80
          Width = 145
          Height = 21
          DataField = 'FORMA_PAGTO'
          DataSource = DtSrcTabela
          DropDownRows = 10
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'COD'
          ListField = 'DESCRI'
          ListSource = dtsFormaPagto
          ParentFont = False
          TabOrder = 6
        end
        object dbCondicaoPagto: TDBLookupComboBox
          Left = 168
          Top = 80
          Width = 321
          Height = 21
          DataField = 'CONDICAO_PAGTO'
          DataSource = DtSrcTabela
          DropDownRows = 10
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'COND_COD'
          ListField = 'COND_DESCRICAO_FULL'
          ListSource = dtsCondicaoPagto
          ParentFont = False
          TabOrder = 7
        end
        object dbTipoDespesa: TDBLookupComboBox
          Left = 496
          Top = 40
          Width = 409
          Height = 21
          DataField = 'CODTPDESP'
          DataSource = DtSrcTabela
          DropDownRows = 10
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'COD'
          ListField = 'TIPODESP'
          ListSource = dtsTpDespesa
          ParentFont = False
          TabOrder = 5
        end
      end
      object pgcMaisDados: TPageControl
        Left = 0
        Top = 344
        Width = 926
        Height = 146
        ActivePage = tbsHistorico
        Align = alBottom
        TabOrder = 3
        object tbsHistorico: TTabSheet
          Caption = 'Hist'#243'rico'
          object dbObservacao: TDBMemo
            Left = 0
            Top = 0
            Width = 918
            Height = 118
            Align = alClient
            DataField = 'HISTORIC'
            DataSource = DtSrcTabela
            TabOrder = 0
          end
        end
      end
      object dbgPagamentos: TDBGrid
        Left = 0
        Top = 205
        Width = 926
        Height = 135
        TabStop = False
        Align = alClient
        DataSource = dtsPagamentos
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = [fsBold]
        OnDrawColumnCell = dbgDadosDrawColumnCell
        OnKeyDown = dbgDadosKeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'SEQ'
            Title.Alignment = taCenter
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATA_PAGTO'
            Title.Alignment = taCenter
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FORMA_PAGTO_DESC'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_BAIXA'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clBlue
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NUMERO_CHEQUE'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BCO_NOME'
            Width = 250
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DOCUMENTO_BAIXA'
            Width = 120
            Visible = True
          end>
      end
    end
  end
  inherited IbDtstTabela: TIBDataSet
    OnNewRecord = IbDtstTabelaNewRecord
    SelectSQL.Strings = (
      'Select'
      '    p.Anolanc'
      '  , p.Numlanc'
      '  , p.Parcela'
      '  , p.Codforn'
      '  , p.Nomeemp'
      '  , f.Nomeforn'
      '  , f.Cnpj'
      '  , p.Notfisc'
      '  , p.Tippag'
      '  , p.Dtemiss'
      '  , p.Dtvenc'
      '  , p.Dtpag'
      '  , p.Valorpag'
      '  , p.Banco'
      '  , b.Bco_nome'
      '  , p.Numchq'
      '  , p.Historic'
      '  , p.Forma_pagto'
      '  , p.Condicao_pagto'
      '  , Case when p.Quitado = 1 then '#39'X'#39' else '#39'.'#39' end as Pago_'
      '  , p.Docbaix'
      '  , p.Quitado'
      '  , p.Codtpdesp'
      'from TBCONTPAG p'
      '  inner join TBFORNECEDOR f on (f.Codforn = p.Codforn)'
      '  left join TBBANCO_BOLETO b on (b.Bco_cod = p.Banco)')
    GeneratorField.Field = 'NUMLANC'
    GeneratorField.Generator = 'GEN_CONTAPAG_NUM_2013'
    object IbDtstTabelaANOLANC: TSmallintField
      FieldName = 'ANOLANC'
      Origin = 'TBCONTPAG.ANOLANC'
      Required = True
    end
    object IbDtstTabelaNUMLANC: TIntegerField
      DisplayLabel = 'No. Lan'#231'amento'
      FieldName = 'NUMLANC'
      Origin = 'TBCONTPAG.NUMLANC'
    end
    object IbDtstTabelaPARCELA: TSmallintField
      Alignment = taCenter
      DisplayLabel = 'Parcela'
      FieldName = 'PARCELA'
      Origin = 'TBCONTPAG.PARCELA'
      DisplayFormat = '00'
    end
    object IbDtstTabelaCODFORN: TSmallintField
      DisplayLabel = 'Fornecedor'
      FieldName = 'CODFORN'
      Origin = 'TBCONTPAG.CODFORN'
    end
    object IbDtstTabelaNOMEEMP: TIBStringField
      DisplayLabel = 'Empresa'
      FieldName = 'NOMEEMP'
      Origin = 'TBCONTPAG.NOMEEMP'
      Size = 40
    end
    object IbDtstTabelaNOMEFORN: TIBStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'NOMEFORN'
      Origin = 'TBFORNECEDOR.NOMEFORN'
      Size = 60
    end
    object IbDtstTabelaCNPJ: TIBStringField
      FieldName = 'CNPJ'
      Origin = 'TBFORNECEDOR.CNPJ'
      Size = 18
    end
    object IbDtstTabelaNOTFISC: TIBStringField
      DisplayLabel = 'Nota Fiscal'
      FieldName = 'NOTFISC'
      Origin = 'TBCONTPAG.NOTFISC'
      Size = 15
    end
    object IbDtstTabelaTIPPAG: TIBStringField
      DisplayLabel = 'Tipo de Pagamento'
      FieldName = 'TIPPAG'
      Origin = 'TBCONTPAG.TIPPAG'
      Size = 35
    end
    object IbDtstTabelaDTEMISS: TDateField
      Alignment = taCenter
      DisplayLabel = 'Emiss'#227'o'
      FieldName = 'DTEMISS'
      Origin = 'TBCONTPAG.DTEMISS'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/0000;1; '
    end
    object IbDtstTabelaDTVENC: TDateField
      Alignment = taCenter
      DisplayLabel = 'Vencimento'
      FieldName = 'DTVENC'
      Origin = 'TBCONTPAG.DTVENC'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/0000;1; '
    end
    object IbDtstTabelaDTPAG: TDateField
      Alignment = taCenter
      DisplayLabel = 'Data Pagto.'
      FieldName = 'DTPAG'
      Origin = 'TBCONTPAG.DTPAG'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object IbDtstTabelaVALORPAG: TIBBCDField
      DisplayLabel = 'Valor A Pagar (R$)'
      FieldName = 'VALORPAG'
      Origin = 'TBCONTPAG.VALORPAG'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object IbDtstTabelaBANCO: TSmallintField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
      Origin = 'TBCONTPAG.BANCO'
    end
    object IbDtstTabelaBCO_NOME: TIBStringField
      DisplayLabel = 'Banco'
      FieldName = 'BCO_NOME'
      Origin = 'TBBANCO_BOLETO.BCO_NOME'
      Size = 50
    end
    object IbDtstTabelaNUMCHQ: TIBStringField
      DisplayLabel = 'No. Cheque'
      FieldName = 'NUMCHQ'
      Origin = 'TBCONTPAG.NUMCHQ'
      Size = 10
    end
    object IbDtstTabelaPAGO_: TIBStringField
      Alignment = taCenter
      DisplayLabel = 'Pago?'
      FieldName = 'PAGO_'
      FixedChar = True
      Size = 1
    end
    object IbDtstTabelaDOCBAIX: TIBStringField
      DisplayLabel = 'Doc. Baixa'
      FieldName = 'DOCBAIX'
      Origin = 'TBCONTPAG.DOCBAIX'
      Size = 15
    end
    object IbDtstTabelaHISTORIC: TMemoField
      DisplayLabel = 'Hist'#243'rico'
      FieldName = 'HISTORIC'
      Origin = 'TBCONTPAG.HISTORIC'
      BlobType = ftMemo
      Size = 8
    end
    object IbDtstTabelaFORMA_PAGTO: TSmallintField
      DisplayLabel = 'Forma de Pagamento'
      FieldName = 'FORMA_PAGTO'
      Origin = 'TBCONTPAG.FORMA_PAGTO'
    end
    object IbDtstTabelaCONDICAO_PAGTO: TSmallintField
      DisplayLabel = 'Condi'#231#227'o de Pagamento'
      FieldName = 'CONDICAO_PAGTO'
      Origin = 'TBCONTPAG.CONDICAO_PAGTO'
    end
    object IbDtstTabelaQUITADO: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'QUITADO'
      Origin = 'TBCONTPAG.QUITADO'
      Required = True
      OnGetText = IbDtstTabelaQUITADOGetText
    end
    object IbDtstTabelaCODTPDESP: TSmallintField
      FieldName = 'CODTPDESP'
      Origin = 'TBCONTPAG.CODTPDESP'
    end
  end
  inherited IbUpdTabela: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  ANOLANC,'
      '  NUMLANC,'
      '  PARCELA,'
      '  CODFORN,'
      '  TIPPAG,'
      '  HISTORIC,'
      '  NOTFISC,'
      '  DTEMISS,'
      '  DTVENC,'
      '  DTPAG,'
      '  DOCBAIX,'
      '  VALORPAG,'
      '  NOMEEMP,'
      '  TIPOCATEG,'
      '  BANCO,'
      '  NUMCHQ,'
      '  ANOCOMPRA,'
      '  NUMCOMPRA,'
      '  FORMA_PAGTO,'
      '  CONDICAO_PAGTO,'
      '  QUITADO,'
      '  CODTPDESP'
      'from TBCONTPAG '
      'where'
      '  ANOLANC = :ANOLANC and'
      '  NUMLANC = :NUMLANC')
    ModifySQL.Strings = (
      'update TBCONTPAG'
      'set'
      '  ANOLANC = :ANOLANC,'
      '  NUMLANC = :NUMLANC,'
      '  PARCELA = :PARCELA,'
      '  CODFORN = :CODFORN,'
      '  TIPPAG = :TIPPAG,'
      '  HISTORIC = :HISTORIC,'
      '  NOTFISC = :NOTFISC,'
      '  DTEMISS = :DTEMISS,'
      '  DTVENC = :DTVENC,'
      '  DTPAG = :DTPAG,'
      '  DOCBAIX = :DOCBAIX,'
      '  VALORPAG = :VALORPAG,'
      '  NOMEEMP = :NOMEEMP,'
      '  BANCO = :BANCO,'
      '  NUMCHQ = :NUMCHQ,'
      '  FORMA_PAGTO = :FORMA_PAGTO,'
      '  CONDICAO_PAGTO = :CONDICAO_PAGTO,'
      '  QUITADO = :QUITADO,'
      '  CODTPDESP = :CODTPDESP'
      'where'
      '  ANOLANC = :OLD_ANOLANC and'
      '  NUMLANC = :OLD_NUMLANC')
    InsertSQL.Strings = (
      'insert into TBCONTPAG'
      
        '  (ANOLANC, NUMLANC, PARCELA, CODFORN, TIPPAG, HISTORIC, NOTFISC' +
        ', DTEMISS, '
      
        '   DTVENC, DTPAG, DOCBAIX, VALORPAG, NOMEEMP, BANCO, NUMCHQ, FOR' +
        'MA_PAGTO, '
      '   CONDICAO_PAGTO, QUITADO, CODTPDESP)'
      'values'
      
        '  (:ANOLANC, :NUMLANC, :PARCELA, :CODFORN, :TIPPAG, :HISTORIC, :' +
        'NOTFISC, '
      
        '   :DTEMISS, :DTVENC, :DTPAG, :DOCBAIX, :VALORPAG, :NOMEEMP, :BA' +
        'NCO, :NUMCHQ, '
      '   :FORMA_PAGTO, :CONDICAO_PAGTO, :QUITADO, :CODTPDESP)')
    DeleteSQL.Strings = (
      'delete from TBCONTPAG'
      'where'
      '  ANOLANC = :OLD_ANOLANC and'
      '  NUMLANC = :OLD_NUMLANC')
  end
  object tblEmpresa: TIBTable
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'TBEMPRESA'
    Left = 864
    Top = 8
  end
  object dtsEmpresa: TDataSource
    DataSet = tblEmpresa
    Left = 896
    Top = 8
  end
  object tblFormaPagto: TIBTable
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'TBFORMPAGTO'
    Left = 864
    Top = 40
  end
  object dtsFormaPagto: TDataSource
    DataSet = tblFormaPagto
    Left = 896
    Top = 40
  end
  object tblCondicaoPagto: TIBTable
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'COND_COD'
        DataType = ftSmallint
      end
      item
        Name = 'COND_DESCRICAO'
        DataType = ftString
        Size = 80
      end
      item
        Name = 'COND_PRAZO'
        DataType = ftSmallint
      end
      item
        Name = 'COND_PRAZO_01'
        DataType = ftSmallint
      end
      item
        Name = 'COND_PRAZO_02'
        DataType = ftSmallint
      end
      item
        Name = 'COND_PRAZO_03'
        DataType = ftSmallint
      end
      item
        Name = 'COND_PRAZO_04'
        DataType = ftSmallint
      end
      item
        Name = 'COND_PRAZO_05'
        DataType = ftSmallint
      end
      item
        Name = 'COND_PRAZO_06'
        DataType = ftSmallint
      end
      item
        Name = 'COND_PRAZO_07'
        DataType = ftSmallint
      end
      item
        Name = 'COND_PRAZO_08'
        DataType = ftSmallint
      end
      item
        Name = 'COND_PRAZO_09'
        DataType = ftSmallint
      end
      item
        Name = 'COND_PRAZO_10'
        DataType = ftSmallint
      end
      item
        Name = 'COND_PRAZO_11'
        DataType = ftSmallint
      end
      item
        Name = 'COND_PRAZO_12'
        DataType = ftSmallint
      end
      item
        Name = 'COND_DESCRICAO_FULL'
        Attributes = [faReadonly]
        DataType = ftString
        Size = 177
      end>
    StoreDefs = True
    TableName = 'VW_CONDICAOPAGTO'
    TableTypes = [ttView]
    Left = 864
    Top = 72
  end
  object dtsCondicaoPagto: TDataSource
    DataSet = tblCondicaoPagto
    Left = 896
    Top = 72
  end
  object cdsPagamentos: TIBDataSet
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = True
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'Select'
      '    p.Anolanc'
      '  , p.Numlanc'
      '  , p.Seq'
      '  , p.Historico'
      '  , p.Data_pagto'
      '  , p.Forma_pagto'
      '  , f.Descri as Forma_pagto_desc'
      '  , p.Valor_baixa'
      '  , p.Numero_cheque'
      '  , p.Banco'
      '  , b.Bco_nome'
      '  , p.Documento_baixa'
      'from TBCONTPAG_BAIXA p'
      '  left join TBFORMPAGTO f on (f.Cod = p.Forma_pagto)'
      '  left join TBBANCO_BOLETO b on (b.Bco_cod = p.Banco)')
    ModifySQL.Strings = (
      '')
    Left = 624
    Top = 40
    object cdsPagamentosANOLANC: TSmallintField
      FieldName = 'ANOLANC'
      Origin = 'TBCONTPAG_BAIXA.ANOLANC'
      Required = True
    end
    object cdsPagamentosNUMLANC: TIntegerField
      FieldName = 'NUMLANC'
      Origin = 'TBCONTPAG_BAIXA.NUMLANC'
      Required = True
    end
    object cdsPagamentosSEQ: TSmallintField
      Alignment = taCenter
      DisplayLabel = '#'
      FieldName = 'SEQ'
      Origin = 'TBCONTPAG_BAIXA.SEQ'
      Required = True
      DisplayFormat = '00'
    end
    object cdsPagamentosHISTORICO: TMemoField
      FieldName = 'HISTORICO'
      Origin = 'TBCONTPAG_BAIXA.HISTORICO'
      BlobType = ftMemo
      Size = 8
    end
    object cdsPagamentosDATA_PAGTO: TDateField
      Alignment = taCenter
      DisplayLabel = 'Data Pagto.'
      FieldName = 'DATA_PAGTO'
      Origin = 'TBCONTPAG_BAIXA.DATA_PAGTO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsPagamentosFORMA_PAGTO: TSmallintField
      FieldName = 'FORMA_PAGTO'
      Origin = 'TBCONTPAG_BAIXA.FORMA_PAGTO'
    end
    object cdsPagamentosFORMA_PAGTO_DESC: TIBStringField
      DisplayLabel = 'Forma de Pagamento'
      FieldName = 'FORMA_PAGTO_DESC'
      Origin = 'TBFORMPAGTO.DESCRI'
      Size = 30
    end
    object cdsPagamentosVALOR_BAIXA: TIBBCDField
      DisplayLabel = 'Valor Pago (R$)'
      FieldName = 'VALOR_BAIXA'
      Origin = 'TBCONTPAG_BAIXA.VALOR_BAIXA'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsPagamentosNUMERO_CHEQUE: TIBStringField
      DisplayLabel = 'No. Cheque'
      FieldName = 'NUMERO_CHEQUE'
      Origin = 'TBCONTPAG_BAIXA.NUMERO_CHEQUE'
      Size = 10
    end
    object cdsPagamentosBANCO: TSmallintField
      FieldName = 'BANCO'
      Origin = 'TBCONTPAG_BAIXA.BANCO'
    end
    object cdsPagamentosBCO_NOME: TIBStringField
      DisplayLabel = 'Banco'
      FieldName = 'BCO_NOME'
      Origin = 'TBBANCO_BOLETO.BCO_NOME'
      Size = 50
    end
    object cdsPagamentosDOCUMENTO_BAIXA: TIBStringField
      DisplayLabel = 'Doc. Baixa'
      FieldName = 'DOCUMENTO_BAIXA'
      Origin = 'TBCONTPAG_BAIXA.DOCUMENTO_BAIXA'
      Size = 10
    end
  end
  object dtsPagamentos: TDataSource
    AutoEdit = False
    DataSet = cdsPagamentos
    Left = 688
    Top = 40
  end
  object dtsTpDespesa: TDataSource
    DataSet = qryTpDespesa
    Left = 896
    Top = 104
  end
  object qryTpDespesa: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from TBTPDESPESA'
      'order by tipodesp')
    Left = 864
    Top = 104
  end
end
