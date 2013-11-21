unit Unit1;

{$IFDEF VER140}
{$DEFINE USAVARIANTS}
{$ENDIF}

{$IFDEF VER150}
{$DEFINE USAVARIANTS}
{$ENDIF}

interface

uses
    Forms, StdCtrls, DB, DBTables, Grids, Mask, DBGrids, DBCtrls, Controls,
    Classes, ExtCtrls, {$IFDEF USAVARIANTS} Variants,{$ENDIF}
    ComObj, SysUtils, Dialogs;

type
  TForm1 = class(TForm)
    tbBoletosChaveBoleto: TAutoIncField;
    tbBoletosChaveContaCorrente: TIntegerField;
    tbBoletosNomeSacado: TStringField;
    tbBoletosCNPJCPFSacado: TStringField;
    tbBoletosEnderecoEmailSacado: TStringField;
    tbBoletosEnderecoSacado: TStringField;
    tbBoletosBairroSacado: TStringField;
    tbBoletosCidadeSacado: TStringField;
    tbBoletosEstadoSacado: TStringField;
    tbBoletosCEPSacado: TStringField;
    tbBoletosDataVencimento: TDateField;
    tbBoletosValorBoleto: TCurrencyField;
    tbBoletosPercentualJuros: TFloatField;
    tbBoletosPercentualMulta: TFloatField;
    tbBoletosPercentualDesconto: TFloatField;
    tbBoletosValorOutrosAcrescimos: TCurrencyField;
    tbBoletosDemonstrativo: TStringField;
    tbBoletosInstrucoesCaixa: TStringField;
    tbBoletosNossoNumero: TStringField;
    tbContasCorrentesChaveContaCorrente: TAutoIncField;
    tbContasCorrentesBanco: TStringField;
    tbContasCorrentesAgenciaCedente: TStringField;
    tbContasCorrentesContaCorrenteCedente: TStringField;
    tbContasCorrentesCodigoCedente: TStringField;
    tbContasCorrentesNomeCedente: TStringField;
    tbContasCorrentesCNPJCPFCedente: TStringField;
    tbContasCorrentesInicioNossoNumero: TStringField;
    tbContasCorrentesFimNossoNumero: TStringField;
    tbContasCorrentesProximoNossoNumero: TStringField;
    tbContasCorrentesArquivoLicenca: TStringField;
    tbContasCorrentesEnderecoEmailCedente: TStringField;
    tbContasCorrentesCaminhoLogotipoBoletoImpr: TStringField;
    tbContasCorrentesIdentificacaoCedenteBolet: TStringField;
    ScrollBox: TScrollBox;
    Label1: TLabel;
    EditChaveContaCorrente: TDBEdit;
    Label2: TLabel;
    EditBanco: TDBEdit;
    Label3: TLabel;
    EditAgenciaCedente: TDBEdit;
    Label4: TLabel;
    EditContaCorrenteCedente: TDBEdit;
    Label5: TLabel;
    EditCodigoCedente: TDBEdit;
    Label6: TLabel;
    EditNomeCedente: TDBEdit;
    Label7: TLabel;
    EditCNPJCPFCedente: TDBEdit;
    Label8: TLabel;
    EditInicioNossoNumero: TDBEdit;
    Label9: TLabel;
    EditFimNossoNumero: TDBEdit;
    Label10: TLabel;
    EditProximoNossoNumero: TDBEdit;
    Label11: TLabel;
    EditArquivoLicenca: TDBEdit;
    Label12: TLabel;
    EditEnderecoEmailCedente: TDBEdit;
    Label15: TLabel;
    EditCaminhoLogotipoBoletoImpr: TDBEdit;
    Label16: TLabel;
    EditIdentificacaoCedenteBolet: TDBEdit;
    DBGrid1: TDBGrid;
    DBNavigator: TDBNavigator;
    Panel1: TPanel;
    dsContasCorrentes: TDataSource;
    Panel2: TPanel;
    Panel3: TPanel;
    tbContasCorrentes: TTable;
    tbBoletos: TTable;
    dsBoletos: TDataSource;
    Panel4: TPanel;
    btImprimirBoletos: TButton;
    btEnviarBoletosEmail: TButton;
    btGerarArquivosRemessa: TButton;
    btCarregarArquivoRetorno: TButton;
    tbBoletosDataPagamento: TDateField;
    tbBoletosValorPago: TCurrencyField;
    procedure FormCreate(Sender: TObject);
    procedure btImprimirBoletosClick(Sender: TObject);
    procedure btEnviarBoletosEmailClick(Sender: TObject);
    procedure btGerarArquivosRemessaClick(Sender: TObject);
    procedure btCarregarArquivoRetornoClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure tbContasCorrentesAfterEdit(DataSet: TDataSet);
    procedure tbContasCorrentesAfterInsert(DataSet: TDataSet);
  private
         procedure PassaDadosContaCorrenteParaCobreBemX;
         procedure SalvaDadosContaCorrente;
         procedure PassaDadosBoletosParaCobreBemX;
         procedure SalvaDadosBoletos;
         procedure SalvaDadosOcorrenciasCobranca;
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

