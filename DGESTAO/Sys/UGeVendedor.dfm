inherited frmGeVendedor: TfrmGeVendedor
  Left = 313
  Top = 229
  Width = 722
  Caption = 'Cadastro de Vendedores'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Width = 706
  end
  inherited Bevel3: TBevel
    Width = 706
  end
  inherited tlbBotoes: TToolBar
    Width = 706
    inherited bvlToolExpandir: TBevel
      Width = 36
    end
    inherited btbtnSelecionar: TBitBtn
      Left = 577
    end
    inherited bvlTool4: TBevel
      Left = 697
    end
  end
  inherited pgcGuias: TPageControl
    Width = 706
    inherited tbsTabela: TTabSheet
      inherited Bevel4: TBevel
        Width = 698
      end
      inherited dbgDados: TDBGrid
        Width = 698
        Columns = <
          item
            Expanded = False
            FieldName = 'COD'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Width = 350
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CPF'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COMISSAO'
            Title.Caption = 'Comiss'#227'o(%)'
            Visible = True
          end>
      end
      inherited pnlFiltros: TPanel
        Width = 698
        inherited grpBxFiltro: TGroupBox
          Left = 404
          Width = 290
          inherited lbltFiltrar: TLabel
            Width = 57
            Caption = 'Vendedor:'
          end
          inherited btnFiltrar: TSpeedButton
            Left = 245
          end
          inherited edtFiltrar: TEdit
            Left = 72
            Width = 169
          end
        end
      end
    end
    inherited tbsCadastro: TTabSheet
      inherited Bevel8: TBevel
        Top = 81
        Width = 698
      end
      inherited GrpBxDadosNominais: TGroupBox
        Width = 698
        Height = 81
        object lblNome: TLabel [1]
          Left = 88
          Top = 24
          Width = 31
          Height = 13
          Caption = 'Nome:'
        end
        object lblCPF: TLabel [2]
          Left = 408
          Top = 24
          Width = 23
          Height = 13
          Caption = 'CPF:'
          FocusControl = dbCPF
        end
        object lblComissao: TLabel [3]
          Left = 520
          Top = 24
          Width = 68
          Height = 13
          Caption = 'Comiss'#227'o(%):'
          FocusControl = dbCPF
        end
        inherited dbCodigo: TDBEdit
          Color = clMoneyGreen
          DataField = 'COD'
        end
        object dbNome: TDBEdit
          Left = 88
          Top = 40
          Width = 313
          Height = 21
          CharCase = ecUpperCase
          DataField = 'NOME'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object dbCPF: TDBEdit
          Left = 408
          Top = 40
          Width = 105
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CPF'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 14
          ParentFont = False
          TabOrder = 2
        end
        object dbComissao: TDBEdit
          Left = 520
          Top = 40
          Width = 81
          Height = 21
          CharCase = ecUpperCase
          DataField = 'COMISSAO'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
      end
    end
  end
  inherited IbDtstTabela: TIBDataSet
    OnNewRecord = IbDtstTabelaNewRecord
    SelectSQL.Strings = (
      'Select'
      '    v.Cod'
      '  , v.Nome'
      '  , v.Cpf'
      '  , v.comissao'
      'from TBVENDEDOR v')
    GeneratorField.Field = 'COD'
    GeneratorField.Generator = 'GEN_GRUPOPRODUTO_COD'
    Left = 488
    object IbDtstTabelaCOD: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD'
      Origin = 'TBVENDEDOR.COD'
      Required = True
    end
    object IbDtstTabelaNOME: TIBStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Origin = 'TBVENDEDOR.NOME'
      Required = True
      Size = 60
    end
    object IbDtstTabelaCPF: TIBStringField
      FieldName = 'CPF'
      Origin = 'TBVENDEDOR.CPF'
      Required = True
      EditMask = '000.000.000-00;0; '
      Size = 12
    end
    object IbDtstTabelaCOMISSAO: TIBBCDField
      FieldName = 'COMISSAO'
      Origin = 'TBVENDEDOR.COMISSAO'
      DisplayFormat = '#0.00'
      Precision = 9
      Size = 2
    end
  end
  inherited DtSrcTabela: TDataSource
    Left = 552
  end
  inherited IbUpdTabela: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  COD,'
      '  NOME,'
      '  CPF,'
      '  COMISSAO'
      'from TBVENDEDOR '
      'where'
      '  COD = :COD')
    ModifySQL.Strings = (
      'update TBVENDEDOR'
      'set'
      '  COD = :COD,'
      '  NOME = :NOME,'
      '  CPF = :CPF,'
      '  COMISSAO = :COMISSAO'
      'where'
      '  COD = :OLD_COD')
    InsertSQL.Strings = (
      'insert into TBVENDEDOR'
      '  (COD, NOME, CPF, COMISSAO)'
      'values'
      '  (:COD, :NOME, :CPF, :COMISSAO)')
    DeleteSQL.Strings = (
      'delete from TBVENDEDOR'
      'where'
      '  COD = :OLD_COD')
    Left = 520
  end
  inherited ImgList: TImageList
    Left = 456
  end
end
