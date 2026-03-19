program PrimerPunto;
type
	archivo = file of integer;
var
	arch : archivo;
	arch_nombre : string[15];
	num : integer;
begin
	writeln('ingrese el nombre del archivo');
	readln(arch_nombre);
	assign( arch , arch_nombre);
	rewrite(arch);
	writeln(' ingrese el primero numero ');
	readln(num);
	while (num <> 3000) do begin
		write(arch, num);
		writeln('siga ingresando numeros');
		readln(num);
	end;
	close(arch);
end.
