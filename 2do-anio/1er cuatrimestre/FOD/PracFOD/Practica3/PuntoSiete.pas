program PuntoSiete;
const valorAlto = 9999;
type
	aves = record
		codigo : integer;
		nombre_especie : string;
		familia_ave : string;
		descripcion : string;
		zona_geo : integer;
	end;

Maestro = file of aves;

procedure cargarMaestro(var mae:Maestro);
var
	carga:Text; regmae: aves;
begin
	assign(mae,'Maestro');
	rewrite(mae);
	assign(carga,'maestro.txt');
	reset(carga);
	while not eof(carga) do begin
		with regmae do begin
			readln(carga,codigo,zona_geo,nombre_especie);
			readln(carga,descripcion);
			write(mae,regmae);
		end;
	end;
	close(mae);
	close(carga);
end;

procedure leer(var mae:Maestro; var reg:aves);
begin
	if not eof(mae) then
		read(mae,reg)
	else
		reg.codigo := valorAlto;
end;

procedure bajaLogica(var mae:Maestro; codigo: integer);
var reg: aves; pos: integer;
begin
	reset(mae);
	leer(mae,reg);
	while reg.codigo <> valorAlto do begin
		if reg.codigo = codigo then begin
			pos := filepos(mae)-1;
			seek(mae,pos);
			reg.codigo := -reg.codigo;
			write(mae,reg);
			writeln('se encontro el codigo y se lo borro logicamente');
			break;
		end;
		leer(mae,reg);
	end;
	close(mae);
end;

procedure bajaFisica(var mae:Maestro);
var eliminados,posAct,posUlt : integer; reg,regUlt : aves;
begin
	eliminados := 0;
	reset(mae);
	while filepos(mae) < filesize(mae) do begin
		leer(mae,reg);
		if reg.codigo < 0 then begin {si el reg esta dado de baja}
			posAct := filepos(mae)-1; {-1 porque cuando lei antes,pase a la siguiente}
			repeat
				posUlt := filesize(mae)- 1 - eliminados;
				seek(mae,posUlt); {voy a la ultima posicion del archivo}
				read(mae,regUlt); {saco el registro que esta la pos ultima valida}
				eliminados := eliminados + 1;
			until (regUlt.codigo > 0) or (posAct >= posUlt); {si encontre un registro valido o estoy parado en la misma posicion ,salgo}
			if posAct < posUlt then begin {si sali porque encontre un registro no dado de baja}
				seek(mae,posAct); {voy a mi posicion donde encontre el registro dado de baja}
				write(mae,regUlt); {le pongo el registro que estaba "ultimo"}
				seek(mae,posAct); {vuelvo atras porque avance con el write}
			end;
		end;
	end;
	seek(mae,(filesize(mae)-eliminados)); {me paro en la posicion donde no hay registros que elimine}
	Truncate(mae);
	close(mae);
end;

var
  mae: Maestro;
  opcion, codigo: integer;
begin
  writeln('1. Cargar archivo maestro desde texto');
  writeln('2. Borrar especie (baja lógica)');
  writeln('3. Compactar archivo (baja física)');
  writeln('4. Salir');
  repeat
    write('Ingrese una opción: ');
    readln(opcion);
    case opcion of
      1: cargarMaestro(mae);
      2:
        begin
          write('Ingrese el código de la especie a borrar: ');
          readln(codigo);
          bajaLogica(mae, codigo);
        end;
      3: bajaFisica(mae);
    end;
  until opcion = 4;
end.
