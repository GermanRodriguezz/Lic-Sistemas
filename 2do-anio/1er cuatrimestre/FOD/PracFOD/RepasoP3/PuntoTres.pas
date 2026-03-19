program tres;
const
type
var

novelas = record
	codigo : integer;
	genero : integer;
	nombre : apellido;
	duracion : integer;
	director : string;
	precio : real;
end;

archivo = file of novelas;

procedure leerNovelas(var nov:novelas);
begin
	writeln('Ingrese codigo de novelas');
	readln(nov.codigo);
	if nov.codigo <> valorAlto then begin
		readln(nov.genero);
		readln(nov.nombre);
		readln(nov.duracion);
		readln(nov.director);
		readln(nov.precio);
	end;
end;

procedure cargarMaestro(var mae:archivo);
var nov: novelas;
begin
	reset(mae);
	nov.codigo := 0;
	write(mae,nov);
	leerNovelas(nov);
	while nov.codigo <> valorAlto do begin
		write(mae,nov);
		leerNovelas(nov);
	end;
	close(mae);
end;

procedure DardeAlta(var mae:archivo);
var nov,cabecera : novela; pos : integer;
begin
	writeln('Ingresar datos a agregar');
	leerNovelas(nov);
	reset(mae);
	read(mae,cabecera);{leo cabecera}
	if cabecera.codigo < 0 then begin {si tengo un numero negativo}
		pos := -cabecera.codigo; 
		seek(mae,pos); {voy a la posicion que está libre}
		read(mae,cabecera);{me guardo la informacion de esa posicion, en el registro cabecera}
		
		seek(mae,0); {vuelvo a la posicion de la cabecera}
		write(mae,cabecera); {copio lo que me traje de la posicion libre}
		
		seek(mae,pos); {vuelvo a la posicion libre}
		write(mae,nov); {copio el nuevo registro}
	end
	else begin
		seek(mae,filesize(mae));
		write(mae,nov);
	end;
	close(mae);
end;

procedure eliminar(var mae:archivo);
var regmae, cabecera : novela; pos : integer;
begin
	writeln('Ingresar codigo novela a eliminar');
	readln(codigo);
	reset(mae);
	leerMae(mae,cabecera);
	leerMae(mae,regmae);
	while regmae.codigo <> valorAlto do begin
		if regmae.codigo = codigo then begin
			pos := filepos(mae)-1; {me guardo la posicion donde encontre}
			seek(mae,pos); {voy a la posicion donde encontre}
			write(mae,cabecera); {pego el contenido de la cabecera}
			
			seek(mae,0); {vuelvo al registro cabecera}
			regmae.codigo := -pos; {defino cual fue la ultima posicion eliminada}
			write(mae,reg); {pego el nuevo registro cabecera}
			break
		end
		else
			leerMae(mae,regmae);
	end;
	close(mae);	
end;















begin
end.
