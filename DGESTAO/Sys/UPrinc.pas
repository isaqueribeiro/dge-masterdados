unit UPrinc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, BarMenus, RXCtrls, ExtCtrls, jpeg, 
  EUserAcs, StdCtrls, Buttons, rxSpeedbar, EAppProt;

type
  TfrmPrinc = class(TForm)
    BcBarMainMenu: TBcBarMainMenu;
    stbMain: TStatusBar;
    menuCadastro: TMenuItem;
    nmCliente: TMenuItem;
    nmProduto: TMenuItem;
    nmVendedor: TMenuItem;
    mnBanco: TMenuItem;
    menuEstoque: TMenuItem;
    menuFinanceiro: TMenuItem;
    nmContasAPagar: TMenuItem;
    nmContasAReceber: TMenuItem;
    nmDeposito: TMenuItem;
    nmFluxoDeCaixa: TMenuItem;
    menuRelatorio: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    nmUsuario: TMenuItem;
    nmEntrada: TMenuItem;
    nmEmpresa: TMenuItem;
    spbBarraAcessoRapido: TSpeedBar;
    btnContaAReceber: TRxSpeedButton;
    btnFornecedor: TRxSpeedButton;
    btnTesouraria: TRxSpeedButton;
    btnContaAPagar: TRxSpeedButton;
    btnProduto: TRxSpeedButton;
    btnCliente: TRxSpeedButton;
    SpeedbarSection1: TSpeedbarSection;
    menuSobre: TMenuItem;
    pnlMain: TPanel;
    nmFornecedor: TMenuItem;
    imgFundo: TImage;
    nmTipoDespesa: TMenuItem;
    btnSair: TRxSpeedButton;
    N3: TMenuItem;
    btnEstoque: TRxSpeedButton;
    ppEstoque: TPopupMenu;
    popEntrada: TMenuItem;
    nmAjusteManual: TMenuItem;
    nmKardex: TMenuItem;
    popKardex: TMenuItem;
    menuFaturamento: TMenuItem;
    nmVendas: TMenuItem;
    nmRelatorioCliente: TMenuItem;
    nmRelatorioFornecedor: TMenuItem;
    nmRelatorioProduto: TMenuItem;
    mnRelatorioFinanceiro: TMenuItem;
    mnRelatorioFinanceiroContasAPagar: TMenuItem;
    mnRelatorioFinanceiroContasAReceber: TMenuItem;
    btnVenda: TRxSpeedButton;
    nmAbout: TMenuItem;
    mnRelatorioFaturamentoVendas: TMenuItem;
    mnTabelasAuxiliares: TMenuItem;
    nmEstados: TMenuItem;
    nmCidades: TMenuItem;
    nmBairros: TMenuItem;
    nmTiposdeLogradouros: TMenuItem;
    nmLogradouros: TMenuItem;
    N5: TMenuItem;
    N4: TMenuItem;
    nmDistritos: TMenuItem;
    nmGruposProduto: TMenuItem;
    nmSecaoProduto: TMenuItem;
    nmUnidade: TMenuItem;
    nmTributacao: TMenuItem;
    nmFormaPagto: TMenuItem;
    nmCondicaoPagto: TMenuItem;
    N6: TMenuItem;
    nmTabelaCFOP: TMenuItem;
    nmSenhaAutorizacao: TMenuItem;
    nmConfigurarNFeACBr: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    nmNotaFiscal: TMenuItem;
    N9: TMenuItem;
    nmEnviarLoteNFe: TMenuItem;
    N10: TMenuItem;
    nmGerarBoleto: TMenuItem;
    nmCancelarNFe: TMenuItem;
    nmInutilizarNumeroNFe: TMenuItem;
    EvAcessUserPrincipal: TEvUserAccess;
    SpeedbarSection2: TSpeedbarSection;
    SpeedItem1: TSpeedItem;
    SpeedItem2: TSpeedItem;
    nmImprimirDANFE: TMenuItem;
    N11: TMenuItem;
    nmRemessaBoleto: TMenuItem;
    nmRetornoBoleto: TMenuItem;
    nmPromocoes: TMenuItem;
    nmContaCorrente: TMenuItem;
    nmAberturaCaixa: TMenuItem;
    N12: TMenuItem;
    nmEncerramentoCaixa: TMenuItem;
    nmGerenciaCaixa: TMenuItem;
    mnRelatorioFaturamento: TMenuItem;
    imgEmpresa: TImage;
    ProductName: TLabel;
    Copyright: TLabel;
    FileDescription: TLabel;
    Version: TLabel;
    nmFabricanteProduto: TMenuItem;
    nmUsuarioAlterarSenha: TMenuItem;
    btnEmpresa: TRxSpeedButton;
    menuUtilitarios: TMenuItem;
    nmExportarNFeGerada: TMenuItem;
    mnRelatorioEstoque: TMenuItem;
    mnRelatorioEstoqueProduto: TMenuItem;
    mnRelatorioFinanceiroPorFormaPagto: TMenuItem;
    mnRelatorioEstoqueDemanda: TMenuItem;
    menuConsulta: TMenuItem;
    nmConultarVendaItem: TMenuItem;
    popRotatividade: TMenuItem;
    nmRotatividade: TMenuItem;
    nmConfiguracaoEmpresa: TMenuItem;
    popEstoqueMinimo: TMenuItem;
    nmEstoqueMinimo: TMenuItem;
    nmConsultarLoteNFe: TMenuItem;
    VeculoMovimentao1: TMenuItem;
    Minimo1: TMenuItem;
    nmGerarArquivoNFC: TMenuItem;
    EAP: TEvAppProtect;
    miCarregarLicenca: TMenuItem;
    N13: TMenuItem;
    miConfigurarAmbiente: TMenuItem;
    RankingdeProdutos1: TMenuItem;
    SegmentoVarejo1: TMenuItem;
    SegmentoVeculos1: TMenuItem;
    Estoque1: TMenuItem;
    Vendas1: TMenuItem;
    Veculos1: TMenuItem;
    CustosVeculos1: TMenuItem;
    Listagem1: TMenuItem;
    CustoDetalhado1: TMenuItem;
    Comisso1: TMenuItem;
    nmCartaCorrecaoNFe: TMenuItem;
    N14: TMenuItem;
    nmUsuarioPerfil: TMenuItem;
    nmNotaFiscalComplementar: TMenuItem;
    N15: TMenuItem;
    procedure btnEmpresaClick(Sender: TObject);
    procedure btnClienteClick(Sender: TObject);
    procedure btnContaAReceberClick(Sender: TObject);
    procedure btnContaAPagarClick(Sender: TObject);
    procedure nmFornecedorClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnProdutoClick(Sender: TObject);
    procedure nmEntradaClick(Sender: TObject);
    procedure nmAjusteManualClick(Sender: TObject);
    procedure nmKardexClick(Sender: TObject);
    procedure nmVendasClick(Sender: TObject);
    procedure nmRelatorioClienteClick(Sender: TObject);
    procedure nmRelatorioFornecedorClick(Sender: TObject);
    procedure nmRelatorioProdutoClick(Sender: TObject);
    procedure mnRelatorioFinanceiroContasAPagarClick(Sender: TObject);
    procedure mnRelatorioFinanceiroContasAReceberClick(Sender: TObject);
    procedure nmAboutClick(Sender: TObject);
    procedure mnBancoClick(Sender: TObject);
    procedure nmTiposdeLogradourosClick(Sender: TObject);
    procedure nmEstadosClick(Sender: TObject);
    procedure nmCidadesClick(Sender: TObject);
    procedure nmDistritosClick(Sender: TObject);
    procedure nmBairrosClick(Sender: TObject);
    procedure nmLogradourosClick(Sender: TObject);
    procedure nmGruposProdutoClick(Sender: TObject);
    procedure nmSecaoProdutoClick(Sender: TObject);
    procedure nmUnidadeClick(Sender: TObject);
    procedure nmTabelaCFOPClick(Sender: TObject);
    procedure nmFormaPagtoClick(Sender: TObject);
    procedure nmVendedorClick(Sender: TObject);
    procedure nmCondicaoPagtoClick(Sender: TObject);
    procedure nmConfigurarNFeACBrClick(Sender: TObject);
    procedure nmTipoDespesaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure nmGerarBoletoClick(Sender: TObject);
    procedure nmRemessaBoletoClick(Sender: TObject);
    procedure nmRetornoBoletoClick(Sender: TObject);
    procedure nmPromocoesClick(Sender: TObject);
    procedure nmContaCorrenteClick(Sender: TObject);
    procedure nmGerenciaCaixaClick(Sender: TObject);
    procedure nmAberturaCaixaClick(Sender: TObject);
    procedure nmEncerramentoCaixaClick(Sender: TObject);
    procedure nmFluxoDeCaixaClick(Sender: TObject);
    procedure mnRelatorioFaturamentoVendasClick(Sender: TObject);
    procedure nmFabricanteProdutoClick(Sender: TObject);
    procedure nmUsuarioAlterarSenhaClick(Sender: TObject);
    procedure nmExportarNFeGeradaClick(Sender: TObject);
    procedure mnRelatorioEstoqueProdutoClick(Sender: TObject);
    procedure mnRelatorioFinanceiroPorFormaPagtoClick(Sender: TObject);
    procedure mnRelatorioEstoqueDemandaClick(Sender: TObject);
    procedure nmConultarVendaItemClick(Sender: TObject);
    procedure nmRotatividadeClick(Sender: TObject);
    procedure nmInutilizarNumeroNFeClick(Sender: TObject);
    procedure nmConfiguracaoEmpresaClick(Sender: TObject);
    procedure nmEstoqueMinimoClick(Sender: TObject);
    procedure nmConsultarLoteNFeClick(Sender: TObject);
    procedure VeculoMovimentao1Click(Sender: TObject);
    procedure Minimo1Click(Sender: TObject);
    procedure nmGerarArquivoNFCClick(Sender: TObject);
    procedure miCarregarLicencaClick(Sender: TObject);
    procedure miConfigurarAmbienteClick(Sender: TObject);
    procedure RankingdeProdutos1Click(Sender: TObject);
    procedure Veculos1Click(Sender: TObject);
    procedure nmCartaCorrecaoNFeClick(Sender: TObject);
    procedure nmUsuarioPerfilClick(Sender: TObject);
    procedure nmUsuarioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FAcesso : Boolean;
    procedure RegistrarRotinasMenu;
  end;

