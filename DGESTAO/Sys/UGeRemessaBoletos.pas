unit UGeRemessaBoletos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DB, IBCustomDataSet, IBTable, ComCtrls,
  IBSQL, DBClient, Provider, IBUpdateSQL, IBQuery, Buttons, ToolWin, Grids,
  DBGrids, ComObj, frxClass, frxDBSet, UGrPadrao;

type
  TfrmGeRemessaBoleto = class(TfrmGrPadrao)
    pnlFiltro: TPanel;
    GroupBox1: TGroupBox;
    lblBanco: TLabel;
    edBanco: TComboBox;
    IbTblBancos: TIBTable;
    IbTblBancosBCO_COD: TSmallintField;
    IbTblBancosBCO_CARTEIRA: TIBStringField;
    IbTblBancosBCO_NOME: TIBStringField;
    IbTblBancosBCO_CHAVE: TIBStringField;
    IbTblBancosBCO_AGENCIA: TIBStringField;
    IbTblBancosBCO_CC: TIBStringField;
    IbTblBancosBCO_NOSSO_NUM_INICIO: TIBStringField;
    IbTblBancosBCO_NOSSO_NUM_FINAL: TIBStringField;
    IbTblBancosBCO_NOSSO_NUM_PROXIMO: TIBStringField;
    IbTblBancosBCO_CONFG_1: TIBStringField;
    IbTblBancosBCO_CONFG_2: TIBStringField;
    edInicio: TDateTimePicker;
    lblInicio: TLabel;
    lblFinal: TLabel;
    edFinal: TDateTimePicker;
    edArquivoRemessa: TEdit;
    lblArquivoRemessa: TLabel;
    IbQryTitulos: TIBQuery;
    IbUpdTitulos: TIBUpdateSQL;
    DspTitulos: TDataSetProvider;
    CdsTitulos: TClientDataSet;
    CdsTitulosPARCELA: TSmallintField;
    CdsTitulosCODBANCO: TIntegerField;
    CdsTitulosNOSSONUMERO: TStringField;
    CdsTitulosCNPJ: TStringField;
    CdsTitulosTIPPAG: TStringField;
    CdsTitulosDTEMISS: TDateField;
    CdsTitulosDTVENC: TDateField;
    CdsTitulosVALORREC: TBCDField;
    CdsTitulosPERCENTJUROS: TBCDField;
    CdsTitulosPERCENTMULTA: TBCDField;
    CdsTitulosPERCENTDESCONTO: TBCDField;
    CdsTitulosVALORRECTOT: TBCDField;
    CdsTitulosVALORSALDO: TBCDField;
    CdsTitulosDATAPROCESSOBOLETO: TDateField;
    DtsTitulos: TDataSource;
    UpdateLanc: TIBSQL;
    pnlTitulos: TPanel;
    Shape1: TShape;
    Bevel2: TBevel;
    Bevel1: TBevel;
    tlbBotoes: TToolBar;
    Bevel3: TBevel;
    btnFechar: TBitBtn;
    Bevel4: TBevel;
    btnGerarRemessa: TBitBtn;
    Bevel5: TBevel;
    Bevel6: TBevel;
    dbgTitulos: TDBGrid;
    Label5: TLabel;
    CdsTitulosINSCEST: TStringField;
    CdsTitulosNOME: TStringField;
    CdsTitulosFONE: TStringField;
    CdsTitulosENDER: TStringField;
    CdsTitulosBAIRRO: TStringField;
    CdsTitulosCIDADE: TStringField;
    CdsTitulosUF: TStringField;
    CdsTitulosCEP: TStringField;
    CdsTitulosEMAIL: TStringField;
    IbTblBancosBCO_SEQUENCIAL_REM: TIntegerField;
    IbTblBancosBCO_DIRETORIO_REMESSA: TIBStringField;
    IbTblBancosBCO_DIRETORIO_RETORNO: TIBStringField;
    frrRemessa: TfrxReport;
    frdRemessa: TfrxDBDataset;
    CdsTitulosANOLANC: TSmallintField;
    CdsTitulosANOVENDA: TSmallintField;
    CdsTitulosNUMVENDA: TIntegerField;
    CdsTitulosNUMLANC: TIntegerField;
    procedure FormShow(Sender: TObject);
    procedure edBancoChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnGerarRemessaClick(Sender: TObject);
    procedure edInicioChange(Sender: TObject);
    procedure dbgTitulosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure frrRemessaGetValue(const VarName: String;
      var Value: Variant);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    CobreBemX : Variant;
    procedure CarregarBancos;
    procedure DefinirNomeArquivo( iBanco : Integer );
    procedure CarregarTitulos( iBanco : Integer; DataInicial, DataFinal : TDate);
    procedure GravarHistoricoRemessa;

    function DefinirCedente( Banco, Carteira : Integer; var Objeto : Variant ) : Boolean;
    function InserirBoleto( var Objeto : Variant ) : Boolean;
  public
    { Public declarations }
  end;

