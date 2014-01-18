unit UGrMessage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadrao, ExtCtrls, StdCtrls, Buttons;

type
  TfrmGeMessage = class(TfrmGrPadrao)
    ImgAlerta: TImage;
    memoMensagem: TMemo;
    btnOk: TBitBtn;
    btnSim: TBitBtn;
    btnNao: TBitBtn;
    ImgInforme: TImage;
    ImgErro: TImage;
    ImgConsulta: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Informe(sTitulo, sMensagem : String);
    procedure Alerta(sTitulo, sMensagem : String);
    procedure Erro(sTitulo, sMensagem : String);
    procedure Parar(sTitulo, sMensagem : String);
  end;

var
  frmGeMessage: TfrmGeMessage;

implementation

uses
  UConstantesDGE;

{$R *.dfm}

{ TfrmGeMessage }

procedure TfrmGeMessage.Alerta(sTitulo, sMensagem: String);
begin
  Caption := sTitulo;
  memoMensagem.Lines.Text := sMensagem;

  ImgAlerta.Visible := True;

  btnOk.Visible  := True;
  btnSim.Visible := False;
  btnNao.Visible := False;

  MessageBeep(MB_ICONWARNING);
end;

procedure TfrmGeMessage.Erro(sTitulo, sMensagem: String);
begin
  Caption := sTitulo;
  memoMensagem.Lines.Text := sMensagem;

  ImgErro.Visible := True;

  btnOk.Visible  := True;
  btnSim.Visible := False;
  btnNao.Visible := False;

  MessageBeep(MB_ICONERROR);
end;

procedure TfrmGeMessage.Informe(sTitulo, sMensagem: String);
begin
  Caption := sTitulo;
  memoMensagem.Lines.Text := sMensagem;

  ImgInforme.Visible := True;

  btnOk.Visible  := True;
  btnSim.Visible := False;
  btnNao.Visible := False;

  MessageBeep(MB_ICONINFORMATION);
end;

procedure TfrmGeMessage.Parar(sTitulo, sMensagem: String);
begin
  Caption := sTitulo;
  memoMensagem.Lines.Text := sMensagem;

  ImgErro.Visible := True;

  btnOk.Visible  := True;
  btnSim.Visible := False;
  btnNao.Visible := False;

  MessageBeep(MB_ICONSTOP);
end;

end.
