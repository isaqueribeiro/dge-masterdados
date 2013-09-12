unit UGeRetornoBoletos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, IBCustomDataSet, IBTable, CheckLst,
  Buttons, ToolWin, ComCtrls, Grids, DBGrids, ComObj, IBSQL, DBClient,
  IBQuery, UGrPadrao;

type
  TfrmGeRetornoBoleto = class(TfrmGrPadrao)
    pnlFiltro: TPanel;
    GroupBox1: TGroupBox;
    lblBanco: TLabel;
    lblDiretorioRetorno: TLabel;
    edBanco: TComboBox;
    edDiretorioRetorno: TEdit;
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
    IbTblBancosBCO_SEQUENCIAL_REM: TIntegerField;
    Label2: TLabel;
    lstBxRetorno: TCheckListBox;
    Bevel1: TBevel;
    tlbBotoes: TToolBar;
    Bevel2: TBevel;
    btnFechar: TBitBtn;
    Bevel3: TBevel;
    btnCarregarRetorno: TBitBtn;
    Bevel4: TBevel;
    Bevel5: TBevel;
    pnlTitulos: TPanel;
    Shape1: TShape;
    Bevel6: TBevel;
    Label3: TLabel;
    dbgTitulos: TDBGrid;
    UpdateLanc: TIBSQL;
    btnConfirmarBaixa: TBitBtn;
    CdsTitulos: TClientDataSet;
    DtsTitulos: TDataSource;
    CdsTitulosQuitar: TStringField;
    CdsTitulosNossoNumero: TStringField;
    CdsTitulosDataPagamento: TDateField;
    CdsTitulosValorPago: TCurrencyField;
    CdsTitulosNumeroDocumento: TStringField;
    CdsTitulosArquivo: TStringField;
    CdsTitulosLancamento: TLargeintField;
    CdsTitulosParcela: TIntegerField;
    CdsTitulosBanco: TIntegerField;
    CdsTitulosAPagar: TCurrencyField;
    CdsTitulosSacado: TStringField;
    CdsTitulosCnpj: TStringField;
    gFind: TIBQuery;
    IbTblBancosBCO_DIRETORIO_REMESSA: TIBStringField;
    IbTblBancosBCO_DIRETORIO_RETORNO: TIBStringField;
    CdsTitulosAno: TSmallintField;
    procedure edBancoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure dbgTitulosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnCarregarRetornoClick(Sender: TObject);
    procedure btnConfirmarBaixaClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    CobreBemX : Variant;
    procedure CarregarBancos;
    procedure DefinirDiretorioArquivo( iBanco : Integer );
    procedure ListarArquivosRetorno(sDiretorio, sMascara : String; Lista : TStrings);

    function DefinirCedente( Banco, Carteira : Integer; var Objeto : Variant ) : Boolean;
    function CarregarRetorno( sArquivo : String; var Objeto : Variant ) : Boolean;
    function ArquivoSelecionado : Boolean;
    function LancamentoIdentificado( Banco : Integer; sNossoNumero : String; var Ano, Lancamento : Integer; var Parcela : Integer; var APagar : Currency; var Sacado, Cnpj : String) : Boolean;
    function QuitarLancamento(Ano, Lancamento : Integer; Parcela : Integer; ValorPago : Currency; DataPagamento : TDateTime; NossoNumero : String) : Boolean;
  public
    { Public declarations }
  end;

var
  frmGeRetornoBoleto: TfrmGeRetornoBoleto;

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

  procedure ProcessarRetorno(const AOwer : TComponent);

implementation

uses UDMBusiness, UConstantesDGE;

{$R *.dfm}

{ TfrmGrRetornoBoleto }

procedure ProcessarRetorno(const AOwer : TComponent);
var
  f : TfrmGeRetornoBoleto;
begin
  try
    f := TfrmGeRetornoBoleto.Create(AOwer);
    f.ShowModal;
  finally
    f.Free;
  end;
end;

procedure TfrmGeRetornoBoleto.CarregarBancos;
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