var
  frmGeRemessaBoleto: TfrmGeRemessaBoleto;

const
  feeSMTPBoletoHTML              = $00000000;
  feeSMTPMensagemBoletoHTMLAnexo = $00000001;
  feeSMTPMensagemBoletoPDFAnexo  = $00000002;
  feeSMTPMensagemLinhaDigitavelURLCobreBemECommerce = $00000003;
  feeSMTPMensagemURLCobreBemECommerce = $00000004;
  feeSMTPMensagemLinhaDigitavel       = $00000005;
  feeOutlookBoletoHTML                = $00000006;
  feeOutlookMensagemBoletoHTMLAnexo   = $00000007;
  feeOutlookMensagemBoletoPDFAnexo    = $00000008;
  feeOutlookMensagemLinhaDigitavelURLCobreBemECommerce = $00000009;
  feeOutlookMensagemURLCobreBemECommerce = $0000000A;
  feeOutlookMensagemLinhaDigitavel       = $0000000B;
  scpExecutar = $00000000;
  scpOK       = $00000001;
  scpInvalido = $00000002;
  scpErro     = $00000003;

  procedure GerarArquivoRemessa(const AOwer : TComponent);

implementation

uses UDMBusiness, UConstantesDGE;

{$R *.dfm}

{ TfrmGrRemessaBoleto }

procedure GerarArquivoRemessa(const AOwer : TComponent);
var
  f : TfrmGeRemessaBoleto;
begin
  try
    f := TfrmGeRemessaBoleto.Create(AOwer);
    f.ShowModal;
  finally
    f.Free;
  end;
end;

procedure TfrmGeRemessaBoleto.CarregarBancos;
begin
  with IbTblBancos, edBanco do
  begin
    Close;
    Open;
    if ( not IsEmpty ) then
      Clear;

    while not Eof do
    begin
      Items.Add( FormatFloat('000', IbTblBancosBCO_COD.AsInteger) + ' - ' + IbTblBancosBCO_NOME.AsString );

      Next;
    end;

    First;

    edBanco.Tag       := IbTblBancosBCO_COD.AsInteger;
    edBanco.ItemIndex := 0;
  end;
end;

procedure TfrmGeRemessaBoleto.FormShow(Sender: TObject);
begin
  CarregarBancos;
  edBancoChange(edBanco);
end;

procedure TfrmGeRemessaBoleto.edBancoChange(Sender: TObject);
begin
  if ( not IbTblBancos.Active ) then
    IbTblBancos.Open;

  if ( IbTblBancos.Locate('BCO_COD', StrToIntDef(Copy(edBanco.Text, 1, 3), 0), []) ) then
    edBanco.Tag := IbTblBancosBCO_COD.AsInteger;

  DefinirNomeArquivo( edBanco.Tag );

  CarregarTitulos( edBanco.Tag, edInicio.Date, edFinal.Date );
end;

procedure TfrmGeRemessaBoleto.FormCreate(Sender: TObject);
begin
  inherited;
  edInicio.Date := Date;
  edFinal.Date  := Date;
  CobreBemX := CreateOleObject('CobreBemX.ContaCorrente');
end;

