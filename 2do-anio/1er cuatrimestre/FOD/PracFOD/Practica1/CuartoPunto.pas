program CuartoPunto;
type

empleado = record
	numeroEmple : integer;
	nombre : string;
	apellido : string;
	edad : integer;
	dni : string;
end;

archivo_empleado = file of empleado;
ArchivoText = Text;
procedure leerEmpleado(var e:empleado);
begin
	writeln('ingrese dni del empleado'); readln(e.dni);
	if (e.dni <> '999') then begin {CONDICION DE CORTE PARA QUE DEJE DE AGREGAR EMPLEADOS}
		writeln('ingrese apellido del empleado'); readln(e.apellido);
		writeln('ingrese nombre'); readln(e.nombre);
		writeln('ingrese numero del empleado'); readln(e.numeroEmple);
		writeln('ingrese edad del empleado'); readln(e.edad);
	end;		
end;

procedure inciso4a(var a:archivo_empleado);
var e: empleado; cant: integer;
begin
	cant := 0;
	reset(a);
	seek(a , filesize(a));
	writeln(' Se agregaran empleados al final del archivo!');
	leerEmpleado(e);
	while (e.dni <> '999') do begin
		cant := cant + 1;
		write(a, e);
		writeln('Se agrego exitosamente ');
		leerEmpleado(e);
	end;
	writeln('Se agregaron ', cant ,' empleados ' );
	close(a);
end;

procedure inciso4b(var a :archivo_empleado);
var
	empleado_a_modificar,edad,num: integer;
	emp: empleado;
	si : boolean;
begin
	reset(a);
	empleado_a_modificar := 1; 					{EL PUNTERO ESTA PARADO EN LA PRIMER POSICIN DEL ARCHIVO}
	writeln('Ingrese el numero de empleado a modificar'); readln(num);
	si := False;
	while (not eof(a)) and (not si) do begin
		read(a,emp); 						{ME TRAIGO LA INFORMACION DEL EMPLEADO Y AVANZÓ A LA SIGUIENTE POSICION EL PUNTERO} 		
		if (emp.numeroEmple <> num) then 		{EVALUO EL NUMERO DE EMPLEADO DE LA PRIMER POSICION}
			empleado_a_modificar := empleado_a_modificar + 1 {SI ES DISTINTO ENTONCES INDICO QUE SE CAMBIO DE POSICION}
		else 
			if (emp.numeroEmple = num) then begin
				writeln('El nombre del empleado a modificar es : ', emp.nombre, ' y su edad era : ', emp.edad);
				seek(a, (empleado_a_modificar)-1); 				{ME PARO EN LA POSICION DEL EMPLEADO DONDE ME DETUVE EL RECORRIDO}
				read(a, emp);								{ME TRAIGO LA INFORMACION DEL EMPLEADO QUE MODIFICARE}
				write(' Edad nueva : '); read(edad);
				emp.edad := edad; 							{MODIFICO LA EDAD DEL EMPLEADO QUE ME TRAJE}
				seek(a, (empleado_a_modificar)-1);			{NECESITO LA POSICION DEL EMPLEADO QUE SALIO A MODIFICAR}
				write(a , emp);			
				si := True;
			end
	end;	
	if (si) then
		writeln('Se modifico la edad')
	else
		writeln('No se modifico la edad');
	close(a);
end;

procedure inciso4c(var a:archivo_empleado; var a2:ArchivoText);
var
	empA: empleado; linea:string;
begin
	reset(a); rewrite(a2);
	writeln(a2,' Nombre	|	Dni 	|	Edad	');
	writeln(a2,'--------------------------------');
	while not eof(a) do begin		{ACA CARGO LA INFORMACION DE UN ARCHIVO A OTRO}
		read(a,empA);
		writeln(a2,empA.nombre,' |	',empA.dni,'| 	',empA.edad);
	end;
	close(a);
	close(a2);{UNA VEZ CARGADO EL ARCHIVO DE TEXTO,LO CIERRO}
	
	reset(a2);{ABRO EL ARCHIVO DE TEXTO CARGADO ANTERIORMENTE Y LO RECORRO} {IMPRIMO LA INFORMACION DEL ARCHIVO}
	while not eof(a2) do begin
		readln(a2,linea); {ME TRAIGO LA INFORMACION DE A2 Y ME LA GUARDO EN LA VARIABLE LINEA}
		writeln(linea);
	end;
	close(a2);
end;

var
archivo : archivo_empleado; 
{e: empleado;}
archivo2 : Text;
begin
writeln('Se traera el archivo del punto 3');
assign(archivo, 'ArchivoDeEmpleados');
reset(archivo);

	{writeln('ingresar datos del empleado');
	leerEmpleado(e);
	while (e.apellido <> 'fin') do begin
		write(archivo, e);
		leerEmpleado(e);
	end;}
inciso4a(archivo);
inciso4b(archivo);

assign(archivo2, 'todos_empleados');
inciso4c(archivo, archivo2);


end.
