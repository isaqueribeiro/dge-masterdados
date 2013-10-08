unit UDMBusiness;

interface

uses
  Windows, Forms, SysUtils, Classes, IBDatabase, DB, IBCustomDataSet, IniFIles,
  ShellApi, Printers, DateUtils, IBQuery, RpDefine, RpRave,
  frxClass, frxDBSet, EMsgDlg, IdBaseComponent, IdComponent, IdIPWatch, IBStoredProc,
  FuncoesFormulario, UConstantesDGE, IBUpdateSQL, EUserAcs;

type
  TUsuarioLogado = record
    Codigo : Integer;
    Nome   : String;
    Funcao : Integer;
    Empresa: String;
  end;

  TContaEmail = record
    Conta : String;
    Senha : String;
    Servidor_POP    : String;
    Servidor_SMTP   : String;
    Porta_SMTP      : Integer;
    Assunto_Padrao    : String;
    Mensagem_Padrao   : String;
    Assinatura_Padrao : String;
    RequerAutenticacao : Boolean;
    ConexaoSeguraSSL   : Boolean;
  end;

  TTipoMovimentoCaixa = (tmcxCredito, tmcxDebito);
  TDMBusiness = class(TDataModule)
    ibdtbsBusiness: TIBDatabase;
    ibtrnsctnBusiness: TIBTransaction;
    dtsrcAjustEstoq: TDataSource;
    ibdtstAjustEstoq: TIBDataSet;
    ibdtstProduto: TIBDataSet;
    ibdtstFornec: TIBDataSet;
    ibdtstAjustEstoqCODPROD: TIBStringField;
    ibdtstAjustEstoqCODFORN: TIntegerField;
    ibdtstAjustEstoqQTDEATUAL: TIntegerField;
    ibdtstAjustEstoqQTDENOVA: TIntegerField;
    ibdtstAjustEstoqQTDEFINAL: TIntegerField;
    ibdtstAjustEstoqMOTIVO: TIBStringField;
    ibdtstAjustEstoqDOC: TIBStringField;
    ibdtstAjustEstoqDTAJUST: TDateTimeField;
    ibdtstAjustEstoqLookProdNome: TStringField;
    ibdtstAjustEstoqLookProdQtde: TIntegerField;
    ibdtstAjustEstoqLookFornec: TStringField;
    qryBusca: TIBQuery;
    ibdtstUsers: TIBDataSet;
    ibdtstUsersNOME: TIBStringField;
    ibdtstUsersSENHA: TIBStringField;
    ibdtstUsersNOMECOMPLETO: TIBStringField;
    ibdtstUsersCODFUNCAO: TSmallintField;
    EvMsgDialog: TEvMsgDlg;
    dtsrcUsers: TDataSource;
    ibdtstUsersLIMIDESC: TIBBCDField;
    raveReport: TRvProject;
    IdIPWatch: TIdIPWatch;
    qryCaixaAberto: TIBDataSet;
    qryCaixaAbertoANO: TSmallintField;
    qryCaixaAbertoNUMERO: TIntegerField;
    qryCaixaAbertoUSUARIO: TIBStringField;
    qryCaixaAbertoDATA_ABERTURA: TDateField;
    qryCaixaAbertoVALOR_TOTAL_CREDITO: TIBBCDField;
    qryCaixaAbertoVALOR_TOTAL_DEBITO: TIBBCDField;
    stpCaixaMovimentoREC: TIBStoredProc;
    stpCaixaMovimentoPAG: TIBStoredProc;
    stpContaCorrenteSaldo: TIBStoredProc;
    qryCaixaAbertoCONTA_CORRENTE: TIntegerField;
    stpCaixaMovimentoREC_ESTORNO: TIBStoredProc;
    stpCaixaMovimentoPAG_ESTORNO: TIBStoredProc;
    qryEvAcessUser: TIBDataSet;
    updEvAcessUser: TIBUpdateSQL;
    qryEvAcessUserFORM_NAME: TIBStringField;
    qryEvAcessUserOBJECT_NAME: TIBStringField;
    qryEvAcessUserCONSENTS_STRING: TMemoField;
    ibqryEmpresa: TIBQuery;
    ibqryEmpresaCNPJ: TIBStringField;
    ibqryEmpresaNMFANT: TIBStringField;
    qryConfiguracoes: TIBQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMBusiness: TDMBusiness;

  FileINI : TIniFile;
  FormFunction : TFormularios;

  gContaEmail : TContaEmail;


  function IfThen(AValue: Boolean; const ATrue: string; AFalse: string = ''): string; overload;
  function IfThen(AValue: Boolean; const ATrue: TDateTime; AFalse: TDateTime = 0): TDateTime; overload;
  function NetWorkActive(const Alertar : Boolean = FALSE) : Boolean;

  procedure ShowInformation(sTitle, sMsg : String); overload;
  procedure ShowInformation(sMsg : String); overload;
  procedure ShowWarning(sMsg : String);
  procedure ShowStop(sMsg : String);
  procedure ShowError(sMsg : String);
  procedure UpdateSequence(GeneratorName, NomeTabela, CampoChave : String; const sWhr : String = '');
  procedure CommitTransaction;

  procedure Desativar_Promocoes;
  procedure GerarSaldoContaCorrente(const ContaCorrente : Integer; const Data : TDateTime);
  procedure BloquearClientes;
  procedure DesbloquearCliente(CNPJ : String; const Motivo : String = '');
  procedure BloquearCliente(CNPJ : String; const Motivo : String = '');
  procedure RegistrarSegmentos(Codigo : Integer; Descricao : String);
  procedure RegistrarControleAcesso(const AOnwer : TComponent; const EvUserAcesso : TEvUserAccess);
  procedure CarregarConfiguracoesEmpresa(CNPJ : String; Mensagem : String);
  procedure SetEmpresaIDDefault(CNPJ : String);

  function DelphiIsRunning : Boolean;
  function ShowConfirm(sMsg : String; const sTitle : String = ''; const DefaultButton : Integer = MB_DEFBUTTON2) : Boolean;
  function GetPaisIDDefault : String;
  function GetEstadoIDDefault : Integer;
  function GetCidadeIDDefault : Integer;
  function GetCfopIDDefault : Integer;
  function GetEmpresaIDDefault : String;
  function GetClienteIDDefault : String;
  function GetVendedorIDDefault : Integer;
  function GetFormaPagtoIDDefault : Integer;
  function GetCondicaoPagtoIDDefault : Integer;
  function GetEmitirBoleto : Boolean;
  function GetCondicaoPagtoIDBoleto : Integer;
  function GetEmitirCupom : Boolean;
  function GetModeloEmissaoCupom : Integer;
  function GetSegmentoID(const CNPJ : String) : Integer;
  function GetControleAcesso(const AOnwer : TComponent; const EvUserAcesso : TEvUserAccess) : Boolean;
  function GetEmailEmpresa(const sCNPJEmpresa : String) : String;

  function StrIsCNPJ(const Num: string): Boolean;
  function StrIsCPF(const Num: string): Boolean;
  function StrIsDateTime(const S: string): Boolean;
  function StrFormatarCnpj(sCnpj: String): String;
  function StrFormatarCpf(sCpf: String): String;
  function StrFormatarCEP(sCEP: String): String;
  function StrFormatarFONE(sFone: String): String;
  function StrDescricaoProduto : String;
  function StrOnlyNumbers(const Str : String) : String;

  function GetGeneratorID(const GeneratorName : String) : Integer;
  function GetNextID(NomeTabela, CampoChave : String; const sWhere : String = '') : Largeint;
  function GetPaisNomeDefault : String;
  function GetEstadoNomeDefault : String;
  function GetEstadoNome(const iEstado : Integer) : String; overload;
  function GetEstadoNome(const sSigla : String) : String; overload;
  function GetEstadoID(const sSigla : String) : Integer;
  function GetCidadeNomeDefault : String;
  function GetCidadeNome(const iCidade : Integer) : String;
  function GetCidadeID(const iEstado : Integer; const sNome : String) : Integer; overload;
  function GetCidadeID(const sCEP : String) : Integer; overload;
  function GetCfopNomeDefault : String;
  function GetEmpresaNomeDefault : String;
  function GetClienteNomeDefault : String;
  function GetVendedorNomeDefault : String;
  function GetFormaPagtoNomeDefault : String;
  function GetCondicaoPagtoNomeDefault : String;
  function GetSenhaAutorizacao : String;
  function GetDateTimeDB : TDateTime;
  function GetDateDB : TDateTime;
  function GetProximoDiaUtil(const Data : TDateTime) : TDateTime;
  function GetTimeDB : TDateTime;
  function GetUserApp : String;
  function GetUserFunctionID : Integer;
  function GetLimiteDescontoUser : Currency;
  function GetSolicitaDHSaidaNFe(const sCNPJEmitente : String) : Boolean;
  function GetImprimirCodClienteNFe(const sCNPJEmitente : String) : Boolean;
  function CaixaAberto(const Usuario : String; const Data : TDateTime; const FormaPagto : Smallint; var CxAno, CxNumero, CxContaCorrente : Integer) : Boolean;
  function SetMovimentoCaixa(const Usuario : String; const Data : TDateTime; const FormaPagto : Smallint;
    const AnoLancamento, NumLancamento, SeqPagto : Integer; const Valor : Currency; const TipoMov : TTipoMovimentoCaixa) : Boolean;
  function SetMovimentoCaixaEstorno(const Usuario : String; const Data : TDateTime; const FormaPagto : Smallint;
    const AnoLancamento, NumLancamento, SeqPagto : Integer; const Valor : Currency; const TipoMov : TTipoMovimentoCaixa) : Boolean;

