unit UGeCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoCadastro, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin, IBTable, rxToolEdit, RXDBCtrl, IBQuery, Menus, JPEG,
  UObserverInterface, UCliente, ACBrBase, ACBrSocket, ACBrConsultaCNPJ,
  ACBrConsultaCPF;

type
  TfrmGeCliente = class(TfrmGrPadraoCadastro, IObserver) // Observador
    IbDtstTabelaCODIGO: TIntegerField;
    IbDtstTabelaPESSOA_FISICA: TSmallintField;
    IbDtstTabelaCNPJ: TIBStringField;
    IbDtstTabelaENDER: TIBStringField;
    IbDtstTabelaCOMPLEMENTO: TIBStringField;
    IbDtstTabelaNUMERO_END: TIBStringField;
    IbDtstTabelaCEP: TIBStringField;
    IbDtstTabelaCIDADE: TIBStringField;
    IbDtstTabelaUF: TIBStringField;
    IbDtstTabelaFONE: TIBStringField;
    IbDtstTabelaTLG_TIPO: TSmallintField;
    IbDtstTabelaLOG_COD: TIntegerField;
    IbDtstTabelaBAI_COD: TIntegerField;
    IbDtstTabelaCID_COD: TIntegerField;
    IbDtstTabelaEST_COD: TSmallintField;
    IbDtstTabelaLOGRADOURO: TIBStringField;
    IbDtstTabelaBAIRRO: TIBStringField;
    IbDtstTabelaEMAIL: TIBStringField;
    dbPessoaFisica: TDBCheckBox;
    lblCNPJ: TLabel;
    lblRazao: TLabel;
    dbRazao: TDBEdit;
    lblIE: TLabel;
    dbIE: TDBEdit;
    lblIM: TLabel;
    dbIM: TDBEdit;
    GroupBox1: TGroupBox;
    lblCidade: TLabel;
    dbCidade: TRxDBComboEdit;
    Bevel5: TBevel;
    lblEstado: TLabel;
    dbEstado: TRxDBComboEdit;
    pgcMaisDados: TPageControl;
    tbsContato: TTabSheet;
    tbsFinanceiro: TTabSheet;
    lblBairro: TLabel;
    dbBairro: TRxDBComboEdit;
    lblLogradouro: TLabel;
    dbLogradouro: TRxDBComboEdit;
    lblCEP: TLabel;
    dbCEP: TDBEdit;
    lblNumero: TLabel;
    dbNumero: TDBEdit;
    lblComplemento: TLabel;
    dbComplemento: TDBEdit;
    lblFoneFixo: TLabel;
    dbFoneFixo: TDBEdit;
    lblEmail: TLabel;
    dbEmail: TDBEdit;
    lblHome: TLabel;
    dbHome: TDBEdit;
    IbDtstTabelaPAIS_ID: TIBStringField;
    IbDtstTabelaEST_NOME: TIBStringField;
    IbDtstTabelaCID_NOME: TIBStringField;
    IbDtstTabelaPAIS_NOME: TIBStringField;
    IbDtstTabelaNOME: TIBStringField;
    IbDtstTabelaINSCEST: TIBStringField;
    IbDtstTabelaINSCMUN: TIBStringField;
    IbDtstTabelaSITE: TIBStringField;
    lblPais: TLabel;
    dbPais: TRxDBComboEdit;
    lblValorLimiteCompra: TLabel;
    dbValorLimiteCompra: TDBEdit;
    IbDtstTabelaVALOR_LIMITE_COMPRA: TIBBCDField;
    lblTotalCompras: TLabel;
    dbTotalCompras: TDBEdit;
    qryTotalComprasAbertas: TIBQuery;
    cdsTotalComprasAbertas: TDataSource;
    qryTotalComprasAbertasVALOR_LIMITE: TIBBCDField;
    qryTotalComprasAbertasVALOR_COMPRAS_ABERTAS: TIBBCDField;
    qryTotalComprasAbertasVALOR_LIMITE_DISPONIVEL: TIBBCDField;
    lblLimiteDisponivel: TLabel;
    dbLimiteDisponivel: TDBEdit;
    qryTitulos: TIBQuery;
    dtsTitulos: TDataSource;
    qryTitulosANOLANC: TSmallintField;
    qryTitulosNUMLANC: TIntegerField;
    qryTitulosLANCAMENTO: TIBStringField;
    qryTitulosPARCELA: TSmallintField;
    qryTitulosDTEMISS: TDateField;
    qryTitulosDTVENC: TDateField;
    qryTitulosFORMA_PAGTO: TSmallintField;
    qryTitulosFORMA_PAGTO_DESC: TIBStringField;
    qryTitulosNOSSONUMERO: TIBStringField;
    qryTitulosVALORREC: TIBBCDField;
    qryTitulosVALORMULTA: TIBBCDField;
    qryTitulosVALORRECTOT: TIBBCDField;
    qryTitulosVALORSALDO: TIBBCDField;
    qryTitulosSTATUS: TIBStringField;
    qryTitulosSITUACAO: TSmallintField;
    pnlTitulos: TPanel;
    dbgTitulos: TDBGrid;
    lblTituloCancelado: TLabel;
    lblTituloPagando: TLabel;
    IbDtstTabelaDTCAD: TDateField;
    lblDataCadastro: TLabel;
    dbDataCadastro: TDBEdit;
    qryTitulosANOVENDA: TSmallintField;
    qryTitulosNUMVENDA: TIntegerField;
    qryTitulosVENDA: TIBStringField;
    qryTitulosSERIE: TIBStringField;
    qryTitulosNFE: TLargeintField;
    qryTitulosNFE_SERIE: TIBStringField;
    IbDtstTabelaBLOQUEADO: TSmallintField;
    IbDtstTabelaBLOQUEADO_DATA: TDateField;
    IbDtstTabelaBLOQUEADO_MOTIVO: TMemoField;
    IbDtstTabelaBLOQUEADO_USUARIO: TIBStringField;
    GrpBxBloqueio: TGroupBox;
    Bevel6: TBevel;
    Bevel7: TBevel;
    Bevel9: TBevel;
    dbmMotivoBloqueio: TDBMemo;
    dbcBloqueio: TDBCheckBox;
    IbDtstTabelaDESBLOQUEADO_DATA: TDateField;
    Bevel10: TBevel;
    BtBtnProcesso: TBitBtn;
    IbDtstTabelaFONECEL: TIBStringField;
    IbDtstTabelaFONECOMERC: TIBStringField;
    lblFoneCelular: TLabel;
    dbFoneCelular: TDBEdit;
    lblFoneComercial: TLabel;
    dbFoneComercial: TDBEdit;
    tblVendedor: TIBTable;
    dtsVendedor: TDataSource;
    IbDtstTabelaVENDEDOR_COD: TIntegerField;
    lblVendedor: TLabel;
    dbVendedor: TDBLookupComboBox;
    IbDtstTabelaUSUARIO: TIBStringField;
    popProcesso: TPopupMenu;
    mpClienteBloquear: TMenuItem;
    mpClienteDesbloquear: TMenuItem;
    dbCNPJ: TRxDBComboEdit;
    tbsConsultarCNPJ: TTabSheet;
    tbsConsultarCPF: TTabSheet;
    ACBrConsultaCNPJ: TACBrConsultaCNPJ;
    pnlConsultarCNPJ: TPanel;
    lblCNPJX: TLabel;
    lblCaptchaX: TLabel;
    edCaptcha: TEdit;
    edCNPJ: TMaskEdit;
    pnlCaptcha: TPanel;
    ImgCaptcha: TImage;
    LabAtualizarCaptcha: TLabel;
    ckRemoverEspacosDuplos: TCheckBox;
    btnConsultarCNPJ: TButton;
    BvlConsultar: TBevel;
    pnlRetornoCNPJ: TPanel;
    lblTipoX: TLabel;
    lblRazaoSocialX: TLabel;
    lblAberturaX: TLabel;
    lblEnderecoX: TLabel;
    lblNumeroX: TLabel;
    lblComplementoX: TLabel;
    lblBairroX: TLabel;
    lblCidadeX: TLabel;
    lblUFX: TLabel;
    lblCEPX: TLabel;
    lblSituacaoX: TLabel;
    lblFantasiaX: TLabel;
    EditTipo: TEdit;
    EditRazaoSocial: TEdit;
    EditAbertura: TEdit;
    EditEndereco: TEdit;
    EditNumero: TEdit;
    EditComplemento: TEdit;
    EditBairro: TEdit;
    EditCidade: TEdit;
    EditUF: TEdit;
    EditCEP: TEdit;
    EditSituacao: TEdit;
    EditFantasia: TEdit;
    btnVoltar: TButton;
    btnRecuperarCNPJ: TButton;
    ACBrConsultaCPF: TACBrConsultaCPF;
    pnlConsultarCPF: TPanel;
    edCPF: TMaskEdit;
    btnConsultarCPF: TButton;
    lblCPFX: TLabel;
    tbsDadosAdcionais: TTabSheet;
    DBCheckBox1: TDBCheckBox;
    IbDtstTabelaEMITIR_NFE_DEVOLUCAO: TSmallintField;
    GrpBxCustosOper: TGroupBox;
    lblFrete: TLabel;
    lblOutros: TLabel;
    dbCustoOperacional: TDBCheckBox;
    dbFrete: TDBEdit;
    dbOutros: TDBEdit;
    IbDtstTabelaCUSTO_OPER_PERCENTUAL: TSmallintField;
    IbDtstTabelaCUSTO_OPER_FRETE: TIBBCDField;
    IbDtstTabelaCUSTO_OPER_OUTROS: TIBBCDField;
    procedure ProximoCampoKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure dbEstadoButtonClick(Sender: TObject);
    procedure dbCidadeButtonClick(Sender: TObject);
    procedure dbBairroButtonClick(Sender: TObject);
    procedure dbLogradouroButtonClick(Sender: TObject);
    procedure IbDtstTabelaNewRecord(DataSet: TDataSet);
    procedure DtSrcTabelaStateChange(Sender: TObject);
    procedure DtSrcTabelaDataChange(Sender: TObject; Field: TField);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure pgcGuiasChange(Sender: TObject);
    procedure qryTitulosSITUACAOGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtBtnProcessoClick(Sender: TObject);
    procedure btbtnAlterarClick(Sender: TObject);
    procedure mpClienteDesbloquearClick(Sender: TObject);
    procedure mpClienteBloquearClick(Sender: TObject);
    procedure dbCNPJButtonClick(Sender: TObject);
    procedure LabAtualizarCaptchaClick(Sender: TObject);
    procedure btnConsultarCNPJClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure btnRecuperarCNPJClick(Sender: TObject);
    procedure edCNPJKeyPress(Sender: TObject; var Key: Char);
    procedure btnConsultarCPFClick(Sender: TObject);
    procedure edCaptchaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure GetComprasAbertas(sCNPJ : String);
  public
    { Public declarations }
    procedure Update(Observeble: IObservable); overload;
    procedure Update(Observeble: IObservable; sMessage: string); overload;
  end;

