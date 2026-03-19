program act1;
var ale,n,i,inf,sup: integer;
begin
	writeln('ingrese el n de repeticiones');
	readln(n);
	writeln('ingrese el tope inferior del rango');
	readln(inf);
	writeln('ingrese el tope superior del rango');
	readln(sup);
	for i:= 1 to n do begin
	 randomize;
	 ale:= inf + random(sup-inf)+1;
	 writeln('El numero aleatirio es:',ale);
	 readln;
	end;
end.
