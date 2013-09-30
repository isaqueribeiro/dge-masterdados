unit UCliente;

interface

uses SysUtils, Windows, Classes, UBaseObject;

type

  TTipoCliente = (tcPessoaFisica, tcPessoaJuridica);

  TCliente = class(TBaseObject)
  private
    fTipo    : TTipoCliente;
    fCpfCnpj : String;

    procedure SetTipo(Value : TTipoCliente);
    procedure SetCpfCnpj(Value : String);

    function GetTipo : TTipoCliente;
    function GetCpfCnpj : String;
  public
    property Tipo    : TTipoCliente read GetTipo write SetTipo;
    property CpfCnpj : String read GetCpfCnpj write SetCpfCnpj;

    class function GetInstance() : TCliente;
    destructor Destroy; override;
  end;

implementation

{ TCliente }

var
  _Cliente : TCliente;

destructor TCliente.Destroy;
begin
  _Cliente.Destroy;
  inherited;
end;

function TCliente.GetCpfCnpj: String;
begin
  Result := Trim(fCpfCnpj);
end;

class function TCliente.GetInstance: TCliente;
begin
  if ( _Cliente = nil ) then
    _Cliente := TCliente.Create;
    
  Result := _Cliente;
end;

function TCliente.GetTipo: TTipoCliente;
begin
  Result := fTipo;
end;

procedure TCliente.SetCpfCnpj(Value: String);
begin
  fCpfCnpj := Trim(Value);
end;

procedure TCliente.SetTipo(Value: TTipoCliente);
begin
  fTipo := Value;
end;

end.
