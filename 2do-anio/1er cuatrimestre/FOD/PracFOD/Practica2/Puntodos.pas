program PuntoDos;
const valorAlto = 9999;
type
regMaestro = record
	cod: integer;
	nombre : string;
	apellido : string;
	masf : integer;
	macf : integer;
end;

regDetalle = record
	codigo : integer;
	materiaAprobada : integer; {si es 1:aprobo cursada, si es 2 aprobo final}
end;

detalle = file of regDetalle;
maestro = file of regMaestro;

procedure leer(var archivo: detalle; var reg: regDetalle);
begin
	if not eof(archivo) then
		read(archivo,reg)
	else
		reg.codigo := valorAlto;
end;

procedure cargarMaestro(var mae:maestro; var infoMaestro: Text);
var regM: regMaestro;
begin
	assign(infoMaestro, 'infoAlu.txt');
	reset(infoMaestro);
	assign(mae, 'ArchMaestro');
	rewrite(mae);
	while not eof(infoMaestro) do begin
		with regM do begin
			readln(infoMaestro,cod,masf,macf,nombre);
			readln(infoMaestro,apellido);
		end;
		write(mae,regM);
	end;
	writeln('Se cargo el archivo maestro');
	close(mae);
	close(infoMaestro);
end;

procedure cargarDetalle(var det:detalle;var infoDetalle: Text);
var regD: regDetalle;
begin
	assign(infoDetalle,'det.txt');
	reset(infoDetalle);
	assign(det,'ArchDetalle');
	rewrite(det);
	while not eof(infoDetalle) do begin
		with regD do begin
			readln(infoDetalle,codigo,materiaAprobada);
			write(det,regD);
		end;
	end;
	writeln('Se cargo el archivo detalle');
	close(det);
	close(infoDetalle);
end;

procedure actualizar(var mae:maestro; var det:detalle);
var regd: regDetalle; regm: RegMaestro;
begin
	reset(det);
	reset(mae);
	leer(det,regd);
	while regd.codigo <> valorAlto do begin
		read(mae,regm);
		while regm.cod <> regd.codigo do 
			read(mae,regm);
		while regm.cod = regd.codigo do begin
			if regd.materiaAprobada = 1 then
				regm.masf := regm.masf + 1
			else begin
				regm.macf := regm.macf + 1;
				regm.masf := regm.masf - 1; 
			end;
		leer(det,regd); {leo otro para ver si es el mismo cod}
		end;
		seek(mae,filepos(mae)-1);
		write(mae,regm);
	end;
	writeln('Se actualizo el archivo maestro');
	close(mae);
	close(det);
end;

procedure listar(var mae: maestro);
var listaTexto : Text; regm: regMaestro;
begin
	assign(listaTexto, 'ListaAlumnos');
	rewrite(listaTexto);
	reset(mae);
	while not eof(mae) do begin
		read(mae,regm);
		if regm.macf > regm.masf then begin
			writeln(listaTexto, regm.cod,' ', regm.masf,' ',regm.macf,' ',regm.nombre,' ',regm.apellido,'	');
		end;
	end;
	writeln('se enlistaron los datos!');
	close(mae);
	close(listaTexto);
end;

procedure imprimirMae(var mae: Maestro);
var reg: regMaestro;
begin
	reset(mae);
	while not eof(mae) do begin
		read(mae,reg);
		writeln('Codigo = ', reg.cod, ' NombreyApellido = ',reg.nombre,' ', reg.apellido);
	end;
end;

procedure MenuOpciones;
var
	mae: Maestro; det: Detalle; infoMaestro,infoDetalle: Text;
	opc: integer;
begin
	repeat
		writeln('Ingrese un el numero de la operacion que quiera realizar');
		writeln('');
		writeln('Ingrese 1 si quiere cargar maestro');
		writeln('Ingrese 2 si quiere cargar detalle');
		writeln('Ingrese 3 si quiere actualizar el maestro');
		writeln('Ingrese 4 si quiere listar alumnos con mas materias con finales aprobados que materias sin finales aprobados');
		writeln('Ingrese 5 si quiere imprimir el archivo detalle');
		readln(opc);
		case opc of
			1 : cargarMaestro(mae,infoMaestro);
			2 : cargarDetalle(det,infoDetalle);
			3 : actualizar(mae,det);
			4 : listar(mae);
			5 : imprimirMae(mae);
			0 : writeln('Termino el programa!');
		else
			writeln('Numero invalido!');
		end;
	until (opc = 0);
end;

begin
MenuOpciones;
end.