{ Trocar o caminho abaixo para o local onde você instalou o CobreBemX no seu computador }
const
     CaminhoInstalacaoCBX = 'C:\Projects\Dorivaldo\CobreBemX Exemplos\DelphiComBancoDados';

var
   CobreBemX: Variant;

const
     feeSMTPBoletoHTML = $00000000;
     feeSMTPMensagemBoletoHTMLAnexo = $00000001;
     feeSMTPMensagemBoletoPDFAnexo = $00000002;
     feeSMTPMensagemLinhaDigitavelURLCobreBemECommerce = $00000003;
     feeSMTPMensagemURLCobreBemECommerce = $00000004;
     feeSMTPMensagemLinhaDigitavel = $00000005;
     feeOutlookBoletoHTML = $00000006;
     feeOutlookMensagemBoletoHTMLAnexo = $00000007;
     feeOutlookMensagemBoletoPDFAnexo = $00000008;
     feeOutlookMensagemLinhaDigitavelURLCobreBemECommerce = $00000009;
     feeOutlookMensagemURLCobreBemECommerce = $0000000A;
     feeOutlookMensagemLinhaDigitavel = $0000000B;
     scpExecutar = $00000000;
     scpOK = $00000001;
     scpInvalido = $00000002;
     scpErro = $00000003;

procedure TForm1.FormCreate(Sender: TObject);
begin
     CobreBemX := CreateOleObject('CobreBemX.ContaCorrente');
     tbContasCorrentes.DatabaseName := CaminhoInstalacaoCBX + '\Dados';
     tbContasCorrentes.Open;
     tbBoletos.DatabaseName := tbContasCorrentes.DatabaseName;
     tbBoletos.Open;
end;

procedure TForm1.PassaDadosContaCorrenteParaCobreBemX;
begin
{ Início dos parâmetros obrigatórios da conta corrente }
     CobreBemX.ArquivoLicenca := tbContasCorrentesArquivoLicenca.AsString;
     CobreBemX.CodigoAgencia := tbContasCorrentesAgenciaCedente.AsString;
     CobreBemX.NumeroContaCorrente := tbContasCorrentesContaCorrenteCedente.AsString;
     CobreBemX.CodigoCedente := tbContasCorrentesCodigoCedente.AsString;
     CobreBemX.InicioNossoNumero := tbContasCorrentesInicioNossoNumero.AsString;
     CobreBemX.FimNossoNumero := tbContasCorrentesFimNossoNumero.AsString;
     CobreBemX.ProximoNossoNumero := tbContasCorrentesProximoNossoNumero.AsString;
{ Término dos parâmetros obrigatórios da conta corrente }

