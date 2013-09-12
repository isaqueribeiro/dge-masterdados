unit UGeContaCorrente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoCadastro, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin, dblookup, IBQuery, rxToolEdit, RXDBCtrl;

type
  TfrmGeContaCorrente = class(TfrmGrPadraoCadastro)
    lblNome: TLabel;
    dbNome: TDBEdit;
    IbDtstTabelaCODIGO: TIntegerField;
    IbDtstTabelaDESCRICAO: TIBStringField;
    IbDtstTabelaTIPO: TSmallintField;
    IbDtstTabelaCONTA_BANCO_BOLETO: TSmallintField;
    IbDtstTabelaBANCO: TIBStringField;
    lblBanco: TLabel;
    dbBanco: TRxDBComboEdit;
    dbTipo: TDBRadioGroup;
    IbDtstTabelaTIPO_DESC: TIBStringField;
    procedure FormCreate(Sender: TObject);
    procedure IbDtstTabelaNewRecord(DataSet: TDataSet);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure dbBancoButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGeContaCorrente: TfrmGeContaCorrente;

  procedure MostrarTabelaContaCorrente(const AOwner : TComponent);
  function SelecionarContaCorrente(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;

implementation

uses UDMBusiness, UGeBancos;

{$R *.dfm}

procedure MostrarTabelaContaCorrente(const AOwner : TComponent);
var
  frm : TfrmGeContaCorrente;
begin
  frm := TfrmGeContaCorrente.Create(AOwner);
  try
    frm.ShowModal;
  finally
    frm.Destroy;
  end;
end;

function SelecionarContaCorrente(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;
var
  frm : TfrmGeContaCorrente;
begin
  frm := TfrmGeContaCorrente.Create(AOwner);
  try
    Result := frm.SelecionarRegistro(Codigo, Nome);
  finally
    frm.Destroy;
  end;
end;

procedure TfrmGeContaCorrente.FormCreate(Sender: TObject);
begin
  inherited;
  ControlFirstEdit := dbNome;

  DisplayFormatCodigo := '000';
  NomeTabela     := 'TBCONTA_CORRENTE';
  CampoCodigo    := 'Codigo';
  CampoDescricao := 'Descricao';
end;

procedure TfrmGeContaCorrente.IbDtstTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  IbDtstTabelaCODIGO.Value := GetNextID(NomeTabela, CampoCodigo);
  IbDtstTabelaTIPO.Value   := 1;
  IbDtstTabelaCONTA_BANCO_BOLETO.Clear;
end;

procedure TfrmGeContaCorrente.btbtnSalvarClick(Sender: TObject);
begin
  IbDtstTabelaCONTA_BANCO_BOLETO.Required := (IbDtstTabelaTIPO.AsInteger = 2);
  IbDtstTabelaTIPO_DESC.AsString := dbTipo.Items[ dbTipo.ItemIndex ];
  inherited;
end;

procedure TfrmGeContaCorrente.dbBancoButtonClick(Sender: TObject);
var
  iCodigo : Integer;
  sNome   ,
  sAgencia,
  sConta  : String;
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    if ( SelecionarBanco(Self, iCodigo, sNome, sAgencia, sConta) ) then
    begin
      IbDtstTabelaCONTA_BANCO_BOLETO.AsInteger := iCodigo;
      IbDtstTabelaBANCO.AsString := sNome + ' AG.: ' + sAgencia + ' C/C.: ' + sConta;
    end;
end;

initialization
  FormFunction.RegisterForm('frmGeContaCorrente', TfrmGeContaCorrente);

end.