procedure TfrmGeRetornoBoleto.DefinirDiretorioArquivo(iBanco: Integer);
begin
  if ( DirectoryExists(Trim(IbTblBancosBCO_DIRETORIO_RETORNO.AsString)) ) then
    edDiretorioRetorno.Text := Trim(IbTblBancosBCO_DIRETORIO_RETORNO.AsString) + FormatFloat('000', iBanco) + '\'
  else
    edDiretorioRetorno.Text := ExtractFilePath(ParamStr(0)) + 'Retorno\' + FormatFloat('000', iBanco) + '\';

  ForceDirectories( edDiretorioRetorno.Text );
end;

procedure TfrmGeRetornoBoleto.ListarArquivosRetorno(sDiretorio, sMascara : String; Lista : TStrings);
var
  Rec : TSearchRec;
begin
  Lista.Clear;
  if ( SysUtils.FindFirst(sDiretorio + sMascara, faAnyFile, Rec) = 0 ) then
    try
      repeat
        Lista.Add(rec.Name);
      until SysUtils.FindNext(Rec) <> 0;
    finally
      SysUtils.FindClose(Rec);
      
      // deleta o diretorio ..
      Lista.Delete(1);

      // deleta o diretorio .
      Lista.Delete(0);
    end;
end;

procedure TfrmGeRetornoBoleto.edBancoChange(Sender: TObject);
begin
  if ( not IbTblBancos.Active ) then
    IbTblBancos.Open;

  if ( IbTblBancos.Locate('BCO_COD', StrToIntDef(Copy(edBanco.Text, 1, 3), 0), []) ) then
    edBanco.Tag := IbTblBancosBCO_COD.AsInteger;

  DefinirDiretorioArquivo( edBanco.Tag );

  ListarArquivosRetorno( edDiretorioRetorno.Text, '*.*', lstBxRetorno.Items);
end;

procedure TfrmGeRetornoBoleto.FormShow(Sender: TObject);
begin
  CarregarBancos;
  edBancoChange(edBanco);
end;

procedure TfrmGeRetornoBoleto.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmGeRetornoBoleto.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
//  CanClose := ( Application.MessageBox('Deseja abandonar processo de leitura dos arquivos de retorno?','Fechar', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = ID_YES );
end;

procedure TfrmGeRetornoBoleto.FormCreate(Sender: TObject);
begin
  CobreBemX := CreateOleObject('CobreBemX.ContaCorrente');
end;

