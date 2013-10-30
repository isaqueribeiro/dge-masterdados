unit UConstantesDGE;

interface

const
  VERSION_NUMBER = '1.0.3.5';

  MODELO_NFE  = 55; // NF-e  (Nota Fiscal Eletrônica de Venda)
  MODELO_NFCE = 65; // NFC-e (Nota Fiscal Eletrônica de Venda ao Consumidor Final)

  SEGMENTO_PADRAO_ID         = 0;
  SEGMENTO_VAREJO_ATACADO_ID = 1;
  SEGMENTO_MERCADO_CARRO_ID  = 2;

  TIPO_LOG_TRANS_NOTIFIC = 0;
  TIPO_LOG_TRANS_SEFA    = 1;
  TIPO_LOG_TRANS_SISTEMA = 2;

  DESC_LOG_INUTILIZA_NRO_NFE      = 'Inutilização de numerão para NF-e';
  DESC_LOG_CONSULTAR_NRO_LOTE_NFE = 'Consultar retorno do Lote/Recibo de NF-e';

  SEGMENTO_PADRAO_DS         = 'Padrão';
  SEGMENTO_VAREJO_ATACADO_DS = 'Varejo e Atacado';
  SEGMENTO_MERCADO_CARRO_DS  = 'Comércio de Veículos';

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

  CODIGO_CONSUMIDOR_FINAL = '99999999999999';

  PORTA_SMTP_PADRAO = 587;

implementation

end.
