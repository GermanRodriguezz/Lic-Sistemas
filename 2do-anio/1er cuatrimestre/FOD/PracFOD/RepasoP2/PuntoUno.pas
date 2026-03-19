program uno;
const valorAlto := 9999;
type
empleado = record
	codigo : integer;
	nombre : string;
	montoComision : real;
end;

archivoComision : file of empleado;

archivoMaestro : file of empleado;

procedure leerComision(var ac:archivoComision; var e:empleado);
begin
	if not eof(ac) then
		read(ac,e)
	else
		e.codigo := valorAlto;
end;

procedure cargarArchCom(var ar:archivoComision);//se dispone
procedure cargarMaestro(var am: archivoMaestro; var ac: archivoComision);
var e,regm: empleado;
begin
	reset(ac);
	assign(am,'ArchivoMaestroUno');
	rewrite(am);
	leerComision(ac,e); {leo el primer registro del archivo de la informacion}
	while e.codigo <> valorAlto do begin
		regm.codigo := e.codigo; {tomo el primero codigo}
		regm.nombre := e.nombre;
		while codAct = e.codigo do begin {mientras sea el mismo codigo ire acumulando}
			regm.montoComision := regm.montoComision + e.montoComision; {acumulo}
			leerComision(ac,e); {leo el siguiente}
		end;
		{cuando salgo es porque cambio el codigo ¿que hago? copio esos valores en el archivo maestro}
		write(am,regm);
	end;
	close(am);
	close(ac);
end;

var am : archivoMaestro; ac: archivoComision;
begin
cargarArchCom(ac);//se dispone
cargarMaestro(am,ac);
end.
