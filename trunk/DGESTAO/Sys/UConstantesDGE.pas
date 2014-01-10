unit UConstantesDGE;

interface

const
  VERSION_NUMBER = '1.0.3.5';

  SISTEMA_GESTAO = 0;
  SISTEMA_PDV    = 1;
  
  MODELO_NFE  = 55; // NF-e  (Nota Fiscal Eletrônica de Venda)
  MODELO_NFCE = 65; // NFC-e (Nota Fiscal Eletrônica de Venda ao Consumidor Final)

  SEGMENTO_PADRAO_ID          = 0;
  SEGMENTO_VAREJO_ATACADO_ID  = 1;
  SEGMENTO_MERCADO_CARRO_ID   = 2;
  SEGMENTO_SERVICOS_ID        = 3;
  SEGMENTO_VAREJO_SERVICOS_ID = 4;

  TIPO_LOG_TRANS_NOTIFIC = 0;
  TIPO_LOG_TRANS_SEFA    = 1;
  TIPO_LOG_TRANS_SISTEMA = 2;

  DESC_LOG_EVENTO_CANCELAR_NFE_SD = 'Cancelar NF-e de Saída';
  DESC_LOG_EVENTO_CANCELAR_NFE_ET = 'Cancelar NF-e de Entrada';
  DESC_LOG_INUTILIZA_NRO_NFE      = 'Inutilização de numerão para NF-e';
  DESC_LOG_CONSULTAR_NRO_LOTE_NFE = 'Consultar retorno do Lote/Recibo de NF-e';

  SEGMENTO_PADRAO_DS          = 'Padrão';
  SEGMENTO_VAREJO_ATACADO_DS  = 'Produtos a Varejo e Atacado';
  SEGMENTO_MERCADO_CARRO_DS   = 'Comércio de Veículos';
  SEGMENTO_SERVICOS_DS        = 'Serviços';
  SEGMENTO_VAREJO_SERVICOS_DS = 'Produtos a Varejo e Serviços';

  CONTA_CORRENTE_TIPO_CAIXA = 1;
  CONTA_CORRENTE_TIPO_BANCO = 2;

  BOLETO_ARQUIVO_LOGOTIPO = 'Imagens\Emitente.gif';
  BOLETO_IMAGENS          = 'Imagens\';
  BOLETO_LICENCAS         = 'Licencas\';

  LAYOUT_BOLETO_ENTREGA = 'Boleto\Boleto.fr3';
  LAYOUT_BOLETO_CARNE   = 'Boleto\BoletoCarne.fr3';

  CODIGO_BANCO_BRASIL    = 1;
  CODIGO_BANCO_BRADESCO  = 237;
  CODIGO_BANCO_CAIXA     = 104;
  CODIGO_BANCO_HSBC      = 399;
  CODIGO_BANCO_ITAU      = 341;
  CODIGO_BANCO_SANTANDER = 33;

  CONSUMIDOR_FINAL_CODIGO = 1;
  CONSUMIDOR_FINAL_CNPJ   = '99999999999999';
  CONSUMIDOR_FINAL_NOME   = 'CONSUMIDOR FINAL';

  TRIBUTO_ORIGEM_NACIONAL  = '0';
  TRIBUTO_TRIBUTADA_INTEG  = '00';
  TRIBUTO_NAO_TRIBUTADA_SN = '400';

  PORTA_SMTP_PADRAO = 587;

  STR_TAMANHO_NCMSH = 8;

implementation

end.
