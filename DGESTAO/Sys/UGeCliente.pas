unit UGeCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoCadastro, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin, IBTable, rxToolEdit, RXDBCtrl, IBQuery, Menus;

type
  TfrmGeCliente = class(TfrmGrPadraoCadastro)
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
    dbCNPJ: TDBEdit;
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
  private
    { Private declarations }
    procedure GetComprasAbertas(sCNPJ : String);
  public
    { Public declarations }
  end;

var
  frmGeCliente: TfrmGeCliente;

  procedure MostrarTabelaClientes(const AOwner : TComponent);
  function SelecionarCliente(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean; overload;
  function SelecionarCliente(const AOwner : TComponent; var Codigo : Integer; var CNPJ, Nome : String) : Boolean; overload;
  function SelecionarCliente(const AOwner : TComponent; var Codigo : Integer; var CNPJ, Nome : String; var Bloqueado : Boolean; var MotivoBloqueio : String) : Boolean; overload;

implementation

uses UDMBusiness, UGeBairro, UGeCidade, UGeDistrito, UGeEstado,
  UGeLogradouro, UGrPadrao, ChkDgVer;

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

  if not (GetUserFunctionID in [FUNCTION_USER_ID_DIRETORIA, FUNCTION_USER_ID_GERENTE_FIN, FUNCTION_USER_ID_SYSTEM_ADM])
  then  dbValorLimiteCompra.Enabled := False;   

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
  IbDtstTabelaPESSOA_FISICA.AsInteger   := 1;
  IbDtstTabelaVALOR_LIMITE_COMPRA.Value := 0;
  IbDtstTabelaPAIS_ID.AsString          := GetPaisIDDefault;
  IbDtstTabelaPAIS_NOME.AsString        := GetPaisNomeDefault;
  IbDtstTabelaDTCAD.AsDateTime          := GetDateDB;
  IbDtstTabelaBLOQUEADO.AsInteger       := Ord(False);

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
    IbDtstTabelaCNPJ.EditMask := '';

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

initialization
  FormFunction.RegisterForm('frmGeCliente', TfrmGeCliente);

end.