var
  frmPrinc: TfrmPrinc;

implementation

uses
  // Conex�o e Controles Aplica��o
  UDMBusiness,
  UDMNFe,
  USobre,
  UFuncoes,
  UConstantesDGE,

  // Estoque, Entrada e Sa�da
  UGeProduto,
  UGeVenda,
  UGeEntradaEstoque,

  // Financeiro
  UGeContasAPagar,
  UGeContasAReceber,
  UGeCaixa,
  UGeFluxoCaixa,

  // Relat�rios
  UfrmRelEstoque, UfrmRelEstoqMinimo, UfrmRelVendas, URelEstoqVeic;

{$R *.dfm}

procedure TfrmPrinc.btnEmpresaClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'frmGeEmpresa');
end;

procedure TfrmPrinc.btnClienteClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'frmGeCliente');
end;

procedure TfrmPrinc.btnContaAReceberClick(Sender: TObject);
begin
  MostrarControleContasAReceber(Self);
end;

procedure TfrmPrinc.btnContaAPagarClick(Sender: TObject);
begin
  MostrarControleContasAPagar(Self);
end;

procedure TfrmPrinc.nmFornecedorClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'frmGeFornecedor');
end;

procedure TfrmPrinc.btnSairClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja SAIR do Sistema?', 'Confirma��o ...', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = ID_YES then
  Application.Terminate;
