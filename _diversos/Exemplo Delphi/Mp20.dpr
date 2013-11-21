program mp20;

uses
  Forms,
  mp20mici in 'mp20mici.pas' {Form1},
  Modulo in 'Modulo.pas',
  frmLogo in 'frmLogo.pas' {Form2};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'TestApp';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
