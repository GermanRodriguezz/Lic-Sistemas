program PuntoTres;
const valorAlto = 'fin';
type
empleados = record
	num_empleado : integer;
	apellido : string;
	nombre : string;
	edad : integer;
	dni : integer;
end;

archivo = file of empleados;

procedure leer(var arch:archivo; var e:empleados);
begin
	if not eof(arch) then
		read(arch,e)
	else
		e.apellido := valorAlto;
end;

procedure leerEmpleado(var e: empleados);
begin
	writeln('Ingrese apellido');
	readln(e.apellido);
	if e.apellido <> 'fin' then begin
		writeln('Ingrese nombre');
		readln(e.nombre);
		writeln('Ingrese numero de empleado');
		readln(e.num_empleado);
		writeln('Ingrese edad');
		readln(e.edad);
		writeln('Ingrese dni');
		readln(e.dni);
	end
	else
		e.apellido := valorAlto;
end;

procedure CargarArchivo(var arch: archivo);
var e: empleados; nombre: string;
begin
	writeln('Ingresar nombre para el archivo Binario');
	readln(nombre);
	assign(arch,nombre);
	rewrite(arch);
	leerEmpleado(e);
	while e.apellido <> valorAlto do begin
		write(arch,e);
		leerEmpleado(e);
	end;
	close(arch);
end;

procedure ListarNombresApellidos(var arch:archivo);
var dato:string; e: empleados;
begin
	reset(arch);
	leer(arch,e);
	writeln('Ingrese nombre o apellido que quiere listar');
	readln(dato);
	while e.apellido <> valorAlto do begin
		if dato = e.apellido or dato = e.nombre then
			writeln('Datos del empleado :'' Num: ',e.num_empleado,' Apellido: ',e.apellido, ' Nombre: ',e.nombre, ' Edad: ',e.edad, ' Dni: ',e.dni);
		leer(arch,e);
	end;
	close(arch);
end;

procedure ListarCompleto(var arch:archivo);
var e:empleados;
begin
	reset(arch);
	leer(arch,e);
	while e.apellido <> valorAlto do begin
		writeln('Numero ');writeln(e.num_empleado);
		writeln('Apellido '); writeln(e.apellido);
		writeln('Nombre '); writeln(e.nombre);
		writeln('Edad '); writeln(e.edad);
		writeln('Dni '); writeln(e.dni);
		leer(arch,e);
	end;
	close(arch);
end;

procedure ListarMayores(var arch:archivo);
var e:empleados;
begin
	reset(arch);
	leer(arch,e);
	while e.apellido <> valorAlto do begin
		if e.edad > 70 then	
			writeln('Datos del empleado :'' Num: ',e.num_empleado,' Apellido: ',e.apellido, ' Nombre: ',e.nombre, ' Edad: ',e.edad, ' Dni: ',e.dni);
		leer(arch,e);
	end;
	close(arch);
end;

var
arch: archivo; opcion: integer;
begin
write('SELECCIONE UNA OPCION');
writeln('1 - Crear archivo');
writeln('2 - Listar en pantalla datos de empleados con nombre o apellido determinado proporcionado desde teclado');
writeln('3 - Listar en pantalla los empleados de a uno por linea');
writeln('4 - Listar en pantalla los empleados mayores a 70 años');
writeln('0 - Cerrar programa');
readln(opcion);
repeat
	case opcion of
		1: CrearArchivo(arch);
		2: ListarNombresApellidos(arch);
		3: ListarCompleto(arch);
		4: ListarMayores(arch);
	end;
	write('SELECCIONE UNA OPCION');
	writeln('1 - Crear archivo');
	writeln('2 - Listar en pantalla datos de empleados con nombre o apellido determinado proporcionado desde teclado');
	writeln('3 - Listar en pantalla los empleados de a uno por linea');
	writeln('4 - Listar en pantalla los empleados mayores a 70 años');
	writeln('0 - Cerrar programa');
	readln(opcion);
until (opcion = 0);
end.