end;

procedure TfrmPrinc.btnProdutoClick(Sender: TObject);
begin
  MostrarTabelaProdutos(Self, taICMS);
end;

procedure TfrmPrinc.nmEntradaClick(Sender: TObject);
begin
  MostrarControleCompras(Self);
end;

procedure TfrmPrinc.nmAjusteManualClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'frmAjustEstoq');
end;

procedure TfrmPrinc.nmKardexClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'frmKardex');
end;

procedure TfrmPrinc.nmVendasClick(Sender: TObject);
begin
  MostrarControleVendas(Self);
end;

procedure TfrmPrinc.nmRelatorioClienteClick(Sender: TObject);
begin
  FormFunction.ShowFormReport(Self, 'frmRelCli', 'qckrp');
end;

procedure TfrmPrinc.nmRelatorioFornecedorClick(Sender: TObject);
begin
  FormFunction.ShowFormReport(Self, 'frmRelFornec', 'qckrp');
end;

procedure TfrmPrinc.nmRelatorioProdutoClick(Sender: TObject);
begin
  FormFunction.ShowFormReport(Self, 'frmRelProdutos', 'QuickRep1');
end;

procedure TfrmPrinc.mnRelatorioFinanceiroContasAPagarClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'frmGerRelCR');
end;

