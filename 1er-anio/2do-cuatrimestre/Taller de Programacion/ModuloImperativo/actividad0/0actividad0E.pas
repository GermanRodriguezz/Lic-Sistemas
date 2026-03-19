program puntoE;
var a,b,f,ale: integer;
begin
	randomize;
	writeln('ingrese num A');
	readln(a);
	
	writeln('ingrese num B');
	readln(b);
	
	writeln('ingrese num F');
	readln(f);
	
	ale := random(b-a+1)+a;
	
	while ale <> f do begin
		ale := random (b-a+1)+a;
		writeln('el num generado es ', ale);
	end;
	writeln('se ingreso un valor igual a f');
end.
