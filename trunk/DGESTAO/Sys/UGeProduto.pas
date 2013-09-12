unit UGeProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoCadastro, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin, IBTable, rxToolEdit, RXDBCtrl, EUserAcs;

type
  TAliquota = (taICMS, taISS);
  TfrmGeProduto = class(TfrmGrPadraoCadastro)
    IbDtstTabelaCODIGO: TIntegerField;
    IbDtstTabelaCOD: TIBStringField;
    IbDtstTabelaDESCRI: TIBStringField;
    IbDtstTabelaMODELO: TIBStringField;
    IbDtstTabelaPRECO: TIBBCDField;
    IbDtstTabelaREFERENCIA: TIBStringField;
    IbDtstTabelaSECAO: TIBStringField;
    IbDtstTabelaQTDE: TIntegerField;
    IbDtstTabelaUNIDADE: TIBStringField;
    IbDtstTabelaESTOQMIN: TSmallintField;
    IbDtstTabelaCODGRUPO: TSmallintField;
    IbDtstTabelaCUSTOMEDIO: TIBBCDField;
    IbDtstTabelaCODEMP: TIBStringField;
    IbDtstTabelaCODSECAO: TSmallintField;
    IbDtstTabelaCODORIGEM: TIBStringField;
    IbDtstTabelaCODTRIBUTACAO: TIBStringField;
    IbDtstTabelaCST: TIBStringField;
    IbDtstTabelaCODCFOP: TIntegerField;
    IbDtstTabelaCODBARRA_EAN: TIBStringField;
    IbDtstTabelaCODUNIDADE: TSmallintField;
    IbDtstTabelaDESCRICAO_GRUPO: TIBStringField;
    IbDtstTabelaDESCRICAO_SECAO: TIBStringField;
    IbDtstTabelaDESCRICAO_UNIDADE: TIBStringField;
    lblDescricao: TLabel;
    dbDescricao: TDBEdit;
    lblReferencia: TLabel;
    dbReferencia: TDBEdit;
    tblEmpresa: TIBTable;
    dtsEmpresa: TDataSource;
    lblModelo: TLabel;
    dbModelo: TDBEdit;
    lblSecao: TLabel;
    dbSecao: TRxDBComboEdit;
    lblGrupo: TLabel;
    dbGrupo: TRxDBComboEdit;
    lblUnidade: TLabel;
    dbUnidade: TRxDBComboEdit;
    IbDtstTabelaALIQUOTA: TIBBCDField;
    IbDtstTabelaCFOP_DESCRICAO: TIBStringField;
    IbDtstTabelaCFOP_ESPECIFICACAO: TMemoField;
    Bevel5: TBevel;
    tblOrigem: TIBTable;
    dtsOrigem: TDataSource;
    tblTributacaoNM: TIBTable;
    dtsTributacaoNM: TDataSource;
    pgcMaisDados: TPageControl;
    tbsValores: TTabSheet;
    tbsHistoricoVeiculo: TTabSheet;
    IbDtstTabelaUNP_SIGLA: TIBStringField;
    GrpBxDadosEstoque: TGroupBox;
    lblEstoqueQtde: TLabel;
    dbEstoqueQtde: TDBEdit;
    lblEstoqueMinimo: TLabel;
    dbEstoqueMinimo: TDBEdit;
    lblEmpresa: TLabel;
    dbEmpresa: TDBLookupComboBox;
    lblCusto: TLabel;
    dbCusto: TDBEdit;
    lblPreco: TLabel;
    dbPreco: TDBEdit;
    lblCodigoEAN: TLabel;
    dbCodigoEAN: TDBEdit;
    tblAliquota: TIBTable;
    dtsAliquota: TDataSource;
    IbDtstTabelaALIQUOTA_TIPO: TSmallintField;
    IbDtstTabelaVALOR_IPI: TIBBCDField;
    lblReserva: TLabel;
    dbReserva: TDBEdit;
    IbDtstTabelaRESERVA: TIntegerField;
    IbDtstTabelaDISPONIVEL: TLargeintField;
    IbDtstTabelaNCM_SH: TIBStringField;
    EvUA: TEvUserAccess;
    tblTributacaoSN: TIBTable;
    dtsTributacaoSN: TDataSource;
    IbDtstTabelaCSOSN: TIBStringField;
    IbDtstTabelaALIQUOTA_CSOSN: TIBBCDField;
    IbDtstTabelaPRECO_PROMOCAO: TIBBCDField;
    lblPrecoPromocao: TLabel;
    dbPrecoPromocao: TDBEdit;
    lblProdutoPromocao: TLabel;
    lblProdutoSemEstoque: TLabel;
    lblProdutoMsgLivre: TLabel;
    lblFabricante: TLabel;
    dbFabricante: TRxDBComboEdit;
    IbDtstTabelaCODFABRICANTE: TIntegerField;
    IbDtstTabelaNOME_FABRICANTE: TIBStringField;
    IbDtstTabelaAPRESENTACAO: TIBStringField;
    IbDtstTabelaDESCRI_APRESENTACAO: TIBStringField;
    IbDtstTabelaPRODUTO_NOVO: TSmallintField;
    tbsEspecificacaoVeiculo: TTabSheet;
    lblApresentacao: TLabel;
    dbApresentacao: TDBEdit;
    dbProdutoNovo: TDBCheckBox;
    IbDtstTabelaCOR_VEICULO: TIBStringField;
    IbDtstTabelaCOMBUSTIVEL_VEICULO: TIBStringField;
    IbDtstTabelaTIPO_VEICULO: TIBStringField;
    IbDtstTabelaRENAVAM_VEICULO: TIBStringField;
    IbDtstTabelaCHASSI_VEICULO: TIBStringField;
    IbDtstTabelaANO_MODELO_VEICULO: TSmallintField;
    IbDtstTabelaANO_FABRICACAO_VEICULO: TSmallintField;
    IbDtstTabelaKILOMETRAGEM_VEICULO: TIntegerField;
    IbDtstTabelaDESCRICAO_COR: TIBStringField;
    IbDtstTabelaDESCRICAO_COMBUSTIVEL: TIBStringField;
    IbDtstTabelaMODELO_FABRICACAO: TIBStringField;
    tblCor: TIBTable;
    dtsCor: TDataSource;
    tblCombustivel: TIBTable;
    dtsCombustivel: TDataSource;
    tblTipoVeiculo: TIBTable;
    dtsTipoVeiculo: TDataSource;
    lblTipoVeiculo: TLabel;
    dbTipoVeiculo: TDBLookupComboBox;
    lblCorVeiculo: TLabel;
    dbCorVeiculo: TDBLookupComboBox;
    lblTipoCombustivel: TLabel;
    dbTipoCombustivel: TDBLookupComboBox;
    lblRenavam: TLabel;
    dbRenavam: TDBEdit;
    lblChassi: TLabel;
    dbChassi: TDBEdit;
    lblAnoModelo: TLabel;
    dbAnoModelo: TDBEdit;
    lblAnoFabricacao: TLabel;
    dbAnoFabricacao: TDBEdit;
    lblKilometragem: TLabel;
    dbKilometragem: TDBEdit;
    IbDtstTabelaSITUACAO_ATUAL_VEICULO: TIBStringField;
    IbDtstTabelaSITUACAO_HISTORICO_VEICULO: TMemoField;
    lblSituacaoVeiculo: TLabel;
    dbSituacaoVeiculo: TDBEdit;
    lblHistoricoSituacaoVeiculo: TLabel;
    dbHistoricoSituacaoVeiculo: TDBMemo;
    tbsTributacao: TTabSheet;
    IbDtstTabelaPERCENTUAL_REDUCAO_BC: TIBBCDField;
    GrpBxDadosTributoICMS: TGroupBox;
    lblOrigem: TLabel;
    lblTipoTributacaoNM: TLabel;
    lblCFOP: TLabel;
    lblAliquota: TLabel;
    lblIPI: TLabel;
    lblAliquotaTipo: TLabel;
    lblNCM_SH: TLabel;
    lblTipoTributacaoSN: TLabel;
    lblAliquotaSN: TLabel;
    lblPercentualReducaoBC: TLabel;
    dbOrigem: TDBLookupComboBox;
    dbTipoTributacaoNM: TDBLookupComboBox;
    dbCFOP: TRxDBComboEdit;
    dbAliquota: TDBEdit;
    dbIPI: TDBEdit;
    dbAliquotaTipo: TDBLookupComboBox;
    dbNCM_SH: TDBEdit;
    dbTipoTributacaoSN: TDBLookupComboBox;
    dbAliquotaSN: TDBEdit;
    dbPercentualReducaoBC: TDBEdit;
    Bevel6: TBevel;
    GrpBxDadosTributoPIS: TGroupBox;
    Bevel7: TBevel;
    lblCSTPIS: TLabel;
    dbCSTPIS: TDBLookupComboBox;
    lblCSTCOFINS: TLabel;
    dbCSTCOFINS: TDBLookupComboBox;
    chkProdutoComEstoque: TCheckBox;
    IbDtstTabelaCST_PIS: TIBStringField;
    IbDtstTabelaCST_COFINS: TIBStringField;
    IbDtstTabelaALIQUOTA_PIS: TIBBCDField;
    IbDtstTabelaALIQUOTA_COFINS: TIBBCDField;
    lblAliquotaCOFINS: TLabel;
    dbAliquotaCOFINS: TDBEdit;
    lblAliquotaPIS: TLabel;
    dbAliquotaPIS: TDBEdit;
    dtsAliquotaPIS: TDataSource;
    dtsAliquotaCOFINS: TDataSource;
    qryAliquotaPIS: TIBDataSet;
    qryAliquotaCOFINS: TIBDataSet;
    lblPercentualMarckup: TLabel;
    dbPercentualMarckup: TDBEdit;
    lblPrecoVendaSugestao: TLabel;
    dbPrecoVendaSugestao: TDBEdit;
    IbDtstTabelaPRECO_SUGERIDO: TIBBCDField;
    IbDtstTabelaPERCENTUAL_MARCKUP: TIBBCDField;
    CmbBxFiltrarTipo: TComboBox;
    lblLucroValor: TLabel;
    dbLucroValor: TDBEdit;
    IbDtstTabelaLUCRO_CALCULADO: TIBBCDField;
    ShpLucroZerado: TShape;
    Label1: TLabel;
    ShpLucroNegativo: TShape;
    Label2: TLabel;
    IbDtstTabelaLUCRO_VALOR: TIBBCDField;
    IbDtstTabelaPERCENTUAL_MARGEM: TIBBCDField;
    IbDtstTabelaFRACIONADOR: TIBBCDField;
    IbDtstTabelaVENDA_FRACIONADA: TSmallintField;
    IbDtstTabelaCODUNIDADE_FRACIONADA: TSmallintField;
    IbDtstTabelaDESCRICAO_UNIDADE_FRAC: TIBStringField;
    IbDtstTabelaUNP_SIGLA_FRAC: TIBStringField;
    GrpBxFracionamentoPreco: TGroupBox;
    lblPrecoFrac: TLabel;
    dbPrecoFrac: TDBEdit;
    dbPrecoPromocaoFrac: TDBEdit;
    lblPrecoPromocaoFrac: TLabel;
    lblPrecoSugeridoFrac: TLabel;
    dbPrecoSugeridoFrac: TDBEdit;
    lblFracionador: TLabel;
    dbFracionador: TDBEdit;
    dbVendaFracionada: TDBCheckBox;
    lblUnidadeFracao: TLabel;
    dbUnidadeFracao: TRxDBComboEdit;
    IbDtstTabelaPRECO_FRAC: TFloatField;
    IbDtstTabelaPRECO_PROMOCAO_FRAC: TFloatField;
    IbDtstTabelaPRECO_SUGERIDO_FRAC: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure dbGrupoButtonClick(Sender: TObject);
    procedure dbSecaoButtonClick(Sender: TObject);
    procedure IbDtstTabelaBeforePost(DataSet: TDataSet);
    procedure dbUnidadeButtonClick(Sender: TObject);
    procedure dbCFOPButtonClick(Sender: TObject);
    procedure IbDtstTabelaNewRecord(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure DtSrcTabelaStateChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbFabricanteButtonClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure chkProdutoComEstoqueClick(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure DtSrcTabelaDataChange(Sender: TObject; Field: TField);
    procedure dbUnidadeFracaoButtonClick(Sender: TObject);
  private
    { Private declarations }
    fOrdenado : Boolean;
    fAliquota : TAliquota;
  public
    { Public declarations }
    procedure FiltarDados(const iTipoPesquisa : Integer); overload;
  end;

var
  frmGeProduto: TfrmGeProduto;

  procedure MostrarTabelaProdutos(const AOwner : TComponent; const TipoAliquota : TAliquota);

  function SelecionarProduto(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean; overload;
  function SelecionarProduto(const AOwner : TComponent; var Codigo : Integer; var CodigoAlfa, Nome : String; const TipoAliquota : TAliquota = taICMS) : Boolean; overload;
  function SelecionarProduto(const AOwner : TComponent; var Codigo : Integer; var CodigoAlfa, Nome, sUnidade, CST : String; var iUnidade, CFOP : Integer; var Aliquota, AliquotaPIS, AliquotaCOFINS, ValorVenda, ValorPromocao, ValorIPI, PercentualRedBC : Currency;
    var Estoque, Reserva : Integer; const TipoAliquota : TAliquota = taICMS) : Boolean; overload;
  function SelecionarProduto(const AOwner : TComponent; var Codigo : Integer; var CodigoAlfa, CodigoEAN, Nome : String; const TipoAliquota : TAliquota = taICMS) : Boolean; overload;
  function SelecionarProduto(const AOwner : TComponent; var Codigo : Integer; var CodigoAlfa, Nome, Unidade : String; var ValorVenda, ValorPromocao : Currency; const TipoAliquota : TAliquota = taICMS) : Boolean; overload;

implementation

uses UDMBusiness, UGeSecaoProduto, UGeGrupoProduto, UGeUnidade,
  UGeTabelaCFOP, UGeFabricante, UConstantesDGE;

{$R *.dfm}

const
  COLUMN_LUCRO = 12;
  COLUMN_GRUPO = 13;

procedure MostrarTabelaProdutos(const AOwner : TComponent; const TipoAliquota : TAliquota);
var
  frm : TfrmGeProduto;
begin
  frm := TfrmGeProduto.Create(AOwner);
  try
    frm.fAliquota := TipoAliquota;

    if frm.chkProdutoComEstoque.Checked then
      frm.WhereAdditional := 'p.Qtde > 0'
    else
      frm.WhereAdditional := EmptyStr;  

    frm.ShowModal;
  finally
    frm.Destroy;
  end;
end;

function SelecionarProduto(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;
var
  frm : TfrmGeProduto;
begin
  frm := TfrmGeProduto.Create(AOwner);
  try
    Result := frm.SelecionarRegistro(Codigo, Nome);
  finally
    frm.Destroy;
  end;
end;

function SelecionarProduto(const AOwner : TComponent; var Codigo : Integer; var CodigoAlfa, Nome : String; const TipoAliquota : TAliquota = taICMS) : Boolean;
var
  frm : TfrmGeProduto;
  whr : String;
begin
  frm := TfrmGeProduto.Create(AOwner);
  try
    frm.fAliquota := TipoAliquota;

    frm.lblAliquotaTipo.Enabled := False;
    frm.dbAliquotaTipo.Enabled  := False;

    whr := 'p.Aliquota_tipo = ' + IntToStr(Ord(TipoAliquota));

    if frm.chkProdutoComEstoque.Checked then
      whr := whr + ' and p.Qtde > 0';

    Result := frm.SelecionarRegistro(Codigo, Nome, whr);

    if ( Result ) then
      CodigoAlfa := frm.IbDtstTabelaCOD.Value;
  finally
    frm.Destroy;
  end;
end;

function SelecionarProduto(const AOwner : TComponent; var Codigo : Integer; var CodigoAlfa, Nome, sUnidade, CST : String; var iUnidade, CFOP : Integer; var Aliquota, AliquotaPIS, AliquotaCOFINS, ValorVenda, ValorPromocao, ValorIPI, PercentualRedBC : Currency;
  var Estoque, Reserva : Integer; const TipoAliquota : TAliquota = taICMS) : Boolean; overload;
var
  frm : TfrmGeProduto;
  whr : String;
begin
  frm := TfrmGeProduto.Create(AOwner);
  try
    frm.fAliquota := TipoAliquota;

    frm.lblAliquotaTipo.Enabled := False;
    frm.dbAliquotaTipo.Enabled  := False;

    whr := 'p.Aliquota_tipo = ' + IntToStr(Ord(TipoAliquota));

    if frm.chkProdutoComEstoque.Checked then
      whr := whr + ' and p.Qtde > 0';

    Result := frm.SelecionarRegistro(Codigo, Nome, whr);

    if ( Result ) then
    begin
      CodigoAlfa := frm.IbDtstTabelaCOD.AsString;
      iUnidade   := frm.IbDtstTabelaCODUNIDADE.AsInteger;
      sUnidade   := frm.IbDtstTabelaUNP_SIGLA.AsString;
      CST        := frm.IbDtstTabelaCST.AsString;
      CFOP       := frm.IbDtstTabelaCODCFOP.AsInteger;
      Aliquota       := frm.IbDtstTabelaALIQUOTA.AsCurrency;
      AliquotaPIS    := frm.IbDtstTabelaALIQUOTA_PIS.AsCurrency;
      AliquotaCOFINS := frm.IbDtstTabelaALIQUOTA_COFINS.AsCurrency;
      ValorVenda    := frm.IbDtstTabelaPRECO.AsCurrency;
      ValorPromocao := frm.IbDtstTabelaPRECO_PROMOCAO.AsCurrency;
      ValorIPI      := frm.IbDtstTabelaVALOR_IPI.AsCurrency;

      PercentualRedBC := frm.IbDtstTabelaPERCENTUAL_REDUCAO_BC.AsCurrency;

      Estoque := frm.IbDtstTabelaQTDE.AsInteger;
      Reserva := frm.IbDtstTabelaRESERVA.AsInteger;
    end;
  finally
    frm.Destroy;
  end;
end;

function SelecionarProduto(const AOwner : TComponent; var Codigo : Integer; var CodigoAlfa, CodigoEAN, Nome : String; const TipoAliquota : TAliquota = taICMS) : Boolean;
var
  frm : TfrmGeProduto;
  whr : String;
begin
  frm := TfrmGeProduto.Create(AOwner);
  try
    frm.fAliquota := TipoAliquota;

    frm.lblAliquotaTipo.Enabled := False;
    frm.dbAliquotaTipo.Enabled  := False;

    whr := 'p.Aliquota_tipo = ' + IntToStr(Ord(TipoAliquota));

    if frm.chkProdutoComEstoque.Checked then
      whr := whr + ' and p.Qtde > 0';

    Result := frm.SelecionarRegistro(Codigo, Nome, whr);

    if ( Result ) then
    begin
      CodigoAlfa := frm.IbDtstTabelaCOD.Value;
      CodigoEAN  := frm.IbDtstTabelaCODBARRA_EAN.Value;
    end;
  finally
    frm.Destroy;
  end;
end;

function SelecionarProduto(const AOwner : TComponent; var Codigo : Integer; var CodigoAlfa, Nome, Unidade : String; var ValorVenda, ValorPromocao : Currency; const TipoAliquota : TAliquota = taICMS) : Boolean;
var
  frm : TfrmGeProduto;
  whr : String;
begin
  frm := TfrmGeProduto.Create(AOwner);
  try
    frm.fAliquota := TipoAliquota;

    frm.lblAliquotaTipo.Enabled := False;
    frm.dbAliquotaTipo.Enabled  := False;

    whr := 'p.Aliquota_tipo = ' + IntToStr(Ord(TipoAliquota));

    if frm.chkProdutoComEstoque.Checked then
      whr := whr + ' and p.Qtde > 0';

    Result := frm.SelecionarRegistro(Codigo, Nome, whr);

    if ( Result ) then
    begin
      CodigoAlfa := frm.IbDtstTabelaCOD.AsString;
      Unidade    := frm.IbDtstTabelaUNIDADE.AsString;
      ValorVenda := frm.IbDtstTabelaPRECO.AsCurrency;
      ValorPromocao := frm.IbDtstTabelaPRECO_PROMOCAO.AsCurrency;
    end;
  finally
    frm.Destroy;
  end;
end;

procedure TfrmGeProduto.FormCreate(Sender: TObject);
begin
  inherited;
  ControlFirstEdit := dbCodigoEAN;

  fOrdenado := False;
  fAliquota := taICMS;

  tblEmpresa.Open;
  tblOrigem.Open;
  tblTributacaoNM.Open;
  tblTributacaoSN.Open;
  tblAliquota.Open;
  qryAliquotaPIS.Open;
  qryAliquotaCOFINS.Open;

  if ( GetSegmentoID(GetEmpresaIDDefault) = SEGMENTO_MERCADO_CARRO_ID ) then
  begin
    tblCor.Open;
    tblCombustivel.Open;
    tblTipoVeiculo.Open;
  end;

  DisplayFormatCodigo := '###0000000';

  NomeTabela     := 'TBPRODUTO';
  CampoCodigo    := 'p.Codigo';
  CampoDescricao := 'p.Descri';

  UpdateGenerator;

  pgcMaisDados.ActivePageIndex := 0;

  {$IFNDEF DGE}
  dbPercentualMarckup.Color    := clWindow;
  dbPercentualMarckup.ReadOnly := False;
  dbPercentualMarckup.TabStop  := True;

  lblPrecoVendaSugestao.Visible := True;
  dbPrecoVendaSugestao.Visible  := True;
  {$ENDIF}
end;

procedure TfrmGeProduto.dbGrupoButtonClick(Sender: TObject);
var
  iCodigo    : Integer;
  sDescricao : String;
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    if ( SelecionarGrupoProduto(Self, iCodigo, sDescricao) ) then
    begin
      IbDtstTabelaCODGRUPO.AsInteger       := iCodigo;
      IbDtstTabelaDESCRICAO_GRUPO.AsString := sDescricao;
    end;
end;

procedure TfrmGeProduto.dbSecaoButtonClick(Sender: TObject);
var
  iCodigo    : Integer;
  sDescricao : String;
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    if ( SelecionarSecaoProduto(Self, iCodigo, sDescricao) ) then
    begin
      IbDtstTabelaCODSECAO.AsInteger       := iCodigo;
      IbDtstTabelaSECAO.AsString           := sDescricao;
      IbDtstTabelaDESCRICAO_SECAO.AsString := sDescricao;
    end;
end;

procedure TfrmGeProduto.IbDtstTabelaBeforePost(DataSet: TDataSet);
begin
  IbDtstTabelaFRACIONADOR.Required           := (IbDtstTabelaVENDA_FRACIONADA.AsInteger = 1);
  IbDtstTabelaCODUNIDADE_FRACIONADA.Required := (IbDtstTabelaVENDA_FRACIONADA.AsInteger = 1);

  inherited;

  IbDtstTabelaDESCRI_APRESENTACAO.AsString := Trim(IbDtstTabelaDESCRI.AsString + ' ' + IbDtstTabelaAPRESENTACAO.AsString);

  if ( IbDtstTabelaQTDE.AsInteger < 0 ) then
    IbDtstTabelaQTDE.Value := 0;

  if ( (IbDtstTabelaRESERVA.AsInteger < 0) or (IbDtstTabelaRESERVA.AsInteger > IbDtstTabelaQTDE.AsInteger) ) then
    IbDtstTabelaRESERVA.Value := 0;

  if ( IbDtstTabelaPRODUTO_NOVO.IsNull ) then
    IbDtstTabelaPRODUTO_NOVO.Value := 0;

  if ( (IbDtstTabelaPERCENTUAL_REDUCAO_BC.AsCurrency < 0) or (IbDtstTabelaPERCENTUAL_REDUCAO_BC.AsCurrency > 100) ) then
    IbDtstTabelaPERCENTUAL_REDUCAO_BC.Value := 0;

  IbDtstTabelaDISPONIVEL.Value := IbDtstTabelaQTDE.Value - IbDtstTabelaRESERVA.Value;

  IbDtstTabelaCST.Value := IbDtstTabelaCODORIGEM.AsString + IbDtstTabelaCODTRIBUTACAO.AsString;

  if ( IbDtstTabelaPERCENTUAL_MARGEM.IsNull and (not IbDtstTabelaPERCENTUAL_MARCKUP.IsNull) ) then
    IbDtstTabelaPERCENTUAL_MARGEM.Value := IbDtstTabelaPERCENTUAL_MARCKUP.Value;

  if ( IbDtstTabela.State = dsInsert ) then
    if ( Trim(IbDtstTabelaCOD.AsString) = EmptyStr ) then
      IbDtstTabelaCOD.Value := FormatFloat(DisplayFormatCodigo, IbDtstTabelaCODIGO.AsInteger);

  if Trim(VarToStr(IbDtstTabelaSITUACAO_ATUAL_VEICULO.OldValue)) <> Trim(VarToStr(IbDtstTabelaSITUACAO_ATUAL_VEICULO.NewValue)) then
    if (Trim(VarToStr(IbDtstTabelaSITUACAO_ATUAL_VEICULO.OldValue)) <> EmptyStr) and (Trim(VarToStr(IbDtstTabelaSITUACAO_ATUAL_VEICULO.NewValue)) <> EmptyStr) then
      IbDtstTabelaSITUACAO_HISTORICO_VEICULO.AsString :=
        FormatDateTime('dd/mm/yyyy hh:mm', GetDateTimeDB)           + ' - '  +
        Trim(VarToStr(IbDtstTabelaSITUACAO_ATUAL_VEICULO.OldValue)) + ' -> ' +
        Trim(VarToStr(IbDtstTabelaSITUACAO_ATUAL_VEICULO.NewValue)) + ' (' + GetUserApp + ')' + #13 +
        Trim(IbDtstTabelaSITUACAO_HISTORICO_VEICULO.AsString);

  IbDtstTabelaDESCRICAO_COR.AsString         := dbCorVeiculo.Text;
  IbDtstTabelaDESCRICAO_COMBUSTIVEL.AsString := dbTipoCombustivel.Text;
  IbDtstTabelaMODELO_FABRICACAO.AsString     := dbAnoFabricacao.Text + '/' + dbAnoModelo.Text;

  if ( IbDtstTabelaFRACIONADOR.AsCurrency <= 0 ) then
    IbDtstTabelaFRACIONADOR.AsCurrency := 1;
end;

procedure TfrmGeProduto.dbUnidadeButtonClick(Sender: TObject);
var
  iCodigo    : Integer;
  sDescricao,
  sSigla    : String;
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    if ( SelecionarUnidade(Self, iCodigo, sDescricao, sSigla) ) then
    begin
      IbDtstTabelaCODUNIDADE.AsInteger       := iCodigo;
      IbDtstTabelaUNIDADE.AsString           := sDescricao;
      IbDtstTabelaDESCRICAO_UNIDADE.AsString := sDescricao;
      IbDtstTabelaUNP_SIGLA.AsString         := sSigla;
    end;
end;

procedure TfrmGeProduto.dbCFOPButtonClick(Sender: TObject);
var
  iCodigo    : Integer;
  sDescricao : String;
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    if ( SelecionarCFOP(Self, iCodigo, sDescricao) ) then
    begin
      IbDtstTabelaCODCFOP.AsInteger       := iCodigo;
      IbDtstTabelaCFOP_DESCRICAO.AsString := sDescricao;
    end;
end;

procedure TfrmGeProduto.IbDtstTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  if ( not tblEmpresa.IsEmpty ) then
    IbDtstTabelaCODEMP.Value := tblEmpresa.FieldByName('CNPJ').AsString;

  if ( not tblOrigem.IsEmpty ) then
    IbDtstTabelaCODORIGEM.Value := tblOrigem.FieldByName('ORP_COD').AsString;

  if ( not tblTributacaoNM.IsEmpty ) then
    IbDtstTabelaCODTRIBUTACAO.Value := tblTributacaoNM.FieldByName('TPT_COD').AsString;

  IbDtstTabelaCST.Value      := IbDtstTabelaCODORIGEM.AsString + IbDtstTabelaCODTRIBUTACAO.AsString;
  IbDtstTabelaESTOQMIN.Value := 0;
  IbDtstTabelaQTDE.Value     := 0;
  IbDtstTabelaCUSTOMEDIO.Value := 0;
  IbDtstTabelaPRECO.Value      := 0;
  IbDtstTabelaCODCFOP.Value        := GetCfopIDDefault;
  IbDtstTabelaCFOP_DESCRICAO.Value := GetCfopNomeDefault;
  IbDtstTabelaALIQUOTA_TIPO.Value  := Ord(fAliquota);
  IbDtstTabelaALIQUOTA.Value       := 0;
  IbDtstTabelaALIQUOTA_CSOSN.Value := 0;
  IbDtstTabelaVALOR_IPI.Value      := 0;
  IbDtstTabelaRESERVA.Value        := 0;
  IbDtstTabelaPRODUTO_NOVO.Value   := 0;
  IbDtstTabelaPERCENTUAL_MARCKUP.Value := 0;
  IbDtstTabelaPRECO_SUGERIDO.Value     := 0;

  IbDtstTabelaFRACIONADOR.Value        := 1;
  IbDtstTabelaVENDA_FRACIONADA.Value   := 0;

  IbDtstTabelaPERCENTUAL_REDUCAO_BC.Value := 0;

  IbDtstTabelaCOR_VEICULO.Clear;
  IbDtstTabelaCOMBUSTIVEL_VEICULO.Clear;
  IbDtstTabelaTIPO_VEICULO.Clear;
  IbDtstTabelaRENAVAM_VEICULO.Clear;
  IbDtstTabelaCHASSI_VEICULO.Clear;
  IbDtstTabelaANO_MODELO_VEICULO.Clear;
  IbDtstTabelaANO_FABRICACAO_VEICULO.Clear;

  IbDtstTabelaCST_PIS.AsString    := '99';
  IbDtstTabelaCST_COFINS.AsString := '99';
  IbDtstTabelaALIQUOTA_PIS.AsCurrency    := 0.0;
  IbDtstTabelaALIQUOTA_COFINS.AsCurrency := 0.0;
end;

procedure TfrmGeProduto.FormShow(Sender: TObject);
var
  S : String;
begin
  S := StrDescricaoProduto;
  Case fAliquota of
    taICMS :
      Caption := 'Cadastro de ' + S;
    taISS :
      Caption := 'Cadastro de Serviços';
    else
      Caption := 'Cadastro de ' + S + '/Serviços';
  end;

  if (not fOrdenado) then
  begin
    IbDtstTabela.SelectSQL.Add( 'order by ' + CampoDescricao );
    fOrdenado := True;
  end;

  inherited;

  // Configurar Legendas de acordo com o segmento
  tbsEspecificacaoVeiculo.TabVisible := (GetSegmentoID(GetEmpresaIDDefault) = SEGMENTO_MERCADO_CARRO_ID);
  tbsHistoricoVeiculo.TabVisible     := (GetSegmentoID(GetEmpresaIDDefault) = SEGMENTO_MERCADO_CARRO_ID);

  if ( tbsEspecificacaoVeiculo.TabVisible ) then
  begin
    lblReferencia.Caption               := 'Placa:';
    IbDtstTabelaREFERENCIA.DisplayLabel := 'Placa';
  end;

  IbDtstTabelaCOR_VEICULO.Required            := tbsEspecificacaoVeiculo.TabVisible;
  IbDtstTabelaCOMBUSTIVEL_VEICULO.Required    := tbsEspecificacaoVeiculo.TabVisible;
  IbDtstTabelaTIPO_VEICULO.Required           := tbsEspecificacaoVeiculo.TabVisible;
  IbDtstTabelaRENAVAM_VEICULO.Required        := tbsEspecificacaoVeiculo.TabVisible;
  IbDtstTabelaCHASSI_VEICULO.Required         := tbsEspecificacaoVeiculo.TabVisible;
  IbDtstTabelaKILOMETRAGEM_VEICULO.Required   := tbsEspecificacaoVeiculo.TabVisible;
  IbDtstTabelaANO_MODELO_VEICULO.Required     := tbsEspecificacaoVeiculo.TabVisible;
  IbDtstTabelaANO_FABRICACAO_VEICULO.Required := tbsEspecificacaoVeiculo.TabVisible;

  with dbgDados do
  begin
    Columns[2].Visible  := not tbsEspecificacaoVeiculo.TabVisible;
    Columns[4].Visible  := tbsEspecificacaoVeiculo.TabVisible;
    Columns[5].Visible  := tbsEspecificacaoVeiculo.TabVisible;
    Columns[6].Visible  := tbsEspecificacaoVeiculo.TabVisible;
    Columns[7].Visible  := tbsEspecificacaoVeiculo.TabVisible;
    Columns[8].Visible  := tbsEspecificacaoVeiculo.TabVisible;
    Columns[9].Visible  := not tbsEspecificacaoVeiculo.TabVisible;
    Columns[COLUMN_GRUPO].Visible := not tbsEspecificacaoVeiculo.TabVisible;
  end;
end;

procedure TfrmGeProduto.DtSrcTabelaStateChange(Sender: TObject);
begin
  inherited;
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    pgcMaisDados.ActivePageIndex := 0;
end;

procedure TfrmGeProduto.FormActivate(Sender: TObject);
begin
  inherited;
  EvUA.UserID := GetUserFunctionID;

  Case GetUserFunctionID of
    FUNCTION_USER_ID_ESTOQUISTA ,
    FUNCTION_USER_ID_VENDEDOR   ,
    FUNCTION_USER_ID_CAIXA      ,
    FUNCTION_USER_ID_AUX_FINANC1,
    FUNCTION_USER_ID_AUX_FINANC2:
      begin
        btbtnIncluir.Visible  := False;
        btbtnAlterar.Visible  := False;
        btbtnExcluir.Visible  := False;
        btbtnCancelar.Visible := False;
        btbtnSalvar.Visible   := False;

        DtSrcTabela.AutoEdit := False;

        lblCusto.Visible := False;
        dbCusto.Visible  := False;

        lblPercentualMarckup.Visible := False;
        dbPercentualMarckup.Visible  := False;

        lblLucroValor.Visible := False;
        dbLucroValor.Visible  := False;
      end;
  end;


  if pgcGuias.ActivePage = tbsTabela then
  begin
    FiltarDados;
    if ( edtFiltrar.Visible and edtFiltrar.Enabled ) then
      edtFiltrar.SetFocus;
  end;

  dbgDados.Columns[COLUMN_LUCRO].Visible := ( DMBusiness.ibdtstUsersCODFUNCAO.AsInteger in [FUNCTION_USER_ID_DIRETORIA..FUNCTION_USER_ID_GERENTE_FIN,
    FUNCTION_USER_ID_AUX_FINANC1, FUNCTION_USER_ID_AUX_FINANC2, FUNCTION_USER_ID_SUPORTE_TI, FUNCTION_USER_ID_SYSTEM_ADM] );
end;

procedure TfrmGeProduto.dbgDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  // Destacar produtos em Promocao
  if ( IbDtstTabelaQTDE.AsInteger <= 0 ) then
    dbgDados.Canvas.Font.Color := lblProdutoSemEstoque.Font.Color
  else
  // Destacar produtos em Promocao
  if ( IbDtstTabelaPRECO_PROMOCAO.AsCurrency > 0 ) then
    dbgDados.Canvas.Font.Color := lblProdutoPromocao.Font.Color;
    
  // Destacar alerta de lucros
  if (not IbDtstTabelaLUCRO_CALCULADO.IsNull) then
  begin
    if ( IbDtstTabelaLUCRO_CALCULADO.AsInteger = 0 ) then
      dbgDados.Canvas.Brush.Color := ShpLucroZerado.Brush.Color
    else
    if ( IbDtstTabelaLUCRO_CALCULADO.AsInteger < 0 ) then
      dbgDados.Canvas.Brush.Color := ShpLucroNegativo.Brush.Color;
  end;

  dbgDados.DefaultDrawDataCell(Rect, dbgDados.Columns[DataCol].Field, State);
end;

procedure TfrmGeProduto.dbFabricanteButtonClick(Sender: TObject);
var
  iCodigo : Integer;
  sNome   : String;
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    if ( SelecionarFabricante(Self, iCodigo, sNome) ) then
    begin
      IbDtstTabelaCODFABRICANTE.AsInteger  := iCodigo;
      IbDtstTabelaNOME_FABRICANTE.AsString := sNome;
    end;
end;

procedure TfrmGeProduto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    if ( (ActiveControl = dbProdutoNovo) and tbsTributacao.TabVisible ) then
    begin
      pgcMaisDados.ActivePage := tbsTributacao;
      dbOrigem.SetFocus;
      Exit;
    end
    else
    if ( (ActiveControl = dbAliquotaCOFINS) and tbsEspecificacaoVeiculo.TabVisible ) then
    begin
      pgcMaisDados.ActivePage := tbsEspecificacaoVeiculo;
      dbTipoVeiculo.SetFocus;
      Exit;
    end
    else
    if ( (ActiveControl = dbKilometragem) and tbsHistoricoVeiculo.TabVisible ) then
    begin
      pgcMaisDados.ActivePage := tbsHistoricoVeiculo;
      dbSituacaoVeiculo.SetFocus;
      Exit;
    end;

  inherited;

end;

procedure TfrmGeProduto.chkProdutoComEstoqueClick(Sender: TObject);
begin
  if ( (pgcGuias.ActivePage = tbsTabela) and (edtFiltrar.Visible and edtFiltrar.Enabled) ) then
    edtFiltrar.SetFocus;
end;

procedure TfrmGeProduto.btnFiltrarClick(Sender: TObject);
begin
  if chkProdutoComEstoque.Checked then
    WhereAdditional := 'p.Qtde > 0'
  else
    WhereAdditional := EmptyStr;  

  // inherited;
  FiltarDados(CmbBxFiltrarTipo.ItemIndex);
end;

procedure TfrmGeProduto.DtSrcTabelaDataChange(Sender: TObject;
  Field: TField);
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    if ( Field = IbDtstTabelaPERCENTUAL_MARGEM ) then
      IbDtstTabelaPRECO_SUGERIDO.AsCurrency := IbDtstTabelaCUSTOMEDIO.AsCurrency +
        (IbDtstTabelaCUSTOMEDIO.AsCurrency * IbDtstTabelaPERCENTUAL_MARGEM.AsCurrency / 100);
end;

procedure TfrmGeProduto.FiltarDados(const iTipoPesquisa : Integer);
begin
  try

    if (Trim(CampoCodigo) = EmptyStr) or ((Trim(CampoDescricao) = EmptyStr)) then
    begin
      ShowWarning('O nome do campo chave e/ou de descrição não foram informados');
      Abort;
    end;

    with IbDtstTabela, SelectSQL do
    begin
      if ( Trim(CampoOrdenacao) = EmptyStr ) then
        CampoOrdenacao := CampoDescricao;

      Close;
      Clear;
      AddStrings( SQLTabela );

      if ( Trim(edtFiltrar.Text) <> EmptyStr ) then
      begin

        Case iTipoPesquisa of
          // Por Código, Descrição
          0:
            if ( StrToIntDef(Trim(edtFiltrar.Text), 0) > 0 ) then
              Add( 'where ' + CampoCodigo +  ' = ' + Trim(edtFiltrar.Text) )
            else
              Add( 'where (upper(' + CampoDescricao +  ') like ' + QuotedStr('%' + UpperCase(Trim(edtFiltrar.Text)) + '%') +
                   '    or upper(' + CampoDescricao +  ') like ' + QuotedStr('%' + UpperCase(FuncoesString.StrRemoveAllAccents(Trim(edtFiltrar.Text))) + '%') + ')');

          // Por Referência
          1:
            Add( 'where p.Referencia = ' + QuotedStr(Trim(edtFiltrar.Text)) );

          // Por Fabricante
          2:
            if ( StrToIntDef(Trim(edtFiltrar.Text), 0) > 0 ) then
              Add( 'where p.Codfabricante = ' + Trim(edtFiltrar.Text) )
            else
              Add( 'where (upper(f.Nome) like ' + QuotedStr('%' + UpperCase(Trim(edtFiltrar.Text)) + '%') + ')' );

          // Por Grupo
          3:
            if ( StrToIntDef(Trim(edtFiltrar.Text), 0) > 0 ) then
              Add( 'where p.Codgrupo = ' + Trim(edtFiltrar.Text) )
            else
              Add( 'where (upper(g.Descri) like ' + QuotedStr('%' + UpperCase(Trim(edtFiltrar.Text)) + '%') + ')' );
        end;

      end;

      if ( WhereAdditional <> EmptyStr ) then
        if ( Pos('where', SelectSQL.Text) > 0 ) then
          Add( '  and (' + WhereAdditional + ')' )
        else
          Add( 'where (' + WhereAdditional + ')' );

      Add( 'order by ' + CampoOrdenacao );

      Open;

      try
      
        if ( not IsEmpty ) then
          dbgDados.SetFocus
        else
        begin
          ShowWarning('Não existe registros na tabela para este tipo de pesquisa');

          edtFiltrar.SetFocus;
          edtFiltrar.SelectAll;
        end;

      except
      end;

    end;
  except
    On E : Exception do
      ShowWarning('Erro ao tentar filtrar registros na tabela.' + #13#13 + E.Message + #13#13 + 'Script:' + #13 + IbDtstTabela.SelectSQL.Text);
  end;
end;

procedure TfrmGeProduto.dbUnidadeFracaoButtonClick(Sender: TObject);
var
  iCodigo    : Integer;
  sDescricao,
  sSigla    : String;
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    if ( SelecionarUnidade(Self, iCodigo, sDescricao, sSigla) ) then
    begin
      IbDtstTabelaCODUNIDADE_FRACIONADA.AsInteger := iCodigo;
      IbDtstTabelaDESCRICAO_UNIDADE_FRAC.AsString := sDescricao;
      IbDtstTabelaUNP_SIGLA_FRAC.AsString         := sSigla;
    end;
end;

end.