procedure TfrmPrinc.mnRelatorioFinanceiroContasAReceberClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'frmGerRelCP');
end;

procedure TfrmPrinc.nmAboutClick(Sender: TObject);
begin
  ShowAbout(Self);
end;

procedure TfrmPrinc.mnBancoClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'frmGeBancos');
end;

procedure TfrmPrinc.nmTiposdeLogradourosClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'frmGeTipoLogradouro');
end;

procedure TfrmPrinc.nmEstadosClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'frmGeEstado');
end;

procedure TfrmPrinc.nmCidadesClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'frmGeCidade');
end;

procedure TfrmPrinc.nmDistritosClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'frmGeDistrito');
end;

procedure TfrmPrinc.nmBairrosClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'frmGeBairro');
end;

procedure TfrmPrinc.nmLogradourosClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'frmGeLogradouro');
end;

procedure TfrmPrinc.nmGruposProdutoClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'frmGeGrupoProduto');
end;

procedure TfrmPrinc.nmSecaoProdutoClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'frmGeSecaoProduto');
end;

procedure TfrmPrinc.nmUnidadeClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'frmGeUnidade');
end;

procedure TfrmPrinc.nmTabelaCFOPClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'frmGeTabelaCFOP');
end;

procedure TfrmPrinc.nmFormaPagtoClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'frmGeFormaPagto');
end;

procedure TfrmPrinc.nmVendedorClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'frmGeVendedor');
end;

procedure TfrmPrinc.nmCondicaoPagtoClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'frmGeCondicaoPagto');
end;

procedure TfrmPrinc.nmConfigurarNFeACBrClick(Sender: TObject);
begin
  ConfigurarNFeACBr(gUsuarioLogado.Empresa);
end;

procedure TfrmPrinc.nmTipoDespesaClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'frmGeTipoDespesa');
end;

procedure TfrmPrinc.FormActivate(Sender: TObject);
var
  sCNPJ : String;