const
  DB_USER_NAME     = 'SYSDBA';
  DB_USER_PASSWORD = 'masterkey';
  DB_LC_CTYPE      = 'ISO8859_2';

  FUNCTION_USER_ID_DIRETORIA   =  1;
  FUNCTION_USER_ID_GERENTE_ADM =  5;
  FUNCTION_USER_ID_GERENTE_VND =  2;
  FUNCTION_USER_ID_GERENTE_FIN =  3;
  FUNCTION_USER_ID_SUPERV_CX   =  9;
  FUNCTION_USER_ID_ESTOQUISTA  = 10;
  FUNCTION_USER_ID_CAIXA       =  6;
  FUNCTION_USER_ID_VENDEDOR    =  4;
  FUNCTION_USER_ID_AUX_FINANC1 =  7;
  FUNCTION_USER_ID_AUX_FINANC2 =  8;
  FUNCTION_USER_ID_SUPORTE_TI  = 11;
  FUNCTION_USER_ID_SYSTEM_ADM  = 12;

  BOLETO_ARQUIVO_LOGOTIPO = 'Imagens\Emitente.gif'; //gif
  BOLETO_IMAGENS          = 'Imagens\';
  BOLETO_LICENCAS         = 'Licencas\';

  STATUS_VND_AND = 1;
  STATUS_VND_ABR = 2;
  STATUS_VND_FIN = 3;
  STATUS_VND_NFE = 4;
  STATUS_VND_CAN = 5;

  STATUS_CMP_ABR = 1;
  STATUS_CMP_FIN = 2;
  STATUS_CMP_CAN = 3;
  STATUS_CMP_NFE = 4;

  // Mensagens padrões do sistema
  CLIENTE_BLOQUEADO_PORDEBITO = 'Cliente bloqueado, automaticamente, pelo sistema por se encontrar com títulos vencidos. Favor buscar mais informações junto ao FINANCEIRO.';

implementation

{$R *.dfm}

function IfThen(AValue: Boolean; const ATrue: string;
  AFalse: string = ''): string;
begin
  if AValue then
    Result := ATrue
  else
    Result := AFalse;
end;

function IfThen(AValue: Boolean; const ATrue: TDateTime; AFalse: TDateTime = 0): TDateTime; 
begin
  if AValue then
    Result := ATrue
  else
    Result := AFalse;
end;

function NetWorkActive(const Alertar : Boolean = FALSE) : Boolean;
var
  Enviar    ,
  Return    : Boolean;
  sFileName : String;
  Registro  : TStringList;

  sCNPJ     ,
  sRazao    ,
  sFantasia ,
  sTelefone ,
  sSistema  ,
  sHostID   ,
  sHostName : String;
const
  sLocalHost : String = '127.0.0.1';
begin
  Return   := False;

  Registro := TStringList.Create;
  try

    try
