program GerarLicenca;

uses
  Forms,
  UGrGerarLicenca in 'UGrGerarLicenca.pas' {FrmGrGerarLicenca},
  UConstantesDGE in '..\Sys\UConstantesDGE.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Gerar Licen�a de Uso';
  Application.CreateForm(TFrmGrGerarLicenca, FrmGrGerarLicenca);
  Application.Run;
end.