begin
  if ( StrIsCNPJ(gLicencaSistema.CNPJ) ) then
    sCNPJ := ' CPF.: ' + StrFormatarCnpj(gLicencaSistema.CNPJ)
  else
    sCNPJ := ' CNPJ.: ' + StrFormatarCpf(gLicencaSistema.CNPJ);

  stbMain.Panels.Items[2].Text  := 'Licenciado a empresa ' + gLicencaSistema.Empresa;
  nmUsuarioAlterarSenha.Caption := Format('Altera��o de Senha (%s)', [GetUserApp]);

  EvAcessUserPrincipal.UserID := GetUserFunctionID;

  //RegistrarControleAcesso(Self, EvAcessUserPrincipal);
  //GetControleAcesso(Self, EvAcessUserPrincipal);

  Case GetUserFunctionID of
    FUNCTION_USER_ID_DIRETORIA :
      begin
        EvAcessUserPrincipal.UserID := FUNCTION_USER_ID_DIRETORIA;

        mnRelatorioFinanceiro.Enabled := true;
        nmRelatorioProduto.Enabled    := true;
        mnRelatorioEstoque.Enabled := True;

        btnEmpresa.Enabled       := True;
        btnProduto.Enabled       := True;
        btnFornecedor.Enabled    := True;
        btnEstoque.Enabled       := True;
        btnTesouraria.Enabled    := True;
        btnContaAReceber.Enabled := True;
        btnContaAPagar.Enabled   := True;
      end;

    FUNCTION_USER_ID_GERENTE_VND :
      begin
        EvAcessUserPrincipal.UserID := FUNCTION_USER_ID_GERENTE_VND;
        btnTesouraria.Enabled    := False;
        btnContaAReceber.Enabled := False;
        btnContaAPagar.Enabled   := False;
      end;

    FUNCTION_USER_ID_GERENTE_FIN :
      EvAcessUserPrincipal.UserID := FUNCTION_USER_ID_GERENTE_FIN;

    FUNCTION_USER_ID_VENDEDOR :
      begin
        EvAcessUserPrincipal.UserID := FUNCTION_USER_ID_VENDEDOR;

        mnRelatorioFinanceiro.Enabled := False;
        nmRelatorioProduto.Enabled    := False;
        mnRelatorioEstoque.Enabled := False;

        btnEmpresa.Enabled       := False;
        btnProduto.Enabled       := False;
        btnFornecedor.Enabled    := False;
        btnEstoque.Enabled       := False;
        btnTesouraria.Enabled    := False;
        btnContaAReceber.Enabled := False;
        btnContaAPagar.Enabled   := False;
      end;

    FUNCTION_USER_ID_GERENTE_ADM :
      EvAcessUserPrincipal.UserID := FUNCTION_USER_ID_GERENTE_ADM;

    FUNCTION_USER_ID_CAIXA :
      EvAcessUserPrincipal.UserID := FUNCTION_USER_ID_CAIXA;

    FUNCTION_USER_ID_AUX_FINANC1 :
      EvAcessUserPrincipal.UserID := FUNCTION_USER_ID_AUX_FINANC1;

    FUNCTION_USER_ID_AUX_FINANC2 :
      EvAcessUserPrincipal.UserID := FUNCTION_USER_ID_AUX_FINANC2;

    FUNCTION_USER_ID_SUPERV_CX :
      EvAcessUserPrincipal.UserID := FUNCTION_USER_ID_SUPERV_CX;

    FUNCTION_USER_ID_ESTOQUISTA :
      EvAcessUserPrincipal.UserID := FUNCTION_USER_ID_ESTOQUISTA;

    FUNCTION_USER_ID_SUPORTE_TI :
      EvAcessUserPrincipal.UserID := FUNCTION_USER_ID_SUPORTE_TI;

    FUNCTION_USER_ID_SYSTEM_ADM :
      EvAcessUserPrincipal.UserID := FUNCTION_USER_ID_SYSTEM_ADM;
  else
    ShowWarning('Falta cruzar nova fun��o com UserID!');
    Application.Terminate;
  end;

  Self.WindowState := wsMaximized;
end;

procedure TfrmPrinc.FormCreate(Sender: TObject);
var
  sFileImage : String;
begin
  Self.Caption           := 'DGE - Sistema Integrado de Gest�o Empresarial ' + VERSION_NUMBER;
  Self.Version.Caption   := 'Vers�o ' + VERSION_NUMBER;
  Self.Copyright.Caption := '� 2012 | 2015 - Masterdados Tecnologia da Informa��o' + #13 + 'Todos os direitos reservados.';

  // Carregar Imagem de Fundo da Tele Principal

  sFileImage := ExtractFilePath(Application.ExeName) + 'Logo_Principal.jpg';

  if ( FileExists(sFileImage) ) then
    imgFundo.Picture.LoadFromFile(sFileImage)
  else
  begin
    imgEmpresa.Visible  := False;
    ProductName.Visible := False;
    Version.Visible     := False;
    FileDescription.Visible := False;
    Copyright.Visible       := False;
  end;

  // Configurar Legendas de acordo com o segmento
  nmProduto.Caption  := Copy(StrDescricaoProduto, 1, Length(StrDescricaoProduto) - 1);
  btnProduto.Caption := Copy(StrDescricaoProduto, 1, Length(StrDescricaoProduto) - 1);
  nmRelatorioProduto.Caption := Copy(StrDescricaoProduto, 1, Length(StrDescricaoProduto) - 1);
  mnRelatorioEstoqueProduto.Caption := Copy(StrDescricaoProduto, 1, Length(StrDescricaoProduto) - 1);

  if GetSegmentoID(GetEmpresaIDDefault) = SEGMENTO_MERCADO_CARRO_ID
    then
     begin
      VeculoMovimentao1.Visible := true;
      nmConultarVendaItem.Visible := false;
     end
    else
     begin
      VeculoMovimentao1.Visible := false;
      nmConultarVendaItem.Visible := true;
     end;

  if not DelphiIsRunning then
  begin
    eap.Active := False;
    eap.IdApplication := 99832505;
    eap.Active := True;
  end;

  FAcesso := False;
  SetSistema(0, Application.Title, GetVersion);
  RegistrarRotinasMenu;
