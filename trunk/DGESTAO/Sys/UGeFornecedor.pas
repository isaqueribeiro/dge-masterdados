unit UGeFornecedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoCadastro, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin, IBTable, rxToolEdit, RXDBCtrl;

type
  TfrmGeFornecedor = class(TfrmGrPadraoCadastro)
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
    tbsDuplicatas: TTabSheet;
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
    lblFone: TLabel;
    dbFone: TDBEdit;
    lblEmail: TLabel;
    dbEmail: TDBEdit;
    lblHome: TLabel;
    dbHome: TDBEdit;
    lblPais: TLabel;
    dbPais: TRxDBComboEdit;
    IbDtstTabelaCODFORN: TIntegerField;
    IbDtstTabelaPESSOA_FISICA: TSmallintField;
    IbDtstTabelaCNPJ: TIBStringField;
    IbDtstTabelaNOMEFORN: TIBStringField;
    IbDtstTabelaINSCEST: TIBStringField;
    IbDtstTabelaINSCMUN: TIBStringField;
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
    IbDtstTabelaEMAIL: TIBStringField;
    IbDtstTabelaSITE: TIBStringField;
    IbDtstTabelaPAIS_ID: TIBStringField;
    IbDtstTabelaGRF_COD: TSmallintField;
    IbDtstTabelaLOGRADOURO: TIBStringField;
    IbDtstTabelaBAI_NOME: TIBStringField;
    IbDtstTabelaCID_NOME: TIBStringField;
    IbDtstTabelaEST_NOME: TIBStringField;
    IbDtstTabelaPAIS_NOME: TIBStringField;
    lblContato: TLabel;
    dbContato: TDBEdit;
    IbDtstTabelaCONTATO: TIBStringField;
    tblGrupo: TIBTable;
    dtsGrupo: TDataSource;
    lblGrupo: TLabel;
    dbGrupo: TDBLookupComboBox;
    tbsDadosAdcionais: TTabSheet;
    IbDtstTabelaTRANSPORTADORA: TSmallintField;
    DBCheckBox1: TDBCheckBox;
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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGeFornecedor: TfrmGeFornecedor;

  procedure MostrarTabelaFornecedores(const AOwner : TComponent);
  function SelecionarFornecedor(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean; overload;
  function SelecionarFornecedor(const AOwner : TComponent; var Codigo : Integer; var CNPJ, Nome : String) : Boolean; overload;
  function SelecionarTransportadora(const AOwner : TComponent; var Codigo : Integer; var CNPJ, Nome : String) : Boolean; overload;

implementation

uses UDMBusiness, UGeBairro, UGeCidade, UGeDistrito, UGeEstado,
  UGeLogradouro, UGrPadrao, ChkDgVer;

{$R *.dfm}

procedure MostrarTabelaFornecedores(const AOwner : TComponent);
var
  frm : TfrmGeFornecedor;
begin
  frm := TfrmGeFornecedor.Create(AOwner);
  try
    frm.tbsDuplicatas.TabVisible := False; // Temporário
    frm.ShowModal;
  finally
    frm.Destroy;
  end;
end;

function SelecionarFornecedor(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;
var
  frm : TfrmGeFornecedor;
begin
  frm := TfrmGeFornecedor.Create(AOwner);
  try
    frm.tbsDuplicatas.TabVisible := False; // Temporário
    
    Result := frm.SelecionarRegistro(Codigo, Nome);
  finally
    frm.Destroy;
  end;
end;

function SelecionarFornecedor(const AOwner : TComponent; var Codigo : Integer; var CNPJ, Nome : String) : Boolean;
var
  frm : TfrmGeFornecedor;
begin
  frm := TfrmGeFornecedor.Create(AOwner);
  try
    Result := frm.SelecionarRegistro(Codigo, Nome);
    if ( Result ) then
      CNPJ := frm.IbDtstTabelaCNPJ.AsString;
  finally
    frm.Destroy;
  end;
end;

function SelecionarTransportadora(const AOwner : TComponent; var Codigo : Integer; var CNPJ, Nome : String) : Boolean; overload;
var
  frm : TfrmGeFornecedor;
begin
  frm := TfrmGeFornecedor.Create(AOwner);
  try
    frm.WhereAdditional := 'f.Transportadora = 1';

    with frm, IbDtstTabela do
    begin
      Close;
      SelectSQL.Add('where ' + WhereAdditional);
      SelectSQL.Add('order by ' + CampoDescricao);
      Open;
    end;

    Result := frm.SelecionarRegistro(Codigo, Nome, frm.WhereAdditional);
    if ( Result ) then
      CNPJ := frm.IbDtstTabelaCNPJ.AsString;
  finally
    frm.Destroy;
  end;
end;

procedure TfrmGeFornecedor.FormCreate(Sender: TObject);
begin
  inherited;
  ControlFirstEdit := dbPessoaFisica;

  tblGrupo.Open;

  NomeTabela     := 'TBFORNECEDOR';
  CampoCodigo    := 'Codforn';
  CampoDescricao := 'Nomeforn';

  UpdateGenerator;

  pgcMaisDados.ActivePageIndex := 0;
end;

procedure TfrmGeFornecedor.ProximoCampoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if ( Key = #13 ) then
  begin
    Key := #0;
    if ( Sender = dbHome ) then
      pgcMaisDados.SelectNextPage(False);
  end;
end;

procedure TfrmGeFornecedor.dbEstadoButtonClick(Sender: TObject);
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

procedure TfrmGeFornecedor.dbCidadeButtonClick(Sender: TObject);
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

procedure TfrmGeFornecedor.dbBairroButtonClick(Sender: TObject);
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
      IbDtstTabelaBAI_NOME.AsString := sBairro;
    end;
end;

procedure TfrmGeFornecedor.dbLogradouroButtonClick(Sender: TObject);
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

procedure TfrmGeFornecedor.IbDtstTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  IbDtstTabelaPESSOA_FISICA.AsInteger  := 0;
  IbDtstTabelaGRF_COD.AsInteger        := 0;
  IbDtstTabelaPAIS_ID.AsString         := GetPaisIDDefault;
  IbDtstTabelaPAIS_NOME.AsString       := GetPaisNomeDefault;
  IbDtstTabelaTRANSPORTADORA.AsInteger := 0;
end;

procedure TfrmGeFornecedor.DtSrcTabelaStateChange(Sender: TObject);
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
end;

procedure TfrmGeFornecedor.DtSrcTabelaDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if ( Field = IbDtstTabela.FieldByName('PESSOA_FISICA') ) then
    if ( IbDtstTabelaPESSOA_FISICA.AsInteger = 1 ) then
      IbDtstTabelaCNPJ.EditMask := '999.999.999-99;0; '
    else
      IbDtstTabelaCNPJ.EditMask := '99.999.999/9999-99;0; '
end;

procedure TfrmGeFornecedor.btbtnSalvarClick(Sender: TObject);
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

  inherited;
end;

procedure TfrmGeFornecedor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

initialization
  FormFunction.RegisterForm('frmGeFornecedor', TfrmGeFornecedor);

end.
