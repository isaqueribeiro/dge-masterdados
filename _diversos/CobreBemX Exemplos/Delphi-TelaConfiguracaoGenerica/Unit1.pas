unit Unit1;

interface

uses
    Forms, StdCtrls, Buttons, Mask, Controls, Classes, Variants, ComObj,
    Dialogs, IniFiles, SysUtils;

type
  TForm1 = class(TForm)
    Label0: TLabel;
    Edit1: TEdit;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    Label2: TLabel;
    MaskEdit2: TMaskEdit;
    Label3: TLabel;
    MaskEdit3: TMaskEdit;
    Label4: TLabel;
    MaskEdit4: TMaskEdit;
    Label5: TLabel;
    MaskEdit5: TMaskEdit;
    Label6: TLabel;
    MaskEdit6: TMaskEdit;
    Label7: TLabel;
    MaskEdit7: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    Label8: TLabel;
    MaskEdit8: TMaskEdit;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

var
   CobreBemX: Variant;

procedure TForm1.BitBtn1Click(Sender: TObject);
var
   ArquivoIni: TIniFile;
begin
     BitBtn3.Enabled := True;
     BitBtn1.Enabled := False;
     ArquivoIni := TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini'));
     ArquivoIni.WriteString(ChangeFileExt(ExtractFileName(Edit1.Text), ''), 'DadoConfiguracao1', MaskEdit1.Text);
     ArquivoIni.WriteString(ChangeFileExt(ExtractFileName(Edit1.Text), ''), 'DadoConfiguracao2', MaskEdit2.Text);
     ArquivoIni.WriteString(ChangeFileExt(ExtractFileName(Edit1.Text), ''), 'DadoConfiguracao3', MaskEdit3.Text);
     ArquivoIni.WriteString(ChangeFileExt(ExtractFileName(Edit1.Text), ''), 'DadoConfiguracao4', MaskEdit4.Text);
     ArquivoIni.WriteString(ChangeFileExt(ExtractFileName(Edit1.Text), ''), 'DadoConfiguracao5', MaskEdit5.Text);
     ArquivoIni.WriteString(ChangeFileExt(ExtractFileName(Edit1.Text), ''), 'InicioNossoNumero', MaskEdit6.Text);
     ArquivoIni.WriteString(ChangeFileExt(ExtractFileName(Edit1.Text), ''), 'FimNossoNumero', MaskEdit7.Text);
     ArquivoIni.WriteString(ChangeFileExt(ExtractFileName(Edit1.Text), ''), 'ProximoNossoNumero', MaskEdit8.Text);
     Label1.Visible := False;
     MaskEdit1.Visible := False;
     Label2.Visible := False;
     MaskEdit2.Visible := False;
     Label3.Visible := False;
     MaskEdit3.Visible := False;
     Label4.Visible := False;
     MaskEdit4.Visible := False;
     Label5.Visible := False;
     MaskEdit5.Visible := False;
     Label6.Visible := False;
     MaskEdit6.Visible := False;
     Label7.Visible := False;
     MaskEdit7.Visible := False;
     Label8.Visible := False;
     MaskEdit8.Visible := False;
     ArquivoIni.Free;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
     CobreBemX := CreateOleObject('CobreBemX.ContaCorrente');
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
     CobreBemX := Unassigned;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
var
   ArquivoIni: TIniFile;