end;

procedure TfrmPrinc.nmGerarBoletoClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'frmGeGerarBoleto');
end;

procedure TfrmPrinc.nmRemessaBoletoClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'frmGeRemessaBoleto');
end;

procedure TfrmPrinc.nmRetornoBoletoClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'frmGeRetornoBoleto');
end;

procedure TfrmPrinc.nmPromocoesClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'frmGePromocao');
end;

procedure TfrmPrinc.nmContaCorrenteClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'frmGeContaCorrente');
end;

procedure TfrmPrinc.nmGerenciaCaixaClick(Sender: TObject);
begin
  MostrarTabelaCaixa(Self);
end;

procedure TfrmPrinc.nmAberturaCaixaClick(Sender: TObject);
begin
  if ( AbrirCaixa(Self, GetUserApp) ) then
    ShowInformation('Caixa aberto com sucesso!');
end;

procedure TfrmPrinc.nmEncerramentoCaixaClick(Sender: TObject);
begin
  if ( FecharCaixa(Self, GetUserApp) ) then
    ShowInformation('Caixa encerrado com sucesso!');
end;

procedure TfrmPrinc.nmFluxoDeCaixaClick(Sender: TObject);
begin
  MostrarTabelaFluxoCaixas(Self);
end;

procedure TfrmPrinc.mnRelatorioFaturamentoVendasClick(Sender: TObject);
begin
  //FormFunction.ShowModalForm(Self, 'frmRelVendas');
  Application.CreateForm(TfrmRelVendas, frmRelVendas);
  frmRelVendas.grpRanking.Visible := False;
  frmRelVendas.btnRanking.Visible:= false;
  frmRelVendas.ShowModal;
  frmRelVendas.Destroy;
end;

procedure TfrmPrinc.nmFabricanteProdutoClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'frmGeFabricante');
end;

procedure TfrmPrinc.nmUsuarioAlterarSenhaClick(Sender: TObject);
begin
  if ( FormFunction.ShowModalForm(Self, 'frmGrUsuarioAlterarSenha') ) then
    Self.Update;
end;

procedure TfrmPrinc.nmExportarNFeGeradaClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'frmGeExportarNFeGerada');
end;

procedure TfrmPrinc.mnRelatorioEstoqueProdutoClick(Sender: TObject);
begin
  FormFunction.ShowFormReport(Self, 'frmRelProdutos', 'qckrp');
end;

procedure TfrmPrinc.mnRelatorioFinanceiroPorFormaPagtoClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'frmRelVendasFormPag');
end;

procedure TfrmPrinc.mnRelatorioEstoqueDemandaClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'frmRelEstoque');
end;

procedure TfrmPrinc.nmConultarVendaItemClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'FrmGeVendaItemPesquisa');
end;

procedure TfrmPrinc.nmRotatividadeClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'FrmGeProdutoRotatividadePRC');
end;

procedure TfrmPrinc.nmInutilizarNumeroNFeClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'frmGeInutilizarNumeroNFe');
end;

procedure TfrmPrinc.nmConfiguracaoEmpresaClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'frmGeConfiguracaoEmpresa');
end;

procedure TfrmPrinc.nmEstoqueMinimoClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'FrmGeProdutoEstoqueMinimo');
end;

procedure TfrmPrinc.nmConsultarLoteNFeClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'frmGeConsultarLoteNFe');
end;

procedure TfrmPrinc.VeculoMovimentao1Click(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'frmMovVeic');
end;

procedure TfrmPrinc.Minimo1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmRelEstoqMinimo, frmRelEstoqMinimo);
  frmRelEstoqMinimo.ShowModal;
  frmRelEstoqMinimo.Destroy;
