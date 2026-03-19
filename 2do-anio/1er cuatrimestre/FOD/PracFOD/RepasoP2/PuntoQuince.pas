program quince;
const cant = 10; valorAlto = 9999;
type

infomaestro = record
	codprov : integer;
	nomprov : string[30];
	codloc : integer;
	nomloc : string[30];
	viv_sluz : integer;
	viv_sgas : integer;
	viv_schapa : integer;
	viv_sagua : integer;
	viv_ssanitario : integer;
end;
	
infodetalle = record
	codigop : integer;
	codigol : integer;
	vluz : integer;
	vconstruidas : integer;
	vagua : integer;
	vgas : integer;
	entrega_sani : integer;
end;

maestro = file of infomaestro;
detalle = file of infodetalle;
detalles = array [1..cant] of detalle;
registros = array [1..cant] of infodetalle;

procedure leerMae(var mae: maestro; var reg: infomaestro);
begin
	if not eof(mae) then
		read(mae,reg)
	else
		reg.codprov := valorAlto;
end;

procedure leerDet(var det: detalle; var reg: infodetalle);
begin
	if not eof(det) then
		read(det,reg)
	else
		reg.codigop := valorAlto;
end;

procedure minimo(var vector : detalles; var reg : registros; var min: infodetalle);
var i,pos : integer;
begin
	min.codigop := valorAlto;
	min.codigol := valorAlto;
	for i := 1 to cant do begin
		if reg[i].codigop < min.codigop or reg[i].codigop = min.codigop and reg[i].codigol < min.codigol then begin
			min := reg[i];
			pos := i;
		end;
	end;
	leerDet(vector[pos],reg[pos]);
end;

procedure actualizarMaestro(var mae: maestro; var vec: detalles);
var reg: registros; min : infodetalle; vluz,vconstruidas,vagua,vgas,entregas_sani,cantidad : integer;
begin
	reset(mae);
	for i := 1 to cant do begin
		reset(vec[i]);
		leerDet(vec[i],reg[i]);
	end;
	
	minimo(vec,reg,min);
	while min.codigop <> valorAlto do begin
		codact := min.codigop;
		while min.codigop = codact do begin
			locact := min.codigol;
			while codact = min.codigop and locat = min.codigol do begin
				vluz := vluz + min.vluz;
				vconstruidas := vconstruidas + min.vconstruidas;
				vagua := vagua + min.vagua;
				vgas := vgas + min.vgas;
				entrega_sani := entrega_sani + min.entrega_sani;
				minimo(vector,reg,min);
			end;
			leerMae(mae,regmae);
			while regma.codprov <> codact do
				leerMae(mae,regmae);
			regmae.viv_sluz := regmae.viv_sluz - vluz;
			regmae.viv_sgas : regmae.viv_sgas - vgas;
			regmae.viv_schapa : regmae.viv_schapa - vconstruidas;
			regmae.viv_sagua : regmae.viv_sagua - vagua;
			regmae.viv_ssanitario : regmae.viv_ssanitarios - entrega_sani:
			seek(mae,filepos(mae)-1);
			write(mae,regmae);
			
			if regmae.viv_schapa = 0 then begin
				cantidad := cantidad + 1;
			end;
		end;
	end;
	writeln('La cantidad de localidades sin viviendas de chapa son ',cantidad);
	close(mae);
	for i := 1 to cant do
		close(vector[i]);
end;

var
begin
end;