(*
      if ( IdIP = nil ) then
        IdIP  := TIdIPWatch.Create(Application);

      if ( IdFTP = nil ) then
        IdFTP := TIdFTP.Create(Application);
*)
      sSistema  := StringReplace( ExtractFileName(ParamStr(0)), '.exe', '', [rfReplaceAll] );
      sFileName := ExtractFilePath(ParamStr(0)) + 'NetWorkActive' + sSistema + '.dll';

      Return := FileExists( sFileName );
      Enviar := not Return;

      // Abrir arquivo para verificar a data
      if ( Return ) then
      begin
        Registro.LoadFromFile( sFileName );
        Return := ( FormatDateTime('dd/mm/yyyy', Date) = Trim(Registro.Strings[0]) );
        if ( not Return ) then
        begin
          DeleteFile( sFileName );
          Enviar := True;
        end;
      end;

      // --- Conectar ao servidor para registrar cliente (INICIO)
      if ( not Return ) then
      begin
(*        sHostID   := IdIP.LocalIP;
        sHostName := IdIP.LocalName;
*)
        Registro.Clear;
        Registro.BeginUpdate;
        Registro.Add( FormatDateTime('dd/mm/yyyy', Date) );
        Registro.Add( sHostID );
        Registro.Add( sHostName );
        Registro.Add( sSistema );

        with DMBusiness, qryBusca do
        begin
          Close;
          SQL.Clear;
          SQL.Add('Select * from TBEMPRESA');
          Open;

          while not Eof do
          begin
            sCNPJ     := Trim( FieldByName('CNPJ').AsString );
            sRazao    := Trim( FieldByName('RZSOC').AsString );
            sFantasia := Trim( FieldByName('NMFANT').AsString );
            sTelefone := Trim( FieldByName('FONE').AsString );

            Registro.Add( '-- CLIENTE --' );
            Registro.Add( 'CNPJ     : ' + sCNPJ );
            Registro.Add( 'Razão    : ' + sRazao );
            Registro.Add( 'Fantasia : ' + sFantasia );
            Registro.Add( 'Fone     : ' + sTelefone );
            Registro.Add( '--' );

            Next;
          end;

          Close;

          Return := True;
        end;

        Registro.EndUpdate;
        Registro.SaveToFile( sFileName );

      end;

      if ( Return and Enviar ) then
      begin

        // Enviando dados para o FTP MasterDados
        try

          try
//            IdFTP.Username := 'masterdados';
//            IdFTP.Password := 'masterdados';
//            IdFTP.Host     := 'ftp.masterdados.com.br';
//            IdFTP.Connect;
//
//            IdFTP.ChangeDir('/client_license');
//            IdFTP.Put(sFileName, Trim(sHostName) + '_' + Trim(sCNPJ) + '.txt');

            Return := True;
          except
//            Return := False;
          end;

        finally
//          IdFTP.Disconnect;
        end;

      end;
      // --- Conectar ao servidor para registrar cliente (FINAL)

      if ( Alertar and (not Return) ) then
        if ( sHostID =  sLocalHost ) then
          Application.MessageBox('Não foi possível conectar a Internet para validação de recursos visto que a máquina não está em rede.', 'Alerta', MB_ICONEXCLAMATION)
        else
          Application.MessageBox('Não foi possível conectar a Internet para validação de recursos.', 'Alerta', MB_ICONEXCLAMATION);

    except
      Return := False;
    end;

  finally
    Registro.Free;

    Result := Return;
  end;
end;

procedure ShowInformation(sTitle, sMsg : String);
begin
  Application.MessageBox(PChar(sMsg), PChar(sTitle), MB_ICONINFORMATION);
end;

procedure ShowInformation(sMsg : String);
begin
  Application.MessageBox(PChar(sMsg), 'Informação', MB_ICONINFORMATION);
end;

procedure ShowWarning(sMsg : String);
begin
  Application.MessageBox(PChar(sMsg), 'Alerta', MB_ICONWARNING);
end;

procedure ShowStop(sMsg : String);
begin
  Application.MessageBox(PChar(sMsg), 'Pare!', MB_ICONSTOP);
end;

procedure ShowError(sMsg : String);
begin
  Application.MessageBox(PChar(sMsg), 'Erro', MB_ICONERROR);
end;

procedure UpdateSequence(GeneratorName, NomeTabela, CampoChave : String; const sWhr : String = '');
var
  ID : Largeint;
begin
  with DMBusiness, qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select max(' + CampoChave + ') as ID from ' + NomeTabela + ' ' + sWhr);
    Open;

    ID := FieldByName('ID').AsInteger;

    Close;
    SQL.Clear;
    SQL.Add('ALTER SEQUENCE ' + GeneratorName + ' RESTART WITH ' + IntToStr(ID));
    ExecSQL;

    CommitTransaction;
  end;
end;

procedure CommitTransaction;
begin
  with DMBusiness do
  begin
    ibtrnsctnBusiness.CommitRetaining;
  end;
end;

procedure Desativar_Promocoes;
begin
  with DMBusiness, qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Update TBPROMOCAO Set Ativa = 0');
    SQL.Add('where (Ativa = 1) and ((Data_inicio > Current_date) or (Data_final < Current_date))');
    ExecSQL;

    CommitTransaction;
  end;
end;

