unit UGrConfigurarAmbiente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadrao, StdCtrls, Buttons, ExtCtrls, ComCtrls, IniFiles, DB,
  DBClient;

type
  TfrmGrConfigurarAmbiente = class(TfrmGrPadrao)
    PnlBotoes: TPanel;
    Bevel3: TBevel;
    btnSalvar: TBitBtn;
    btnCancelar: TBitBtn;
    PgcConfiguracao: TPageControl;
    TbsGeral: TTabSheet;
    GrpBxPadrao: TGroupBox;
    lblPais: TLabel;
    edPais: TEdit;
    lblEstado: TLabel;
    edEstado: TComboBox;
    lblCidade: TLabel;
    edCidade: TComboBox;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
    FEstado : Array of Integer;
    procedure CarregarEstados;

    procedure CarregarDadosINI;
    procedure GravarDadosINI;

    function GetEstadoIndex(const ID : Integer) : Integer;
  public
    { Public declarations }
    procedure RegistrarRotinaSistema; override;
  end;

var
  frmGrConfigurarAmbiente: TfrmGrConfigurarAmbiente;

implementation

uses UDMBusiness, UConstantesDGE, UFuncoes;

{$R *.dfm}

{ TfrmGrConfigurarAmbiente }

procedure TfrmGrConfigurarAmbiente.RegistrarRotinaSistema;
begin
  ;
end;

procedure TfrmGrConfigurarAmbiente.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmGrConfigurarAmbiente.FormCreate(Sender: TObject);
begin
  inherited;
  PgcConfiguracao.ActivePage := TbsGeral;
end;

procedure TfrmGrConfigurarAmbiente.CarregarDadosINI;
begin
  edPais.Text        := FileINI.ReadString(INI_SECAO_DEFAULT, 'PaisID', '01058');
  edEstado.ItemIndex := GetEstadoIndex( FileINI.ReadInteger(INI_SECAO_DEFAULT, INI_KEY_ESTADO, 0) );
end;

procedure TfrmGrConfigurarAmbiente.FormShow(Sender: TObject);
begin
  inherited;
  CarregarEstados;

  CarregarDadosINI;
end;

function TfrmGrConfigurarAmbiente.GetEstadoIndex(
  const ID: Integer): Integer;
var
  I : Integer;
begin
  I := 0;

  for I := Low(FEstado) to High(FEstado) do
  begin
    if ( FEstado[I] = ID ) then
      Break;
  end;

  Result := I;
end;

procedure TfrmGrConfigurarAmbiente.CarregarEstados;
var
  cds : TClientDataSet;
  I : Integer;
begin
  cds := TClientDataSet.Create(nil);
  try
    GetDataSet(cds, 'TBESTADO', EmptyStr, 'est_cod');
    SetLength(FEstado, cds.RecordCount);
    edEstado.Items.Clear;

    cds.First;
    I := 0;
    while not cds.Eof do
    begin
      FEstado[I] := cds.FieldByName('est_cod').AsInteger;
      edEstado.Items.Add( FormatFloat('000',  cds.FieldByName('est_cod').AsInteger) + ' . ' + cds.FieldByName('est_nome').AsString );

      cds.Next;
      Inc(I);
    end;
  finally
    cds.Free;
  end;
end;

procedure TfrmGrConfigurarAmbiente.GravarDadosINI;
begin
  FileINI.WriteInteger(INI_SECAO_DEFAULT, INI_KEY_ESTADO, FEstado[edEstado.ItemIndex]);
end;

procedure TfrmGrConfigurarAmbiente.btnSalvarClick(Sender: TObject);
begin
  if ShowConfirm('Confirma a gravação das alterações informadas no ambinte de configuração da estação?', 'Salvar Configurações') then
  begin
    GravarDadosINI;
    ModalResult := mrOk;
  end;
end;

initialization
  FormFunction.RegisterForm('frmGrConfigurarAmbiente', TfrmGrConfigurarAmbiente);

end.
