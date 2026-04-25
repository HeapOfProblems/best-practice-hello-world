unit comma6;

interface

procedure print_comma6; cdecl; public name 'print_comma6';

implementation

function putchar(c: LongInt): LongInt; cdecl; external 'c' name 'putchar';

procedure print_comma6; cdecl;
begin
  putchar(Ord(','));
end;

end.