{ Início da configuração dos dados do Cedente para envio de boletos por email }
     CobreBemX.PadroesBoleto.PadroesBoletoEmail.SMTP.Servidor := 'localhost'; { Trocar para apontar para o seu servidor SMTP }
     CobreBemX.PadroesBoleto.PadroesBoletoEmail.SMTP.Porta := 25;
     CobreBemX.PadroesBoleto.PadroesBoletoEmail.SMTP.Usuario := 'cedente'; {utilizar esta propriedade para acesso a servidores SMTP seguros }
     CobreBemX.PadroesBoleto.PadroesBoletoEmail.SMTP.Senha := 'cedente'; {utilizar esta propriedade para acesso a servidores SMTP seguros }

     CobreBemX.PadroesBoleto.PadroesBoletoEmail.URLImagensCodigoBarras := 'http://www.bptob.com/imagenscbe/';
     CobreBemX.PadroesBoleto.PadroesBoletoEmail.URLLogotipo := 'http://www.thisf.com.br/banners/BannerCBE.gif';
     CobreBemX.PadroesBoleto.PadroesBoletoEmail.PadroesEmail.Assunto := 'Boleto de Cobrança';
     CobreBemX.PadroesBoleto.PadroesBoletoEmail.PadroesEmail.EmailFrom.Endereco := tbContasCorrentesEnderecoEmailCedente.AsString;
     CobreBemX.PadroesBoleto.PadroesBoletoEmail.PadroesEmail.EmailFrom.Nome := tbContasCorrentesNomeCedente.AsString;
     CobreBemX.PadroesBoleto.PadroesBoletoEmail.PadroesEmail.FormaEnvio := feeSMTPBoletoHTML;
{ Término da configuração dos dados do Cedente para envio de boletos por email }

{ Início da configuração dos dados do Cedente para impressão de boletos }
{
 A próxima linha só é necessária se for solicitada a impressão de boletos e
 se desejar colocar o logotipo do Cedente na parte superior do boleto
}
     CobreBemX.PadroesBoleto.PadroesBoletoImpresso.ArquivoLogotipo := CaminhoInstalacaoCBX + 'Imagens\BannerCBX.gif';
     CobreBemX.PadroesBoleto.PadroesBoletoImpresso.CaminhoImagensCodigoBarras := CaminhoInstalacaoCBX + 'Imagens\';

{ Utilize o parâmetro abaixo para efetuar ajustes na impressão do boleto subindo ou descendo o mesmo na folha de papel
  Os valores devem ser informados em milímetros e quanto maior o valor mais para baixo será iniciado o boleto
  Se este parâmetro não for passado será assumido o valor 15 que é o indicado para a maioria das impressoras Jato de Tinta }

     CobreBemX.PadroesBoleto.PadroesBoletoImpresso.MargemSuperior := 3;

{ Término da configuração dos dados do Cedente para impressão de boletos }

{
 A próxima linha é utilizada para exibir um texto do lado direito do logotipo nos boletos impressos ou
 enviados por email
}
     CobreBemX.PadroesBoleto.IdentificacaoCedente := tbContasCorrentesIdentificacaoCedenteBolet.AsString;
end;

procedure TForm1.PassaDadosBoletosParaCobreBemX;
var
   MarcaPosicao: TBookMark;
   Boleto: Variant;
   EmailSacado: Variant;
