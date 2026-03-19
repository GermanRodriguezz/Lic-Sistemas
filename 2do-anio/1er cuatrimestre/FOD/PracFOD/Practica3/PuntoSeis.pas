program PuntoSeis;
const valorAlto = 9999;
type
infoMaestro = record
	cod_prenda : integer;
	descrip : string;
	colores : string;
	tipo_prenda : integer;
	stock : integer;
	precio_unitario : real;
end;

reg_prenda = record
	cod : integer;
end;

Maestro = file of infoMaestro;
DetalleDeBajas = file of reg_prenda;

procedure cargarMaestro(var mae:Maestro); {se dispone}
procedure cargarDetalle(var det:DetalleDeBajas);
var carga: Text; reg: reg_prenda;
begin
	assign(carga,'DetalleBajas.txt');
	reset(carga);
	assign(det,'BinarioBajas');
	rewrite(det);
	while not eot(carga) do begin
		with reg do
			read(carga,cod);
			write(det,reg);
	end;
end;

procedure leer(var arch: Maestro; var reg: infoMaestro);
begin
  if not eof(arch) then
    read(arch, reg)
  else
    reg.cod_prenda := valorAlto;
end;

procedure leerDet(var det: DetalleDeBajas; var reg: reg_prenda);
begin
  if not eof(det) then
    read(det, reg)
  else
    reg.cod_prenda := valorAlto;
end;


procedure CambioDeTemporada(var archivo: Maestro; var det:DetalleDeBajas);
var
  regmae : infoMaestro;
  regdet : reg_prenda;
  pos    : integer;
begin
  reset(det); {abro el detalle primero}
  leerDet(det, regdet);
  while regdet.cod <> valorAlto do begin
    reset(archivo); {por cada reg del detalle, abro el maestro}
    leer(archivo, regmae);
    while regmae.cod_prenda <> valorAlto do begin
      if regmae.cod_prenda = regdet.cod then begin
        regmae.stock := -regmae.stock;  // baja lógica
        pos := filepos(archivo) - 1;
        seek(archivo, pos);
        write(archivo, regmae);
        break;  // ya lo procesé, corto la búsqueda en el maestro
      end;
      leer(archivo, regmae);
    end;
    leerDet(det, regdet);
  end;
  close(archivo);
  close(det);
end;

procedure EfectivizarBajas(var mae:Maestro; var nueMae: Maestro);
var regmae: infoMaestro;
begin
	reset(mae);
	assign(nueMae,'Auxiliar');
	rewrite(nueMae);
	leer(mae,regmae);
	while regmae.cod <> valorAlto do begin
		if regmae.stock > 0 then
			write(nueMae,regmae);
		leer(mae,regmae);{salto ese registro}
	end;
	rename(nueMae,'ArchivoPrincipal');
	rename(mae,'ExArchivoPrincipal');
end;

var
	mae,nueMae: Maestro; det: DetalleDeBajas;
begin
cargarMaestro(mae);
cargarDetalle(det);
CambioDeTemporada(mae,det);
EfectivizarBajas(mae,nueMae);
end.
