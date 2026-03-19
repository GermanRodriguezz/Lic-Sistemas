program ocho;
const valorAlto := 9999;
type
informacionMaestro = record
	codcliente: integer;
	nombre : string;
	apellido : string;
	anio : integer;
	mes : integer;
	dia : integer;
	monto : real;
end;

maestro = file of informacionMaestro;

procedure leerMae(var mae:maestro; var reg: informacionMaestro);
var
begin
	if not eof(mae) then
		read(mae,reg)
	else
		reg.codcliente := valorAlto;
end;

procedure merge(var mae:maestro);
var
begin
	reset(mae);
	leerMae(mae,regmae);
	while regmae.codcliente <> valorAlto do begin
	{aca comienza un nuevo cliente}
		codAct := regmae.codcliente;
		montoDelCliente := 0;
		while codAct = regmae.codcliente do begin
			añoAct := regmae.año;
			while codAct = regmae.codcliente and añoAct = regmae.anio do begin
				mesAct := regmae.mes;
				compraDelMes := 0;
				while codAct = regmae.codcliente and añoAct = regmae.anio and mesAct = regmae.mes do begin
					montoDelMes := compraDelMes + regmae.monto;
					leerMae(mae,regmae);
				end;
				{aca sale porque cambio el mes}
				writeln('en el mes',mesAct, ' gasto ', montoDelMes);
				montoDelCliente := montoDelCliente + montoDelMes;
			end;
			{aca cambio el año}
			writeln('el cliente ',codAct, 'en el año',añoAct,' gasto ',montoDelCliente);
			montoTotalCliente := montoTotalCliente + montoDelCliente;
		end;
		writeln('el cliente entre todas sus compras gasto :',montoTotalCliente);
		{aca cambio el cliente}
		montoEmpresa := montoEmpresa + montoTotalCliente;
	end;
	close(mae);
end;























var
begin
end.
