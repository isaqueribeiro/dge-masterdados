object Form1: TForm1
  Left = 193
  Top = 107
  Width = 309
  Height = 418
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label0: TLabel
    Left = 8
    Top = 12
    Width = 95
    Height = 13
    Caption = 'Arquivo de Licen'#231'a:'
  end
  object Label1: TLabel
    Left = 16
    Top = 48
    Width = 104
    Height = 13
    Caption = 'Dado Configura'#231#227'o 1:'
    Visible = False
  end
  object Label2: TLabel
    Left = 16
    Top = 88
    Width = 104
    Height = 13
    Caption = 'Dado Configura'#231#227'o 2:'
    Visible = False
  end
  object Label3: TLabel
    Left = 16
    Top = 128
    Width = 104
    Height = 13
    Caption = 'Dado Configura'#231#227'o 3:'
    Visible = False
  end
  object Label4: TLabel
    Left = 16
    Top = 168
    Width = 104
    Height = 13
    Caption = 'Dado Configura'#231#227'o 4:'
    Visible = False
  end
  object Label5: TLabel
    Left = 16
    Top = 208
    Width = 104
    Height = 13
    Caption = 'Dado Configura'#231#227'o 5:'
    Visible = False
  end
  object Label6: TLabel
    Left = 16
    Top = 248
    Width = 103
    Height = 13
    Caption = 'In'#237'cio Nosso N'#250'mero:'
    Visible = False
  end
  object Label7: TLabel
    Left = 16
    Top = 288
    Width = 92
    Height = 13
    Caption = 'Fim Nosso N'#250'mero:'
    Visible = False
  end
  object Label8: TLabel
    Left = 16
    Top = 328
    Width = 113
    Height = 13
    Caption = 'Pr'#243'ximo Nosso N'#250'mero:'
    Visible = False
  end
  object Edit1: TEdit
    Left = 108
    Top = 8
    Width = 93
    Height = 21
    Hint = 'Digite o nome e localiza'#231#227'o do arquivo de licen'#231'a'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    Text = 'C:\001-51.conf'
  end
  object MaskEdit1: TMaskEdit
    Left = 16
    Top = 64
    Width = 189
    Height = 21
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    Visible = False
  end
  object MaskEdit2: TMaskEdit
    Left = 16
    Top = 104
    Width = 189
    Height = 21
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    Visible = False
  end
  object MaskEdit3: TMaskEdit
    Left = 16
    Top = 144
    Width = 189
    Height = 21
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    Visible = False
  end
  object MaskEdit4: TMaskEdit
    Left = 16
    Top = 184
    Width = 189
    Height = 21
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    Visible = False
  end
  object MaskEdit5: TMaskEdit
    Left = 16
    Top = 224
    Width = 189
    Height = 21
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    Visible = False
  end
  object MaskEdit6: TMaskEdit
    Left = 16
    Top = 264
    Width = 189
    Height = 21
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
    Visible = False
  end
  object MaskEdit7: TMaskEdit
    Left = 16
    Top = 304
    Width = 189
    Height = 21
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
    Visible = False
  end
  object BitBtn1: TBitBtn
    Left = 208
    Top = 34
    Width = 75
    Height = 22
    Caption = 'Salvar'
    Enabled = False
    TabOrder = 11
    OnClick = BitBtn1Click
  end
  object BitBtn3: TBitBtn
    Left = 208
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Configurar'
    TabOrder = 1
    OnClick = BitBtn3Click
  end
  object MaskEdit8: TMaskEdit
    Left = 16
    Top = 344
    Width = 189
    Height = 21
    ParentShowHint = False
    ShowHint = True
    TabOrder = 10
    Visible = False
  end
  object BitBtn2: TBitBtn
    Left = 208
    Top = 58
    Width = 75
    Height = 22
    Caption = 'Imprimir Boleto'
    TabOrder = 2
    OnClick = BitBtn2Click
  end
end
