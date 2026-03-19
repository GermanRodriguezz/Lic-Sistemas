program cuatro;
const valorAlto = 'ZZZ'
type
informacionMaestro = record
	nombre : string;
	cant_personas_alf : integer;
	total_encuestados : integer;
end;

informacionDetalles = record
	nomprov : string;
	cod_localidad : integer;
	cantidad_alf : integer;
	cantidad_enc : integer;
end;

archivoMaestro = file of informacionMaestro;
archivoDetalle = file of informacionDetalles;

procedure leerDet(var arch: archivoDetalle; var reg: informacionDetalles);
begin
	if not eof(arch)then
		read(arch,reg)
	else
		reg.nomprov := valorAlto;
end;
procedure leerMae(var a: archivoMaestro; var reg: informacionMaestro);
begin	
	if not eof(a)then
		read(a,reg)
	else
		reg.nombre := valorAlto;
end;

procedure minimo(var det1,det2: archivoDetalle; var reg1,reg2,min: informacionDetalles);
begin
	
	if reg1.nomprov < reg2.nomprov then begin
		min := reg1;
		leerDet(det1,reg1);
	end
	else if reg2.nomprov < reg1.nomprov then begin
		min := reg2;
		leerDet(det2,reg2);
	end;
end;

procedure actualizarMaestro(var mae:archivoMaestro; var det1,det2: archivoDetalle);
var alf_prov, enc_prov, encuestados,alfabetizados : integer; regmae : informacionMaestro; reg1,reg2: informacionDetalles;
begin
	reset(mae);
	reset(det1);
	reset(det2);
	leerDet(det1,reg1);
	leerDet(det2,reg2);
	leerMae(mae,regmae);
	minimo(det1,det2,reg1,reg2,min);
	while regmae.nombre <> valorAlto do begin
		provAct := regmae.nombre;
		alf_prov := 0;
		enc_prov := 0;
		while provAct <> min.nomprov do 
			leerMae(mae,regmae);
		while provAct = min.nomprov do begin
			localidadAct := min.cod_localidad;
			alfabetizados := 0;
			encuestados := 0;
			while provAct = min.nomprov and min.cod_localidad = localidadAct do begin
				{acumulo mientras este en misma prov y misma localidad}
				alfabetizados := alfabetizados + min.cantidad_alf;
				encuestados := encuestados + min.cantidad_enc;
				{leo los proximos y saco min reg}
				minimo(det1,det2,reg1,reg2,min);
			end;
			{acumulo lo que va de la misma provincia}
			alf_prov := alf_prov + alf_prov + alfabetizados;
			enc_prov := enc_prov + encuestados;
		end;
		{cambió la provincia, asique escribo los datos de la provincia leida en el maestro}
		regmae.cant_personas_alf := regmae.cant_personas_alf + alf_prov;
		regmae.total_encuestados := regmae.total_encuestados + enc_prov;
		seek(mae,filepos(mae)-1);
		write(mae,regmae);
	end;
	
end;

var
begin
end.
