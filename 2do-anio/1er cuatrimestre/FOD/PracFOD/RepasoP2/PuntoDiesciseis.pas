program unoseis;
const valorAlto = 9999; diml = 100;
type
infomae = record
	fecha : integer;
	codigoseminario: integer;
	nombreseminario : string;
	descripcion : string;
	precio : real;
	totalejemplares : integer;
	ejemplaresvendidos : integer;
end;

infodet = record
	fecha : integer;
	codsemi: integer;
	cantvendidos : integer;
end;

maestro = file of infomae;

detalle = file of infodet;
vector = array [1..diml] of detalle;
vectorReg = array [1..diml] of infodet;

procedure leerMae(var mae:maestro; var reg: infomae);
begin
	if not eof(mae) then
		read(mae,reg)
	else
		reg.fecha := valorAlto;
end;

procedure leerDet(var det: detalle; var reg: infodet);
begin
	if not eof(det) then
		read(det,reg)
	else
		reg.fecha := valorAlto;
end;

procedure minimo(var vec:vector; var vecReg: vectorReg; var min: infodet);
var i,pos : integer;
begin
	min.fecha := valorAlto;
	min.codsemi := valorAlto;
	pos := -1:
	for i := 1 to diml do begin
		if (vecReg[i].fecha < min.fecha) or (vecReg[i].fecha = min.fecha) and (vecReg[i].codsemi < min.codsemi) then begin
			min := vecReg[i];
			pos := i;
		end;
	end;
	if pos <> -1 then
		leerDet(vec[pos],vecReg[pos]);
end;

procedure actualizarMaestro(var mae:maestro; var vec: vector);
var vecReg : vectorReg; regmae: infomae; i: integer; actual,max,mini,min : infodet;
begin
	reset(mae);
	for i := 1 to diml do begin
		reset(vec[i]);
		leerDet(vec[i],vecReg[i]);
	end;
	minimo(vec,vecReg,min);
	leerMae(mae,regmae);
	max.cantvendidos := -1;
	mini.cantvendidos := valorAlto;
	while min.fecha <> valorAlto do begin
		actual.fecha := min.fecha;
		while actual.fecha = min.fecha do begin
			actual.codsemi := min.codsemi;
			actual.cantvendidos := 0;
			while actual.fecha = min.fecha and actual.codsemi = min.codsemi do begin
				actual.cantvendidos := actual.cantvendidos + min.cantvendidos;
				minimo(vec,vecReg,min);
			end;
		end;
		while regmae.fecha <> actual.fecha or regmae.codigoseminario <> actual.codsemi do 
			leerMae(mae,regmae);
		if actual.cantvendidos > max.cantvendidos then 
			max := actual
		else if actual.cantvendidos < mini.cantvendidos then
				mini := actual;
		regmae.totalejemplares := regmae.totalejemplares - actual.cantvendidos;
		regmae.ejemplaresvendidos := regmae.ejemplaresvendidos + actual.cantvendidos;
		seek(mae,filepos(mae)-1);
		write(mae,regmae);
	end;
	close(mae);
	for i := 1 to diml do
		close(vec[i]);
		
	writeln('Fecha y seminario que tuvo mas ventas fue ',max.fecha ,' ',max.codsemi);
	writeln('Fecha y seminario que tuvo menos ventas fue ',mini.fecha ,' ',mini.codsemi);
end;

var vec: vector; mae:maestro; i: integer; nombre : string;
begin
	assign(mae,'Maestro.dat');
	for i := 1 to diml do begin
		writeln('Ingrese nombre de detalle a usar');
		readln(nombre);
		assign(vec[i],nombre);
	end;
actualizarMaestro(mae,vec);
end.
