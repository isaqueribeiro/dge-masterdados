unit UGeCidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoCadastro, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin, rxToolEdit, RXDBCtrl;

type
  TfrmGeCidade = class(TfrmGrPadraoCadastro)
    IbDtstTabelaCID_COD: TIntegerField;
    IbDtstTabelaCID_NOME: TIBStringField;
    IbDtstTabelaEST_COD: TSmallintField;
    IbDtstTabelaCID_SIAFI: TIntegerField;
    IbDtstTabelaCID_IBGE: TIntegerField;
    IbDtstTabelaEST_NOME: TIBStringField;
    IbDtstTabelaEST_SIGLA: TIBStringField;
    lblNome: TLabel;
    dbNome: TDBEdit;
    lblBGE: TLabel;
    dbIBGE: TDBEdit;
    lblSIAFI: TLabel;
    dbSIAFI: TDBEdit;
    lblEstado: TLabel;
    dbEstado: TRxDBComboEdit;
    IbDtstTabelaCID_DDD: TSmallintField;
    IbDtstTabelaCID_CEP_INICIAL: TIntegerField;
    IbDtstTabelaCID_CEP_FINAL: TIntegerField;
    lblDDD: TLabel;
    dbDDD: TDBEdit;
    lblCEPInicial: TLabel;
    dbCEPInicial: TDBEdit;
    lblCEPFinal: TLabel;
    dbCEPFinal: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure dbEstadoButtonClick(Sender: TObject);
    procedure IbDtstTabelaNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGeCidade: TfrmGeCidade;

  procedure MostrarTabelaCidades(const AOwner : TComponent);
  function SelecionarCidade(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean; overload;
  function SelecionarCidade(const AOwner : TComponent; const Estado : Smallint; var Codigo : Integer; var Nome : String) : Boolean; overload;

implementation

uses UDMBusiness, UGeEstado;

{$R *.dfm}

procedure MostrarTabelaCidades(const AOwner : TComponent);
var
  frm : TfrmGeCidade;
begin
  frm := TfrmGeCidade.Create(AOwner);
  try
    frm.ShowModal;
  finally
    frm.Destroy;
  end;
end;

function SelecionarCidade(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;
var
  frm : TfrmGeCidade;
begin
  frm := TfrmGeCidade.Create(AOwner);
  try
    Result := frm.SelecionarRegistro(Codigo, Nome);
  finally
    frm.Destroy;
  end;
end;

function SelecionarCidade(const AOwner : TComponent; const Estado : Smallint; var Codigo : Integer; var Nome : String) : Boolean; overload;
var
  frm : TfrmGeCidade;
  whr : String;
begin
  frm := TfrmGeCidade.Create(AOwner);
  try
    whr    := 'c.est_cod = ' + IntToStr(Estado);

    with frm, IbDtstTabela do
    begin
      Close;
      SelectSQL.Add('where ' + whr);
      Open;
    end;

    Result := frm.SelecionarRegistro(Codigo, Nome, whr);
  finally
    frm.Destroy;
  end;
end;

procedure TfrmGeCidade.FormCreate(Sender: TObject);
begin
  inherited;
  ControlFirstEdit := dbNome;

  NomeTabela     := 'TBCIDADE';
  CampoCodigo    := 'cid_cod';
  CampoDescricao := 'cid_nome';

  UpdateGenerator;
end;

procedure TfrmGeCidade.dbEstadoButtonClick(Sender: TObject);
var
  iEstado : Integer;
  sEstado : String;
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    if ( SelecionarEstado(Self, iEstado, sEstado) ) then
    begin
      IbDtstTabelaEST_COD.AsInteger := iEstado;
      IbDtstTabelaEST_NOME.AsString := sEstado;
    end;
end;

procedure TfrmGeCidade.IbDtstTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  if ( GetEstadoIDDefault > 0 ) then
  begin
    IbDtstTabelaEST_COD.AsInteger := GetEstadoIDDefault;
    IbDtstTabelaEST_NOME.AsString := GetEstadoNomeDefault;
  end;
end;

initialization
  FormFunction.RegisterForm('frmGeCidade', TfrmGeCidade);
  
end.