end;

procedure TfrmPrinc.nmGerarArquivoNFCClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'frmGeExportarNFC');
end;

procedure TfrmPrinc.miCarregarLicencaClick(Sender: TObject);
var
  sCNPJ : String;
begin
  if DMBusiness.opdLicenca.Execute then
  begin
    DMBusiness.ValidarLicenca(DMBusiness.opdLicenca.FileName, sCNPJ);
    if (sCNPJ <> gLicencaSistema.CNPJ) then
      ShowStop('Licen�a', 'Arquivo de licen�a inv�lido para o cliente!' + #13 + 'Favor entrar em contato com suporte.')
    else
    begin
      DMBusiness.LimparLicenca;
      DMBusiness.CarregarLicenca(DMBusiness.opdLicenca.FileName);

      ShowInformation('Licen�a', 'Arquivo para licen�a de uso do software carregado com sucesso.');
    end;
  end;
end;

procedure TfrmPrinc.miConfigurarAmbienteClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'frmGrConfigurarAmbiente');
end;

procedure TfrmPrinc.RankingdeProdutos1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmRelVendas, frmRelVendas);
  with frmRelVendas  do
  begin
   grpRanking.Visible := true;
   btnRanking.Visible:= true;
   grpbxVendedor.Visible := false;
   GroupBox2.Visible := false;
   btbtnLista.Visible:=false;
   ShowModal;
   Destroy;
  end;


end;

procedure TfrmPrinc.Veculos1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmRelEstoqVeic, frmRelEstoqVeic);
 // frmRelEstoqVeic.ShowModal;
  frmRelEstoqVeic.ibqryEstoqVeic.Open;
  frmRelEstoqVeic.qckrp.Preview;
  frmRelEstoqVeic.ibqryEstoqVeic.Close;
  frmRelEstoqVeic.Destroy;

end;

procedure TfrmPrinc.nmCartaCorrecaoNFeClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'frmGeCartaCorrecao');
end;

procedure TfrmPrinc.nmUsuarioPerfilClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'frmGrUsuarioPerfil');
end;

