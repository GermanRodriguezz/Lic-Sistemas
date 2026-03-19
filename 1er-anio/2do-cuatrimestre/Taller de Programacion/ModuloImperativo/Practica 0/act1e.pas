program act1e;
var
	n,f,inf,sup:integer;
begin
	randomize;
	writeln('ingrese el numero f');
	readln(f);
	writeln('ingrese el tope inf');
	readln(inf);
	writeln('ingrese el tope sup');
	readln(sup);
	n:= inf + random(sup-inf)+1;
	while (n <> f) do begin
		n:= inf + random(sup-inf)+1;
		writeln('se genero el ', n);
		readln;
	end;
end.
