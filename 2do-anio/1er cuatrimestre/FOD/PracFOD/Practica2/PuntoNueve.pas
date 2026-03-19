program PuntoNueve;
const valorAlto = 9999;
type
infoVenta = record
	cod : integer;
	nomyape : string;
	anio : integer;
	mes : integer;
	dia : integer;
	monto_venta : real;
end;

infoMerge = record
	cod_cliente : integer;
	nom_ape : string;
	anio : integer;
	mes: integer;
	total_mensual : real;
end;

DetalleVentas = file of infoVenta;
Merge = file of infoMerge;

procedure leer(var det: DetalleVentas; var reg: infoVenta);
begin
	if not eof(det) then
		read(det,reg)
	else
		reg.cod := valorAlto;
end;

procedure leerMerge(var archivo: Merge; var reg: infoMerge);
begin
	if not eof(archivo) then
		read(archivo,reg)
	else
		reg.cod_cliente := valorAlto;
end;

procedure crearDetalleVenta(var dv: DetalleVentas);{se dispone}

procedure procesarInformacion(var detVen: DetalleVentas; var merge: Merge);
var regventa : infoVenta; regmerge : infoMerge; cliente_actual,anio_actual, mes_actual, cantidad_ventas : integer;
begin
	assign(detVen,'Ventas');
	reset(detVen);
	assign(merge,'ArchivoMerge');
	rewrite(merge);
	leer(detVen,regventa);
	while regventa.cod <> valorAlto do begin
	
		regmerge.cod_cliente := regventa.cod;
		regmerge.nom_ape := regventa.nomyape;
		regmerge.anio := regventa.anio;
		regmerge.mes := regventa.mes;
		regmerge.total_mensual := 0;
		
		cliente_actual := regventa.cod;
		anio_actual := regventa.anio;
		mes_actual := regventa.mes;
		
		while (regventa.cod = cliente_actual) and 
		(regventa.anio = anio_actual) and (regventa.mes = mes_actual) do begin
			regmerge.total_mensual := regmerge.total_mensual + regventa.monto_venta;
			leer(detVen,regventa);
		end;
		write(merge,regmerge);
	end;
	close(merge);
	close(detVen);
end;

procedure procesarMerge(var mer:Merge);
var regm: infoMerge; cod_actual: integer; monto_anual,monto_ventas : real;
begin
	reset(mer);
	monto_ventas := 0;
	leerMerge(mer,regm);
	while regm.cod_cliente <> valorAlto do begin
		cod_actual := regm.cod_cliente;
		monto_anual := 0;
		while (regm.cod_cliente = cod_actual) do begin
			writeln('El cliente ', cod_actual, ' De nombre ',regm.nom_ape, ' Monto del mes ', regm.mes, ' es = ', regm.total_mensual);
			monto_anual := monto_anual + regm.total_mensual;
			leerMerge(mer,regm);
		end;
		writeln('Monto anual del cliente ',cod_actual,' es : ',monto_anual);
		monto_ventas := monto_ventas + monto_anual;
	end;
	writeln('El monto total de ventas de la empresa es de ', monto_ventas);
	close(mer);
end;

var
	detVen : DetalleVentas;
	mer: Merge;
begin
crearDetalleVenta(detVen);
procesarInformacion(detVen,mer);
procesarMerge(mer);
end.
