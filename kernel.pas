{
This file is part of Jacqueline: an experimental i386 bootable application
Copyright (C) 2020 Dani Rodríguez <dani@danirod.es>

kernel.pas - this is where the Pascal implementation begins
}

unit kernel;

interface

procedure kernelMain();

implementation

procedure kernelMain(); [public name 'kernelMain'];
var
	i: integer;
	value: byte = $cf;
	screenbuf: pchar = pchar($b8000);
begin
	for i := 0 to 80 * 25 * 2 do begin
		screenbuf[i] := char(value);
		value := value + $be;
	end
end;

end.
