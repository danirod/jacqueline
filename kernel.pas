{
This file is part of Jacqueline: an experimental i386 bootable application
Copyright (C) 2020 Dani Rodríguez <dani@danirod.es>

kernel.pas - this is where the Pascal implementation begins
}

unit kernel;

interface

uses console;

procedure kernelMain();

implementation

procedure kernelMain(); [public name 'kernelMain'];
begin
	consoleClearDisplay();
	consoleSetAttributes(White, Black);
	consolePutString('Hello world');
end;

end.