begin
     CobreBemX.DocumentosCobranca.Clear;
     MarcaPosicao := tbBoletos.GetBookmark;
     tbBoletos.First;
     while not tbBoletos.Eof do
     begin
          Boleto := CobreBemX.DocumentosCobranca.Add;
          Boleto.NumeroDocumento := tbBoletosChaveBoleto.AsString;
          Boleto.NomeSacado := tbBoletosNomeSacado.AsString;
          if Length(tbBoletosCNPJCPFSacado.AsString) > 11
          then
              Boleto.CNPJSacado := tbBoletosCNPJCPFSacado.AsString
          else
              Boleto.CPFSacado := tbBoletosCNPJCPFSacado.AsString;
          Boleto.EnderecoSacado := tbBoletosEnderecoSacado.AsString;
          Boleto.BairroSacado := tbBoletosBairroSacado.AsString;
          Boleto.CidadeSacado := tbBoletosCidadeSacado.AsString;
          Boleto.EstadoSacado := tbBoletosEstadoSacado.AsString;
          Boleto.CepSacado := tbBoletosCEPSacado.AsString;
          Boleto.DataDocumento := FormatDateTime('dd/mm/yyyy', Date);
          if not tbBoletosDataVencimento.IsNull
          then
              Boleto.DataVencimento  := FormatDateTime('dd/mm/yyyy', tbBoletosDataVencimento.AsDateTime);
          Boleto.DataProcessamento := FormatDateTime('dd/mm/yyyy', Date);
          Boleto.ValorDocumento := tbBoletosValorBoleto.AsFloat;
          Boleto.PercentualJurosDiaAtraso := tbBoletosPercentualJuros.AsFloat;
          Boleto.PercentualMultaAtraso := tbBoletosPercentualMulta.AsFloat;
          Boleto.PercentualDesconto := tbBoletosPercentualDesconto.AsFloat;
          Boleto.ValorOutrosAcrescimos := tbBoletosValorOutrosAcrescimos.AsFloat;
          Boleto.PadroesBoleto.Demonstrativo := tbBoletosDemonstrativo.AsString;
          Boleto.PadroesBoleto.InstrucoesCaixa := tbBoletosInstrucoesCaixa.AsString;

          EmailSacado := Boleto.EnderecosEmailSacado.Add;
          EmailSacado.Nome := Boleto.NomeSacado;
          EmailSacado.Endereco := tbBoletosEnderecoEmailSacado.AsString;

          Boleto.ControleProcessamentoDocumento.Imprime := scpExecutar;
          Boleto.ControleProcessamentoDocumento.EnviaEmail := scpExecutar;
          Boleto.ControleProcessamentoDocumento.GravaRemessa := scpExecutar;
          if tbBoletosNossoNumero.AsString <> ''
          then
              begin
                   Boleto.NossoNumero := tbBoletosNossoNumero.AsString;
                   if Length(tbBoletosNossoNumero.AsString) < (CobreBemX.MascaraNossoNumero + 1)
                   then
                       Boleto.CalculaDacNossoNumero := True;
              end;
          tbBoletos.Next;
     end;
     tbBoletos.GotoBookmark(MarcaPosicao);
     tbBoletos.FreeBookmark(MarcaPosicao);
end;

procedure TForm1.SalvaDadosBoletos;
var
   MarcaPosicao: TBookMark;
   IndiceAntigo: String;
   i: Integer;
begin
     MarcaPosicao := tbBoletos.GetBookmark;
     IndiceAntigo := tbBoletos.IndexFieldNames;
     tbBoletos.MasterSource := nil;
     tbBoletos.IndexFieldNames := 'ChaveBoleto';
     for i := 0 to CobreBemX.DocumentosCobranca.Count - 1 do
         if tbBoletos.FindKey([StrToInt(CobreBemX.DocumentosCobranca[i].NumeroDocumento)])
         then
             if tbBoletosNossoNumero.AsString <> CobreBemX.DocumentosCobranca[i].NossoNumero
             then
                 begin
                      tbBoletos.Edit;
                      tbBoletosNossoNumero.AsString := CobreBemX.DocumentosCobranca[i].NossoNumero;
                      tbBoletos.Post;
                 end;
     tbBoletos.IndexFieldNames := IndiceAntigo;
     tbBoletos.MasterSource := dsContasCorrentes;
     tbBoletos.GotoBookmark(MarcaPosicao);
     tbBoletos.FreeBookmark(MarcaPosicao);
     if tbContasCorrentesProximoNossoNumero.AsString <> CobreBemX.ProximoNossoNumero
     then
         begin
              tbContasCorrentes.Edit;
              tbContasCorrentesProximoNossoNumero.AsString := CobreBemX.ProximoNossoNumero;
              tbContasCorrentes.Post;
         end;
end;

