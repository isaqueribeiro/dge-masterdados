object frmCdVendedor: TfrmCdVendedor
  Left = 373
  Top = 231
  BorderStyle = bsDialog
  Caption = 'Cadastro de Vendedor'
  ClientHeight = 230
  ClientWidth = 413
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 413
    Height = 194
    Align = alClient
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 411
      Height = 192
      Align = alClient
      Caption = 'Dados'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Label1: TLabel
        Left = 224
        Top = 80
        Width = 44
        Height = 13
        Caption = 'C'#243'digo:'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 16
        Top = 32
        Width = 37
        Height = 13
        Caption = 'Nome:'
        FocusControl = DBEdit2
      end
      object Label3: TLabel
        Left = 16
        Top = 80
        Width = 28
        Height = 13
        Caption = 'CPF:'
        FocusControl = DBEdit3
      end
      object DBEdit1: TDBEdit
        Left = 224
        Top = 96
        Width = 57
        Height = 21
        Color = clSilver
        DataField = 'COD'
        DataSource = dtsrcVendedor
        Enabled = False
        TabOrder = 2
      end
      object DBEdit2: TDBEdit
        Left = 16
        Top = 48
        Width = 360
        Height = 21
        DataField = 'NOME'
        DataSource = dtsrcVendedor
        TabOrder = 0
      end
      object DBEdit3: TDBEdit
        Left = 16
        Top = 96
        Width = 160
        Height = 21
        DataField = 'CPF'
        DataSource = dtsrcVendedor
        TabOrder = 1
      end
    end
  end
  object tlbarForn: TToolBar
    Left = 0
    Top = 194
    Width = 413
    Height = 36
    Align = alBottom
    ButtonHeight = 31
    Caption = 'tlbarForn'
    TabOrder = 1
    object btbtnGrav: TBitBtn
      Left = 0
      Top = 2
      Width = 75
      Height = 31
      Caption = 'Gravar'
      TabOrder = 0
      OnClick = btbtnGravClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500000000055
        555557777777775F55550FFFFFFFFF0555557F5555555F7FFF5F0FEEEEEE0000
        05007F555555777775770FFFFFF0BFBFB00E7F5F5557FFF557770F0EEEE000FB
        FB0E7F75FF57775555770FF00F0FBFBFBF0E7F57757FFFF555770FE0B00000FB
        FB0E7F575777775555770FFF0FBFBFBFBF0E7F5575FFFFFFF5770FEEE0000000
        FB0E7F555777777755770FFFFF0B00BFB0007F55557577FFF7770FEEEEE0B000
        05557F555557577775550FFFFFFF0B0555557FF5F5F57575F55500F0F0F0F0B0
        555577F7F7F7F7F75F5550707070700B055557F7F7F7F7757FF5507070707050
        9055575757575757775505050505055505557575757575557555}
      NumGlyphs = 2
    end
    object btbtnCancel: TBitBtn
      Left = 75
      Top = 2
      Width = 75
      Height = 31
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = btbtnCancelClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
        555557777F777555F55500000000555055557777777755F75555005500055055
        555577F5777F57555555005550055555555577FF577F5FF55555500550050055
        5555577FF77577FF555555005050110555555577F757777FF555555505099910
        555555FF75777777FF555005550999910555577F5F77777775F5500505509990
        3055577F75F77777575F55005055090B030555775755777575755555555550B0
        B03055555F555757575755550555550B0B335555755555757555555555555550
        BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
        50BB555555555555575F555555555555550B5555555555555575}
      NumGlyphs = 2
    end
    object ToolButton1: TToolButton
      Left = 150
      Top = 2
      Width = 8
      Caption = 'ToolButton1'
      Style = tbsSeparator
    end
    object btbtnFech: TBitBtn
      Left = 158
      Top = 2
      Width = 75
      Height = 31
      Caption = 'Fechar'
      TabOrder = 2
      OnClick = btbtnFechClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033BBBBBBBBBB
        BB33337777777777777F33BB00BBBBBBBB33337F77333333F37F33BB0BBBBBB0
        BB33337F73F33337FF7F33BBB0BBBB000B33337F37FF3377737F33BBB00BB00B
        BB33337F377F3773337F33BBBB0B00BBBB33337F337F7733337F33BBBB000BBB
        BB33337F33777F33337F33EEEE000EEEEE33337F3F777FFF337F33EE0E80000E
        EE33337F73F77773337F33EEE0800EEEEE33337F37377F33337F33EEEE000EEE
        EE33337F33777F33337F33EEEEE00EEEEE33337F33377FF3337F33EEEEEE00EE
        EE33337F333377F3337F33EEEEEE00EEEE33337F33337733337F33EEEEEEEEEE
        EE33337FFFFFFFFFFF7F33EEEEEEEEEEEE333377777777777773}
      NumGlyphs = 2
    end
    object ToolButton2: TToolButton
      Left = 233
      Top = 2
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 0
      Style = tbsSeparator
    end
    object DBNavigator1: TDBNavigator
      Left = 241
      Top = 2
      Width = 92
      Height = 31
      DataSource = dtsrcVendedor
      VisibleButtons = [nbPrior, nbNext, nbInsert, nbDelete]
      TabOrder = 3
    end
  end
  object ibdtstVendedor: TIBDataSet
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from TBVENDEDOR'
      'where'
      '  COD = :OLD_COD')
    InsertSQL.Strings = (
      'insert into TBVENDEDOR'
      '  (COD, NOME, CPF)'
      'values'
      '  (:COD, :NOME, :CPF)')
    RefreshSQL.Strings = (
      'Select '
      '  COD,'
      '  NOME,'
      '  CPF'
      'from TBVENDEDOR '
      'where'
      '  COD = :COD')
    SelectSQL.Strings = (
      'select * from TBVENDEDOR')
    ModifySQL.Strings = (
      'update TBVENDEDOR'
      'set'
      '  COD = :COD,'
      '  NOME = :NOME,'
      '  CPF = :CPF'
      'where'
      '  COD = :OLD_COD')
    GeneratorField.Field = 'COD'
    GeneratorField.Generator = 'GEN_TBVENDEDOR_ID'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 192
    Top = 112
    object ibdtstVendedorCOD: TIntegerField
      FieldName = 'COD'
      Origin = 'TBVENDEDOR.COD'
      Required = True
    end
    object ibdtstVendedorNOME: TIBStringField
      FieldName = 'NOME'
      Origin = 'TBVENDEDOR.NOME'
      Required = True
      Size = 60
    end
    object ibdtstVendedorCPF: TIBStringField
      FieldName = 'CPF'
      Origin = 'TBVENDEDOR.CPF'
      Required = True
      Size = 12
    end
  end
  object dtsrcVendedor: TDataSource
    DataSet = ibdtstVendedor
    Left = 280
    Top = 112
  end
end