procedure TfrmGeRemessaBoleto.DefinirNomeArquivo(iBanco: Integer);
begin
  if ( DirectoryExists(Trim(IbTblBancosBCO_DIRETORIO_REMESSA.AsString)) ) then
    edArquivoRemessa.Text := Trim(IbTblBancosBCO_DIRETORIO_REMESSA.AsString) + FormatFloat('000', iBanco) + '\' + FormatFloat('000', iBanco) + '_' + FormatDateTime('yyyymmdd-hhmmss', Now) + '.rem'
  else
    edArquivoRemessa.Text := ExtractFilePath(ParamStr(0)) + 'Remessa\' + FormatFloat('000', iBanco) + '\' + FormatFloat('000', iBanco) + '_' + FormatDateTime('yyyymmdd-hhmmss', Now) + '.rem';

  ForceDirectories( ExtractFilePath(edArquivoRemessa.Text) );
end;

procedure TfrmGeRemessaBoleto.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmGeRemessaBoleto.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
//  CanClose := ( Application.MessageBox('Deseja abandonar processo de geração de remessas?','Fechar', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = ID_YES );
end;

procedure TfrmGeRemessaBoleto.btnGerarRemessaClick(Sender: TObject);
var
  IBanco    ,
  ICarteira : Integer;
begin
  try

    if ( CdsTitulos.IsEmpty ) then
    begin
      Application.MessageBox('Não existe relação de boletos para gerar arquivo de remessa.','Alerta', MB_ICONEXCLAMATION);
      Exit;
    end;

    if ( Application.MessageBox('Confirma a geração de arquivo de remessa?','Gerar Remessa', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) <> ID_YES ) then
      Exit;

    if ( edBanco.ItemIndex < 0 ) then
    begin
      Application.MessageBox(PChar('Favor selecionar a entidade financeira para geração dos boletos.'), 'Alerta', MB_ICONWARNING);
      Exit;
    end;

    IBanco    := StrToIntDef( Copy(edBanco.Text, 1, 3), 0 );
    ICarteira := IbTblBancosBCO_CARTEIRA.AsInteger;

    if DefinirCedente( IBanco, ICarteira, CobreBemX ) then
    begin
      CdsTitulos.First;

      if ( InserirBoleto( CobreBemX ) ) then
      begin
        CobreBemX.GravaArquivoRemessa;

        GravarHistoricoRemessa;

        frrRemessa.ShowReport;
        
        Application.MessageBox('Arquivo de remessa gerado com sucesso.', 'Remessa', MB_ICONINFORMATION);

        CarregarTitulos( edBanco.Tag, edInicio.Date, edFinal.Date );
      end;

    end;

  except
    On E : Exception do
      Application.MessageBox(PChar('Erro na tentativa de gerar o arquivo de remessa.' + #13 + E.Message), 'Erro', MB_ICONERROR);
  end;
end;

procedure TfrmGeRemessaBoleto.CarregarTitulos(iBanco: Integer; DataInicial,
  DataFinal: TDate);
begin
  with CdsTitulos, Params do
  begin
    Close;
    ParamByName('banco').Value        := iBanco;
    ParamByName('dataInicial').AsDate := DataInicial;
    ParamByName('dataFinal').AsDate   := DataFinal;
    Open;

    btnGerarRemessa.Enabled := not IsEmpty;
  end;
end;

procedure TfrmGeRemessaBoleto.edInicioChange(Sender: TObject);
begin
  CarregarTitulos( edBanco.Tag, edInicio.Date, edFinal.Date );
end;

procedure TfrmGeRemessaBoleto.dbgTitulosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
 TDbGrid(Sender).Canvas.font.Color := clBlack;

 if gdSelected in State then
 with (Sender as TDBGrid).Canvas do
 begin
   Brush.Color :=  clMoneyGreen;
   FillRect(Rect);
   Font.Style  := [fsbold]
 end;

 TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);
end;

function TfrmGeRemessaBoleto.DefinirCedente(Banco, Carteira: Integer;
  var Objeto: Variant): Boolean;
var
  sAppPath     ,
  sFileLisence : String;
begin
  try
    sAppPath     := ExtractFilePath(ParamStr(0));
    sFileLisence := sAppPath + BOLETO_LICENCAS + FormatFloat('000', Banco)  + '-' + FormatFloat('00', Carteira) + '.conf';

    if ( not FileExists(sFileLisence) ) then
      raise Exception.Create('Arquivo de licença ' + QuotedStr(sFileLisence) + ' não encontrado');

    // Parâmetros obrigatórios da conta corrente do Cedente

    Objeto.ArquivoLicenca         := sFileLisence;
    Objeto.CodigoAgencia          := IbTblBancosBCO_AGENCIA.AsString;
    Objeto.NumeroContaCorrente    := IbTblBancosBCO_CC.AsString;
    Objeto.CodigoCedente          := IbTblBancosBCO_CHAVE.AsString;
    Objeto.InicioNossoNumero      := IbTblBancosBCO_NOSSO_NUM_INICIO.AsString;
    Objeto.FimNossoNumero         := IbTblBancosBCO_NOSSO_NUM_FINAL.AsString;
    Objeto.OutroDadoConfiguracao1 := Trim(IbTblBancosBCO_CONFG_1.AsString);
    Objeto.OutroDadoConfiguracao2 := Trim(IbTblBancosBCO_CONFG_2.AsString);

    if ( Trim(IbTblBancosBCO_NOSSO_NUM_PROXIMO.AsString) = EmptyStr ) then
      Objeto.ProximoNossoNumero  := '1'
    else
      Objeto.ProximoNossoNumero  := IbTblBancosBCO_NOSSO_NUM_PROXIMO.AsString;

    // Parâmetros obrigatórios para a geração de arquivos de remessa

    Objeto.ArquivoRemessa.Arquivo      := ExtractFileName(edArquivoRemessa.Text);
    Objeto.ArquivoRemessa.Diretorio    := ExtractFilePath(edArquivoRemessa.Text);
    Objeto.ArquivoRemessa.Sequencia    := IbTblBancosBCO_SEQUENCIAL_REM.AsInteger;
    Objeto.ArquivoRemessa.DataGravacao := FormatDateTime('dd/mm/yyyy', Date);

    Objeto.PadroesBoleto.PadroesBoletoImpresso.ArquivoLogotipo            := sAppPath + BOLETO_ARQUIVO_LOGOTIPO;
    Objeto.PadroesBoleto.PadroesBoletoImpresso.CaminhoImagensCodigoBarras := sAppPath + BOLETO_IMAGENS;

    Result := True;
  except
    On E : Exception do
    begin
      Application.MessageBox(PChar('Erro ao tentar iniciar processo de geração de arquivo de remessa.' + #13 + E.Message), 'Erro', MB_ICONERROR);
      Result := False;
    end;
  end;
end;

function TfrmGeRemessaBoleto.InserirBoleto(var Objeto: Variant): Boolean;
var
  sDocumento  : String;
  Boleto      ,
  EmailSacado : Variant;
begin
  try
    Objeto.DocumentosCobranca.Clear;

    CdsTitulos.First;

    while not CdsTitulos.Eof do
    begin
      Boleto := Objeto.DocumentosCobranca.Add;
      sDocumento := Copy(CdsTitulosANOLANC.AsString, 3, 2) + FormatFloat('00000000', CdsTitulosNUMLANC.AsInteger) + FormatFloat('000', CdsTitulosPARCELA.AsInteger);

      Boleto.NumeroDocumento := sDocumento;
      Boleto.NomeSacado      := Trim(CdsTitulosNOME.AsString);

      if Length(Trim(CdsTitulosCNPJ.AsString)) > 11 then
        Boleto.CNPJSacado := Trim(CdsTitulosCNPJ.AsString)
      else
        Boleto.CPFSacado  := Trim(CdsTitulosCNPJ.AsString);

      Boleto.EnderecoSacado := Trim(CdsTitulosENDER.AsString);
      Boleto.BairroSacado   := Trim(CdsTitulosBAIRRO.AsString);
      Boleto.CidadeSacado   := Trim(CdsTitulosCIDADE.AsString);
      Boleto.EstadoSacado   := Trim(CdsTitulosUF.AsString);
      Boleto.CepSacado      := Trim(CdsTitulosCEP.AsString);
      Boleto.DataDocumento  := FormatDateTime('dd/mm/yyyy', CdsTitulosDATAPROCESSOBOLETO.AsDateTime);

      if not CdsTitulosDTVENC.IsNull then
        Boleto.DataVencimento  := FormatDateTime('dd/mm/yyyy', CdsTitulosDTVENC.AsDateTime);

      Boleto.DataProcessamento := FormatDateTime('dd/mm/yyyy', CdsTitulosDATAPROCESSOBOLETO.AsDateTime);

      Boleto.ValorDocumento                := CdsTitulosVALORREC.AsFloat;
      Boleto.PercentualJurosDiaAtraso      := CdsTitulosPERCENTJUROS.AsFloat;
      Boleto.PercentualMultaAtraso         := CdsTitulosPERCENTMULTA.AsFloat;
      Boleto.PercentualDesconto            := CdsTitulosPERCENTDESCONTO.AsFloat;
      Boleto.ValorOutrosAcrescimos         := 0;
      Boleto.PadroesBoleto.Demonstrativo   := 'Referente a compra de produtos <br>e/ou a contratação de serviços' + '<br><br>Venda No. ' +
                                              FormatFloat('0000', CdsTitulosANOLANC.AsInteger) + '/' +
                                              FormatFloat('##00000000', CdsTitulosNUMVENDA.AsInteger);;
      Boleto.PadroesBoleto.InstrucoesCaixa := '<br>Não receber pagamento após o vencimento.';

      EmailSacado          := Boleto.EnderecosEmailSacado.Add;
      EmailSacado.Nome     := Boleto.NomeSacado;
      EmailSacado.Endereco := Trim(CdsTitulosEMAIL.AsString);

      Boleto.ControleProcessamentoDocumento.Imprime      := scpExecutar;
      Boleto.ControleProcessamentoDocumento.EnviaEmail   := scpExecutar;
      Boleto.ControleProcessamentoDocumento.GravaRemessa := scpExecutar;

      Boleto.NossoNumero := CdsTitulosNOSSONUMERO.AsString;

      CdsTitulos.Next;
    end;

    Result := True;
  except
    On E : Exception do
    begin
      Application.MessageBox(PChar('Erro ao tentar inserir boleto no arquivo de remessa.' + #13 + E.Message), 'Erro', MB_ICONERROR);
      Result := False;
    end;
  end;
end;

procedure TfrmGeRemessaBoleto.GravarHistoricoRemessa;
var
  sSQL : TStringList;
begin
  try
    sSQL := TStringList.Create;
    
    if ( FileExists(edArquivoRemessa.Text) ) then
    begin

      sSQL.BeginUpdate;
      sSQL.Clear;
      sSQL.Add( ' Update TBCONTREC Set ' );
      sSQL.Add( '     enviado = 1, remessa = ' + IbTblBancosBCO_SEQUENCIAL_REM.AsString );
      sSQL.Add( ' where codbanco = '   + IntToStr(edBanco.Tag) );
      sSQL.Add( '   and baixado  = 0' );
      sSQL.Add( '   and enviado  = 0' );
      sSQL.Add( '   and dataprocessoboleto between ' + QuotedStr(FormatDateTime('yyyy-mm-dd', edInicio.Date)) + ' and ' + QuotedStr(FormatDateTime('yyyy-mm-dd', edFinal.Date))) ;
      sSQL.EndUpdate;

      with UpdateLanc, SQL  do
      begin
        Clear;
        AddStrings( sSQL );
        ExecQuery;
      end;

      IbTblBancos.Edit;
      IbTblBancosBCO_SEQUENCIAL_REM.Value := IbTblBancosBCO_SEQUENCIAL_REM.AsInteger + 1;
      IbTblBancos.Post;

      CommitTransaction;
    end;
  finally
    sSQL.Free;
  end;
end;

procedure TfrmGeRemessaBoleto.frrRemessaGetValue(const VarName: String;
  var Value: Variant);
begin
  if ( VarName = 'Banco' ) then
    Value := edBanco.Text;
  if ( VarName = 'Arquivo' ) then
    Value := ExtractFileName(edArquivoRemessa.Text);
end;

procedure TfrmGeRemessaBoleto.FormDestroy(Sender: TObject);
begin
  CobreBemX := Unassigned;
end;

procedure TfrmGeRemessaBoleto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ( Key = VK_ESCAPE ) then
    btnFechar.Click
  else
    inherited;
end;

initialization
  FormFunction.RegisterForm('frmGeRemessaBoleto', TfrmGeRemessaBoleto);

end.