procedure TfrmGeRetornoBoleto.dbgTitulosDrawColumnCell(Sender: TObject;
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

function TfrmGeRetornoBoleto.DefinirCedente(Banco, Carteira: Integer; var Objeto: Variant): Boolean;
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

    Objeto.PadroesBoleto.PadroesBoletoImpresso.ArquivoLogotipo            := sAppPath + BOLETO_ARQUIVO_LOGOTIPO;
    Objeto.PadroesBoleto.PadroesBoletoImpresso.CaminhoImagensCodigoBarras := sAppPath + BOLETO_IMAGENS;

    Result := True;
  except
    On E : Exception do
    begin
      Application.MessageBox(PChar('Erro ao tentar iniciar carga de arquivo(s) de retorno.' + #13 + E.Message), 'Erro', MB_ICONERROR);
      Result := False;
    end;
  end;
end;

function TfrmGeRetornoBoleto.CarregarRetorno(sArquivo: String;
  var Objeto: Variant): Boolean;
var
  I          ,
  Ano        ,
  Lancamento : Integer;
  Parcela    : Integer;
  APagar     : Currency;
  Sacado     ,
  Cnpj       : String;
begin
  try
    // Parâmetros obrigatórios para recuperação dos arquivos de retorno

    Objeto.ArquivoRetorno.Arquivo      := sArquivo;
    Objeto.ArquivoRetorno.Diretorio    := edDiretorioRetorno.Text;

    Objeto.OcorrenciasCobranca.Clear;
    Objeto.CarregaArquivosRetorno;

    if ( not CdsTitulos.Active ) then
      CdsTitulos.CreateDataSet;

    CdsTitulos.IndexFieldNames := 'NossoNumero';
    for I := 0 to Objeto.OcorrenciasCobranca.Count - 1 do
      if ( Objeto.OcorrenciasCobranca[I].Pagamento ) then
        if not CdsTitulos.FindKey( [Objeto.OcorrenciasCobranca[I].NossoNumero] ) then
        begin
          CdsTitulos.Append;
          
          CdsTitulosQuitar.AsString          := '.';
          CdsTitulosNossoNumero.AsString     := Objeto.OcorrenciasCobranca[I].NossoNumero;
          CdsTitulosNumeroDocumento.AsString := Objeto.OcorrenciasCobranca[I].NumeroDocumento;
          CdsTitulosDataPagamento.AsDateTime := StrToDate( Objeto.OcorrenciasCobranca[I].DataOcorrencia );
          CdsTitulosValorPago.AsCurrency     := Objeto.OcorrenciasCobranca[I].ValorPago;

          CdsTitulosBanco.AsInteger          := edBanco.Tag;
          CdsTitulosArquivo.AsString         := sArquivo;

          if ( LancamentoIdentificado( CdsTitulosBanco.AsInteger, CdsTitulosNossoNumero.AsString, Ano, Lancamento, Parcela, APagar, Sacado, Cnpj) ) then
          begin
            if ( CdsTitulosValorPago.AsCurrency >= APagar ) then
              CdsTitulosQuitar.Value   := 'X';

            CdsTitulosAno.Value        := Ano;
            CdsTitulosLancamento.Value := Lancamento;
            CdsTitulosParcela.Value    := Parcela;
            CdsTitulosAPagar.Value     := APagar;
            CdsTitulosSacado.Value     := Sacado;
            CdsTitulosCnpj.Value       := Cnpj;
          end;

          CdsTitulos.Post;
        end;

    Result := True;
  except
    On E : Exception do
    begin
      Application.MessageBox(PChar('Erro ao tentar iniciar carga do arquivo ' + sArquivo + '.' + #13 + E.Message), 'Erro', MB_ICONERROR);
      Result := False;
    end;
  end;
end;

procedure TfrmGeRetornoBoleto.btnCarregarRetornoClick(Sender: TObject);
var
  IArquivos ,
  IBanco    ,
  ICarteira : Integer;
  sFileNew ,
  sFileOld  : String;
begin
  try

    if ( lstBxRetorno.Items.Count = 0 ) then
    begin
      Application.MessageBox('Não existe(m) arquivo(s) de retorno para o banco selecionado.','Alerta', MB_ICONEXCLAMATION);
      Exit;
    end;

    if ( ArquivoSelecionado ) then
    begin
      Application.MessageBox('Não existe(m) arquivo(s) de retorno selecionado(s) para carga.','Alerta', MB_ICONEXCLAMATION);
      Exit;
    end;

    if ( Application.MessageBox('Confirma a carga dos registros de cobrança do(s) arquivo(s) de retorno selecionado(s)?','Ler Retorno', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) <> ID_YES ) then
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

      for IArquivos := 0 to lstBxRetorno.Items.Count - 1 do
        if ( lstBxRetorno.Checked[IArquivos] ) then
          if ( CarregarRetorno(lstBxRetorno.Items.Strings[IArquivos], CobreBemX) ) then
          begin

            lstBxRetorno.Checked[IArquivos] := False;

            sFileOld := edDiretorioRetorno.Text + lstBxRetorno.Items.Strings[IArquivos];
            sFileNew := ChangeFileExt(sFileOld, FormatDateTime('yyyymmdd.hhmmss', Now));
            sFileNew := ExtractFilePath(ParamStr(0)) + 'Retorno\Processados\' + ExtractFileName(sFileNew);

            ForceDirectories( ExtractFilePath(sFileNew) );
            if CopyFile(PChar(sFileOld), PChar(sFileNew), False) then
              DeleteFile(sFileOld);

            Application.ProcessMessages;
          end;

      Application.MessageBox('Arquivo(s) de retorno carregado(s) com sucesso.','Retorno', MB_ICONINFORMATION);
      
      edBancoChange(edBanco);
    end;

  except
    On E : Exception do
      Application.MessageBox(PChar('Erro na tentativa de carregar os registro de cobrança.' + #13 + E.Message), 'Erro', MB_ICONERROR);
  end;
end;

function TfrmGeRetornoBoleto.ArquivoSelecionado: Boolean;
var
  I : Integer;
begin
  Result := False;

  with lstBxRetorno do
    for I := 0 to Items.Count - 1 do
      if ( Checked[i] ) then
      begin
        Result := True;
        Break;
      end;
end;

function TfrmGeRetornoBoleto.LancamentoIdentificado(Banco: Integer;
  sNossoNumero: String; var Ano, Lancamento: Integer; var Parcela: Integer;
  var APagar: Currency; var Sacado, Cnpj: String): Boolean;
var
  sSQL : TStringList;
begin

  try

    try
      sSQL := TStringList.Create;
      sSQL.BeginUpdate;
      sSQL.Add(' Select ');
      sSQL.Add('     r.anolanc ');
      sSQL.Add('   , r.numlanc ');
      sSQL.Add('   , r.parcela ');
      sSQL.Add('   , coalesce(r.valorsaldo, r.valorrec) as apagar ');
      sSQL.Add('   , c.nome ');
      sSQL.Add('   , r.cnpj ');
      sSQL.Add('   , r.nossonumero ');
      sSQL.Add(' from TBCONTREC r ');
      sSQL.Add('   inner join TBCLIENTE c on ( r.cnpj = c.cnpj ) ');
      sSQL.Add(' where r.codbanco = '    + IntToStr(Banco) );
      sSQL.Add('   and r.nossonumero = ' + QuotedStr(sNossoNumero) );
      sSQL.EndUpdate;

      with gFind do
      begin
        Close;
        SQL.Clear;
        SQL.AddStrings( sSQL );
        Open;

        Result := ( not IsEmpty );

        if ( Result ) then
        begin
          Ano        := FieldByName('anolanc').AsInteger;
          Lancamento := FieldByName('numlanc').AsInteger;
          Parcela    := FieldByName('parcela').AsInteger;
          APagar     := FieldByName('apagar').AsCurrency;
          Sacado     := FieldByName('nome').AsString;
          Cnpj       := FieldByName('cnpj').AsString;
        end
        else
        begin
          Ano        := 0;
          Lancamento := 0;
          Parcela    := 0;
          APagar     := 0;
          Sacado     := EmptyStr;
          Cnpj       := EmptyStr;
        end;

        btnConfirmarBaixa.Enabled := ( btnConfirmarBaixa.Enabled ) or ( Result );
      end;
    finally
      sSQL.Free;
    end;

  except
    Result := False;
  end;

end;

procedure TfrmGeRetornoBoleto.btnConfirmarBaixaClick(Sender: TObject);
var
  CxAno    ,
  CxNumero ,
  CxContaCorrente : Integer;
begin
  try

    CxAno    := 0;
    CxNumero := 0;
    CxContaCorrente := 0;

    if ( not CaixaAberto(GetUserApp, GetDateDB, GetCondicaoPagtoIDBoleto, CxAno, CxNumero, CxContaCorrente) ) then
    begin
      ShowWarning('Não existe caixa aberto para o usuário na forma de pagamento BOLETO.');
      Exit;
    end;

    if ( GetCondicaoPagtoIDBoleto = 0 ) then
    begin
      ShowInformation('O código da forma de pagamento BOLETO ainda não foi configurado.' + #13#13 + 'Favor entrar em contato com suporte.');
      Exit;
    end;

    if ( CdsTitulos.IsEmpty ) then
    begin
      Application.MessageBox('Não existe(m) título(s) de cobrança carregado(s) na tela.','Alerta', MB_ICONEXCLAMATION);
      Exit;
    end;

    if ( Application.MessageBox('Confirma a quitação (baixa) do(s) título(s) relacionado(s)?','Confirmar baixa', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) <> ID_YES ) then
      Exit;

    CdsTitulos.First;
    while not CdsTitulos.Eof do
    begin
      QuitarLancamento(
        CdsTitulosAno.AsInteger,
        CdsTitulosLancamento.AsInteger,
        CdsTitulosParcela.Value,
        CdsTitulosValorPago.Value,
        CdsTitulosDataPagamento.Value,
        CdsTitulosNossoNumero.AsString);


      try
        if ( CxContaCorrente > 0 ) then
          GerarSaldoContaCorrente(CxContaCorrente, CdsTitulosDataPagamento.AsDateTime);
      except
      end;

      CdsTitulos.Next;
    end;

    CdsTitulos.EmptyDataSet;
    Application.MessageBox('Processo de baixa de lançamentos executado com sucesso.','Baixa', MB_ICONINFORMATION);

  except
    On E : Exception do
      Application.MessageBox(PChar('Erro na tentativa de quitar o(s) lançamento(s) identificado(s).' + #13 + E.Message), 'Erro', MB_ICONERROR);
  end;
end;

function TfrmGeRetornoBoleto.QuitarLancamento(Ano, Lancamento : Integer; Parcela : Integer;
  ValorPago: Currency; DataPagamento: TDateTime; NossoNumero : String): Boolean;
var
  sSQL  : TStringList;
  iSeq  : Integer;
  sHist : String;
begin
  try

    try
      sSQL := TStringList.Create;

//      sSQL.BeginUpdate;
//      sSQL.Clear;
//      sSQL.Add( ' Update TBCONTREC Set ' );
//      sSQL.Add( '   baixado = 1, numrec = :num, docbaix = :doc, valorrectot = :pago, dtrec = :data' );
//      sSQL.Add( ' where anolanc = ' + IntToStr(Ano) );
//      sSQL.Add( '   and numlanc = ' + IntToStr(Lancamento) );
//      sSQL.EndUpdate;
//
//      with UpdateLanc, SQL  do
//      begin
//        Clear;
//        AddStrings( sSQL );
//        ParamByName('num').AsString    := FormatFloat('0000000000', Lancamento) + FormatFloat('000', Parcela);
//        ParamByName('doc').AsString    := 'BOLETO';
//        ParamByName('pago').AsCurrency := ValorPago;
//        ParamByName('data').AsString   := FormatDateTime('yyyy-mm-dd', DataPagamento);
//        ExecQuery;
//
//        CommitTransaction;
//      end;
//
      sSQL.BeginUpdate;
      sSQL.Clear;
      sSQL.Add( ' Insert Into TBCONTREC_BAIXA ' );
      sSQL.Add( '   (ANOLANC, NUMLANC, SEQ, HISTORICO, DATA_PAGTO, FORMA_PAGTO, VALOR_BAIXA, DOCUMENTO_BAIXA) ' );
      sSQL.Add( ' values ' );
      sSQL.Add( '   (:ano, :num, :seq, :hist, :data, :forma, :pago, :doc) ' );
      sSQL.EndUpdate;

      iSeq  := GetNextID('TBCONTREC_BAIXA', 'SEQ', 'where ANOLANC = ' + IntToStr(Ano) + ' and NUMLANC = ' + IntToStr(Lancamento));
      sHist := 'BAIXA DE TITULO ATRAVES DO PROCESSAMENTO DE ARQUIVO RETORNO BANCARIO';

      with UpdateLanc, SQL  do
      begin
        Clear;
        AddStrings( sSQL );
        ParamByName('ano').AsInteger   := Ano;
        ParamByName('num').AsInteger   := Lancamento;
        ParamByName('seq').AsInteger   := iSeq;
        ParamByName('hist').AsString   := sHist;
        ParamByName('data').AsDateTime := DataPagamento;
        ParamByName('forma').AsInteger := GetCondicaoPagtoIDBoleto;
        ParamByName('pago').AsCurrency := ValorPago;
        ParamByName('doc').AsString    := NossoNumero;
        ExecQuery;

        CommitTransaction;
      end;
    finally
      sSQL.Free;
    end;

    Result := True;
    
  except
    Result := False;
  end;
end;

procedure TfrmGeRetornoBoleto.FormDestroy(Sender: TObject);
begin
  CobreBemX := Unassigned;
end;

procedure TfrmGeRetornoBoleto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ( Key = VK_ESCAPE ) then
    btnFechar.Click
  else
    inherited;
end;

initialization
  FormFunction.RegisterForm('frmGeRetornoBoleto', TfrmGeRetornoBoleto);

end.