procedure TfrmPrinc.RegistrarRotinasMenu;
begin
  // Menus

  SetRotinaSistema(ROTINA_TIPO_MENU, ROTINA_MENU_CADASTRO_ID,   'Cadastro', EmptyStr);
  SetRotinaSistema(ROTINA_TIPO_MENU, ROTINA_MENU_ENTRADA_ID,    'Estoque',  EmptyStr);
  SetRotinaSistema(ROTINA_TIPO_MENU, ROTINA_MENU_MOVIMENTO_ID,  'Faturamento', EmptyStr);
  SetRotinaSistema(ROTINA_TIPO_MENU, ROTINA_MENU_NOTAFISCAL_ID, 'Notas Fiscais', EmptyStr);
  SetRotinaSistema(ROTINA_TIPO_MENU, ROTINA_MENU_CONSULTA_ID,   'Consultas',  EmptyStr);
  SetRotinaSistema(ROTINA_TIPO_MENU, ROTINA_MENU_FINANCEIRO_ID, 'Financeiro', EmptyStr);
  SetRotinaSistema(ROTINA_TIPO_MENU, ROTINA_MENU_RELATORIO_ID,  'Relat�rios', EmptyStr);
  SetRotinaSistema(ROTINA_TIPO_MENU, ROTINA_MENU_AJUDA_ID,      'Ajuda',      EmptyStr);

  // Sub-menus

  SetRotinaSistema(ROTINA_TIPO_MENU, ROTINA_MENU_TAB_AUXILIAR_ID,    'Tabelas Auxiliares',        ROTINA_MENU_CADASTRO_ID);
  SetRotinaSistema(ROTINA_TIPO_MENU, ROTINA_MENU_REL_ESTOQUE_ID,     'Relat�rios de Estoque',     ROTINA_MENU_RELATORIO_ID);
  SetRotinaSistema(ROTINA_TIPO_MENU, ROTINA_MENU_REL_ENTRADA_ID,     'Relat�rios de Entradas',    ROTINA_MENU_RELATORIO_ID);
  SetRotinaSistema(ROTINA_TIPO_MENU, ROTINA_MENU_REL_FATURAMENTO_ID, 'Relat�rios de Faturamento', ROTINA_MENU_RELATORIO_ID);
  SetRotinaSistema(ROTINA_TIPO_MENU, ROTINA_MENU_REL_FINANCEIRO_ID,  'Relat�rios do Financeiro',  ROTINA_MENU_RELATORIO_ID);

  // Cadastros

  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_CAD_EMPRESA_ID,    'Cadastro da Empresa(s)',   ROTINA_MENU_CADASTRO_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_CAD_CLIENTE_ID,    'Cadastro da Clientes',     ROTINA_MENU_CADASTRO_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_CAD_FORNECEDOR_ID, 'Cadastro da Fornecedores', ROTINA_MENU_CADASTRO_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_CAD_VENDEDOR_ID,   'Cadastro da Vendedores',   ROTINA_MENU_CADASTRO_ID);

  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_CAD_CONFIG_EMP_ID, Trim(nmConfiguracaoEmpresa.Caption), ROTINA_MENU_CADASTRO_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_CAD_CONFIG_NFE_ID, Trim(nmConfigurarNFeACBr.Caption),   ROTINA_MENU_CADASTRO_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_CAD_CONFIG_AMB_ID, Trim(miConfigurarAmbiente.Caption),  ROTINA_MENU_CADASTRO_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_CAD_GERAR_SENH_ID, Trim(nmSenhaAutorizacao.Caption),    ROTINA_MENU_CADASTRO_ID);

  // Entradas

  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_ENT_AJUSTE_ID, Trim(nmAjusteManual.Caption), ROTINA_MENU_ENTRADA_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_ENT_KARDEX_ID, Trim(nmKardex.Caption),       ROTINA_MENU_ENTRADA_ID);

  // Notas Fiscais

  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_NFE_INUTILIZAR_NRO_ID,  Trim(nmInutilizarNumeroNFe.Caption),    ROTINA_MENU_NOTAFISCAL_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_NFE_CONSULTA_RECIBO_ID, Trim(nmConsultarLoteNFe.Caption),       ROTINA_MENU_NOTAFISCAL_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_NFE_EXPORTAR_NFE_ID,    Trim(nmExportarNFeGerada.Caption),      ROTINA_MENU_NOTAFISCAL_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_NFE_GERAR_ARQUI_NFC_ID, Trim(nmGerarArquivoNFC.Caption),        ROTINA_MENU_NOTAFISCAL_ID);

  // Consultas

  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_CNS_CONSULTA_VENDA_ID,       Trim(nmConultarVendaItem.Caption), ROTINA_MENU_CONSULTA_ID);

  // Financeiro

  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_FIN_ABRIR_CAIXA_ID,     Trim(nmAberturaCaixa.Caption),            ROTINA_MENU_FINANCEIRO_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_FIN_ENCERRAR_CAIXA_ID,  Trim(nmEncerramentoCaixa.Caption),        ROTINA_MENU_FINANCEIRO_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_FIN_GERAR_BOLETO_ID,    Trim(nmGerarBoleto.Caption),              ROTINA_MENU_FINANCEIRO_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_FIN_GERAR_REMESSA_ID,   Trim(nmRemessaBoleto.Caption),            ROTINA_MENU_FINANCEIRO_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_FIN_PROCESSA_RETORN_ID, Trim(nmRetornoBoleto.Caption),            ROTINA_MENU_FINANCEIRO_ID);

  // Relat�rios

  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_REL_CLIENTE_ID,      Trim(nmRelatorioCliente.Caption),        ROTINA_MENU_RELATORIO_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_REL_FORNECEDOR_ID,   Trim(nmRelatorioFornecedor.Caption),     ROTINA_MENU_RELATORIO_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_REL_PRODUTO_ID,      Trim(nmRelatorioProduto.Caption),        ROTINA_MENU_RELATORIO_ID);

  // Relat�rios -> Faturamento


  // Relat�rios -> Entradas


  // Relat�rios -> Financeiro


end;

procedure TfrmPrinc.nmUsuarioClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'frmGrUsuario');
end;

end.
