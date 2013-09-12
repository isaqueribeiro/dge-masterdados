unit UGrPadraoLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadrao, ExtCtrls, StdCtrls, Buttons, DB,
  IBCustomDataSet, IBQuery;

type
  TfrmGrPadraoLogin = class(TfrmGrPadrao)
    ImgLogo: TImage;
    lblSystemName: TLabel;
    lblSystemDescription: TLabel;
    lblSystemVersion: TLabel;
    BvlSystemBanner: TBevel;
    ShpLogo: TShape;
    lblNome: TLabel;
    edNome: TEdit;
    lblSenha: TLabel;
    edSenha: TEdit;
    lblEmpresa: TLabel;
    BtnEntrar: TBitBtn;
    QryEmpresa: TIBQuery;
    QryEmpresaCNPJ: TIBStringField;
    QryEmpresaNMFANT: TIBStringField;
    edEmpresa: TComboBox;
    pnlMensagem: TLabel;
    BtnFechar: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure BtnFecharClick(Sender: TObject);
  private
    { Private declarations }
    fCNPJ : Array of String;
    procedure CarregarEmpresa;
    procedure SetUsuario(Value : String);
    procedure SetSenha(Value : String);
    procedure SetEmpresa(Value : String);

    function GetUsuario : String;
    function GetSenha : String;
    function GetEmpresa : String;
  public
    { Public declarations }
    property Usuario : String read GetUsuario write SetUsuario;
    property Senha   : String read GetSenha write SetSenha;
    property Empresa : String read GetEmpresa write SetEmpresa;
  end;

var
  frmGrPadraoLogin: TfrmGrPadraoLogin;

implementation

uses UDMBusiness;

var
  Contador : Integer;

{$R *.dfm}

{ TfrmGrPadraoLogin }

function TfrmGrPadraoLogin.GetSenha: String;
begin
  Result := Trim(edSenha.Text);
end;

function TfrmGrPadraoLogin.GetUsuario: String;
begin
  Result := Trim(edNome.Text);
end;

procedure TfrmGrPadraoLogin.SetSenha(Value: String);
begin
  edSenha.Text := Value;
end;

procedure TfrmGrPadraoLogin.SetUsuario(Value: String);
begin
  edNome.Text := Value;
end;

procedure TfrmGrPadraoLogin.FormCreate(Sender: TObject);
begin
  inherited;
  CarregarEmpresa;
  Empresa := GetEmpresaIDDefault;
  
  if ( ImgLogo.Picture.Height = 0 ) then
    ImgLogo.Picture.Icon := Application.Icon;
end;

procedure TfrmGrPadraoLogin.CarregarEmpresa;
begin
  edEmpresa.Items.Clear;

  QryEmpresa.Open;
  QryEmpresa.Last;

  SetLength(fCNPJ, QryEmpresa.RecordCount);
  QryEmpresa.First;
  while not QryEmpresa.Eof do
  begin
    edEmpresa.Items.Add(QryEmpresaNMFANT.AsString);
    fCNPJ[ edEmpresa.Items.Count - 1 ] := QryEmpresaCNPJ.AsString;

    QryEmpresa.Next;
  end;
  QryEmpresa.Close;
end;

function TfrmGrPadraoLogin.GetEmpresa: String;
begin
  Result := fCNPJ[ edEmpresa.ItemIndex ];
end;

procedure TfrmGrPadraoLogin.SetEmpresa(Value: String);
var
  I : Integer;
begin
  for I := 0 to High(fCNPJ) do
    if ( fCNPJ[I] = Value ) then
    begin
      edEmpresa.ItemIndex := I;
      Break;
    end;
end;

procedure TfrmGrPadraoLogin.BtnFecharClick(Sender: TObject);
begin
  Application.Terminate;
end;

end.
