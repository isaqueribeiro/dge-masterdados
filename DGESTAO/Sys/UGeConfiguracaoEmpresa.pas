unit UGeConfiguracaoEmpresa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoCadastro, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin, IBTable, IBQuery;

type
  TfrmGeConfiguracaoEmpresa = class(TfrmGrPadraoCadastro)
    IbDtstTabelaEMPRESA: TIBStringField;
    IbDtstTabelaEMAIL_CONTA: TIBStringField;
    IbDtstTabelaEMAIL_SENHA: TIBStringField;
    IbDtstTabelaEMAIL_POP: TIBStringField;
    IbDtstTabelaEMAIL_SMTP: TIBStringField;
    IbDtstTabelaEMAIL_ASSUNTO_PADRAO: TIBStringField;
    IbDtstTabelaEMAIL_MENSAGEM_PADRAO: TIBStringField;
    IbDtstTabelaRZSOC: TIBStringField;
    IbDtstTabelaNMFANT: TIBStringField;
    tblEmpresa: TIBTable;
    dtsEmpresa: TDataSource;
    lblEmpresa: TLabel;
    dbEmpresa: TDBLookupComboBox;
    IbDtstTabelaEMAIL_SMTP_PORTA: TIntegerField;
    IbDtstTabelaEMAIL_REQUER_AUTENTICACAO: TSmallintField;
    IbDtstTabelaEMAIL_CONEXAO_SSL: TSmallintField;
    pgcConfigurar: TPageControl;
    tbsContaEmail: TTabSheet;
    lblEmailConta: TLabel;
    dbEmailConta: TDBEdit;
    lblEmailSenha: TLabel;
    dbEmailSenha: TDBEdit;
    lblEmailPOP: TLabel;
    dbEmailPOP: TDBEdit;
    dbEmailSMTP: TDBEdit;
    lblEmailSMTP: TLabel;
    lblEmailPorta: TLabel;
    dbEmailPorta: TDBEdit;
    dbEmailAutentica: TDBCheckBox;
    dbEmailConexaoSSL: TDBCheckBox;
    qryConfiguracoes: TIBQuery;
    procedure FormCreate(Sender: TObject);
    procedure DtSrcTabelaStateChange(Sender: TObject);
    procedure IbDtstTabelaEMPRESAGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure btbtnSalvarClick(Sender: TObject);
  private
    { Private declarations }
    function GetConfiguracaoCadastrada(sEmpresa : String) : Boolean;
  public
    { Public declarations }
  end;

implementation

uses UConstantesDGE, UDMBusiness;

{$R *.dfm}

procedure TfrmGeConfiguracaoEmpresa.FormCreate(Sender: TObject);
begin
  inherited;
  ControlFirstEdit := dbEmpresa;

  NomeTabela      := 'TBCONFIGURACAO';
  CampoCodigo     := 'EMPRESA';
  CampoDescricao  := 'e.RZSOC';
  AbrirTabelaAuto := True;

  tblEmpresa.Open;
end;

procedure TfrmGeConfiguracaoEmpresa.DtSrcTabelaStateChange(
  Sender: TObject);
begin
  inherited;
  dbEmpresa.ReadOnly := (IbDtstTabela.State = dsEdit);
end;

procedure TfrmGeConfiguracaoEmpresa.IbDtstTabelaEMPRESAGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
  if ( Sender.IsNull ) then
    Exit;

  if StrIsCNPJ(Sender.AsString) then
    Text := StrFormatarCnpj(Sender.AsString)
  else
  if StrIsCPF(Sender.AsString) then
    Text := StrFormatarCpf(Sender.AsString);
end;

procedure TfrmGeConfiguracaoEmpresa.btbtnSalvarClick(Sender: TObject);
begin
  if ( IbDtstTabela.State = dsInsert ) then
    if ( GetConfiguracaoCadastrada(IbDtstTabelaEMPRESA.AsString) ) then
    begin
      ShowStop('Empresa selecionada já possui registtro de configuração');
      Exit;
    end;

  inherited;
end;

function TfrmGeConfiguracaoEmpresa.GetConfiguracaoCadastrada(
  sEmpresa: String): Boolean;
begin
  with qryConfiguracoes do
  begin
    Close;
    ParamByName('empresa').AsString := sEmpresa;
    open;

    Result := (not IsEmpty);
  end;
end;

initialization
  FormFunction.RegisterForm('frmGeConfiguracaoEmpresa', TfrmGeConfiguracaoEmpresa);

end.
