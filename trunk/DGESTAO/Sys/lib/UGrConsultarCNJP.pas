unit UGrConsultarCNJP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, ExtCtrls, StdCtrls, Buttons,
  ACBrBase, ACBrSocket, ACBrConsultaCNPJ, JPEG, Mask; 


type
  TfrmGrConsultarCNJP = class(TForm)
    pnlRetorno: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    EditTipo: TEdit;
    EditRazaoSocial: TEdit;
    EditAbertura: TEdit;
    EditEndereco: TEdit;
    EditNumero: TEdit;
    EditComplemento: TEdit;
    EditBairro: TEdit;
    EditCidade: TEdit;
    EditUF: TEdit;
    EditCEP: TEdit;
    EditSituacao: TEdit;
    pnlConsultar: TPanel;
    lblCNPJ: TLabel;
    btnBuscar: TBitBtn;
    edCaptcha: TEdit;
    lblCaptcha: TLabel;
    tmrCaptcha: TTimer;
    EditFantasia: TEdit;
    Label13: TLabel;
    ACBrConsultaCNPJ: TACBrConsultaCNPJ;
    edCNPJ: TMaskEdit;
    Panel3: TPanel;
    ImgCaptcha: TImage;
    LabAtualizarCaptcha: TLabel;
    ckRemoverEspacosDuplos: TCheckBox;
    BvlConsultar: TBevel;
    btnRecuperar: TBitBtn;
    procedure LabAtualizarCaptchaClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure tmrCaptchaTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edCaptchaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

//var
//  frmGrConsultarCNJP: TfrmGrConsultarCNJP;
//
implementation

uses
  UDMBusiness;

{$R *.dfm}

procedure TfrmGrConsultarCNJP.btnBuscarClick(Sender: TObject);
begin
  if Trim(edCaptcha.Text) <> EmptyStr then
  begin
    if ACBrConsultaCNPJ.Consulta(edCNPJ.Text, Trim(edCaptcha.Text), ckRemoverEspacosDuplos.Checked) then
    begin
      EditTipo.Text        := ACBrConsultaCNPJ.EmpresaTipo;
      EditRazaoSocial.Text := ACBrConsultaCNPJ.RazaoSocial;
      EditAbertura.Text    := DateToStr( ACBrConsultaCNPJ.Abertura );
      EditFantasia.Text    := ACBrConsultaCNPJ.Fantasia;
      EditEndereco.Text    := ACBrConsultaCNPJ.Endereco;
      EditNumero.Text      := ACBrConsultaCNPJ.Numero;
      EditComplemento.Text := ACBrConsultaCNPJ.Complemento;
      EditBairro.Text      := ACBrConsultaCNPJ.Bairro;
      EditComplemento.Text := ACBrConsultaCNPJ.Complemento;
      EditCidade.Text      := ACBrConsultaCNPJ.Cidade;
      EditUF.Text          := ACBrConsultaCNPJ.UF;
      EditCEP.Text         := ACBrConsultaCNPJ.CEP;
      EditSituacao.Text    := ACBrConsultaCNPJ.Situacao;

      btnRecuperar.Enabled := True;
    end;
  end
  else
  begin
    ShowWarning('É necessário digitar o captcha.');
    edCaptcha.SetFocus;

    btnRecuperar.Enabled := False;
  end;
end;

procedure TfrmGrConsultarCNJP.edCaptchaKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
    btnBuscarClick( btnBuscar );
end;

procedure TfrmGrConsultarCNJP.FormShow(Sender: TObject);
begin
  tmrCaptcha.Enabled := True;
end;

procedure TfrmGrConsultarCNJP.LabAtualizarCaptchaClick(Sender: TObject);
var
  Stream : TMemoryStream;
  Jpg : TJPEGImage;
begin
  Stream := TMemoryStream.Create;
  Jpg    := TJPEGImage.Create;
  try
    ACBrConsultaCNPJ.Captcha(Stream);
    Jpg.LoadFromStream(Stream);
    ImgCaptcha.Picture.Assign(Jpg);

    edCaptcha.Clear;
    edCaptcha.SetFocus;
  finally
    Stream.Free;
    Jpg.Free;
  end;
end;

procedure TfrmGrConsultarCNJP.tmrCaptchaTimer(Sender: TObject);
begin
  tmrCaptcha.Enabled := False;
  LabAtualizarCaptchaClick(LabAtualizarCaptcha);
  edCNPJ.SetFocus;
end;

initialization
  FormFunction.RegisterForm('frmGrConsultarCNJP', TfrmGrConsultarCNJP);

end.