procedure GerarSaldoContaCorrente(const ContaCorrente : Integer; const Data : TDateTime);
begin
  try

    try

      with DMBusiness, stpContaCorrenteSaldo do
      begin
        ParamByName('CONTA_CORRENTE').AsInteger  := ContaCorrente;
        ParamByName('DATA_MOVIMENTO').AsDateTime := Data;

        ExecProc;
        CommitTransaction;
      end;

    except
      On E : Exception do
      begin
        DMBusiness.ibtrnsctnBusiness.Rollback;
        ShowError('Erro ao tentar atualizar saldo diário de conta corrente.' + #13#13 + E.Message);
      end;
    end;

  finally
  end;
end;

procedure BloquearClientes;
begin
  with DMBusiness, qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Update TBCLIENTE Set Dtcad = coalesce(Dtcad, Current_date), Bloqueado = 1, Bloqueado_data = Current_date, Bloqueado_usuario = user,');
    SQL.Add('  Usuario = user, Desbloqueado_data = null, Bloqueado_motivo = ' + QuotedStr(CLIENTE_BLOQUEADO_PORDEBITO));
    SQL.Add('where Bloqueado = 0');
    SQL.Add('  and ((Desbloqueado_data is null) or (Desbloqueado_data <> Current_date))');
    SQL.Add('  and Cnpj in (');
    SQL.Add('    Select Distinct');
    SQL.Add('      r.Cnpj');
    SQL.Add('    from TBCONTREC r');
    SQL.Add('    where r.Parcela > 0');
    SQL.Add('      and r.Situacao = 1');
    SQL.Add('      and r.Dtvenc < Current_date');
    SQL.Add('      and r.Baixado = 0');
    SQL.Add('      and r.Cnpj <> ' + QuotedStr('99999999999999')); // CONSUMIDOR FINAL
    SQL.Add('  )');
    ExecSQL;

    CommitTransaction;
  end;
end;

procedure DesbloquearCliente(CNPJ : String; const Motivo : String = '');
begin
  with DMBusiness, qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Update TBCLIENTE Set Dtcad = coalesce(Dtcad, Current_date), Desbloqueado_data = Current_date, Bloqueado = 0, Bloqueado_data = Null, Bloqueado_usuario = Null,');
    SQL.Add('  Usuario = ' + QuotedStr(GetUserApp) + ',');

    if Trim(Motivo) = EmptyStr then
      SQL.Add('  Bloqueado_motivo = Null')
    else
      SQL.Add('  Bloqueado_motivo = ' + QuotedStr(Trim(Motivo)));

    SQL.Add('where Cnpj = ' + QuotedStr(CNPJ));
    ExecSQL;

    CommitTransaction;
  end;
end;

procedure BloquearCliente(CNPJ : String; const Motivo : String = '');
begin
  with DMBusiness, qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Update TBCLIENTE Set Dtcad = coalesce(Dtcad, Current_date), Desbloqueado_data = Null, Bloqueado = 1, Bloqueado_data = Current_date, Bloqueado_usuario = ' + QuotedStr(GetUserApp) + ',');
    SQL.Add('  Usuario = ' + QuotedStr(GetUserApp) + ',');

    if Trim(Motivo) = EmptyStr then
      SQL.Add('  Bloqueado_motivo = Null')
    else
      SQL.Add('  Bloqueado_motivo = ' + QuotedStr(Trim(Motivo)));

    SQL.Add('where Cnpj = ' + QuotedStr(CNPJ));
    ExecSQL;

    CommitTransaction;
  end;
end;

procedure RegistrarSegmentos(Codigo : Integer; Descricao : String);
begin
  with DMBusiness, qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Execute Procedure SET_SEGMENTO(' + IntToStr(Codigo) + ', ' + QuotedStr(Trim(Descricao)) + ')');
    ExecSQL;

    CommitTransaction;
  end;
end;

procedure RegistrarControleAcesso(const AOnwer : TComponent; const EvUserAcesso : TEvUserAccess);
begin
  with DMBusiness, qryEvAcessUser do
  begin
    Close;
    ParamByName('formulario').AsString := TForm(AOnwer).Name;
    ParamByName('objeto').AsString     := EvUserAcesso.Name;
    Open;

    if IsEmpty then
    begin
      Append;
      qryEvAcessUserFORM_NAME.AsString       := TForm(AOnwer).Name;
      qryEvAcessUserOBJECT_NAME.AsString     := EvUserAcesso.Name;
      qryEvAcessUserCONSENTS_STRING.AsString := EvUserAcesso.Consents.Text;
      Post;
      ApplyUpdates;
    end;

    CommitTransaction;
  end;
end;

procedure CarregarConfiguracoesEmpresa(CNPJ : String; Mensagem : String);
var
  sMsg : String;
  bFaltaConfigurado : Boolean;
const
  sHTML =
    '<html>'                  + #13 +
    '<style type="text/css">' + #13 +
    '<!--'      + #13 +
    '.style1 {' + #13 +
    '	font-family: Verdana, Arial, Helvetica, sans-serif;' + #13 +
    '	font-size: 12px;' + #13 +
    '}'   + #13 +
    '-->' + #13 +
    '</style>'  + #13 +
    '<body>'    + #13 +
    '  %s'      + #13 +
    '  <p>&nbsp;</p>' + #13 +
    '  <p><span class="style1"><strong>%s</strong><br>' + #13 +
    '    %s<br>'           + #13 +
    '    %s<br>' + #13 +
    '    <a href="http://%s">%s</a>' + #13 +
    '  </span></p>' + #13 +
    '</body>'       + #13 +
    '</html>';

begin
  // Verificar se existe apenas uma empresa no cadastro
  with DMBusiness, qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select cnpj from TBEMPRESA');
    Open;

    if (RecordCount = 1) then
    begin
      SetEmpresaIDDefault( FieldByName('cnpj').AsString );
      CNPJ := FieldByName('cnpj').AsString;
    end;

    Close;
  end;

  if (Trim(CNPJ) = EmptyStr) then
    CNPJ := GetEmpresaIDDefault;

  with gContaEmail, DMBusiness, qryConfiguracoes do
  begin
    Close;
    ParamByName('empresa').AsString := Trim(CNPJ);
    Open;

    if IsEmpty then
      raise Exception.Create('Tabela de Configurações vazia!');

    bFaltaConfigurado := False;

    bFaltaConfigurado := bFaltaConfigurado
      or (Trim(FieldByName('email_conta').AsString) = EmptyStr)
      or (Trim(FieldByName('email_senha').AsString) = EmptyStr)
      or (Trim(FieldByName('email_pop').AsString)   = EmptyStr)
      or (Trim(FieldByName('email_smtp').AsString)  = EmptyStr);

    if bFaltaConfigurado then
      raise Exception.Create('Configurações da conta de e-mail do sistema não informadas!');

    if (Trim(Mensagem) <> EmptyStr) then
      sMsg := '<p>' + Trim(Mensagem) + '</p>'
    else
    if (Trim(FieldByName('email_mensagem_padrao').AsString) <> EmptyStr) then
      sMsg := '<p>' + Trim(FieldByName('email_mensagem_padrao').AsString) + '</p>'
    else
    if (Trim(FieldByName('email_mensagem_padrao').AsString) = EmptyStr) then
      sMsg := '<p>-</p>';

    gContaEmail.Conta := FieldByName('email_conta').AsString;
    gContaEmail.Senha := FieldByName('email_senha').AsString;
    gContaEmail.Servidor_POP  := FieldByName('email_pop').AsString;
    gContaEmail.Servidor_SMTP := FieldByName('email_smtp').AsString;
    gContaEmail.Porta_SMTP    := FieldByName('email_smtp_porta').AsInteger;
    gContaEmail.Assunto_Padrao    := FieldByName('email_assunto_padrao').AsString;
    gContaEmail.Mensagem_Padrao   := FieldByName('email_mensagem_padrao').AsString;

    gContaEmail.RequerAutenticacao := (FieldByName('email_requer_autenticacao').AsInteger = 1);
    gContaEmail.ConexaoSeguraSSL   := (FieldByName('email_conexao_ssl').AsInteger = 1);
(*
    gContaEmail.Assinatura_Padrao := Format(sHTML, [sMsg,
      FieldByName('empresa_razao').AsString,
      FieldByName('empresa_fone_1').AsString,
      FieldByName('empresa_email').AsString,
      FieldByName('empresa_homepage').AsString, FieldByName('empresa_homepage').AsString]);
*)
    gContaEmail.Assinatura_Padrao := '-'     + #13 +
      FieldByName('empresa_razao').AsString  + #13 +
      FieldByName('empresa_fone_1').AsString + #13 +
      FieldByName('empresa_email').AsString  + #13 +
      FieldByName('empresa_homepage').AsString;
  end;
end;

procedure SetEmpresaIDDefault(CNPJ : String);
begin
  FileINI.WriteString('Default', 'EmpresaID', CNPJ);
  FileINI.UpdateFile;
end;

function DelphiIsRunning : Boolean;
begin
  // Verifica se o programa rodou a partir do IDE do Delphi7:
  Result := DebugHook <> 0;
end;

function ShowConfirm(sMsg : String; const sTitle : String = ''; const DefaultButton : Integer = MB_DEFBUTTON2) : Boolean;
begin
  Result := ( Application.MessageBox(PChar(sMsg), 'Confirmar', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = ID_YES );
end;

function GetPaisIDDefault : String;
begin
  Result := FileINI.ReadString('Default', 'PaisID', '01058');
end;

function GetEstadoIDDefault : Integer;
begin
  Result := FileINI.ReadInteger('Default', 'EstadoID', 15);
end;

function GetCidadeIDDefault : Integer;
begin
  Result := FileINI.ReadInteger('Default', 'CidadeID', 170);
end;

function GetCfopIDDefault : Integer;
begin
  Result := FileINI.ReadInteger('Default', 'CfopID', 5102);
end;

function GetEmpresaIDDefault : String;
begin
  Result := FileINI.ReadString('Default', 'EmpresaID', EmptyStr);
end;

function GetClienteIDDefault : String;
begin
  Result := FileINI.ReadString('Default', 'ClienteID', EmptyStr);
end;

function GetVendedorIDDefault : Integer;
begin
  Result := FileINI.ReadInteger('Default', 'VendedorID', 1);
end;

function GetFormaPagtoIDDefault : Integer;
begin
  Result := FileINI.ReadInteger('Default', 'FormaPagtoID', 1);
end;

function GetCondicaoPagtoIDDefault : Integer;
begin
  Result := FileINI.ReadInteger('Default', 'CondicaoPagtoID', 1);
end;

function GetEmitirBoleto : Boolean;
begin
  Result := FileINI.ReadBool('Boleto', 'EmitirBoleto', False);
end;

function GetCondicaoPagtoIDBoleto : Integer;
begin
  Result := FileINI.ReadInteger('Boleto', 'FormaPagtoID', 1);
end;

function GetEmitirCupom : Boolean;
begin
  Result := FileINI.ReadBool('Cupom', 'EmitirCupom', False);
end;

function GetModeloEmissaoCupom : Integer;
begin
  Result := FileINI.ReadInteger('Cupom', 'ModeloEmissaoCupom', 0);
end;

function GetSegmentoID(const CNPJ : String) : Integer;
begin
  with DMBusiness, qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select coalesce(SEGMENTO, 0) as SegmentoID from TBEMPRESA where CNPJ = ' + QuotedStr(Trim(CNPJ)));
    Open;

    Result := FieldByName('SegmentoID').AsInteger;

    Close;
  end;
end;

function GetControleAcesso(const AOnwer : TComponent; const EvUserAcesso : TEvUserAccess) : Boolean;
begin
  with DMBusiness, qryEvAcessUser do
  begin
    Close;
    ParamByName('formulario').AsString := TForm(AOnwer).Name;
    ParamByName('objeto').AsString     := EvUserAcesso.Name;
    Open;

    Result := not IsEmpty;

    if Result then
    begin
      EvUserAcesso.Consents.Clear;
      EvUserAcesso.Consents.Text := qryEvAcessUserCONSENTS_STRING.AsString;
    end;
  end;
end;

function GetEmailEmpresa(const sCNPJEmpresa : String) : String;
begin
  with DMBusiness, qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select email from TBEMPRESA where cnpj = ' + QuotedStr(sCNPJEmpresa));
    Open;

    Result := AnsiLowerCase( FieldByName('email').AsString );

    Close;
  end;
end;

function StrIsCNPJ(const Num: string): Boolean;
var
  Dig: array [1..14] of Byte;
  I, Resto: Byte;
  Dv1, Dv2: Byte;
  Total1, Total2: Integer;
  Valor: string;
begin
  if ( StrToIntDef(Copy(Num, 1, 2), -1) = -1 ) then
  begin
    Result := False;
    Exit;
  end;

  Valor := Num;

  for I := 1 to Length(Valor) do
    if not (Valor[I] in ['0'..'9']) then
      Delete(Valor, I, 1);

  if ( StrToIntDef(Copy(Valor, 1, 5), 0) = 0 ) then
  begin
    Result := False;
    Exit;
  end;

  try
    StrToInt(Copy(Valor, 1, 5));
  except
    Result := True;
    Exit;
  end;

  Result := False;

  if Length(Valor) = 14 then
  begin
    for I := 1 to 14 do
      try
        Dig[I] := StrToInt (Valor[I]);
      except
        Dig[i] := 0;
      end;

    Total1 := Dig[1]  * 5 + Dig[2]  * 4 + Dig[3]  * 3 +
              Dig[4]  * 2 + Dig[5]  * 9 + Dig[6]  * 8 +
              Dig[7]  * 7 + Dig[8]  * 6 + Dig[9]  * 5 +
              Dig[10] * 4 + Dig[11] * 3 + Dig[12] * 2 ;

    Resto := Total1 mod 11;

    if Resto > 1 then
      Dv1 := 11 - Resto
    else
      Dv1 := 0;

    Total2 := Dig[1]  * 6 + Dig[2]  * 5 + Dig[3]  * 4 +
              Dig[4]  * 3 + Dig[5]  * 2 + Dig[6]  * 9 +
              Dig[7]  * 8 + Dig[8]  * 7 + Dig[9]  * 6 +
              Dig[10] * 5 + Dig[11] * 4 + Dig[12] * 3 + Dv1 * 2 ;

    Resto := Total2 mod 11;

    if Resto > 1 then
      Dv2 := 11 - Resto
    else
      Dv2 := 0;

    if (Dv1 = Dig[13]) and (Dv2 = Dig[14]) then
      Result := True;
  end;

end;

function StrIsCPF(const Num: string): Boolean;
var
  I, Numero, Resto: Byte ;
  Dv1, Dv2: Byte ;
  Total, Soma: Integer ;
  Valor: string;
begin
  if ( StrToIntDef(Copy(Num, 1, 2), -1) = -1 ) then
  begin
    Result := False;
    Exit;
  end;

  Valor := Num;
  for I := 1 to Length(Valor) do
    if not (Valor[I] in ['0'..'9']) then Delete(Valor, I, 1);
  try
    StrToInt(Copy(Valor, 1, 5));
  except
    Result := True;
    Exit;
  end;
  Result := False;
  if Length(Valor) = 11 then
  begin
    Total := 0 ;
    Soma := 0 ;
    for I := 1 to 9 do
    begin
      try
        Numero := StrToInt (Valor[I]);
      except
        Numero := 0;
      end;
      Total := Total + (Numero * (11 - I)) ;
      Soma := Soma + Numero;
    end;
    Resto := Total mod 11;
    if Resto > 1
      then Dv1 := 11 - Resto
      else Dv1 := 0;
    Total := Total + Soma + 2 * Dv1;
    Resto := Total mod 11;
    if Resto > 1
      then Dv2 := 11 - Resto
      else Dv2 := 0;
    if (IntToStr (Dv1) = Valor[10]) and (IntToStr (Dv2) = Valor[11])
      then Result := True;
  end;
end;

function StrIsDateTime(const S: string): Boolean;
var
  d : TDateTime;
begin
  Result := TryStrToDateTime(S, d);
end;

function StrFormatarCnpj(sCnpj: String): String;
var
  S : String;
begin
  S := Trim(sCnpj);

  if ( Copy(S, 3, 1) <> '.' ) then
    S := Copy(S, 1, 2) + '.' + Copy(S, 3, Length(S));

  if ( Copy(S, 7, 1) <> '.' ) then
    S := Copy(S, 1, 6) + '.' + Copy(S, 7, Length(S));

  if ( Copy(S, 11, 1) <> '/' ) then
    S := Copy(S, 1, 10) + '/' + Copy(S, 11, Length(S));

  if ( Copy(S, 16, 1) <> '-' ) then
    S := Copy(S, 1, 15) + '-' + Copy(S, 16, Length(S));

  Result := S;
end;

function StrFormatarCpf(sCpf: String): String;
var
  S : String;
begin
  S := Trim(sCpf); // 000.000.000-00

  if ( Copy(S, 4, 1) <> '.' ) then
    S := Copy(S, 1, 3) + '.' + Copy(S, 4, Length(S));

  if ( Copy(S, 8, 1) <> '.' ) then
    S := Copy(S, 1, 7) + '.' + Copy(S, 8, Length(S));

  if ( Copy(S, 12, 1) <> '-' ) then
    S := Copy(S, 1, 11) + '-' + Copy(S, 12, Length(S));

  Result := S;
end;

function StrFormatarCEP(sCEP: String): String;
var
  S : String;
begin
  S := Trim(sCEP); // 00.000-000

  if ( Copy(S, 3, 1) <> '.' ) then
    S := Copy(S, 1, 2) + '.' + Copy(S, 3, Length(S));

  if ( Copy(S, 7, 1) <> '-' ) then
    S := Copy(S, 1, 6) + '-' + Copy(S, 7, Length(S));

  Result := S;
end;

function StrFormatarFONE(sFone: String): String;
var
  S : String;
begin
  S := Trim(sFone); // (91)0123-4567

  if ( Copy(S, 1, 1) <> '(' ) then
    S := '(' + Copy(S, 1, Length(S));

  if ( Copy(S, 4, 1) <> ')' ) then
    S := Copy(S, 1, 3) + ')' + Copy(S, 4, Length(S));

  if ( Copy(S, 9, 1) <> '-' ) then
    S := Copy(S, 1, 8) + '-' + Copy(S, 9, Length(S));

  Result := S;
end;

function StrDescricaoProduto : String;
var
  S : String;
begin
  try
    S := 'Produtos';

    Case GetSegmentoID(GetEmpresaIDDefault)  of
      SEGMENTO_MERCADO_CARRO_ID:
        S := 'Veículos';
      else
        S := 'Produtos';
    end;

  finally
    Result := S;
  end;
end;

function StrOnlyNumbers(const Str : String) : String;
var
  I : Byte;
  Valor : String;
begin
  Valor := Str;

  for I := 1 to Length(Valor) do
    if not (Valor[I] in ['0'..'9']) then
      Delete(Valor, I, 1);

  Result := Valor;
end;

function GetGeneratorID(const GeneratorName : String) : Integer;
begin
  with DMBusiness, qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select first 1 GEN_ID(' + GeneratorName + ', 1) as ID from TBEMPRESA');
    Open;

    Result := FieldByName('ID').AsInteger;

    CommitTransaction;

    Close;
  end;
end;

function GetNextID(NomeTabela, CampoChave : String; const sWhere : String = '') : Largeint;
begin
  with DMBusiness, qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select max(' + CampoChave + ') as ID from ' + NomeTabela + ' ' + sWhere);
    Open;

    Result := FieldByName('ID').AsInteger + 1;
  end;
end;

function GetPaisNomeDefault : String;
begin
  with DMBusiness, qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select pais_nome from TBPAIS where pais_id = ' + QuotedStr(GetPaisIDDefault));
    Open;

    Result := FieldByName('pais_nome').AsString;

    Close;
  end;
end;

function GetEstadoNomeDefault : String;
begin
  with DMBusiness, qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select est_nome from TBESTADO where est_cod = ' + IntToStr(GetEstadoIDDefault));
    Open;

    Result := FieldByName('est_nome').AsString;

    Close;
  end;
end;

function GetEstadoNome(const iEstado : Integer) : String;
begin
  with DMBusiness, qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select est_nome from TBESTADO where est_cod = ' + IntToStr(iEstado));
    Open;

    Result := FieldByName('est_nome').AsString;

    Close;
  end;
end;

function GetEstadoNome(const sSigla : String) : String;
begin
  with DMBusiness, qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select est_nome from TBESTADO where est_sigla = ' + QuotedStr(sSigla));
    Open;

    Result := FieldByName('est_nome').AsString;

    Close;
  end;
end;

function GetEstadoID(const sSigla : String) : Integer;
begin
  with DMBusiness, qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select est_cod from TBESTADO where est_sigla = ' + QuotedStr(sSigla));
    Open;

    Result := FieldByName('est_cod').AsInteger;

    Close;
  end;
end;

function GetCidadeNomeDefault : String;
begin
  with DMBusiness, qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select cid_nome from TBCIDADE where cid_cod = ' + IntToStr(GetCidadeIDDefault));
    Open;

    Result := FieldByName('cid_nome').AsString;

    Close;
  end;
end;

function GetCidadeNome(const iCidade : Integer) : String;
begin
  with DMBusiness, qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select cid_nome from TBCIDADE where cid_cod = ' + IntToStr(iCidade));
    Open;

    Result := FieldByName('cid_nome').AsString;

    Close;
  end;
end;

function GetCidadeID(const iEstado : Integer; const sNome : String) : Integer;
begin
  with DMBusiness, qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select cid_cod from TBCIDADE where est_cod = ' + IntToStr(iEstado) + ' and cid_nome like ' + QuotedStr('%' + Trim(sNome) + '%'));
    Open;

    Result := FieldByName('cid_cod').AsInteger;

    Close;
  end;
end;

function GetCidadeID(const sCEP : String) : Integer;
begin
  with DMBusiness, qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select cid_nome from TBCIDADE where ' + StrOnlyNumbers(sCEP) + ' between cid_cep_inicial and cid_cep_final');
    Open;

    Result := FieldByName('cid_cod').AsInteger;

    Close;
  end;
end;

function GetCfopNomeDefault : String;
begin
  with DMBusiness, qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select cfop_descricao from TBCFOP where cfop_cod = ' + IntToStr(GetCfopIDDefault));
    Open;

    Result := FieldByName('cfop_descricao').AsString;

    Close;
  end;
end;

function GetEmpresaNomeDefault : String;
begin
  with DMBusiness, qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select rzsoc from TBEMPRESA where Cnpj = ' + QuotedStr(GetEmpresaIDDefault));
    Open;

    Result := FieldByName('rzsoc').AsString;

    Close;
  end;
end;

function GetClienteNomeDefault : String;
begin
  with DMBusiness, qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select nome from TBCLIENTE where Cnpj = ' + QuotedStr(GetClienteIDDefault));
    Open;

    Result := FieldByName('nome').AsString;

    Close;
  end;
end;

function GetVendedorNomeDefault : String;
begin
  with DMBusiness, qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select nome from TBVENDEDOR where cod = ' + IntToStr(GetVendedorIDDefault));
    Open;

    Result := FieldByName('nome').AsString;

    Close;
  end;
end;

function GetFormaPagtoNomeDefault : String;
begin
  with DMBusiness, qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select descri from TBFORMPAGTO where cod = ' + IntToStr(GetFormaPagtoIDDefault));
    Open;

    Result := FieldByName('descri').AsString;

    Close;
  end;
end;

function GetCondicaoPagtoNomeDefault : String;
begin
  with DMBusiness, qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select cond_descricao_full from VW_CONDICAOPAGTO where cond_cod = ' + IntToStr(GetCondicaoPagtoIDDefault));
    Open;

    Result := FieldByName('cond_descricao_full').AsString;

    Close;
  end;
end;

function GetSenhaAutorizacao : String;
begin
  with DMBusiness, qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select snh_descricao from TBSENHA_AUTORIZACAO');
    Open;

    if IsEmpty then
      ShowWarning('Não existe senha de autorização gravada na base.' + #13#13 + 'Favor solicitar a geração de uma senha de autorização');

    Result := FieldByName('snh_descricao').AsString;

    Close;
  end;
end;

function GetDateTimeDB : TDateTime;
begin
  with DMBusiness, qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select First 1 Current_timestamp as DataHora from TBEMPRESA');
    Open;

    Result := FieldByName('DataHora').AsDateTime;
  end;
end;

function GetDateDB : TDateTime;
begin
  with DMBusiness, qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select First 1 Current_date as Data from TBEMPRESA');
    Open;

    Result := FieldByName('Data').AsDateTime;
  end;
end;

function GetProximoDiaUtil(const Data : TDateTime) : TDateTime;
var
  dData : TDateTime;
begin
  dData := Data + 1;
  while ( DayOfWeek(dData) in [1, 7] ) do
    dData := dData + 1;
  Result := dData;
end;

function GetTimeDB : TDateTime;
begin
  with DMBusiness, qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select First 1 Current_time as Hora from TBEMPRESA');
    Open;

    Result := FieldByName('Hora').AsDateTime;
  end;
end;

function GetUserApp : String;
begin
  with DMBusiness, ibdtstUsers do
    Result := UpperCase( Trim(ibdtstUsersNOME.AsString) );
end;

function GetUserFunctionID : Integer;
begin
  with DMBusiness, ibdtstUsers do
    Result := ibdtstUsersCODFUNCAO.AsInteger;
end;

function GetLimiteDescontoUser : Currency;
begin
  with DMBusiness, ibdtstUsers do
    Result := ibdtstUsersLIMIDESC.AsCurrency;
end;

function GetSolicitaDHSaidaNFe(const sCNPJEmitente : String) : Boolean;
begin
  with DMBusiness, qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select nfe_solicita_dh_saida from TBCONFIGURACAO where empresa = ' + QuotedStr(sCNPJEmitente));
    Open;

    Result := (FieldByName('nfe_solicita_dh_saida').AsInteger = 1);

    Close;
  end;
end;

function GetImprimirCodClienteNFe(const sCNPJEmitente : String) : Boolean;
begin
  with DMBusiness, qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select nfe_imprimir_cod_cliente from TBCONFIGURACAO where empresa = ' + QuotedStr(sCNPJEmitente));
    Open;

    Result := (FieldByName('nfe_imprimir_cod_cliente').AsInteger = 1);

    Close;
  end;
end;

function CaixaAberto(const Usuario : String; const Data : TDateTime; const FormaPagto : Smallint; var CxAno, CxNumero, CxContaCorrente : Integer) : Boolean;
begin
  with DMBusiness, qryCaixaAberto do
  begin
    Close;
    ParamByName('Usuario').AsString   := Usuario;
    ParamByName('Data').AsDate        := Data;
    ParamByName('FormaPagto').AsShort := FormaPagto;
    Open;

    Result := ( qryCaixaAbertoANO.AsInteger > 0 );

    if ( Result ) then
    begin
      CxAno           := qryCaixaAbertoANO.AsInteger;
      CxNumero        := qryCaixaAbertoNUMERO.AsInteger; 
      CxContaCorrente := qryCaixaAbertoCONTA_CORRENTE.AsInteger
    end;
  end;
end;

function SetMovimentoCaixa(const Usuario : String; const Data : TDateTime; const FormaPagto : Smallint;
  const AnoLancamento, NumLancamento, SeqPagto : Integer; const Valor : Currency; const TipoMov : TTipoMovimentoCaixa) : Boolean;
var
  Return : Boolean;
begin
  try

    Return := False;

    try

      UpdateSequence('GEN_CX_MOVIMENTO_' + IntToStr(YearOf(Data)), 'TBCAIXA_MOVIMENTO', 'NUMERO', 'where ANO = ' + IntToStr(YearOf(Data)));

      if ( TipoMov = tmcxCredito ) then
        with DMBusiness, stpCaixaMovimentoREC do
        begin
          ParamByName('USUARIO').AsString       := Usuario;
          ParamByName('DATA_PAGTO').AsDateTime  := Data;
          ParamByName('FORMA_PAGTO').AsInteger  := FormaPagto;
          ParamByName('ANOLANC').AsInteger      := AnoLancamento;
          ParamByName('NUMLANC').AsInteger      := NumLancamento;
          ParamByName('SEQ').AsInteger          := SeqPagto;
          ParamByName('VALOR_BAIXA').AsCurrency := Valor;

          ExecProc;
          CommitTransaction;
        end
      else
      if ( TipoMov = tmcxDebito ) then
        with DMBusiness, stpCaixaMovimentoPAG do
        begin
          ParamByName('USUARIO').AsString       := Usuario;
          ParamByName('DATA_PAGTO').AsDateTime  := Data;
          ParamByName('FORMA_PAGTO').AsInteger  := FormaPagto;
          ParamByName('ANOLANC').AsInteger      := AnoLancamento;
          ParamByName('NUMLANC').AsInteger      := NumLancamento;
          ParamByName('SEQ').AsInteger          := SeqPagto;
          ParamByName('VALOR_BAIXA').AsCurrency := Valor;

          ExecProc;
          CommitTransaction;
        end;

      Return := True;

    except
      On E : Exception do
      begin
        DMBusiness.ibtrnsctnBusiness.Rollback;
        ShowError('Erro ao tentar registrar o pagamento no movimento de caixa.' + #13#13 + E.Message);
      end;
    end;

  finally
    Result := Return;
  end;
end;

function SetMovimentoCaixaEstorno(const Usuario : String; const Data : TDateTime; const FormaPagto : Smallint;
  const AnoLancamento, NumLancamento, SeqPagto : Integer; const Valor : Currency; const TipoMov : TTipoMovimentoCaixa) : Boolean;
var
  Return : Boolean;
begin
  try

    Return := False;

    try

      UpdateSequence('GEN_CX_MOVIMENTO_' + IntToStr(YearOf(Data)), 'TBCAIXA_MOVIMENTO', 'NUMERO', 'where ANO = ' + IntToStr(YearOf(Data)));

      if ( TipoMov = tmcxCredito ) then
        with DMBusiness, stpCaixaMovimentoREC_ESTORNO do
        begin
          ParamByName('USUARIO').AsString       := Usuario;
          ParamByName('DATA_PAGTO').AsDateTime  := Data;
          ParamByName('FORMA_PAGTO').AsInteger  := FormaPagto;
          ParamByName('ANOLANC').AsInteger      := AnoLancamento;
          ParamByName('NUMLANC').AsInteger      := NumLancamento;
          ParamByName('SEQ').AsInteger          := SeqPagto;
          ParamByName('VALOR_BAIXA').AsCurrency := Valor;

          ExecProc;
          CommitTransaction;
        end
      else
      if ( TipoMov = tmcxDebito ) then
        with DMBusiness, stpCaixaMovimentoPAG_ESTORNO do
        begin
          ParamByName('USUARIO').AsString       := Usuario;
          ParamByName('DATA_PAGTO').AsDateTime  := Data;
          ParamByName('FORMA_PAGTO').AsInteger  := FormaPagto;
          ParamByName('ANOLANC').AsInteger      := AnoLancamento;
          ParamByName('NUMLANC').AsInteger      := NumLancamento;
          ParamByName('SEQ').AsInteger          := SeqPagto;
          ParamByName('VALOR_BAIXA').AsCurrency := Valor;

          ExecProc;
          CommitTransaction;
        end;

      Return := True;

    except
      On E : Exception do
      begin
        DMBusiness.ibtrnsctnBusiness.Rollback;
        ShowError('Erro ao tentar registrar o estorno de movimento no caixa.' + #13#13 + E.Message);
      end;
    end;

  finally
    Result := Return;
  end;
end;

procedure TDMBusiness.DataModuleCreate(Sender: TObject);
begin
  try

    with ibdtbsBusiness, FileINI do
    begin
      Connected    := False;
      DatabaseName := ReadString('Conexao', 'Servidor', EmptyStr) + ':' + ReadString('Conexao', 'Base', EmptyStr);
      Params.Clear;
      Params.Add('user_name=' + DB_USER_NAME);
      Params.Add('password='  + DB_USER_PASSWORD);
      Params.Add('lc_ctype='  + DB_LC_CTYPE);
      Connected := True;

      if ( Connected ) then
      begin
        ibdtstUsers.Open;
        ibqryEmpresa.Open;
      end;
    end;

  except
    On E : Exception do
      ShowError('Erro ao tentar conectar no Servidor/Base.' + #13#13 + E.Message);
  end;
end;

initialization
  FormFunction := TFormularios.Create;

finalization
  FormFunction.Destroy;

end.
