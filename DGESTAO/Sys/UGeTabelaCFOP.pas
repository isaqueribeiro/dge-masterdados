unit UGeTabelaCFOP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoCadastro, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin;

type
  TfrmGeTabelaCFOP = class(TfrmGrPadraoCadastro)
    lblNome: TLabel;
    dbNome: TDBEdit;
    IbDtstTabelaCFOP_COD: TIntegerField;
    IbDtstTabelaCFOP_DESCRICAO: TIBStringField;
    IbDtstTabelaCFOP_ESPECIFICACAO: TMemoField;
    lblEspecificacao: TLabel;
    dbEspecificacao: TDBMemo;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGeTabelaCFOP: TfrmGeTabelaCFOP;

  procedure MostrarTabelaCFOP(const AOwner : TComponent);
  function SelecionarCFOP(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;

implementation

uses UDMBusiness;

{$R *.dfm}

procedure MostrarTabelaCFOP(const AOwner : TComponent);
var
  frm : TfrmGeTabelaCFOP;
begin
  frm := TfrmGeTabelaCFOP.Create(AOwner);
  try
    frm.ShowModal;
  finally
    frm.Destroy;
  end;
end;

function SelecionarCFOP(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;
var
  frm : TfrmGeTabelaCFOP;
begin
  frm := TfrmGeTabelaCFOP.Create(AOwner);
  try
    Result := frm.SelecionarRegistro(Codigo, Nome);
  finally
    frm.Destroy;
  end;
end;

procedure TfrmGeTabelaCFOP.FormCreate(Sender: TObject);
begin
  inherited;
  ControlFirstEdit := dbCodigo;

  DisplayFormatCodigo := '0000';
  NomeTabela     := 'TBCFOP';
  CampoCodigo    := 'CFOP_COD';
  CampoDescricao := 'CFOP_DESCRICAO';
end;

initialization
  FormFunction.RegisterForm('frmGeTabelaCFOP', TfrmGeTabelaCFOP);

end.
