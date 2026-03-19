program ocho;
const valorAlto = 9999; cant = 16;
type
infomaestro = record
	codprov : integer;
	nomprov : string[30];
	canthabitantes : integer;
	cantotalk : integer;
end;

infodetalle = record
	codigoprov : integer;
	cantkilos : integer;
end;

maestro = file of infomaestro;
detalle = file of infodetalle;

vector = array [1..cant] of detalle;
registros = array [1..cant] of infodetalle;

procedure leerMae(var mae: maestro; var reg: infomaestro);
begin
	if not eof(mae) then
		read(mae,reg)
	else
		reg.codprov := valorAlto;
end;

procedure leerDet(var det:detalle; var reg: infodetalle);
begin
	if not eof(det) then
		read(det,reg)
	else
		reg.codigoprov := valorAlto;
end;

procedure minimo(var detalles : vector; var regs : registros; var min: infodetalle);
var i,pos: integer;
begin
	min.codigoprov := valorAlto;
	for i := 1 to cant do begin
		if regs[i].codigoprov < min.codigoprov then begin
			min := regs[i];
			pos := i;
		end;
	end;
	leerDet(detalles[pos],regs[pos]);
end;

procedure actualizarMaestro(var mae: maestro; var detalles : vector; var regs: registros);
var i,codact,cantidad: integer; promedio : real; nomact: string; regmae : infomaestro; min : infodetale;
begin
	for i := 1 to cant do begin
		reset(detalles[i]);
		leerDet(detalles[i],regs[i]);
	end;
	minimo(detalles,regs,min);
	
	reset(mae);
	
	while min.codigoprov <> valorAlto do begin
		leerMae(mae,regmae);
		codact := min.codigoprov; 
		
		while regmae.codprov <> codact do
			leerMae(mae,regmae);
		
		nomact := regmae.nomprov;
		writeln('Provincia ',nomact);
		cantidad := 0;
		while regmae.codprov = codact do begin
			cantidad := cantidad + min.cantkilos;
			minimo(detalles,regs,min);
		end;
		regmae.cantotalk := regmae.cantotalk + cantidad;
		if regmae.cantotalk > 10000 then begin
			writeln('La provincio cod ',codact,' nombre ',nomact,' supero os 10.000 kilos consumidos historicamente');
			promedio := regmae.cantotalk/regmae.canthabitantes;
			writeln('El promedio de consumicion de yerba por habitante es', promedio:0:2);
		end;
		seek(mae,filepos(mae)-1);
		write(mae,regmae);
	end;
	for i:= 1 to cant do
		close(detalles[i]);
	close(mae);
end;















var
begin
end.
