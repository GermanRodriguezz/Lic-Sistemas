program PuntoUno;
const valorAlto = 9999;
type
empleado = record
	numeroEmple : integer;
	nombre : string;
	apellido : string;
	edad : integer;
	dni : string;
end;

archivo_empleado = file of empleado;

procedure leer(var archivo: archivo_empleado ; var reg: empleado);
begin
	if not eof(archivo) then
		read(archivo,reg)
	else
		reg.numEmple := valorAlto;
end;

var
	archivo : archivo_empleado;
	reg,regEliminar,regUlt: empleado;
	numEliminar,numReg : integer;
begin
	assign(archivoUno, 'ArchivoUno');
	reset(archivoUno);
	writeln('Se agregara opcion para eliminar registro');
	writeln('---------------------');
	writeln('ingrese numero de registro a eliminar');
	readln(numEliminar);
	if (numEliminar < filesize(archivoUno)) then begin
		writeln('el numero de registro a eliminar se encuentra dentro del archivo');

		seek(archivoUno,numEliminar);
		leer(archivoUno,regEliminar);
		
		seek(archivoUno,filesize(archivoUno)-1);
		leer(archivoUno,regUlt);
		
		seek(archivoUno,numEliminar);
		write(archivoUno,regUlt);
		
		seek(archivoUno,filesize(archivoUno)-1);
		write(archivoUno,regEliminar);
		Truncate(archivo);
	end
	else
		writeln('El numero de registro a eliminar no esta en el archivo');
end.