begin
     CobreBemX.ArquivoLicenca := Edit1.Text;
     if CobreBemX.UltimaMensagemErro <> ''
     then
         begin
              ShowMessage(CobreBemX.UltimaMensagemErro);
              Exit;
         end;
     BitBtn3.Enabled := False;
     BitBtn1.Enabled := True;
     ArquivoIni := TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini'));
     if CobreBemX.MascaraCodigoAgencia <> ''
     then
         begin
              Label1.Caption := CobreBemX.CabecalhoCodigoAgencia;
              MaskEdit1.Hint := CobreBemX.AjudaCodigoAgencia;
              MaskEdit1.EditMask := CobreBemX.MascaraCodigoAgencia;
              MaskEdit1.Text := ArquivoIni.ReadString(ChangeFileExt(ExtractFileName(Edit1.Text), ''), 'DadoConfiguracao1', '');
              Label1.Visible := True;
              MaskEdit1.Visible := True;
         end;
     if CobreBemX.MascaraContaCorrente <> ''
     then
         begin
              Label2.Caption := CobreBemX.CabecalhoContaCorrente;
              MaskEdit2.Hint := CobreBemX.AjudaContaCorrente;
              MaskEdit2.EditMask := CobreBemX.MascaraContaCorrente;
              MaskEdit2.Text := ArquivoIni.ReadString(ChangeFileExt(ExtractFileName(Edit1.Text), ''), 'DadoConfiguracao2', '');
              Label2.Visible := True;
              MaskEdit2.Visible := True;
         end;
     if CobreBemX.MascaraCodigoCedente <> ''
     then
         begin
              Label3.Caption := CobreBemX.CabecalhoCodigoCedente;
              MaskEdit3.Hint := CobreBemX.AjudaCodigoCedente;
              MaskEdit3.EditMask := CobreBemX.MascaraCodigoCedente;
              MaskEdit3.Text := ArquivoIni.ReadString(ChangeFileExt(ExtractFileName(Edit1.Text), ''), 'DadoConfiguracao3', '');
              Label3.Visible := True;
              MaskEdit3.Visible := True;
         end;
     if CobreBemX.MascaraOutroDadoConfiguracao1 <> ''
     then
         begin
              Label4.Caption := CobreBemX.CabecalhoOutroDadoConfiguracao1;
              MaskEdit4.Hint := CobreBemX.AjudaOutroDadoConfiguracao1;
              MaskEdit4.EditMask := CobreBemX.MascaraOutroDadoConfiguracao1;
              MaskEdit4.Text := ArquivoIni.ReadString(ChangeFileExt(ExtractFileName(Edit1.Text), ''), 'DadoConfiguracao4', '');
              Label4.Visible := True;
              MaskEdit4.Visible := True;
         end;
     if CobreBemX.MascaraOutroDadoConfiguracao2 <> ''
     then
         begin
              Label5.Caption := CobreBemX.CabecalhoOutroDadoConfiguracao2;
              MaskEdit5.Hint := CobreBemX.AjudaOutroDadoConfiguracao2;
              MaskEdit5.EditMask := CobreBemX.MascaraOutroDadoConfiguracao2;
              MaskEdit5.Text := ArquivoIni.ReadString(ChangeFileExt(ExtractFileName(Edit1.Text), ''), 'DadoConfiguracao5', '');
              Label5.Visible := True;
              MaskEdit5.Visible := True;
         end;
     Label6.Caption := CobreBemX.CabecalhoInicioNossoNumero;
     MaskEdit6.Hint := CobreBemX.AjudaInicioNossoNumero;
     MaskEdit6.EditMask := CobreBemX.MascaraNossoNumero;
     MaskEdit6.Text := ArquivoIni.ReadString(ChangeFileExt(ExtractFileName(Edit1.Text), ''), 'InicioNossoNumero', '');
     Label6.Visible := True;
     MaskEdit6.Visible := True;
     Label7.Caption := CobreBemX.CabecalhoFimNossoNumero;
     MaskEdit7.Hint := CobreBemX.AjudaFimNossoNumero;
     MaskEdit7.EditMask := CobreBemX.MascaraNossoNumero;
     MaskEdit7.Text := ArquivoIni.ReadString(ChangeFileExt(ExtractFileName(Edit1.Text), ''), 'FimNossoNumero', '');
     Label7.Visible := True;
     MaskEdit7.Visible := True;
     MaskEdit8.EditMask := CobreBemX.MascaraNossoNumero;
     MaskEdit8.Text := ArquivoIni.ReadString(ChangeFileExt(ExtractFileName(Edit1.Text), ''), 'ProximoNossoNumero', '');
     Label8.Visible := True;
     MaskEdit8.Visible := True;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
