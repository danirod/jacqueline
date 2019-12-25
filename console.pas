{
This file is part of Jacqueline: an experimental i386 bootable application
Copyright (C) 2020 Dani Rodríguez <dani@danirod.es>

console.pas - manager for the standard VGA text mode framebuffer
}

unit console;

interface

type
	AnsiColor = (
		Black := #0,
		Blue := #1,
		Green := #2,
		Cyan := #3,
		Red := #4,
		Magenta := #5,
		Brown := #6,
		Gray := #7,
		DarkGray := #8,
		LightBlue := #9,
		LightGreen := #10,
		LightCyan := #11,
		LightRed := #12,
		LightMagenta := #13,
		Yellow := #14,
		White := #15
	);

procedure consoleClearDisplay();
procedure consolePutChar(c: char);
procedure consolePutString(s: pchar);
procedure consoleSetAttributes(foreground, background: AnsiColor);

implementation

const
	FRAMEBUFFER_COLS = 80;
	FRAMEBUFFER_ROWS = 25;
	FRAMEBUFFER_ADDRESS = $b8000;

var
	cursorX: integer = 0;
	cursorY: integer = 0;
	cursorColor: byte = $07;
	framebuffer: pchar = pchar(FRAMEBUFFER_ADDRESS);

procedure consoleClearDisplay();
var
	i: integer;
begin
	cursorX := 0;
	cursorY := 0;
	for i := 0 to FRAMEBUFFER_COLS * FRAMEBUFFER_ROWS * 2 do begin
		framebuffer[i] := #0;
	end;
end;

procedure consoleSetAttributes(foreground, background: AnsiColor);
begin
	cursorColor := (byte(background) and $f << 4) or (byte(foreground) and $f);
end;

procedure consolePutString(s: pchar);
var
	i: integer = 0;
begin
	while s[i] <> #0 do begin
		consolePutChar(s[i]);
		i := i + 1;
	end
end;

procedure consolePutChar(c: char);
var
	index: integer;
begin
	index := (FRAMEBUFFER_COLS * cursorY + cursorX) * 2;
	framebuffer[index] := c;
	framebuffer[index + 1] := char(cursorColor);

	cursorX := cursorX + 1;
	if cursorX >= 80 then begin
		cursorX := 0;
		cursorY := cursorY + 1;
	end
end;

end.
