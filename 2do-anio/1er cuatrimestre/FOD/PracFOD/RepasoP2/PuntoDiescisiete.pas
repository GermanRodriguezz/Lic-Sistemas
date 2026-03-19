program unosiete;
const valorAlto = 9999; cant = 10;
type
moto = record
	codigo : longint;
	nombre : string[30];
	descripcion : string;
	modelo : string[20];
	marca : string[15];
	stockActual : integer;
end;
	
infodetalle = record
	codmoto : longint;
	precio: real;
	fechaventa : integer;
end;

detalle = file of infodetalle;
detalles = array [1..cant] of detalle;
registros = array [1..cant] of infodetalle;
maestro = file of moto;

procedure leerMae(var mae: maestro; var reg: moto);
begin
	if not eof(mae) then
		read(mae,reg)
	else
		reg.codigo := valorAlto;
end;

procedure leerDet(var det: detalle; var reg: infodetalle);
begin
	if not eof(det) then
		read(det,reg)
	else
		reg.codmoto := valorAlto;
end;

procedure minimo(var det : detalles; var regs : registros ; var min: infodetalle);
var pos,i : integer;
begin
	min.codmoto := valorAlto;
	for i := 1 to cant do begin
		if regs[i].codmoto < min.codmoto then begin
			pos := i;
			min := regs[i];
		end;
	end;
	leerDet(det[pos],regs[pos]);
end;

procedure actualizarMaestro(var mae: maestro; var det:detalles);
var i,vendidas,motoact,max : integer; regs: registro; regmae: moto; marca,nombre : string;
begin
	max := -1;
	reset(mae);
	for i := 1 to cant do begin
		reset(det[i]);
		leerDet(det[i],regs[i]);
	end;
	minimo(det,regs,min);
	while min.codmoto <> valorAlto do begin
		motoact := min.codmoto;
		vendidas := 0;
		while motoact = min.codmoto do begin
			vendidas := vendidas + 1;
			minimo(det,regs,min);
		end;
		leerMae(mae,regmae);
		while regmae.codigo <> motoact do
			leerMae(mae,regmae);
		if vendidas > max then begin
			max := vendidas;
			nombre := regmae.nombre;
			marca := regmae.marca;
		end;
		regmae.stockActual := regmae.stockActual - vendidas;
		seek(mae,filepos(mae)-1);
		write(mae,regmae);
	end;
	close(mae);
	for i := 1 to cant do 
		close(det[i]);
	writeln('La moto mas vendida fue ; ',nombre ,' , Marca ',marca);
end;

var
begin
end.