var
   Boleto: Variant;
   ArquivoIni: TIniFile;
begin                                                                   
     CobreBemX.ArquivoLicenca := Edit1.Text;
     if CobreBemX.UltimaMensagemErro <> ''
     then
         begin
              ShowMessage(CobreBemX.UltimaMensagemErro);
              Exit;
         end;
     ArquivoIni := TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini'));
     CobreBemX.CodigoAgencia := ArquivoIni.ReadString(ChangeFileExt(ExtractFileName(Edit1.Text), ''), 'DadoConfiguracao1', '');
     CobreBemX.NumeroContaCorrente := ArquivoIni.ReadString(ChangeFileExt(ExtractFileName(Edit1.Text), ''), 'DadoConfiguracao2', '');
     CobreBemX.CodigoCedente := ArquivoIni.ReadString(ChangeFileExt(ExtractFileName(Edit1.Text), ''), 'DadoConfiguracao3', '');
     CobreBemX.OutroDadoConfiguracao1 := ArquivoIni.ReadString(ChangeFileExt(ExtractFileName(Edit1.Text), ''), 'DadoConfiguracao4', '');
     CobreBemX.OutroDadoConfiguracao2 := ArquivoIni.ReadString(ChangeFileExt(ExtractFileName(Edit1.Text), ''), 'DadoConfiguracao5', '');
     CobreBemX.InicioNossoNumero := ArquivoIni.ReadString(ChangeFileExt(ExtractFileName(Edit1.Text), ''), 'InicioNossoNumero', '');
     CobreBemX.FimNossoNumero := ArquivoIni.ReadString(ChangeFileExt(ExtractFileName(Edit1.Text), ''), 'FimNossoNumero', '');
     CobreBemX.ProximoNossoNumero := ArquivoIni.ReadString(ChangeFileExt(ExtractFileName(Edit1.Text), ''), 'ProximoNossoNumero', '');
     CobreBemX.PadroesBoleto.PadroesBoletoImpresso.ArquivoLogotipo := 'C:\Projects\Dorivaldo\Boleto\Imagens\BannerCBX.gif';
     CobreBemX.PadroesBoleto.PadroesBoletoImpresso.CaminhoImagensCodigoBarras := 'C:\Projects\Dorivaldo\Boleto\Imagens\';
     CobreBemX.DocumentosCobranca.Clear;
     Boleto := CobreBemX.DocumentosCobranca.Add;
     Boleto.NumeroDocumento := '12345';
     Boleto.NomeSacado := 'Fulano de Tal';
     Boleto.CPFSacado := '111.111.111-11';
     Boleto.EnderecoSacado := 'Rua do Sacado 123';
     Boleto.BairroSacado := 'Bairro do Sacado';
     Boleto.CidadeSacado := 'Cidade do Sacado';
     Boleto.EstadoSacado := 'SP';
     Boleto.CepSacado := '01001-001';
     Boleto.DataDocumento := '01/09/2002';
     Boleto.DataVencimento  := '15/09/2002';
     Boleto.ValorDocumento := 123.45;
     Boleto.PadroesBoleto.Demonstrativo := 'Referente a compras na WEB<br><b>O melhor site da Internet</b>';
     Boleto.PadroesBoleto.InstrucoesCaixa := '<br><br>Não dispensar juros e multa após o vencimento';
     CobreBemX.ImprimeBoletos;
     ArquivoIni.WriteString(ChangeFileExt(ExtractFileName(Edit1.Text), ''), 'ProximoNossoNumero', CobreBemX.ProximoNossoNumero);
     ArquivoIni.Free;
end;

end.