procedure TForm1.SalvaDadosContaCorrente;
begin
     tbContasCorrentesBanco.AsString := CobreBemX.NumeroBanco;
     tbContasCorrentesAgenciaCedente.AsString := CobreBemX.CodigoAgencia;
     tbContasCorrentesContaCorrenteCedente.AsString := CobreBemX.NumeroContaCorrente;
     tbContasCorrentesCodigoCedente.AsString := CobreBemX.CodigoCedente;
     tbContasCorrentesNomeCedente.AsString := CobreBemX.NomeCedente;
     tbContasCorrentesCNPJCPFCedente.AsString := CobreBemX.CnpjCpfCedente;
     tbContasCorrentesFimNossoNumero.AsString := CobreBemX.FimNossoNumero;
     if tbContasCorrentesInicioNossoNumero.AsString <> CobreBemX.InicioNossoNumero
     then
         tbContasCorrentesProximoNossoNumero.AsString := CobreBemX.InicioNossoNumero;
     tbContasCorrentesInicioNossoNumero.AsString := CobreBemX.InicioNossoNumero;
end;

procedure TForm1.SalvaDadosOcorrenciasCobranca;
var
   MarcaPosicao: TBookMark;
   IndiceAntigo: String;
   i: Integer;
begin
     MarcaPosicao := tbBoletos.GetBookmark;
     IndiceAntigo := tbBoletos.IndexFieldNames;
     tbBoletos.IndexFieldNames := 'NossoNumero';
     for i := 0 to CobreBemX.OcorrenciasCobranca.Count - 1 do
         if tbBoletos.FindKey([StrToInt(CobreBemX.OcorrenciasCobranca[i].NossoNumero)])
         then
             if CobreBemX.OcorrenciasCobranca[i].Pagamento
             then
                 begin
                      tbBoletos.Edit;
                      tbBoletosDataPagamento.AsDateTime := StrToDateTime(CobreBemX.OcorrenciasCobranca[i].DataOcorrencia);
                      tbBoletosValorPago.AsFloat := CobreBemX.OcorrenciasCobranca[i].ValorPago;
                      tbBoletos.Post;
                 end;
     tbBoletos.IndexFieldNames := IndiceAntigo;
     tbBoletos.GotoBookmark(MarcaPosicao);
     tbBoletos.FreeBookmark(MarcaPosicao);
end;

procedure TForm1.btImprimirBoletosClick(Sender: TObject);
begin
     PassaDadosContaCorrenteParaCobreBemX;
     PassaDadosBoletosParaCobreBemX;
     CobreBemX.ImprimeBoletos;
     SalvaDadosBoletos;
end;

procedure TForm1.btEnviarBoletosEmailClick(Sender: TObject);
begin
     PassaDadosContaCorrenteParaCobreBemX;
     PassaDadosBoletosParaCobreBemX;
     CobreBemX.EnviaBoletosPorEmail;
     SalvaDadosBoletos;
     ShowMessage('Boletos Enviados por email');
end;

procedure TForm1.btGerarArquivosRemessaClick(Sender: TObject);
begin
     PassaDadosContaCorrenteParaCobreBemX;
     PassaDadosBoletosParaCobreBemX;
     CobreBemX.GravaArquivoRemessa;
     SalvaDadosBoletos;
     ShowMessage('Arquivo de Remessa gerado');
end;

procedure TForm1.btCarregarArquivoRetornoClick(Sender: TObject);
begin
     PassaDadosContaCorrenteParaCobreBemX;
     CobreBemX.OcorrenciasCobranca.Clear;
     CobreBemX.CarregaArquivosRetorno;
     SalvaDadosOcorrenciasCobranca;
     ShowMessage('Pagamentos Carregados');
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
     tbBoletos.Close;
     tbContasCorrentes.Close;
     CobreBemX := Unassigned;                                                      
end;

procedure TForm1.tbContasCorrentesAfterEdit(DataSet: TDataSet);
begin
     if tbContasCorrentesArquivoLicenca.IsNull
     then
         tbContasCorrentesArquivoLicenca.AsString := InputBox('Seleção de Arquivo de Licença', 'Arquivo de Licença', '..\Licencas\001-18.conf');
     PassaDadosContaCorrenteParaCobreBemX;
     CobreBemX.ConfiguraContaCorrente;
     SalvaDadosContaCorrente;
end;

procedure TForm1.tbContasCorrentesAfterInsert(DataSet: TDataSet);
begin
     tbContasCorrentesAfterEdit(Dataset);
end;

end.