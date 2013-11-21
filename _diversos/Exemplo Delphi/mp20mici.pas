unit MP20MICI;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ExtDlgs, Buttons, Printers, ComCtrls, ImgList, Mask, Modulo;

type
  TForm1 = class(TForm)
    FontDialog1: TFontDialog;
    Idioma: TGroupBox;
    RBIdioma: TRadioButton;
    RadioButton2: TRadioButton;
    Button5: TButton;
    GroupBox6: TGroupBox;
    ComboBox1: TComboBox;
    GroupBox7: TGroupBox;
    ComboModeloImpressora: TComboBox;
    imgIcones: TImageList;
    OpenDialogFind: TOpenDialog;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox8: TGroupBox;
    Label1: TLabel;
    Label10: TLabel;
    Label5: TLabel;
    tempo: TEdit;
    TxtAutentica: TEdit;
    btnVerificaDocInserido: TButton;
    btnAutenticacao: TButton;
    GroupBox4: TGroupBox;
    Label11: TLabel;
    Label3: TLabel;
    Edit2: TEdit;
    btnPrgramarPresenter: TButton;
    btnHabilitaPresenter: TButton;
    Edit1: TEdit;
    btnCaracterGrafico: TButton;
    Button9: TButton;
    btnAguardaImpressaoTexto: TButton;
    btnCortarPapel: TButton;
    GroupBox5: TGroupBox;
    btnStatusPorta: TButton;
    MemoStatus: TMemo;
    GroupBox3: TGroupBox;
    Label9: TLabel;
    Edit4: TEdit;
    btnPrgramarExtrato: TButton;
    btnHabilitaTamanhoExtrato: TButton;
    GroupBox1: TGroupBox;
    RBNormal: TRadioButton;
    RBElite: TRadioButton;
    RBCondensado: TRadioButton;
    GroupBox2: TGroupBox;
    RBNegrito: TCheckBox;
    RBItalico: TCheckBox;
    RBSublinhado: TCheckBox;
    RBExpandido: TCheckBox;
    Button1: TButton;
    Button2: TButton;
    btnTesteTextoFormatado: TButton;
    btnVerificarPapelPresenter: TButton;
    BtnCorteParcial: TButton;
    TSCodBarras: TTabSheet;
    GBEscolhaCod: TGroupBox;
    CBSelectCodigo: TComboBox;
    GBCodigo: TGroupBox;
    MEDCodigo: TMaskEdit;
    GBLargura: TGroupBox;
    RBMedia: TRadioButton;
    RbGrossa: TRadioButton;
    RBFina: TRadioButton;
    Panel2: TPanel;
    LBImprimirCodigo: TLabel;
    BtnImprimirCodigo: TBitBtn;
    GBPosicao: TGroupBox;
    RBAcima: TRadioButton;
    RBAbaixo: TRadioButton;
    RBAcimaAbaixo: TRadioButton;
    RBNaoImprime: TRadioButton;
    GBFonte: TGroupBox;
    RBFonteNormal: TRadioButton;
    RBFonteCondensada: TRadioButton;
    TabSheet2: TTabSheet;
    Panel4: TPanel;
    Label4: TLabel;
    RichEdit1: TRichEdit;
    BtnImprimirTexto: TBitBtn;
    BtnFonte: TBitBtn;
    Button4: TButton;
    Panel1: TPanel;
    Label6: TLabel;
    BtnImprimirFigura: TBitBtn;
    GBInformacoes: TGroupBox;
    Label2: TLabel;
    CBImpressoras: TComboBox;
    TabSheet3: TTabSheet;
    Label7: TLabel;
    Label8: TLabel;
    Label12: TLabel;
    BmpImage: TImage;
    FileName: TEdit;
    findFileBtn: TButton;
    GroupBox9: TGroupBox;
    RadioButtonRetrato: TRadioButton;
    RadioButtonPaisagem: TRadioButton;
    PrintNormal: TButton;
    ComboBoxBitola: TComboBox;
    ComboBoxAlgo: TComboBox;
    GroupBoxTransform: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    HeighEdit: TEdit;
    WidthEdit: TEdit;
    CheckBoxFitOnPage: TCheckBox;
    GroupBox10: TGroupBox;
    Label15: TLabel;
    Degrees: TEdit;
    PrintSpecialBtn: TButton;
    Label16: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure btnCaracterGraficoClick(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure btnStatusPortaClick(Sender: TObject);
    procedure btnCortarPapelClick(Sender: TObject);
    procedure btnAguardaImpressaoTextoClick(Sender: TObject);
    procedure ComboModeloImpressoraChange(Sender: TObject);
    procedure Inicializa(Sender: TObject);
    procedure btnTesteTextoFormatadoClick(Sender: TObject);
    procedure BtnImprimirFiguraClick(Sender: TObject);
    procedure BtnImprimirTextoClick(Sender: TObject);
    procedure FindfileClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure btnPrgramarExtratoClick(Sender: TObject);
    procedure btnHabilitaTamanhoExtratoClick(Sender: TObject);
    procedure btnPrgramarPresenterClick(Sender: TObject);
    procedure btnHabilitaPresenterClick(Sender: TObject);
    procedure RBIdiomaClick(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure BtnFonteClick(Sender: TObject);
    procedure CBImpressorasChange(Sender: TObject);
    procedure btnAutenticacaoClick(Sender: TObject);
    procedure btnVerificaDocInseridoClick(Sender: TObject);
    procedure btnVerificarPapelPresenterClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure BtnCorteParcialClick(Sender: TObject);
    procedure CBSelectCodigoChange(Sender: TObject);
    procedure RBFinaClick(Sender: TObject);
    procedure RBMediaClick(Sender: TObject);
    procedure RbGrossaClick(Sender: TObject);
    procedure BtnImprimirCodigoClick(Sender: TObject);
    procedure findFileBtnClick(Sender: TObject);
    procedure TabSheet3Show(Sender: TObject);
    procedure HeighEditKeyPress(Sender: TObject; var Key: Char);
    procedure PrintNormalClick(Sender: TObject);
    procedure ComboBoxBitolaChange(Sender: TObject);
    procedure ComboBoxAlgoChange(Sender: TObject);
    procedure PrintSpecialBtnClick(Sender: TObject);
    procedure CheckBoxFitOnPageClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Procedure HabilitaProgramacaoPresenter(Flag: boolean);
    Procedure HabilitaFuncoesExtrato(Flag: boolean);
  end;

var
  Form1: TForm1;
  buffer, cmd: String;
  comunica: String;
  retorno,envia, porta, comando, fecha, modo: Integer;
  negrito, italico, sublinhado, expandido: Integer;
  PGAltura, PGLargura : Integer;
  ThreadStatus : TThreadLeStatus;

implementation

uses frmLogo;

{$R *.DFM}


{*******************************************************************************
================================================================================

 Imprime Texto sem Formatação

================================================================================
*******************************************************************************}
procedure TForm1.Button1Click(Sender: TObject);
var Contador   : integer;
    InputString: string;

begin
  if RBIdioma.Checked then
    InputString:= inputbox( 'Impressão de Texto', 'Quantas vezes você deseja imprimir?' , '' )
  else
    InputString:= inputbox( 'Impression of Text ', ' How many times you desire to print?' , '' );

  if ( InputString <> '' ) then
  begin
    for Contador := 1 to strtoint( InputString ) do
    begin
      buffer  := Edit1.Text + Chr(13) + Chr(10);
      comando := FormataTX(buffer, 3, 0, 0, 0, 0);
      if comando = 0 then
      begin
        If RBIdioma.Checked then
          MessageDlg('Problemas na impressão do texto.' + #10 + 'Possíveis causas: Impressora desligada, off-line ou sem papel', mtError, [mbOk], 0 )
        else
          MessageDlg('Problems in the impression of the text.'  + #10 + ' Possible causes:  Off printer, off-line or without paper ', mtError, [mbOk], 0 );
        exit;
      end;
    end;
  end;
end;


{*******************************************************************************
================================================================================

 Imprime Texto com Formatação

================================================================================
*******************************************************************************}
procedure TForm1.Button2Click(Sender: TObject);
var Contador   : integer;
    InputString: string;

begin
  Negrito    := 0;
  Italico    := 0;
  Sublinhado := 0;
  Expandido  := 0;
  if RBIdioma.Checked then
    InputString:= inputbox( 'Impressão de Texto', 'Quantas vezes você deseja imprimir?' , '' )
  else
    InputString:= inputbox( ' Impression of Text ', ' How many times you desire to print ' , '' );

  if ( InputString <> '' ) then
  begin

    // Verifica modo NORMAL, ELITE ou CONDENSADO.
    if RBNormal.Checked = True Then
       modo := 2  // normal
    else if RBElite.Checked = True Then
       modo := 3  // elite
    else
       modo := 1; // condensado

    // Negrito, Itálico, Sublinhado e Expandido
    if (RBNegrito.Checked = True) then
      Negrito := 1;
    if (RBItalico.Checked = True) then
      Italico := 1;
    if (RBSublinhado.Checked = True) then
      Sublinhado := 1;
    if (RBExpandido.Checked = True) then
      Expandido  := 1;

    for Contador := 1 to strtoint( InputString ) do
    begin
      buffer  := Edit1.Text + Chr(13) + Chr(10);
      comando := FormataTX(buffer, modo, Italico, Sublinhado, Expandido, Negrito);
      if comando = 0 then
      begin
        If RbIdioma.Checked then
          MessageDlg('Problemas na impressão do texto formatado.' + #10 + 'Possíveis causas: Impressora desligada, off-line ou sem papel', mtError, [mbOk], 0 )
        else
          MessageDlg('Problems in the impression of the formatted text.'  + #10 + ' Possible causes:  Off printer, off-line or without paper ', mtError, [mbOk], 0 );
        exit;
      end;
    end;
  end;
end;


{*******************************************************************************
================================================================================

 Combo para selecionar a Porta de Comunicação

================================================================================
*******************************************************************************}
procedure TForm1.ComboBox1Change(Sender: TObject);
var
  msg: string;
  code : integer;
  ret  : integer;

begin

  // Fecha a porta que está aberta

  ret := 0;
  ret := FechaPorta();
  if ret <= 0 then
    if RbIdioma.Checked then
      MessageDlg('Problemas ao fechar a porta de Comunicação.', mtError, [mbOk], 0 )
    else
      MessageDlg('Problems when closing the communication port.', mtError, [mbOk], 0 );

   if (ComboBox1.ItemIndex) = 0 then
            comunica := 'LPT1'#0;
   if (ComboBox1.ItemIndex) = 1 then
            comunica := 'COM1'#0;
   if (ComboBox1.ItemIndex) = 2 then
           comunica := 'COM2'#0;
   if (ComboBox1.ItemIndex) = 3 then
           comunica := 'COM3'#0;
   if (ComboBox1.ItemIndex) = 4 then
           comunica := 'USB'#0;


  // Abre a porta de comunicacao
  ret := 0;
//  SetLength( msg,100);
//  porta := IniciaPortaEx(Pchar(comunica),code,msg);
//  msg := msg + '*';
  ret := IniciaPorta(Pchar(comunica));
  if ret <= 0 then
    if RbIdioma.Checked then
      MessageDlg('Problemas ao abrir a porta de Comunicação.', mtError, [mbOk], 0 )
    else
      MessageDlg('Problems when opening the communication port.', mtError, [mbOk], 0 )

end;


{*******************************************************************************
================================================================================

 Finaliza a Aplicação

================================================================================
*******************************************************************************}
procedure TForm1.Button5Click(Sender: TObject);
begin
  retorno:=FechaPorta();
  Application.Terminate;
  Exit;
end;


{*******************************************************************************
================================================================================

 Comando para Imprimir Caracter de Autenticação

================================================================================
*******************************************************************************}
procedure TForm1.btnCaracterGraficoClick(Sender: TObject);
{
                  DESENHO

             1 2 3 4 5 6 7 8 9
bit 7 = 128  *               *
bit 6 = 064  * *             *
bit 5 = 032  * * *           *
bit 4 = 016  * * * *         *
bit 3 = 008  * * * * *       *
bit 2 = 004  * * * * * *     *
bit 1 = 002  * * * * * * *   *
bit 0 = 001  * * * * * * * * *
}
begin

  // Comando que habilita o modo grafico com 9 pinos (9 colunas)
  cmd := chr(27) + chr(94) + chr(18) + chr(0);
  comando := ComandoTX(cmd, Length(cmd));
  if comando = 0 then
  begin
    if RBIdioma.Checked then
       MessageDlg('Problemas na impressão do caracter gráfico.' + #10 + 'Possíveis causas: Impressora desligada, off-line ou sem papel', mtError, [mbOk], 0 )
    else
       MessageDlg('Problems in the impression of graphical caracter.'  + #10 + ' Possible causes:  Off printer, off-line or without paper', mtError, [mbOk], 0 );
       exit;
  end;

  // Sequencia de bytes para a montagem do desenho acima
  cmd := chr(255) + chr(0) + chr(0) + chr(0) + chr(127) + chr(0)
         + chr(0) + chr(0) + chr(063) + chr(0) + chr(0) + chr(0)
         + chr(031) + chr(0) + chr(0) + chr(0) + chr(015) + chr(0) + chr(0)
         + chr(0) + chr(007) + chr(0) + chr(0) + chr(0) + chr(003) + chr(0)
         + chr(0) + chr(0) + chr(001) + chr(0) + chr(0) + chr(0) + chr(255)
         + chr(0) + chr(0) + chr(0);

  cmd := cmd + #13 + #10;

  comando := CaracterGrafico( cmd, length( cmd ) );
  if comando = 0 then
  begin
    if RBIdioma.Checked then
       MessageDlg('Problemas na impressão do caracter gráfico.' + #10 + 'Possíveis causas: Impressora desligada, off-line ou sem papel', mtError, [mbOk], 0 )
    else
      MessageDlg('Problems in the impression of graphical caracter.'  + #10 + ' Possible causes:  Off printer, off-line or without paper', mtError, [mbOk], 0 );
       exit;
  end;
end;


{*******************************************************************************
================================================================================

 Exibe caracteres acentuados

================================================================================
*******************************************************************************}
procedure TForm1.Button9Click(Sender: TObject);
begin
  edit1.text:='âäàáãÃÂÄÁÀ êëèéÊËÉÈ ïíìîÎÍÌÏ öóòôõÖÓÒÔÕ üúùûÜÙÚÛ Çç ÿ Ññ  ' ;
end;


{*******************************************************************************
================================================================================

 Verifica o Status da Impressora

================================================================================
*******************************************************************************}
procedure TForm1.btnStatusPortaClick(Sender: TObject);
var Contador   : integer;
begin
  if (ThreadStatus = nil) then  // Se não existe a thread
    Begin
      ThreadStatus := TThreadLeStatus.Inicia(MemoStatus);
      if RBIdioma.Checked then
        btnStatusPorta.Caption := 'Cancelar'
      else
        btnStatusPorta.Caption := 'Cancel';
    End
  Else
    Begin
      If ThreadStatus.Suspended then
        Begin
          ThreadStatus.Suspended := False;
          if RBIdioma.Checked then
            btnStatusPorta.Caption := 'Cancelar'
          else
            btnStatusPorta.Caption := 'Cancel';
        End
      Else // Se não estiver para então para.
        Begin
          ThreadStatus.Suspended := True;
          if RBIdioma.Checked then
            btnStatusPorta.Caption := 'Status da Impressora'
          else
            btnStatusPorta.Caption := 'Printer Status';
        End;
    End;
end;


{*******************************************************************************
================================================================================

 Acionamento da Guilhotina

================================================================================
*******************************************************************************}
procedure TForm1.btnCortarPapelClick(Sender: TObject);
begin
  comando := AcionaGuilhotina(1);  // modo total (full cut)
  if comando <> 1 then
    if RBIdioma.Checked then
      MessageDlg('Problemas no corte do papel..' + #10 + 'Possíveis causas: Impressora desligada, off-line ou sem papel', mtError, [mbOk], 0 )
    else
      MessageDlg('Problems in the cut of the paper.'  + #10 + ' Possible causes:  Off printer, off-line or without paper', mtError, [mbOk], 0 );
end;


{*******************************************************************************
================================================================================

 Realiza a Impressão do Texto, aguardando para o envio de novas informações
 para a impressão

================================================================================
*******************************************************************************}
procedure TForm1.btnAguardaImpressaoTextoClick(Sender: TObject);
var Contador   : integer;
    InputString: string;
begin
  if RBIdioma.Checked then
    InputString:= inputbox( 'Impressão de Texto com acionamento da guilhotina', 'Quantas vezes você deseja imprimir?' , '' )
  else
    InputString:= inputbox( 'Impression of Text with drive of the guillotine ', ' How many times you desire to print?' , '' );

  if ( InputString <> '' ) then
  begin
    comando := HabilitaEsperaImpressao(1);  // habilita a espera até que o texto seja todo impresso.
    //                            1         2         3         4         5         6         7         8         9
    buffer  :=          '1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890';
    buffer  := buffer + '1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890';
    buffer  := buffer + '1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890';
    buffer  := buffer + '1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890';
    buffer  := buffer + '1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890';
    buffer  := buffer + Chr(27) + Chr(119);// comando para cortar o papel

    for Contador := 1 to strtoint( InputString ) do
    begin
      comando := BematechTX(buffer);         // envia o texto para impressão
      if comando = 0 then
      begin
        if RBIdioma.Checked then
          MessageDlg('Problemas na impressão do texto.' + #10 + 'Possíveis causas: Impressora desligada, off-line ou sem papel', mtError, [mbOk], 0 )
        else
          MessageDlg('Problems in the impression of the text.'  + #10 + ' Possible causes:  Off printer, off-line or without paper', mtError, [mbOk], 0 );
        exit;
      end;

      comando := EsperaImpressao();          // Aguarda o final da impressao do texto

      // mostra a mensagem para retirar o extrato.
      if RBIdioma.Checked then
      begin
        if MessageDlg('Retire seu extrato.', mtInformation, [mbOk, mbCancel], 0) = mrCancel then
        begin
          comando := HabilitaEsperaImpressao(0);  // desabilita a espera de impressao de todo o texto
          exit;
        end
      end
      else
        if MessageDlg('Remove the Coupon.', mtInformation, [mbOk, mbCancel], 0) = mrCancel then
        begin
          comando := HabilitaEsperaImpressao(0);  // desabilita a espera de impressao de todo o texto
          exit;
        end;
    end; // end for
    comando := HabilitaEsperaImpressao(0);  // desabilita a espera de impressao de todo o texto
  end;
end;


{*******************************************************************************
================================================================================

 Seleciona o Modelo da Impressora e Configura a mesma para o uso

================================================================================
*******************************************************************************}
procedure TForm1.ComboModeloImpressoraChange(Sender: TObject);
var ModeloImpressora : integer;
begin
  if (ComboModeloImpressora.ItemIndex > 4) and
     (ComboModeloImpressora.ItemIndex < 9) then
  begin
    If ComboModeloImpressora.ItemIndex = 9 then
      ModeloImpressora := 3  // Bloco 112mm
    Else
      ModeloImpressora := 2;  // Bloco Térmico

    GroupBox8.Visible := False;  //autenticacao
    GroupBox4.Visible := true;   //programacao presenter
    HabilitaProgramacaoPresenter( True );
    HabilitaFuncoesExtrato( True );
    btnCortarPapel.Enabled := True;
    BtnCorteParcial.Enabled := True;
    CBSelectCodigo.Enabled :=true;
    MEDCodigo.Enabled :=True;
    BtnImprimirCodigo.Enabled := True;
    GBLargura.Enabled := True;
    GBPosicao.Enabled := True;
    GBFonte.Enabled := True;
    btnVerificarPapelPresenter.Enabled := True;
    btnAguardaImpressaoTexto.Enabled := True;
  end

  else if (ComboModeloImpressora.ItemIndex = 0) or (ComboModeloImpressora.ItemIndex = 1) Then
  begin
    ModeloImpressora := 1;  // impressora MP20 MI ou CI

    GroupBox8.Visible := True;  // autenticacao
    GroupBox4.Visible := False; // programacao do presenter
    HabilitaProgramacaoPresenter( False );
    HabilitaFuncoesExtrato( False );
    btnCortarPapel.Enabled := False;
    BtnCorteParcial.Enabled := False;
    CBSelectCodigo.Enabled :=False;
    MEDCodigo.Enabled :=False;
    GBLargura.Enabled := False;
    GBPosicao.Enabled := False;
    GBFonte.Enabled := False;
    BtnImprimirCodigo.Enabled := False;
    btnAguardaImpressaoTexto.Enabled := False;
    btnVerificarPapelPresenter.Enabled := False;
  end

  else
  begin
    ModeloImpressora := 0;       // impressora MP20 TH, MP2000 TH, MP2000 CI ou bloco térmico
    GroupBox8.Visible := False;  // autenticacao
    GroupBox4.Visible := true;   // programação do presenter
    HabilitaProgramacaoPresenter( False );
    HabilitaFuncoesExtrato( False );
    btnCortarPapel.Enabled := True;
    BtnCorteParcial.Enabled := True;
    IF ComboModeloImpressora.ItemIndex = 3 then
    Begin
      CBSelectCodigo.Enabled := False;
      MEDCodigo.Enabled := False;
      BtnImprimirCodigo.Enabled := False;
      GBLargura.Enabled := False;
      GBPosicao.Enabled := False;
      GBFonte.Enabled := False;
    End
    Else
    Begin
      CBSelectCodigo.Enabled := True;
      MEDCodigo.Enabled := True;
      BtnImprimirCodigo.Enabled := True;
      GBLargura.Enabled := True;
      GBPosicao.Enabled := True;
      GBFonte.Enabled := True;

    End;
    btnVerificarPapelPresenter.Enabled := False;
    btnAguardaImpressaoTexto.Enabled := False;
  end;

  // Configura o modelo da impressora
  comando := ConfiguraModeloImpressora(ModeloImpressora);
  If comando = -2 Then
    If RBIdioma.Checked then
       MessageDlg('Parâmetro inválido na função "ConfiguraModeloImpressora."', mtError, [mbOk], 0 )
    Else
      MessageDlg('Invalid parameter in the function "ConfiguraModeloImpressora."', mtError, [mbOk], 0 );
end;

procedure TForm1.Inicializa(Sender: TObject);
begin
  // driver
  CBImpressoras.Items.Assign(Printer.Printers);
  CBImpressoras.ItemIndex := Printer.PrinterIndex;
  CBSelectCodigo.ItemIndex := 0;

  // inicializa o combo Porta de Comunicação
   If (ComboBox1.ItemIndex) = -1 Then
       ComboBox1.ItemIndex := 0;

  // Abre a porta de comunicacao
  comando := IniciaPorta(Pchar(ComboBox1.Text));
  If comando <= 0 Then
    If RBIdioma.Checked then
      MessageDlg('Problemas ao abrir a porta de Comunicação.', mtError, [mbOk], 0 )
    Else
      MessageDlg('Problems when opening the communication port.', mtError, [mbOk], 0 );

  // inicializa o combo ModeloImpressora com MP20 CI
  If (ComboModeloImpressora.ItemIndex) = -1 Then
      ComboModeloImpressora.ItemIndex := 0;

  // Configura o modelo da impressora para MP20 CI
  comando := ConfiguraModeloImpressora(1);
  If comando = -2 Then
    If RBIdioma.Checked then
      MessageDlg('Parâmetro inválido na função "ConfiguraModeloImpressora."', mtError, [mbOk], 0 )
    Else
      MessageDlg('Invalid parameter in the function "ConfiguraModeloImpressora."', mtError, [mbOk], 0 );

    ComboModeloImpressora.OnChange(self);
end;


{*******************************************************************************
================================================================================

 Realiza a impressão do texto usando as formatações selecionadas

================================================================================
*******************************************************************************}
procedure TForm1.btnTesteTextoFormatadoClick(Sender: TObject);
var Fonte : string;
var Texto : string;
   begin
        // acentos a serem impressos
        Texto := Texto + 'âäàáãÃÂÄÁÀ êëèéÊËÉÈ ïíìîÎÍÌÏ öóòôõÖÓÒÔÕ üúùûÜÙÚÛ' + chr(13) + chr(10) + chr(10);

        // italico
        Fonte := 'Itálico' + chr(10);
        if FormataTX(Fonte + Texto, 3, 1, 0, 0, 0) = 0 then
        begin
            If RBIdioma.Checked then
              MessageDlg('Problemas na impressão do texto formatado.' + #10 + 'Possíveis causas: Impressora desligada, off-line ou sem papel', mtError, [mbOk], 0 )
            Else
              MessageDlg('Problems in the impression of the formatted text.'  + #10 + ' Possible causes:  Off printer, off-line or without paper', mtError, [mbOk], 0 );
            exit;
        end;

        // sublinhado
        Fonte := 'Sublinhado' + chr(10);
        if FormataTX(Fonte + Texto, 3, 0, 1, 0, 0) = 0 then
        begin
          If RBIdioma.Checked then
            MessageDlg('Problemas na impressão do texto formatado.' + #10 + 'Possíveis causas: Impressora desligada, off-line ou sem papel', mtError, [mbOk], 0 )
          else
            MessageDlg('Problems in the impression of the formatted text.'  + #10 + ' Possible causes:  Off printer, off-line or without paper', mtError, [mbOk], 0 );
         exit;
        end;

        // expandido
        Fonte := 'Expandido' + chr(10);
        if FormataTX(Fonte + Texto, 3, 0, 0, 1, 0) = 0 then
        begin
          If RBIdioma.Checked then
            MessageDlg('Problemas na impressão do texto formatado.' + #10 + 'Possíveis causas: Impressora desligada, off-line ou sem papel', mtError, [mbOk], 0 )
          else
            MessageDlg('Problems in the impression of the formatted text.'  + #10 + ' Possible causes:  Off printer, off-line or without paper', mtError, [mbOk], 0 );
          exit;
        end;

        // negrito
        Fonte := 'Negrito' + chr(10);
        if FormataTX(Fonte + Texto, 3, 0, 0, 0, 1) = 0 then
        begin
          If RBIdioma.Checked then
            MessageDlg('Problemas na impressão do texto formatado.' + #10 + 'Possíveis causas: Impressora desligada, off-line ou sem papel', mtError, [mbOk], 0 )
          else
            MessageDlg('Problems in the impression of the formatted text.'  + #10 + ' Possible causes:  Off printer, off-line or without paper', mtError, [mbOk], 0 );
          exit;
        end;

        // condensado
        Fonte := 'Condensado' + chr(10);
        if FormataTX(Fonte + Texto, 1, 0, 0, 0, 0) = 0 then
        begin
          If RBIdioma.Checked then
            MessageDlg('Problemas na impressão do texto formatado.' + #10 + 'Possíveis causas: Impressora desligada, off-line ou sem papel', mtError, [mbOk], 0 )
          else
            MessageDlg('Problems in the impression of the formatted text.'  + #10 + ' Possible causes:  Off printer, off-line or without paper', mtError, [mbOk], 0 );
          exit;
        end;

        // italico + sublinhado
        Fonte := 'Itálico + sublinhado' + chr(10);
        if FormataTX(Fonte + Texto, 3, 1, 1, 0, 0) = 0 then
        begin
          If RBIdioma.Checked then
            MessageDlg('Problemas na impressão do texto formatado.' + #10 + 'Possíveis causas: Impressora desligada, off-line ou sem papel', mtError, [mbOk], 0 )
          else
            MessageDlg('Problems in the impression of the formatted text.'  + #10 + ' Possible causes:  Off printer, off-line or without paper', mtError, [mbOk], 0 );
          exit;
        end;

        // italico + expandido
        Fonte := 'Itálico + expandido' + chr(10);
        if FormataTX(Fonte + Texto, 3, 1, 0, 1, 0) = 0 then
        begin
          If RBIdioma.Checked then
            MessageDlg('Problemas na impressão do texto formatado.' + #10 + 'Possíveis causas: Impressora desligada, off-line ou sem papel', mtError, [mbOk], 0 )
          else
            MessageDlg('Problems in the impression of the formatted text.'  + #10 + ' Possible causes:  Off printer, off-line or without paper', mtError, [mbOk], 0 );
          exit;
        end;

        // italico + negrito
        Fonte := 'Itálico + negrito' + chr(10);
        if FormataTX(Fonte + Texto, 3, 1, 0, 0, 1) = 0 then
        begin
          If RBIdioma.Checked then
            MessageDlg('Problemas na impressão do texto formatado.' + #10 + 'Possíveis causas: Impressora desligada, off-line ou sem papel', mtError, [mbOk], 0 )
          else
            MessageDlg('Problems in the impression of the formatted text.'  + #10 + ' Possible causes:  Off printer, off-line or without paper', mtError, [mbOk], 0 );
          exit;
        end;

        // italico + condensado
        Fonte := 'Itálico + condensado' + chr(10);
        if FormataTX(Fonte + Texto, 1, 1, 0, 0, 0) = 0 then
        begin
          If RBIdioma.Checked then
            MessageDlg('Problemas na impressão do texto formatado.' + #10 + 'Possíveis causas: Impressora desligada, off-line ou sem papel', mtError, [mbOk], 0 )
          else
            MessageDlg('Problems in the impression of the formatted text.'  + #10 + ' Possible causes:  Off printer, off-line or without paper', mtError, [mbOk], 0 );
          exit;
        end;

        // italico  +  sublinhado + expandido
        Fonte := 'Itálico  +  sublinhado +expandido' + chr(10);
        if FormataTX(Fonte + Texto, 3, 1, 1, 1, 0) = 0 then
        begin
          If RBIdioma.Checked then
            MessageDlg('Problemas na impressão do texto formatado.' + #10 + 'Possíveis causas: Impressora desligada, off-line ou sem papel', mtError, [mbOk], 0 )
          else
            MessageDlg('Problems in the impression of the formatted text.'  + #10 + ' Possible causes:  Off printer, off-line or without paper', mtError, [mbOk], 0 );
          exit;
        end;

        // italico + sublinhado + negrito
        Fonte := 'Itálico + sublinhado + negrito' + chr(10);
        if FormataTX(Fonte + Texto, 3, 1, 1, 0, 1) = 0 then
        begin
          If RBIdioma.Checked then
            MessageDlg('Problemas na impressão do texto formatado.' + #10 + 'Possíveis causas: Impressora desligada, off-line ou sem papel', mtError, [mbOk], 0 )
          else
            MessageDlg('Problems in the impression of the formatted text.'  + #10 + ' Possible causes:  Off printer, off-line or without paper', mtError, [mbOk], 0 );
          exit;
        end;

        // italico + sublinhado + condensado
        Fonte := 'Itálico + sublinhado + condensado' + chr(10);
        if FormataTX(Fonte + Texto, 1, 1, 1, 0, 0) = 0 then
        begin
          If RBIdioma.Checked then
            MessageDlg('Problemas na impressão do texto formatado.' + #10 + 'Possíveis causas: Impressora desligada, off-line ou sem papel', mtError, [mbOk], 0 )
          else
            MessageDlg('Problems in the impression of the formatted text.'  + #10 + ' Possible causes:  Off printer, off-line or without paper', mtError, [mbOk], 0 );
          exit;
        end;

        // italico + sublinhado + expandido + negrito
        Fonte := 'Itálico  +  sublinhado +expandido + negrito' + chr(10);
        if FormataTX(Fonte + Texto, 3, 1, 1, 1, 1) = 0 then
        begin
          If RBIdioma.Checked then
            MessageDlg('Problemas na impressão do texto formatado.' + #10 + 'Possíveis causas: Impressora desligada, off-line ou sem papel', mtError, [mbOk], 0 )
          else
            MessageDlg('Problems in the impression of the formatted text.'  + #10 + ' Possible causes:  Off printer, off-line or without paper', mtError, [mbOk], 0 );
          exit;
        end;

        // italico + sublinhado + expandido + condensado
        Fonte := 'Itálico + sublinhado + expandido+ condensado' + chr(10);
        if FormataTX(Fonte + Texto, 1, 1, 1, 1, 0) = 0 then
        begin
          If RBIdioma.Checked then
            MessageDlg('Problemas na impressão do texto formatado.' + #10 + 'Possíveis causas: Impressora desligada, off-line ou sem papel', mtError, [mbOk], 0 )
          else
            MessageDlg('Problems in the impression of the formatted text.'  + #10 + ' Possible causes:  Off printer, off-line or without paper', mtError, [mbOk], 0 );
          exit;
        end;

        // italico + sublinhado + expandido + negrito + condensado
        Fonte := 'Itálico + sublinhado + expandido+ negrito + condensado' + chr(10);
        if FormataTX(Fonte + Texto, 1, 1, 1, 1, 1) = 0 then
        begin
          If RBIdioma.Checked then
            MessageDlg('Problemas na impressão do texto formatado.' + #10 + 'Possíveis causas: Impressora desligada, off-line ou sem papel', mtError, [mbOk], 0 )
          else
            MessageDlg('Problems in the impression of the formatted text.'  + #10 + ' Possible causes:  Off printer, off-line or without paper', mtError, [mbOk], 0 );
          exit;
        end;

        // sublinhado + expandido
        Fonte := 'Sublinhado + expandido' + chr(10);
        if FormataTX(Fonte + Texto, 3, 0, 1, 1, 0) = 0 then
        begin
          If RBIdioma.Checked then
            MessageDlg('Problemas na impressão do texto formatado.' + #10 + 'Possíveis causas: Impressora desligada, off-line ou sem papel', mtError, [mbOk], 0 )
          else
            MessageDlg('Problems in the impression of the formatted text.'  + #10 + ' Possible causes:  Off printer, off-line or without paper', mtError, [mbOk], 0 );
          exit;
        end;

        // sublinhado + negrito
        Fonte := 'Sublinhado + negrito' + chr(10);
        if FormataTX(Fonte + Texto, 3, 0, 1, 0, 1) = 0 then
        begin
          If RBIdioma.Checked then
            MessageDlg('Problemas na impressão do texto formatado.' + #10 + 'Possíveis causas: Impressora desligada, off-line ou sem papel', mtError, [mbOk], 0 )
          else
            MessageDlg('Problems in the impression of the formatted text.'  + #10 + ' Possible causes:  Off printer, off-line or without paper', mtError, [mbOk], 0 );
          exit;
        end;

        // sublinhado + condensado
        Fonte := 'Sublinhado + condensado' + chr(10);
        if FormataTX(Fonte + Texto, 1, 0, 1, 0, 0) = 0 then
        begin
          If RBIdioma.Checked then
            MessageDlg('Problemas na impressão do texto formatado.' + #10 + 'Possíveis causas: Impressora desligada, off-line ou sem papel', mtError, [mbOk], 0 )
          else
            MessageDlg('Problems in the impression of the formatted text.'  + #10 + ' Possible causes:  Off printer, off-line or without paper', mtError, [mbOk], 0 );
          exit;
        end;

        // sublinhado + expandido + negrito
        Fonte := 'Sublinhado + expandido +negrito' + chr(10);
        if FormataTX(Fonte + Texto, 3, 0, 1, 1, 1) = 0 then
        begin
          If RBIdioma.Checked then
            MessageDlg('Problemas na impressão do texto formatado.' + #10 + 'Possíveis causas: Impressora desligada, off-line ou sem papel', mtError, [mbOk], 0 )
          else
            MessageDlg('Problems in the impression of the formatted text.'  + #10 + ' Possible causes:  Off printer, off-line or without paper', mtError, [mbOk], 0 );
          exit;
        end;

        // sublinhado + expandido  + condensado
        Fonte := 'Sublinhado + expandido  + condensado' + chr(10);
        if FormataTX(Fonte + Texto, 1, 0, 1, 1, 0) = 0 then
        begin
          If RBIdioma.Checked then
            MessageDlg('Problemas na impressão do texto formatado.' + #10 + 'Possíveis causas: Impressora desligada, off-line ou sem papel', mtError, [mbOk], 0 )
          else
            MessageDlg('Problems in the impression of the formatted text.'  + #10 + ' Possible causes:  Off printer, off-line or without paper', mtError, [mbOk], 0 );
          exit;
        end;

        // sublinhado + expandido + negrito + consensado
        Fonte := 'Sublinhado + expandido + negrito+ condensado' + chr(10);
        if FormataTX(Fonte + Texto, 1, 0, 1, 1, 1) = 0 then
        begin
          If RBIdioma.Checked then
            MessageDlg('Problemas na impressão do texto formatado.' + #10 + 'Possíveis causas: Impressora desligada, off-line ou sem papel', mtError, [mbOk], 0 )
          else
            MessageDlg('Problems in the impression of the formatted text.'  + #10 + ' Possible causes:  Off printer, off-line or without paper', mtError, [mbOk], 0 );
          exit;
        end;

        // Expandido + negrito
        Fonte := 'Expandido + negrito' + chr(10);
        if FormataTX(Fonte + Texto, 3, 0, 0, 1, 1) = 0 then
        begin
          If RBIdioma.Checked then
            MessageDlg('Problemas na impressão do texto formatado.' + #10 + 'Possíveis causas: Impressora desligada, off-line ou sem papel', mtError, [mbOk], 0 )
          else
            MessageDlg('Problems in the impression of the formatted text.'  + #10 + ' Possible causes:  Off printer, off-line or without paper', mtError, [mbOk], 0 );
          exit;
        end;

        // Expandido + condensado
        Fonte := 'Expandido + condensado' + chr(10);
        if FormataTX(Fonte + Texto, 1, 0, 0, 1, 0) = 0 then
        begin
          If RBIdioma.Checked then
            MessageDlg('Problemas na impressão do texto formatado.' + #10 + 'Possíveis causas: Impressora desligada, off-line ou sem papel', mtError, [mbOk], 0 )
          else
            MessageDlg('Problems in the impression of the formatted text.'  + #10 + ' Possible causes:  Off printer, off-line or without paper', mtError, [mbOk], 0 );
          exit;
        end;

        // Expandido + negrito + condensado
        Fonte := 'Expandido + negrito + condensado' + chr(10);
        if FormataTX(Fonte + Texto, 1, 0, 0, 1, 1) = 0 then
        begin
          If RBIdioma.Checked then
            MessageDlg('Problemas na impressão do texto formatado.' + #10 + 'Possíveis causas: Impressora desligada, off-line ou sem papel', mtError, [mbOk], 0 )
          else
            MessageDlg('Problems in the impression of the formatted text.'  + #10 + ' Possible causes:  Off printer, off-line or without paper', mtError, [mbOk], 0 );
          exit;
        end;

        // negrito + condensado
        Fonte := 'Negrito + condensado' + chr(10);
        if FormataTX(Fonte + Texto, 1, 0, 0, 0, 1) = 0 then
        begin
          If RBIdioma.Checked then
            MessageDlg('Problemas na impressão do texto formatado.' + #10 + 'Possíveis causas: Impressora desligada, off-line ou sem papel', mtError, [mbOk], 0 )
          else
            MessageDlg('Problems in the impression of the formatted text.'  + #10 + ' Possible causes:  Off printer, off-line or without paper', mtError, [mbOk], 0 );
          exit;
        end;
   end;


{*******************************************************************************
================================================================================

 Imprime o Form com o Logo Bematech,usando o Driver de Spooler

================================================================================
*******************************************************************************}
procedure TForm1.BtnImprimirFiguraClick(Sender: TObject);
begin
  frmLogo.Form2.Print;
end;


{*******************************************************************************
================================================================================

 Imprime o Texto formatado com as fontes True Type, usando o Driver de Spooler

================================================================================
*******************************************************************************}
procedure TForm1.BtnImprimirTextoClick(Sender: TObject);
begin
   RichEdit1.Print( '' );
end;


{*******************************************************************************
================================================================================

 Comando para ligar o sensor de pouco papel

================================================================================
*******************************************************************************}
procedure TForm1.FindfileClick(Sender: TObject);
begin
  buffer  := Chr(27) + Chr(98) + Chr(0);
  comando := ComandoTx( buffer, 3);
  if comando = 0 then
  begin
    if RBIdioma.Checked then
       MessageDlg('Problemas na impressão do texto formatado.' + #10 + 'Possíveis causas: Impressora desligada, off-line ou sem papel', mtError, [mbOk], 0 )
    else
       MessageDlg('Problems in the impression of the formatted text.'  + #10 + ' Possible causes:  Off printer, off-line or without paper', mtError, [mbOk], 0 );
       exit;
    end;
end;


{*******************************************************************************
================================================================================

 Comando para ligar o sensor de pouco papel

================================================================================
*******************************************************************************}
procedure TForm1.Button4Click(Sender: TObject);
begin

  if ( button4.Caption = 'Ligar Sensor de Pouco Papel' ) or
     ( button4.Caption = 'Enable Low Paper Sensor' ) then
  begin
    buffer  := Chr(27) + Chr(98) + Chr(0);
    comando := ComandoTx( buffer, 3);
    if comando = 0 then
    begin
      If RBIdioma.Checked then
        MessageDlg('Problemas ao ligar o sensor de pouco papel.' + #10 + 'Possíveis causas: Impressora desligada, off-line ou sem papel', mtError, [mbOk], 0 )
      Else
        MessageDlg('Problems when binding the sensor of low paper.'  + #10 + ' Possible causes:  Off printer, off-line or without paper', mtError, [mbOk], 0 );
      exit;
    end;

    If RBIdioma.Checked Then
      button4.Caption := 'Desligar Sensor de Pouco Papel'
    Else
      button4.Caption := 'Disable Low Paper Sensor';

  end

  else // desligar o sensor de pouco papel
  begin
    // sequencia de comando para desligar o sensor de pouco papel
    buffer  := Chr(27) + Chr(98) + Chr(1);
    comando := ComandoTx( buffer, 3);
    if comando = 0 then
    begin
      If RBIdioma.Checked then
        MessageDlg('Problemas ao desligar o sensor de pouco papel.' + #10 + 'Possíveis causas: Impressora desligada, off-line ou sem papel', mtError, [mbOk], 0 )
      Else
        MessageDlg('Problems when the disconnect the sensor of low paper.'  + #10 + ' Possible causes:  Off printer, off-line or without paper', mtError, [mbOk], 0 );
      exit;
    end;

    If RBIdioma.Checked Then
      button4.Caption := 'Ligar Sensor de Pouco Papel'
    Else
      button4.Caption := 'Enable Low Paper Sensor'

  end;
end;


{*******************************************************************************
================================================================================

  Programa o tamanho do extrato longo

================================================================================
*******************************************************************************}
procedure TForm1.btnPrgramarExtratoClick(Sender: TObject);
begin
  comando := ConfiguraTamanhoExtrato( StrtoInt(Edit2.Text));
  if comando = 0 then
     if rbiDIOMA.Checked THEN
        MessageDlg('Problemas na programação do tamanho do extrato.' + #10 + 'Possíveis causas: Impressora desligada, off-line ou sem papel', mtError, [mbOk], 0 )
     else
        MessageDlg('Problems in the programming of the size of the extract..' + #10 + 'Possible causes:  Off printer, off-line or without paper', mtError, [mbOk], 0 );
end;


{*******************************************************************************
================================================================================

Habilita o extrato longo

================================================================================
*******************************************************************************}
procedure TForm1.btnHabilitaTamanhoExtratoClick(Sender: TObject);
begin
  if (btnHabilitaTamanhoExtrato.Caption = 'Habilitar') or (btnHabilitaTamanhoExtrato.Caption = 'Enable') then
  begin
     comando := HabilitaExtratoLongo(1);
     if comando = 0 then
        if RBIdioma.Checked then
           MessageDlg('Problemas na habilitação do extrato longo.' + #10 + 'Possíveis causas: Impressora desligada, off-line ou sem papel', mtError, [mbOk], 0 )
        else
           MessageDlg('Problems in the qualification of the long extract.' + #10 + 'Possíveis causas: Impressora desligada, off-line ou sem papel', mtError, [mbOk], 0 )
        else
        iF RBIdioma.Checked then
           btnHabilitaTamanhoExtrato.Caption := 'Desabilitar'
        else
           btnHabilitaTamanhoExtrato.Caption := 'Disable';
     end
     else
       begin
         // Desabilita o extrato longo
         comando := HabilitaExtratoLongo(0);
         if comando = 0 then
             if RBIdioma.Checked then
               MessageDlg('Problemas na desabilitação do extrato longo.' + #10 + 'Possíveis causas: Impressora desligada, off-line ou sem papel', mtError, [mbOk], 0 )
             else
               MessageDlg('Problems in the disable of the long extract.'  + #10 + ' Possible causes:  Off printer, off-line or without paper', mtError, [mbOk], 0 )

         else
           if RBIdioma.Checked then
             btnHabilitaTamanhoExtrato.Caption := 'Habilitar'
           else
             btnHabilitaTamanhoExtrato.Caption := 'Enable';
        end
end;


{*******************************************************************************
================================================================================

  Programa o tempo de espera para retração do papel caso o mesmo não seja
  retirado do bocal do presenter.

================================================================================
*******************************************************************************}
procedure TForm1.btnPrgramarPresenterClick(Sender: TObject);
begin
  comando := ProgramaPresenterRetratil( StrtoInt(Edit2.Text));
  if comando = 0 then
    if Idioma.Enabled then
      MessageDlg('Problemas na programação do presenter.' + #10 + 'Possíveis causas: Impressora desligada, off-line ou sem papel', mtError, [mbOk], 0 )
    else
      MessageDlg('Problems in the programming of presenter.'  + #10 + ' Possible causes:  Off printer, off-line or without paper', mtError, [mbOk], 0 );
end;


{*******************************************************************************
================================================================================

 Habilita o presenter retrátil

================================================================================
*******************************************************************************}
procedure TForm1.btnHabilitaPresenterClick(Sender: TObject);
begin
  if (btnHabilitaPresenter.Caption = '&Habilitar') or (btnHabilitaPresenter.Caption = 'Enable') then
     begin
        comando := HabilitaPresenterRetratil(1);
        if comando = 0 then
          if Idioma.Enabled then
            MessageDlg('Problemas na programação do presenter.' + #10 + 'Possíveis causas: Impressora desligada, off-line ou sem papel', mtError, [mbOk], 0 )
          else
            MessageDlg('Problems in the programming of presenter.'  + #10 + ' Possible causes:  Off printer, off-line or without paper', mtError, [mbOk], 0 )
        else
           if RBIdioma.Checked then
             btnHabilitaPresenter.Caption := 'D&esabilitar'
           else
             btnHabilitaPresenter.Caption := 'Disable';
     end

     else
       begin
         // Desabilita o presenter retrátil
         comando := HabilitaPresenterRetratil(0);
         if comando = 0 then
           if Idioma.Enabled then
             MessageDlg('Problemas na programação do presenter.' + #10 + 'Possíveis causas: Impressora desligada, off-line ou sem papel', mtError, [mbOk], 0 )
           else
             MessageDlg('Problems in the programming of presenter.'  + #10 + ' Possible causes:  Off printer, off-line or without paper', mtError, [mbOk], 0 )
         else
           if RBIdioma.Checked then
             btnHabilitaPresenter.Caption := '&Habilitar'
           else
             btnHabilitaPresenter.Caption := 'Enable';
        end
end;


procedure TForm1.RBIdiomaClick(Sender: TObject);
begin
  Traduz_Caption(true);
  form1.imgIcones.GetIcon(0, form1.icon);
end;

procedure TForm1.RadioButton2Click(Sender: TObject);
begin
  Traduz_Caption(false);
  form1.imgIcones.GetIcon(1, form1.icon);
end;

procedure TForm1.BtnFonteClick(Sender: TObject);
begin
  FontDialog1.Font.Assign(RichEdit1.Font);
  if FontDialog1.Execute then
    RichEdit1.Font := FontDialog1.Font;
  RichEdit1.SetFocus;
end;

procedure TForm1.CBImpressorasChange(Sender: TObject);
begin
  Printer.PrinterIndex := CBImpressoras.ItemIndex;
end;


//---------------------------------------------------------------//

Procedure TForm1.HabilitaFuncoesExtrato(Flag: boolean);
begin
  with Form1 do
  begin
    GroupBox3.Enabled := Flag;
    Label9.Enabled := Flag;
    Edit4.Enabled := Flag;
    btnHabilitaTamanhoExtrato.Enabled := Flag;
    btnPrgramarExtrato.Enabled := Flag;
  end;
end;

//---------------------------------------------------------------//

Procedure TForm1.HabilitaProgramacaoPresenter(Flag: boolean);
begin
  with Form1 do
  begin
    GroupBox4.Enabled := Flag;
    Label11.Enabled := Flag;
    Label3.Enabled := Flag;
    Edit2.Enabled := Flag;
    btnPrgramarPresenter.Enabled := Flag;
    btnHabilitaPresenter.Enabled := Flag;
  end;
end;
//---------------------------------------------------------------//

procedure TForm1.btnAutenticacaoClick(Sender: TObject);
begin
  // Autenticação de documentos (Validate Document)
    comando := AutenticaDoc(txtAutentica.Text, StrToInt(tempo.Text) * 1000 );
    if comando = 0 then
      if rbiDIOMA.Checked THEN
        MessageDlg('Problemas na autenticação do documento.' + #10 + 'Possíveis causas: Documento não inserido, impressora desligada, off-line ou sem papel', mtError, [mbOk], 0 )
      else
        MessageDlg('Problems in the authentication of the document' + #10 + 'Possible causes: Not inserted document, off printer, off-line or without paper', mtError, [mbOk], 0 )

   else if comando = -1 then
      if rbiDIOMA.Checked THEN
        MessageDlg('Tempo maior que o permitido.', mtError, [mbOk], 0 )
      else
        MessageDlg('Bigger time that the allowed.', mtError, [mbOk], 0 );

end;

procedure TForm1.btnVerificaDocInseridoClick(Sender: TObject);
begin
  // Verifica se há papel posicionado para a autenticação
    comando := DocumentInserted();
    if comando = 1 then
      if rbiDIOMA.Checked THEN
        MessageDlg('Documento inserido.', mtInformation, [mbOk], 0 )
      else
        MessageDlg('Inserted document', mtInformation, [mbOk], 0 )

   else
      if rbiDIOMA.Checked THEN
        MessageDlg('Documento não inserido.', mtInformation, [mbOk], 0 )
      else
        MessageDlg('Not inserted document.', mtInformation, [mbOk], 0 );

end;

procedure TForm1.btnVerificarPapelPresenterClick(Sender: TObject);
begin
  // Acionamento da guilhotina (cortar o papel)
  comando := VerificaPapelPresenter();
  case comando of
    -1 :
      If RBIdioma.Checked then
        MessageDlg('Erro de execução da função.', mtError, [mbOk], 0 )
      else
        MessageDlg('Error of execution of the function.', mtError, [mbOk], 0 );

     0 :
      If RBIdioma.Checked then
        MessageDlg('Problemas da verificação do papel no presenter.' + #10 + 'Possíveis causas: Impressora desligada, off-line ou sem papel.', mtError, [mbOk], 0 )
      else
        MessageDlg('problems in the verification of the paper in presenter.' + #10 + 'Possible causes:  Off printer, off-line or without paper.', mtError, [mbOk], 0 );

     1 :
      If RBIdioma.Checked then
        MessageDlg('Papel posicionado no presenter.', mtInformation, [mbOk], 0 )
      else
        MessageDlg('Paper located in presenter.', mtInformation, [mbOk], 0 );


     2 :
      If RBIdioma.Checked then
        MessageDlg('Papel não posicionado no presenter.', mtInformation, [mbOk], 0 )
      else
        MessageDlg('Paper not located in presenter.', mtInformation, [mbOk], 0 );

     3 :
      If RBIdioma.Checked then
        MessageDlg('Erro desconhecido.', mtError, [mbOk], 0 )
      else
        MessageDlg('Unknown error.', mtError, [mbOk], 0 );

  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
  RBIdioma.OnClick(self);
  RBIdioma.Checked := true;
end;

procedure TForm1.PageControl1Change(Sender: TObject);
begin
  IF TabSheet2.Visible then
  Begin
    groupbox6.Enabled := False;
    groupbox7.Enabled := False;
    combobox1.Enabled := False;
    comboModeloImpressora.Enabled := False;
  End
  Else
  Begin
    groupbox6.Enabled := True;
    groupbox7.Enabled := True;
    combobox1.Enabled := True;
    comboModeloImpressora.Enabled := True;
  End
end;

procedure TForm1.BtnCorteParcialClick(Sender: TObject);
begin
  comando := AcionaGuilhotina(0);  // modo total (Parcial cut)
  if comando <> 1 then
    if RBIdioma.Checked then
      MessageDlg('Problemas no corte do papel..' + #10 + 'Possíveis causas: Impressora desligada, off-line ou sem papel', mtError, [mbOk], 0 )
    else
      MessageDlg('Problems in the cut of the paper.'  + #10 + ' Possible causes:  Off printer, off-line or without paper', mtError, [mbOk], 0 );
end;

procedure TForm1.CBSelectCodigoChange(Sender: TObject);
begin
  MedCodigo.Text := '';
  Case CBSelectCodigo.ItemIndex of
    0 : BEGIN
          MEDCodigo.EditMask := '0000000';  // EAN8
          MEDCodigo.Text := '1234567'
        END;

    1 : BEGIN
          MEDCodigo.EditMask := '000000000000'; //EAN13
          MEDCodigo.Text := '123456789012'
        END;

    2 : BEGIN //CODE39
          iF RBFina.Checked then // Barras Finas
          Begin
            MedCodigo.EditMask := 'CCCCCCCCCCCCCCC';
            MEDCodigo.Text := 'ABC-123';
          End
          Else
            IF RBMedia.Checked then  // Barras Medias
            Begin
              MedCodigo.EditMask := 'CCCCCCCCC';
              MEDCodigo.Text := 'ABC-12345';
            End
            Else // Barras Grossas
            Begin
              MedCodigo.EditMask := 'CCCCCC';
              MEDCodigo.Text := 'AB-123';
            End;
        END;

    3 : BEGIN //CODE 93
          iF RBFina.Checked then
          Begin
            MedCodigo.EditMask := 'CCCCCCCCCCCCCCC';
            MEDCodigo.Text := 'ABC-123';
          End
          Else
            IF RBMedia.Checked then
            Begin
              MedCodigo.EditMask := 'CCCCCCCCC';
              MEDCodigo.Text := 'ABC-123';
            end
            Else
            Begin
              MedCodigo.EditMask := 'CCCCCC';
              MEDCodigo.Text := 'ABC-12';
            End
        END;

    4 : BEGIN // CODE 128
          iF RBFina.Checked then
          Begin
            MedCodigo.EditMask := 'ccccccccccccccccccccccccccccccccccccccccccccccc;0;_';
            MEDCodigo.Text := 'Bematech';
          End
          Else
            IF RBMedia.Checked then
            Begin
              MedCodigo.EditMask := 'cccccccccccccccccccccccccccc;0;_';
              MedCodigo.Text := '';
              MEDCodigo.Text := 'Bematech';
            End
            Else
            Begin
              MedCodigo.EditMask := 'cccccccccccccccc;0;_';
              MEDCodigo.Text := 'Bematech';
            End;
        END;

    5 : BEGIN
          MedCodigo.EditMask := ''; // PDF 417
          MEDCodigo.Text := 'Bematech. Sempre presente nas melhores soluções.!!!';
        END;

    6 : BEGIN
          MedCodigo.EditMask := '00000000000'; // UPCA
          MEDCodigo.Text := '12345678901';
        END;

    7 : BEGIN
          MedCodigo.EditMask := '000000'; //UPCE
          MEDCodigo.Text := '123456';
        END;

    8 : BEGIN // ITF
          If RBFina.Checked then
          Begin
            MedCodigo.EditMask := '999999999999999999999999999999;0;';
            MEDCodigo.Text :=   '0123456789012345';
          End
          Else
            IF RBMedia.Checked then
            Begin
              MedCodigo.EditMask := '99999999999999999999;0;';
              MEDCodigo.Text :=  '0123456789012345';
            End
            Else
            Begin
              MedCodigo.EditMask := '99999999999999;0;';
              MEDCodigo.Text := '01234567890125';
            End;
        END;

    9 : BEGIN // MSI
          iF RBFina.Checked then
          Begin
            MedCodigo.EditMask := '9999999999999999;0;';
            MEDCodigo.Text :=     '123';
          End
          Else
            IF RBMedia.Checked then
            Begin
              MedCodigo.EditMask := '9999999999;0;';
              MEDCodigo.Text :=     '123';
            End
            Else
            Begin
              MedCodigo.EditMask := '9999999;0;';
              MEDCodigo.Text :=     '123';
            End;
        END;

    10 : BEGIN // ISBN
//         MedCodigo.EditMask := '0-00000-000-C 99999' ;
           MedCodigo.EditMask := '';
           MEDCodigo.Text :=     '1-56592-292-X 90000';
         END;

    11 : BEGIN // PLESSEY
          iF RBFina.Checked then
          Begin
            MedCodigo.EditMask := 'aaaaaaaaaaaaa;0;';
            MEDCodigo.Text :=     '123ABC';
          End
          Else
            IF RBMedia.Checked then
            Begin
              MedCodigo.EditMask := 'aaaaaaa;0;';
              MEDCodigo.Text :=     '123ABC';
            End
            Else
            Begin
              MedCodigo.EditMask := 'aaaa;0;';
              MEDCodigo.Text :=     '123B';
            End
        END;

    12 : BEGIN // CODABAR
          iF RBFina.Checked then
          Begin
            MedCodigo.EditMask := 'cccccccccccccccccccc;0;';
            MEDCodigo.Text :=     '123-456/001';
          End
          Else
            IF RBMedia.Checked then
            Begin
              MedCodigo.EditMask := 'ccccccccccc;0;';
              MEDCodigo.Text :=     '123-456/001';
            End
            Else
            Begin
              MedCodigo.EditMask := 'cccccccc;0;';
              MEDCodigo.Text :=     '123-4567';
            End
        END;

  end;

end;

procedure TForm1.RBFinaClick(Sender: TObject);
begin
  CBSelectCodigo.onchange(self);
end;

procedure TForm1.RBMediaClick(Sender: TObject);
begin
  CBSelectCodigo.onchange(self);
end;

procedure TForm1.RbGrossaClick(Sender: TObject);
begin
  CBSelectCodigo.onchange(self);
end;

procedure TForm1.BtnImprimirCodigoClick(Sender: TObject);
var Largura, PosicaoCaracter, Fonte : integer;
begin
{==== LARGURA DA LINHA ====}
  If RBFina.Checked then
    Largura := 0
  Else
    If RBMedia.Checked then
      Largura := 1
    Else
      Largura := 2;
      
  If CBSelectCodigo.ItemIndex = 1 then
    Largura := 1;

{==== POSIÇÃO DO CARACTER ====}
  If RBAcima.Checked then
    PosicaoCaracter := 1
  Else
    IF RBAbaixo.Checked then
      PosicaoCaracter := 2
    Else
      IF RBAcimaAbaixo.Checked then
        PosicaoCaracter := 3
      Else
        PosicaoCaracter := 0;

{==== FONTE ==}
  If RBFonteNormal.checked then
    Fonte := 0
  Else
    Fonte := 1;
  ConfiguraCodigoBarras(162, Largura, PosicaoCaracter,Fonte,0);
  Case CBSelectCodigo.ItemIndex of
    0: Retorno := ImprimeCodigoBarrasEAN8(MEdCodigo.Text);
    1: Retorno := ImprimeCodigoBarrasEAN13(MEdCodigo.Text);
    2: Retorno := ImprimeCodigoBarrasCODE39(MEdCodigo.Text);
    3: Retorno := ImprimeCodigoBarrasCODE93(MEdCodigo.Text);
    4: Retorno := ImprimeCodigoBarrasCODE128(MEdCodigo.Text);
    5: Retorno := ImprimeCodigoBarrasPDF417(4,3,2,1,MedCodigo.Text);
    6: Retorno := ImprimeCodigoBarrasUPCA(MEdCodigo.Text);
    7: Retorno := ImprimeCodigoBarrasUPCE(MEdCodigo.Text);
    8: Retorno := ImprimeCodigoBarrasITF(MEdCodigo.Text);
    9: Retorno := ImprimeCodigoBarrasMSI(MEdCodigo.Text);
    10: Retorno := ImprimeCodigoBarrasISBN(MEdCodigo.Text);
    11: Retorno := ImprimeCodigoBarrasPLESSEY(MEdCodigo.Text);
    12: Retorno := ImprimeCodigoBarrasCODABAR(MEdCodigo.Text);
  End;
end;

procedure TForm1.findFileBtnClick(Sender: TObject);
var
ret : boolean ;
temp : string;

begin

  ret := OpenDialogFind.Execute;
  FileName.Text := OpenDialogFind.FileName;
  temp := copy(FileName.Text,Length(filename.text) - 2, 3 );
  temp := uppercase(temp);

  if  temp <> 'BMP' then
  begin
    filename.text := '';
    exit;
  end;


  BmpImage.Picture.LoadFromFile(FileName.Text);
  




end;

procedure TForm1.TabSheet3Show(Sender: TObject);
begin
//  ComboBoxBitola.ItemIndex := 0;
//  ComboBoxAlgo.ItemIndex := 0;

end;

procedure TForm1.HeighEditKeyPress(Sender: TObject; var Key: Char);
begin
 if not (Key in [ '0' .. '9' ] ) then
  key := #0;





end;

procedure TForm1.PrintNormalClick(Sender: TObject);
var
  mode : integer;
  ret  : integer;
  init : integer;
  fim  : integer;
  msg  : string;


begin
    if fileName.Text = '' then
      exit;

    mode := 0;

    if RadioButtonPaisagem.Checked then
      mode := 1;

    try
      Screen.Cursor := crHourGlass;
      ret  := ImprimeBitmap(filename.text,mode);
      msg := Chr(13) + Chr(10) + Chr(13) + Chr(10) + Chr(13) + Chr(10) + Chr(13) + Chr(10);
      ComandoTX(msg,length(msg));
      AcionaGuilhotina(1);
    finally
      Screen.Cursor := crDefault;
    end;
end;

procedure TForm1.ComboBoxBitolaChange(Sender: TObject);
var
  bitola : integer;
  ret     : integer;

begin
  bitola := 48    ;

  Case ComboBoxBitola.ItemIndex of
  0: bitola := 48;
  1: bitola := 58;
  2: bitola := 76;
  3: bitola := 80;
  4: bitola := 112;
  end;

  ret :=  AjustaLarguraPapel(bitola);


end;

procedure TForm1.ComboBoxAlgoChange(Sender: TObject);
var

  ret       : integer;

begin

  ret := SelectDithering(ComboBoxAlgo.ItemIndex);

end;

procedure TForm1.PrintSpecialBtnClick(Sender: TObject);
var
  ret, bmpheight, bmpWidth, rotate : integer;




begin

  if HeighEdit.text = '' then
    bmpheight := 0
  else
    bmpheight := StrtoInt(HeighEdit.Text);

  if WidthEdit.text = '' then
    bmpWidth := 0
  else
    bmpWidth  := strtoint (WidthEdit.text);

  if Degrees.text = '' then
    rotate := 0
  else
    rotate    := strtoint (Degrees.text );



  if   CheckBoxFitOnPage.Checked then
  begin
      bmpheight := -1;
      bmpWidth := -1;
  end;

  try
    Screen.Cursor := crHourGlass;
    ret :=  ImprimeBmpEspecial(FileName.Text,bmpheight,bmpWidth,rotate);
    Sleep(3000);
    AcionaGuilhotina(1);
  finally
      Screen.Cursor := crDefault;  
  end;



end;

procedure TForm1.CheckBoxFitOnPageClick(Sender: TObject);
begin

  if HeighEdit.Enabled = true then
  begin
    HeighEdit.Enabled := false;
    HeighEdit.Color := clInactiveCaption;
    WidthEdit.enabled := false;
    WidthEdit.Color := clInactiveCaption;

  end
  else
  begin
    HeighEdit.Enabled := true;
    HeighEdit.Color := clWindow;
    WidthEdit.enabled := true;
    WidthEdit.Color := clWindow;
  end;

end;

end.  //Fim do programa




