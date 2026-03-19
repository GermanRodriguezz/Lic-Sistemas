program tercerPunto;
type

empleado = record
	numeroEmple : integer;
	nombre : string;
	apellido : string;
	edad : integer;
	dni : string;
end;

archivo_empleado = file of empleado;

procedure leerEmpleado(var e:empleado);
begin
	writeln('ingrese apellido del empleado'); readln(e.apellido);
	if e.apellido <> 'fin'then begin
		writeln('ingrese nombre'); readln(e.nombre);
		writeln('ingrese dni del empleado'); readln(e.dni);
		writeln('ingrese numero del empleado'); readln(e.numeroEmple);
		writeln('ingrese edad del empleado'); readln(e.edad);
	end;		
end;

procedure incisoB(var a: archivo_empleado);
var emp: empleado;
begin
	reset(a);
	while not eof(a) do begin
		read(a, emp);
		write('Numero del empleado : ' , emp.numeroEmple);
		write(' Nombre :', emp.nombre);
		write(' Apellido : ', emp.apellido);
		write(' Edad del empleado : ', emp.edad);
		writeln(' Dni del empleado : ', emp.dni);
	end;
	close(a);
end;

procedure incisoC(var a:archivo_empleado);
var
	e:empleado;
begin
reset(a);
	read(a,e);
	while not eof(a) do begin
		if e.edad > 70 then 
			write('El empleado de dni ' , e.dni, ' y de nombre ', e.nombre , e.apellido, ' esta proximo a jubilarse ' );
		read(a, e);
	end;
close(a);
end;

var
archivo : archivo_empleado; 
e: empleado;
begin

writeln('se creara archivo');
assign(archivo, 'ArchivoDeEmpleados');
rewrite(archivo);
writeln('ingresar datos del empleado');
	leerEmpleado(e);
	while (e.apellido <> 'fin') do begin
		write(archivo, e);
		leerEmpleado(e);
	end;
close(archivo);
incisoB(archivo);
incisoC(archivo);
end.
