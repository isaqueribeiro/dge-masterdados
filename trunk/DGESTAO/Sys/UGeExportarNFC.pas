unit UGeExportarNFC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadrao, StdCtrls, Mask, rxToolEdit, ExtCtrls, Buttons, DB,
  IBCustomDataSet;

type
  TfrmGeExportarNFC = class(TfrmGrPadrao)
    GrpBxPeriodo: TGroupBox;
    lblDataInicial: TLabel;
    lblDataFinal: TLabel;
    edDataInicial: TDateEdit;
    edDataFinal: TDateEdit;
    chkNFeAtiva: TCheckBox;
    Bevel8: TBevel;
    PnlBotoes: TPanel;
    Bevel3: TBevel;
    lblInforme: TLabel;
    btnExportar: TBitBtn;
    btnCancelar: TBitBtn;
    cdsCompetencia: TIBDataSet;
    edCompetencia: TComboBox;
    cdsCompetenciaCMP_NUM: TIntegerField;
    cdsCompetenciaCMP_DESC: TIBStringField;
    lblCompetencia: TLabel;
    GrpBxTipoArquivo: TRadioGroup;
    Bevel1: TBevel;
    lblDiretorioExportacao: TLabel;
    Bevel2: TBevel;
    edDiretorioExportacao: TDirectoryEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure MontarPeriodoClick(Sender: TObject);
  private
    { Private declarations }
    procedure CarregarCompetencias;

    function GetTipoArquivo : Integer;
    function ExportarNFC : Boolean;
  public
    { Public declarations }
    procedure RegistrarRotinaSistema; override;

    property TipoArquivo : Integer read GetTipoArquivo;
  end;

var
  frmGeExportarNFC: TfrmGeExportarNFC;

implementation

uses
  UConstantesDGE, UDMBusiness, DateUtils, IniFiles;

{$R *.dfm}

{ TfrmGeExportarNFC }

procedure TfrmGeExportarNFC.RegistrarRotinaSistema;
begin
  ;
end;

procedure TfrmGeExportarNFC.FormCreate(Sender: TObject);
begin
  edDataInicial.Date := StrToDate('01/' + FormatDateTime('mm/yyyy', GetDateDB));
  edDataFinal.Date   := StrToDate(FormatFloat('00', DaysInMonth(GetDateDB)) + FormatDateTime('/mm/yyyy', GetDateDB));

  inherited;

  CarregarCompetencias;
  edDiretorioExportacao.Text := FileINI.ReadString('Exportacao', 'NFC', EmptyStr);
  MontarPeriodoClick( edCompetencia );
end;

procedure TfrmGeExportarNFC.CarregarCompetencias;
begin
  with cdsCompetencia do
  begin
    Close;
    ParamByName('empresa').AsString := GetEmpresaIDDefault;
    Open;

    edCompetencia.Items.Clear;
    while not Eof do
    begin
      edCompetencia.Items.Add(cdsCompetenciaCMP_DESC.AsString);
      Next;
    end;

    if (edCompetencia.Items.Count > 0) then
    begin
      edCompetencia.OnChange  := MontarPeriodoClick;
      edCompetencia.ItemIndex := (edCompetencia.Items.Count - 1);
    end;
  end;
end;

function TfrmGeExportarNFC.ExportarNFC: Boolean;
begin
  ;
end;

procedure TfrmGeExportarNFC.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmGeExportarNFC.MontarPeriodoClick(Sender: TObject);
var
  sCompetencia : String;
begin
  if cdsCompetencia.Locate('CMP_DESC', edCompetencia.Text, []) then
  begin
    sCompetencia      := cdsCompetenciaCMP_NUM.AsString;
    edCompetencia.Tag := cdsCompetenciaCMP_NUM.AsInteger;

    edDataInicial.Date := StrToDate('01/' + Copy(sCompetencia, 5, 2) + '/' + Copy(sCompetencia, 1, 4));
    edDataFinal.Date   := StrToDate(FormatFloat('00', DaysInMonth(edDataInicial.Date)) + FormatDateTime('/mm/yyyy', edDataInicial.Date));
  end;
end;

function TfrmGeExportarNFC.GetTipoArquivo: Integer;
begin
  Result := (GrpBxTipoArquivo.ItemIndex + 1);
end;

initialization
  FormFunction.RegisterForm('frmGeExportarNFC', TfrmGeExportarNFC);

end.
