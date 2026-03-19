program punto1;
type

archivo = file of integer;

var
arch : archivo;
num : integer;
nombre : string;

begin
writeln('Ingrese nombre para el archivo binario');
readln(nombre);
assign(arch,nombre);
rewrite(arch);
writeln('Ingrese un numero');
readln(num);
	while num <> 30000 do begin
		write(arch,num);
		readln(num);
	end;
close(arch);
end.
