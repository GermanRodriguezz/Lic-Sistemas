program ocho;
const valorAlto = '9999';
type

distribucion = record
	nombre: string;
	anio_lanz : integer;
	num_version : integer;
	cant_dev : integer;
	descrip : string;
end;

linux = file of distribucion;

procedure leer(var archivo : linux; var reg: distribucion);
begin
	if not eof(archivo) then
		read(archivo,reg)
	else
		reg.nombre := valorAlto;
end;

procedure BuscarDistribucion(var archivo : linux; nombre: string; var pos: integer);
var reg,cab: distribucion;
begin
	pos := -1;
	reset(archivo);
	leer(archivo,cab); {reg 0}
	leer(archivo,reg);{reg 1}
	while reg.nombre <> valorAlto and pos = -1 do begin
		if reg.nombre = nombre then begin
			pos := (filepos(archivo)-1);
		end
		else
			leer(archivo,reg);
	end;
	close(archivo);
	if pos <> -1 then
		writeln('Encontre el nombre a buscar')
	else
		writeln('No encontre el nombre a buscar');
end;

procedure AltaDistribucion(var archivo:linux; regNuevo: distribucion);
var pos: integer; cab, reg: distribucion;
begin
	buscarDistribucion(archivo, regNuevo.nombre,pos);
	if pos = -1 then begin
		reset(archivo);
		leer(archivo,cab);
		if cab.anio_lanz < 0 then begin {obtengo la pos disponible del archivo}
			posLibre := -cab.cant_dev;
			seek(archivo,posLibre);
			read(archivo,reg);
			
			seek(archivo,0);
			write(archivo,reg);
			
			seek(archivo,posLibre);
			write(archivo,regNuevo);
			
			writeln('Agregue una distribucion en una posicion disponible!');
		end
		else begin
			seek(archivo,filesize(archivo));
			write(archivo,regNuevo);
			writeln('Agregue distribucion al final del archivo');
		end;
		close(archivo);
	end
	else
		writeln('Ya existe la distribucion');
end;

procedure BajaDistribucion(var archivo: linux; nombre: string);
var cab, reg: distribucion;
begin
	buscarDistribucion(archivo,nombre,pos);
	if pos <> - 1 then begin
		reset(archivo);
		leer(archivo,cab); {me guardo los valores de la cabecera}
		
		seek(archivo,pos); {voy hasta la posicion donde esta mi distribucion a dar de baja}
		read(archivo,reg); {de esa posicion me guardo su registro}
		reg.cant_dev := -pos; {voy a ponerle en el campo ese,el valor que tenga la cabecera,que puede llegar a ser otra posicion del archivo libre}
		{preparo el enlace}
		seek(archivo,filepos(archivo)-1);
		{hago el enlace}
		write(archivo,cab);
		{vuelvo a la cabecera}
		seek(archivo,0);
		{escribo la cabecera}
		write(archivo,reg);
		close(archivo);
	end
	else
		writeln('Distribucion no existente');
end;


















var
begin
end.
