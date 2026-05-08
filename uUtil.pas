unit uUtil;

interface

function SoNumeros(const Texto: string): string;

implementation

function SoNumeros(const Texto: string): string;
var
  I: Integer;
begin
  Result := '';
  for I := 1 to Length(Texto) do
  begin
    if Texto[I] in ['0'..'9'] then
      Result := Result + Texto[I];
  end;
end;

end.
