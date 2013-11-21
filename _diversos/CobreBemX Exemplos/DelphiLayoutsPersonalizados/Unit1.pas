unit Unit1;

{$IFDEF VER140}
{$DEFINE USAVARIANTS}
{$ENDIF}

{$IFDEF VER150}
{$DEFINE USAVARIANTS}
{$ENDIF}

interface

uses
    Forms, {$IFDEF USAVARIANTS} Variants,{$ENDIF}
    ComObj, Classes, Controls, StdCtrls, SysUtils;

type
  TForm1 = class(TForm)
    btImprimirBoletos: TButton;
    Label1: TLabel;
    ComboBox1: TComboBox;
    Label2: TLabel;
    Memo1: TMemo;
    Label3: TLabel;
    Edit1: TEdit;
    procedure btImprimirBoletosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

var
   CobreBemX: Variant;

procedure TForm1.FormCreate(Sender: TObject);
var
   i: Integer;
begin
     CobreBemX := CreateOleObject('CobreBemX.ContaCorrente');
     CobreBemX.ArquivoLicenca := '001-18.conf';
     ComboBox1.Items.Clear;
     for i := 0 to CobreBemX.LayoutsBoleto.Count - 1 do
         ComboBox1.Items.Add(CobreBemX.LayoutsBoleto[i]);
end;

procedure TForm1.btImprimirBoletosClick(Sender: TObject);
var
   Boleto: Variant;
   i: Integer;
begin
     CobreBemX.CodigoAgencia := '1234-5';
     CobreBemX.NumeroContaCorrente := '00000123-X';
     CobreBemX.CodigoCedente := '123456';
     CobreBemX.InicioNossoNumero := '00001';
     CobreBemX.FimNossoNumero := '99999';
     CobreBemX.ProximoNossoNumero := '00015';
     CobreBemX.PadroesBoleto.PadroesBoletoImpresso.ArquivoLogotipo := 'c:\CobreBemX\Imagens\BannerCBX.gif';
     CobreBemX.PadroesBoleto.PadroesBoletoImpresso.CaminhoImagensCodigoBarras := 'c:\CobreBemX\Imagens\';

     if ComboBox1.ItemIndex > 0
     then
         begin
              CobreBemX.PadroesBoleto.PadroesBoletoImpresso.LayoutBoleto := ComboBox1.Text;
              if Pos('Personalizado', ComboBox1.Text) <> 0
              then
                  CobreBemX.PadroesBoleto.PadroesBoletoImpresso.HTMLReciboPersonalizado := Memo1.Lines.Text;
         end;

     CobreBemX.PadroesBoleto.PadroesBoletoImpresso.MargemSuperior := StrToInt(Edit1.Text);

     CobreBemX.DocumentosCobranca.Clear;

     for i := 1 to 10 do
     begin
          Boleto := CobreBemX.DocumentosCobranca.Add;
          Boleto.NumeroDocumento := IntToStr(i);
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
     end;

     CobreBemX.ImprimeBoletos;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
     CobreBemX := Unassigned;
end;

end.