var
  frmGeCliente: TfrmGeCliente;

  procedure MostrarTabelaClientes(const AOwner : TComponent);
  function SelecionarCliente(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean; overload;
  function SelecionarCliente(const AOwner : TComponent; var Codigo : Integer; var CNPJ, Nome : String) : Boolean; overload;
  function SelecionarCliente(const AOwner : TComponent; var Codigo : Integer; var CNPJ, Nome : String; var Bloqueado : Boolean; var MotivoBloqueio : String) : Boolean; overload;

implementation

uses UDMBusiness, UGeBairro, UGeCidade, UGeDistrito, UGeEstado,
  UGeLogradouro, UGrPadrao, ChkDgVer, FuncoesFormulario;

{$R *.dfm}

procedure MostrarTabelaClientes(const AOwner : TComponent);
var
  frm : TfrmGeCliente;
begin
  frm := TfrmGeCliente.Create(AOwner);
  try
    frm.ShowModal;
  finally
    frm.Destroy;
  end;
end;

function SelecionarCliente(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;
var
  frm : TfrmGeCliente;
begin
  frm := TfrmGeCliente.Create(AOwner);
  try
    Result := frm.SelecionarRegistro(Codigo, Nome);
  finally
    frm.Destroy;
  end;
end;

function SelecionarCliente(const AOwner : TComponent; var Codigo : Integer; var CNPJ, Nome : String) : Boolean;
var
  frm : TfrmGeCliente;
begin
  frm := TfrmGeCliente.Create(AOwner);
  try
    Result := frm.SelecionarRegistro(Codigo, Nome);
    if ( Result ) then
      CNPJ      := frm.IbDtstTabelaCNPJ.AsString;
  finally
    frm.Destroy;
  end;
end;

function SelecionarCliente(const AOwner : TComponent; var Codigo : Integer; var CNPJ, Nome : String; var Bloqueado : Boolean; var MotivoBloqueio : String) : Boolean;
var
  frm : TfrmGeCliente;
begin
  frm := TfrmGeCliente.Create(AOwner);
  try
    Result := frm.SelecionarRegistro(Codigo, Nome);
    if ( Result ) then
    begin
      CNPJ      := frm.IbDtstTabelaCNPJ.AsString;
      Bloqueado := (frm.IbDtstTabelaBLOQUEADO.AsInteger = 1);

      if Bloqueado then
        MotivoBloqueio := frm.IbDtstTabelaBLOQUEADO_MOTIVO.AsString
      else
        MotivoBloqueio := EmptyStr;
    end;
  finally
    frm.Destroy;
  end;
end;

procedure TfrmGeCliente.FormCreate(Sender: TObject);
begin
  inherited;
  tblVendedor.Open;

  BloquearClientes;

  ControlFirstEdit := dbPessoaFisica;

  NomeTabela     := 'TBCLIENTE';
  CampoCodigo    := 'codigo';
  CampoDescricao := 'nome';
  CampoOrdenacao := CampoDescricao;

  UpdateGenerator;

  pgcMaisDados.ActivePageIndex := 0;
  tbsConsultarCNPJ.TabVisible  := False;
  tbsConsultarCPF.TabVisible   := False;

  if not (GetUserFunctionID in [FUNCTION_USER_ID_DIRETORIA, FUNCTION_USER_ID_GERENTE_FIN, FUNCTION_USER_ID_SYSTEM_ADM]) then
    dbValorLimiteCompra.Enabled := False;

  GrpBxCustosOper.Enabled := GetCalcularCustoOperEmpresa(GetEmpresaIDDefault);
end;

procedure TfrmGeCliente.ProximoCampoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if ( Key = #13 ) then
  begin
    Key := #0;
    if ( Sender = dbHome ) then
      pgcMaisDados.SelectNextPage(False);
  end;
end;

procedure TfrmGeCliente.dbEstadoButtonClick(Sender: TObject);
var
  iEstado : Integer;
  sEstado ,
  sUF     : String;
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    if ( SelecionarEstado(Self, iEstado, sEstado, sUF) ) then
    begin
      IbDtstTabelaEST_COD.AsInteger := iEstado;
      IbDtstTabelaEST_NOME.AsString := sEstado;
      IbDtstTabelaUF.AsString       := sUF;
    end;
end;

procedure TfrmGeCliente.dbCidadeButtonClick(Sender: TObject);
var
  iCidade : Integer;
  sCidade : String;
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    if ( IbDtstTabelaEST_COD.AsInteger = 0 ) then
    begin
      ShowWarning('Favor informar o Estado primeiramente!');
      dbEstado.SetFocus;
    end
    else
    if ( SelecionarCidade(Self, IbDtstTabelaEST_COD.AsInteger, iCidade, sCidade) ) then
    begin
      IbDtstTabelaCID_COD.AsInteger := iCidade;
      IbDtstTabelaCID_NOME.AsString := sCidade;
      IbDtstTabelaCIDADE.AsString   := sCidade + ' (' + IbDtstTabelaUF.AsString + ')';
    end;
end;

procedure TfrmGeCliente.dbBairroButtonClick(Sender: TObject);
var
  iBairro : Integer;
  sBairro : String;
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    if ( IbDtstTabelaCID_COD.AsInteger = 0 ) then
    begin
      ShowWarning('Favor informar a Cidade primeiramente!');
      dbCidade.SetFocus;
    end
    else
    if ( SelecionarBairro(Self, IbDtstTabelaCID_COD.AsInteger, iBairro, sBairro) ) then
    begin
      IbDtstTabelaBAI_COD.AsInteger := iBairro;
      IbDtstTabelaBAIRRO.AsString   := sBairro;
    end;
end;

procedure TfrmGeCliente.dbLogradouroButtonClick(Sender: TObject);
var
  iTipo : Smallint;
  sTipo : String;
  iLogradouro : Integer;
  sLogradouro : String;
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    if ( IbDtstTabelaCID_COD.AsInteger = 0 ) then
    begin
      ShowWarning('Favor informar a Cidade primeiramente!');
      dbCidade.SetFocus;
    end
    else
    if ( SelecionarLogradouro(Self, IbDtstTabelaCID_COD.AsInteger, iTipo, sTipo, iLogradouro, sLogradouro) ) then
    begin
      IbDtstTabelaTLG_TIPO.AsInteger  := iTipo;
      IbDtstTabelaLOG_COD.AsInteger   := iLogradouro;
      IbDtstTabelaLOGRADOURO.AsString := Trim(sTipo + ' ' + sLogradouro);
      IbDtstTabelaENDER.AsString      := Trim(sTipo + ' ' + sLogradouro);
    end;
end;

procedure TfrmGeCliente.IbDtstTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  IbDtstTabelaPESSOA_FISICA.AsInteger    := 1;
  IbDtstTabelaVALOR_LIMITE_COMPRA.Value  := 0;
  IbDtstTabelaPAIS_ID.AsString           := GetPaisIDDefault;
  IbDtstTabelaPAIS_NOME.AsString         := GetPaisNomeDefault;
  IbDtstTabelaDTCAD.AsDateTime           := GetDateDB;
  IbDtstTabelaBLOQUEADO.AsInteger            := Ord(False);
  IbDtstTabelaEMITIR_NFE_DEVOLUCAO.AsInteger := Ord(False);

  IbDtstTabelaVENDEDOR_COD.Clear;
  IbDtstTabelaBLOQUEADO_DATA.Clear;
  IbDtstTabelaBLOQUEADO_MOTIVO.Clear;
  IbDtstTabelaBLOQUEADO_USUARIO.Clear;
end;

procedure TfrmGeCliente.DtSrcTabelaStateChange(Sender: TObject);
begin
  inherited;
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
  begin
    pgcMaisDados.ActivePageIndex := 0;

    if ( IbDtstTabelaPESSOA_FISICA.AsInteger = 1 ) then
      IbDtstTabelaCNPJ.EditMask := '999.999.999-99;0; '
    else
      IbDtstTabelaCNPJ.EditMask := '99.999.999/9999-99;0; ';
  end
  else
  begin
    IbDtstTabelaCNPJ.EditMask   := EmptyStr;
    tbsConsultarCNPJ.TabVisible := False;
    tbsConsultarCPF.TabVisible  := False;
  end;

  BtBtnProcesso.Enabled := IbDtstTabela.Active and
    (not (IbDtstTabela.State in [dsEdit, dsInsert]));

  mpClienteBloquear.Enabled    := IbDtstTabela.Active and
    (not (IbDtstTabela.State in [dsEdit, dsInsert])) and (IbDtstTabelaBLOQUEADO.AsInteger = 0);
  mpClienteDesbloquear.Enabled := IbDtstTabela.Active and
    (not (IbDtstTabela.State in [dsEdit, dsInsert])) and (IbDtstTabelaBLOQUEADO.AsInteger = 1);
end;

procedure TfrmGeCliente.DtSrcTabelaDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  BtBtnProcesso.Enabled := IbDtstTabela.Active and
    (not (IbDtstTabela.State in [dsEdit, dsInsert]));

  mpClienteBloquear.Enabled    := IbDtstTabela.Active and
    (not (IbDtstTabela.State in [dsEdit, dsInsert])) and (IbDtstTabelaBLOQUEADO.AsInteger = 0);
  mpClienteDesbloquear.Enabled := IbDtstTabela.Active and
    (not (IbDtstTabela.State in [dsEdit, dsInsert])) and (IbDtstTabelaBLOQUEADO.AsInteger = 1);

  if ( Field = IbDtstTabela.FieldByName('CNPJ') ) then
    GetComprasAbertas( IbDtstTabela.FieldByName('CNPJ').AsString );

  if ( Field = IbDtstTabela.FieldByName('PESSOA_FISICA') ) then
    if ( IbDtstTabelaPESSOA_FISICA.AsInteger = 1 ) then
      IbDtstTabelaCNPJ.EditMask := '999.999.999-99;0; '
    else
      IbDtstTabelaCNPJ.EditMask := '99.999.999/9999-99;0; ';

  if ( Field = IbDtstTabelaCUSTO_OPER_PERCENTUAL ) then
    if ( IbDtstTabelaCUSTO_OPER_PERCENTUAL.AsInteger = 1 ) then
    begin
      lblFrete.Caption  := 'Frete (%):';
      lblOutros.Caption := 'Outros (%):';
    end
    else
    begin
      lblFrete.Caption  := 'Frete (R$):';
      lblOutros.Caption := 'Outros (R$):';
    end;
end;

procedure TfrmGeCliente.btbtnSalvarClick(Sender: TObject);
begin
  if ( IbDtstTabelaPESSOA_FISICA.AsInteger = 1 ) then
    if ( not FuncoesString.StrIsCPF(IbDtstTabelaCNPJ.AsString) ) then
    begin
      ShowWarning('Favor informar um CPF válido.');
      Abort;
    end;

  if ( IbDtstTabelaPESSOA_FISICA.AsInteger = 0 ) then
  begin
    if ( not FuncoesString.StrIsCNPJ(IbDtstTabelaCNPJ.AsString) ) then
    begin
      ShowWarning('Favor informar um CNPJ válido.');
      Abort;
    end;

    if ( (Trim(IbDtstTabelaUF.AsString) = EmptyStr) or (IbDtstTabelaEST_COD.AsInteger = 0) ) then
    begin
      ShowWarning('Favor selecionar o Estado.');
      Abort;
    end;

    if ( not ChkInscEstadual(Trim(IbDtstTabelaINSCEST.AsString), Trim(IbDtstTabelaUF.AsString)) ) then
    begin
      ShowWarning('Favor informar uma Inscrição Estadual válida.');
      Abort;
    end;
  end;

  IbDtstTabelaUSUARIO.AsString := GetUserApp;

  if ( IbDtstTabelaCUSTO_OPER_PERCENTUAL.AsInteger = 1 ) then
  begin
    if ((IbDtstTabelaCUSTO_OPER_FRETE.AsCurrency < 0) or (IbDtstTabelaCUSTO_OPER_FRETE.AsCurrency > 100)) then
    begin
      ShowWarning('Percentual de custo operacional para "Frete" inválido!');
      Exit;
    end;

    if ((IbDtstTabelaCUSTO_OPER_OUTROS.AsCurrency < 0) or (IbDtstTabelaCUSTO_OPER_OUTROS.AsCurrency > 100)) then
    begin
      ShowWarning('Percentual de custo operacional para "Outros" inválido!');
      Exit;
    end;
  end;

  if IbDtstTabelaCUSTO_OPER_PERCENTUAL.IsNull then
    IbDtstTabelaCUSTO_OPER_PERCENTUAL.AsInteger := 1;

  if IbDtstTabelaEMITIR_NFE_DEVOLUCAO.IsNull then
    IbDtstTabelaEMITIR_NFE_DEVOLUCAO.Value := 0;

  inherited;
end;

procedure TfrmGeCliente.GetComprasAbertas(sCNPJ: String);
begin
  with qryTotalComprasAbertas do
  begin
    Close;
    ParamByName('cnpj').AsString := sCNPJ;
    Open;
  end;

  with qryTitulos do
  begin
    Close;
    ParamByName('cliente').AsString := sCNPJ;
    Open;
  end;
end;

procedure TfrmGeCliente.pgcGuiasChange(Sender: TObject);
begin
  inherited;
  GetComprasAbertas( IbDtstTabela.FieldByName('CNPJ').AsString );
end;

procedure TfrmGeCliente.qryTitulosSITUACAOGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if ( Sender.IsNull ) then
    Exit;
    
  if ( Sender.AsInteger = 0 ) then
    Text := 'Cancelado';
end;

procedure TfrmGeCliente.dbgDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if ( Sender = dbgDados ) then
  begin
    // Cliente bloqueado
    if ( IbDtstTabelaBLOQUEADO.AsInteger = 1 ) then
      dbgDados.Canvas.Font.Color := GrpBxBloqueio.Font.Color;

    dbgDados.DefaultDrawDataCell(Rect, dbgDados.Columns[DataCol].Field, State);
  end
  else
  if ( Sender = dbgTitulos ) then
  begin
    // Destacar Títulos em Pagamento
    if ( qryTitulosVALORRECTOT.AsCurrency > 0 ) then
      dbgTitulos.Canvas.Font.Color := lblTituloPagando.Font.Color
    else
    // Destacar Títulos Cancelados
    if ( qryTitulosSITUACAO.AsInteger = 0 ) then
      dbgTitulos.Canvas.Font.Color := lblTituloCancelado.Font.Color;

    dbgTitulos.DefaultDrawDataCell(Rect, dbgTitulos.Columns[DataCol].Field, State);
  end
end;

procedure TfrmGeCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmGeCliente.BtBtnProcessoClick(Sender: TObject);
begin
  popProcesso.Popup(BtBtnProcesso.ClientOrigin.X, BtBtnProcesso.ClientOrigin.Y + BtBtnProcesso.Height);
end;

procedure TfrmGeCliente.btbtnAlterarClick(Sender: TObject);
begin
  inherited;
  if ( not btbtnAlterar.Enabled ) then
    if ( IbDtstTabelaDTCAD.IsNull ) then
      IbDtstTabelaDTCAD.AsDateTime := GetDateTimeDB;
end;

procedure TfrmGeCliente.mpClienteDesbloquearClick(Sender: TObject);
var
  sCNPJ ,
  sMotivo : String;
begin
  if not (GetUserFunctionID in [FUNCTION_USER_ID_DIRETORIA, FUNCTION_USER_ID_GERENTE_FIN, FUNCTION_USER_ID_AUX_FINANC1]) then
  begin
    ShowWarning('Usuário sem permisssão para execução desta rotina!');
    Exit;
  end;

  if ( IbDtstTabelaBLOQUEADO.AsInteger = 1 ) then
    if InputQuery('Desbloquear cliente:', 'Informe o motivo do desbloqueio:', sMotivo) then
      if Trim(sMotivo) <> EmptyStr then
      begin
        sCNPJ := IbDtstTabelaCNPJ.AsString;
        DesbloquearCliente(sCNPJ, GetUserApp + ' -> ' + AnsiUpperCase(sMotivo));

        IbDtstTabela.Close;
        IbDtstTabela.Open;
        IbDtstTabela.Locate('CNPJ', sCNPJ, []);
      end;
end;

procedure TfrmGeCliente.mpClienteBloquearClick(Sender: TObject);
var
  sCNPJ ,
  sMotivo : String;
begin
  if not (GetUserFunctionID in [FUNCTION_USER_ID_DIRETORIA, FUNCTION_USER_ID_GERENTE_FIN, FUNCTION_USER_ID_AUX_FINANC1]) then
  begin
    ShowWarning('Usuário sem permisssão para execução desta rotina!');
    Exit;
  end;

  if ( IbDtstTabelaBLOQUEADO.AsInteger = 0 ) then
    if InputQuery('Bloquear cliente:', 'Informe o motivo do bloqueio:', sMotivo) then
      if Trim(sMotivo) <> EmptyStr then
      begin
        sCNPJ := IbDtstTabelaCNPJ.AsString;
        BloquearCliente(sCNPJ, GetUserApp + ' -> ' + AnsiUpperCase(sMotivo));

        IbDtstTabela.Close;
        IbDtstTabela.Open;
        IbDtstTabela.Locate('CNPJ', sCNPJ, []);
      end;
end;

procedure TfrmGeCliente.Update(Observeble: IObservable);
begin
  ShowWarning('Atualizar observador!');
end;

procedure TfrmGeCliente.Update(Observeble: IObservable; sMessage: string);
begin
  Self.Update(Observeble);
end;

procedure TfrmGeCliente.dbCNPJButtonClick(Sender: TObject);

  procedure AtualizarCamposRetorno;
  var
    bCNPJ,
    bCPF : Boolean;
  begin
    bCNPJ := tbsConsultarCNPJ.TabVisible;
    bCPF  := tbsConsultarCPF.TabVisible;

    if bCNPJ then
      lblRazaoSocialX.Caption := 'Razão Social';

    if bCPF then
      lblRazaoSocialX.Caption := 'Nome';

    lblTipoX.Enabled := bCNPJ;
    EditTipo.Enabled := bCNPJ;
    lblAberturaX.Enabled := bCNPJ;
    EditAbertura.Enabled := bCNPJ;
    lblFantasiaX.Enabled := bCNPJ;
    EditFantasia.Enabled := bCNPJ;
    lblEnderecoX.Enabled := bCNPJ;
    EditEndereco.Enabled := bCNPJ;
    lblNumeroX.Enabled := bCNPJ;
    EditNumero.Enabled := bCNPJ;
    lblComplementoX.Enabled := bCNPJ;
    EditComplemento.Enabled := bCNPJ;
    lblBairroX.Enabled := bCNPJ;
    EditBairro.Enabled := bCNPJ;
    lblCidadeX.Enabled := bCNPJ;
    EditCidade.Enabled := bCNPJ;
    lblUFX.Enabled := bCNPJ;
    EditUF.Enabled := bCNPJ;
    lblCEPX.Enabled := bCNPJ;
    EditCEP.Enabled := bCNPJ;
  end;

begin
  if dbPessoaFisica.Checked then
  begin
    tbsConsultarCPF.TabVisible := True;
    pgcGuias.ActivePage        := tbsConsultarCPF;

    pnlCaptcha.Parent             := pnlConsultarCPF;
    ckRemoverEspacosDuplos.Parent := pnlConsultarCPF;
    lblCaptchaX.Parent    := pnlConsultarCPF;
    edCaptcha.Parent      := pnlConsultarCPF;
    pnlRetornoCNPJ.Parent := tbsConsultarCPF;

    LabAtualizarCaptchaClick(LabAtualizarCaptcha);

    if ( Trim(StrOnlyNumbers(dbCNPJ.Text)) <> EmptyStr ) then
      edCPF.Text := StrFormatarCpf( StrOnlyNumbers(dbCNPJ.Text) )
    else
      edCPF.SetFocus;
  end
  else
  begin
    tbsConsultarCNPJ.TabVisible := True;
    pgcGuias.ActivePage         := tbsConsultarCNPJ;

    pnlCaptcha.Parent             := pnlConsultarCNPJ;
    ckRemoverEspacosDuplos.Parent := pnlConsultarCNPJ;
    lblCaptchaX.Parent    := pnlConsultarCNPJ;
    edCaptcha.Parent      := pnlConsultarCNPJ;
    pnlRetornoCNPJ.Parent := tbsConsultarCNPJ;

    LabAtualizarCaptchaClick(LabAtualizarCaptcha);

    if ( Trim(StrOnlyNumbers(dbCNPJ.Text)) <> EmptyStr ) then
      edCNPJ.Text := StrFormatarCnpj( StrOnlyNumbers(dbCNPJ.Text) )
    else
      edCNPJ.SetFocus;
  end;

  AtualizarCamposRetorno;
end;

procedure TfrmGeCliente.LabAtualizarCaptchaClick(Sender: TObject);
var
  Stream : TMemoryStream;
  Jpg : TJPEGImage;
begin
  Stream := TMemoryStream.Create;
  Jpg    := TJPEGImage.Create;
  try
    if ( pgcGuias.ActivePage = tbsConsultarCNPJ ) then
      ACBrConsultaCNPJ.Captcha(Stream)
    else
    if ( pgcGuias.ActivePage = tbsConsultarCPF ) then
      ACBrConsultaCPF.Captcha(Stream);
      
    Jpg.LoadFromStream(Stream);
    ImgCaptcha.Picture.Assign(Jpg);

    edCaptcha.Clear;
    edCaptcha.SetFocus;

    EditTipo.Clear;
    EditAbertura.Clear;
    EditSituacao.Clear;
    EditRazaoSocial.Clear;
    EditFantasia.Clear;
    EditEndereco.Clear;
    EditNumero.Clear;
    EditComplemento.Clear;
    EditBairro.Clear;
    EditCidade.Clear;
    EditUF.Clear;
    EditCEP.Clear;
  finally
    Stream.Free;
    Jpg.Free;
  end;
end;

procedure TfrmGeCliente.btnConsultarCNPJClick(Sender: TObject);
begin
  if Trim(edCaptcha.Text) <> EmptyStr then
  begin
    if ACBrConsultaCNPJ.Consulta(edCNPJ.Text, Trim(edCaptcha.Text), ckRemoverEspacosDuplos.Checked) then
    begin
      EditTipo.Text        := ACBrConsultaCNPJ.EmpresaTipo;
      EditRazaoSocial.Text := ACBrConsultaCNPJ.RazaoSocial;
      EditAbertura.Text    := DateToStr( ACBrConsultaCNPJ.Abertura );
      EditFantasia.Text    := ACBrConsultaCNPJ.Fantasia;
      EditEndereco.Text    := ACBrConsultaCNPJ.Endereco;
      EditNumero.Text      := ACBrConsultaCNPJ.Numero;
      EditComplemento.Text := ACBrConsultaCNPJ.Complemento;
      EditBairro.Text      := ACBrConsultaCNPJ.Bairro;
      EditComplemento.Text := ACBrConsultaCNPJ.Complemento;
      EditCidade.Text      := ACBrConsultaCNPJ.Cidade;
      EditUF.Text          := ACBrConsultaCNPJ.UF;
      EditCEP.Text         := ACBrConsultaCNPJ.CEP;
      EditSituacao.Text    := ACBrConsultaCNPJ.Situacao;

      btnRecuperarCNPJ.Enabled := True;
    end;
  end
  else
  begin
    ShowWarning('É necessário digitar o captcha.');
    edCaptcha.SetFocus;

    btnRecuperarCNPJ.Enabled := False;
  end;
end;

procedure TfrmGeCliente.btnVoltarClick(Sender: TObject);
begin
  pgcGuias.ActivePage         := tbsCadastro;
  tbsConsultarCNPJ.TabVisible := False;
  dbCNPJ.SetFocus;
end;

procedure TfrmGeCliente.btnRecuperarCNPJClick(Sender: TObject);
var
  bCPF : Boolean;
begin
  bCPF := (pgcGuias.ActivePage = tbsConsultarCPF);
  btnVoltar.Click;

  if not (IbDtstTabela.State in [dsEdit, dsInsert]) then
    Exit;

  if ShowConfirm('Deseja carregar os dados consultados para o cadastro?') then
  begin
    if bCPF then
    begin
      IbDtstTabelaCNPJ.AsString := StrOnlyNumbers(edCPF.Text);
      IbDtstTabelaNOME.AsString := Copy(Trim(EditRazaoSocial.Text), 1, IbDtstTabelaNOME.Size);
    end
    else
    begin
      IbDtstTabelaCNPJ.AsString       := StrOnlyNumbers(edCNPJ.Text);
      IbDtstTabelaNOME.AsString       := Copy(Trim(EditRazaoSocial.Text), 1, IbDtstTabelaNOME.Size);
      IbDtstTabelaEST_COD.AsInteger   := GetEstadoID( Trim(EditUF.Text) );
      IbDtstTabelaEST_NOME.AsString   := GetEstadoNome( Trim(EditUF.Text) );
      IbDtstTabelaUF.AsString         := Trim(EditUF.Text);
      IbDtstTabelaCID_COD.AsInteger   := GetCidadeID(IbDtstTabelaEST_COD.AsInteger, EditCidade.Text);
      IbDtstTabelaCID_NOME.AsString   := GetCidadeNome(IbDtstTabelaCID_COD.AsInteger);

      if ( (IbDtstTabelaCID_COD.AsInteger = 0) and (Trim(EditCEP.Text) <> EmptyStr) ) then
      begin
        IbDtstTabelaCID_COD.AsInteger  := GetCidadeID(Trim(EditCEP.Text));
        IbDtstTabelaCID_NOME.AsString  := GetCidadeNome(IbDtstTabelaCID_COD.AsInteger);
      end;

      IbDtstTabelaCIDADE.AsString   := IbDtstTabelaCID_NOME.AsString + ' (' + Trim(EditUF.Text) + ')';

      IbDtstTabelaBAI_COD.AsInteger := SetBairro(IbDtstTabelaCID_COD.AsInteger, Copy(Trim(EditBairro.Text), 1, IbDtstTabelaBAIRRO.Size));
      IbDtstTabelaBAIRRO.AsString   := Trim(EditBairro.Text);

      IbDtstTabelaLOG_COD.AsInteger   := SetLogradouro(IbDtstTabelaCID_COD.AsInteger, Copy(Trim(EditEndereco.Text), 1, IbDtstTabelaLOGRADOURO.Size));
      IbDtstTabelaLOGRADOURO.AsString := Trim(GetLogradouroTipo(IbDtstTabelaLOG_COD.AsInteger) + ' ' + GetLogradouroNome(IbDtstTabelaLOG_COD.AsInteger));
      IbDtstTabelaENDER.AsString      := Trim(IbDtstTabelaLOGRADOURO.AsString);

      IbDtstTabelaCOMPLEMENTO.AsString := Copy(Trim(EditComplemento.Text), 1, IbDtstTabelaCOMPLEMENTO.Size);
      IbDtstTabelaNUMERO_END.AsString  := Copy(Trim(EditNumero.Text),      1, IbDtstTabelaNUMERO_END.Size);
      IbDtstTabelaCEP.AsString         := Copy(StrOnlyNumbers(Trim(EditCEP.Text)), 1, IbDtstTabelaCEP.Size);
    end;
  end;
end;

procedure TfrmGeCliente.edCNPJKeyPress(Sender: TObject; var Key: Char);
begin
  if ( Key = #13 ) then
    edCaptcha.SetFocus;
end;

procedure TfrmGeCliente.btnConsultarCPFClick(Sender: TObject);
begin
  if Trim(edCaptcha.Text) <> EmptyStr then
  begin
    if ACBrConsultaCPF.Consulta(edCPF.Text, Trim(edCaptcha.Text)) then
    begin
      EditRazaoSocial.Text := ACBrConsultaCPF.Nome;
      EditSituacao.Text    := ACBrConsultaCPF.Situacao;
      //EditAbertura.Text    := ACBrConsultaCPF.Emissao;
      //EditTipo.Text        := ACBrConsultaCPF.CodCtrlControle;
      //EditFantasia.Text    := ACBrConsultaCPF.DigitoVerificador;

      btnRecuperarCNPJ.Enabled := True;
    end;
  end
  else
  begin
    ShowWarning('É necessário digitar o captcha.');
    edCaptcha.SetFocus;

    btnRecuperarCNPJ.Enabled := False;
  end;
end;

procedure TfrmGeCliente.edCaptchaKeyPress(Sender: TObject; var Key: Char);
begin
  if ( Key = #13 ) then
    if ( pgcGuias.ActivePage = tbsConsultarCNPJ ) then
      btnConsultarCNPJ.Click
    else
    if ( pgcGuias.ActivePage = tbsConsultarCPF ) then
      btnConsultarCPF.Click;
end;

initialization
  FormFunction.RegisterForm('frmGeCliente', TfrmGeCliente);

end.
