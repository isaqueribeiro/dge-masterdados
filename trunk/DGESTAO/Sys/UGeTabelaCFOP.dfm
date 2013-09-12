inherited frmGeTabelaCFOP: TfrmGeTabelaCFOP
  Left = 554
  Top = 267
  Width = 744
  Caption = 'Tabela CFOP (C'#243'digo Fiscal de Opera'#231#245'es e Presta'#231#245'es)'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Width = 728
  end
  inherited Bevel3: TBevel
    Width = 728
  end
  inherited tlbBotoes: TToolBar
    Width = 728
  end
  inherited pgcGuias: TPageControl
    Width = 728
    inherited tbsTabela: TTabSheet
      inherited Bevel4: TBevel
        Width = 720
      end
      inherited dbgDados: TDBGrid
        Width = 720
        Columns = <
          item
            Expanded = False
            FieldName = 'CFOP_COD'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CFOP_DESCRICAO'
            Width = 600
            Visible = True
          end>
      end
      inherited pnlFiltros: TPanel
        Width = 720
        inherited grpBxFiltro: TGroupBox
          Left = 464
          inherited lbltFiltrar: TLabel
            Width = 31
            Caption = 'CFOP:'
          end
          inherited edtFiltrar: TEdit
            Left = 48
            Width = 155
          end
        end
      end
    end
    inherited tbsCadastro: TTabSheet
      inherited Bevel8: TBevel
        Top = 225
        Width = 720
      end
      inherited GrpBxDadosNominais: TGroupBox
        Width = 720
        Height = 225
        object lblNome: TLabel [1]
          Left = 88
          Top = 24
          Width = 50
          Height = 13
          Caption = 'Descri'#231#227'o:'
        end
        object lblEspecificacao: TLabel [2]
          Left = 16
          Top = 64
          Width = 50
          Height = 13
          Caption = 'Descri'#231#227'o:'
        end
        inherited dbCodigo: TDBEdit
          DataField = 'CFOP_COD'
          ReadOnly = False
        end
        object dbNome: TDBEdit
          Left = 88
          Top = 40
          Width = 617
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CFOP_DESCRICAO'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object dbEspecificacao: TDBMemo
          Left = 16
          Top = 80
          Width = 689
          Height = 129
          DataField = 'CFOP_ESPECIFICACAO'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ScrollBars = ssVertical
          TabOrder = 2
        end
      end
    end
  end
  inherited IbDtstTabela: TIBDataSet
    SelectSQL.Strings = (
      'Select'
      '    c.Cfop_cod'
      '  , c.Cfop_descricao'
      '  , c.Cfop_especificacao'
      'from TBCFOP c')
    object IbDtstTabelaCFOP_COD: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CFOP_COD'
      Origin = 'TBCFOP.CFOP_COD'
      Required = True
    end
    object IbDtstTabelaCFOP_DESCRICAO: TIBStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'CFOP_DESCRICAO'
      Origin = 'TBCFOP.CFOP_DESCRICAO'
      Size = 250
    end
    object IbDtstTabelaCFOP_ESPECIFICACAO: TMemoField
      DisplayLabel = 'Especifica'#231#227'o'
      FieldName = 'CFOP_ESPECIFICACAO'
      Origin = 'TBCFOP.CFOP_ESPECIFICACAO'
      BlobType = ftMemo
      Size = 8
    end
  end
  inherited IbUpdTabela: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  CFOP_COD,'
      '  CFOP_DESCRICAO,'
      '  CFOP_ESPECIFICACAO'
      'from TBCFOP '
      'where'
      '  CFOP_COD = :CFOP_COD')
    ModifySQL.Strings = (
      'update TBCFOP'
      'set'
      '  CFOP_COD = :CFOP_COD,'
      '  CFOP_DESCRICAO = :CFOP_DESCRICAO,'
      '  CFOP_ESPECIFICACAO = :CFOP_ESPECIFICACAO'
      'where'
      '  CFOP_COD = :OLD_CFOP_COD')
    InsertSQL.Strings = (
      'insert into TBCFOP'
      '  (CFOP_COD, CFOP_DESCRICAO, CFOP_ESPECIFICACAO)'
      'values'
      '  (:CFOP_COD, :CFOP_DESCRICAO, :CFOP_ESPECIFICACAO)')
    DeleteSQL.Strings = (
      'delete from TBCFOP'
      'where'
      '  CFOP_COD = :OLD_CFOP_COD')
  end
end
