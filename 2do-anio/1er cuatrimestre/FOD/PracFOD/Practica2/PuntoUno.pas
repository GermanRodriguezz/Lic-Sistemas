program PuntoUno;
const valorAlto = 999;
type
empleado = record
	codEmpleado : integer;
	nombre : string;
	montoComision : real;
end;

ArchivoBinario = file of empleado;

procedure leer(var mae:ArchivoBinario; var emp:empleado);
begin
	if not eof(mae) then
		read(mae,emp)
	else
		emp.codEmpleado := valorAlto;
end;

procedure CrearArchivoEmpleadosB(var ae: Text; var a:ArchivoBinario);
var e:empleado; nombreArch : string;
begin
	writeln('ingrese nombre del archivo binario');
	readln(nombreArch);
	assign(a, nombreArch);
	reset(ae);
	rewrite(a);
	while (not eof(ae)) do begin
		with e do begin
			readln(ae, codEmpleado,montoComision,nombre);
			write(a,e);
		end;
	end;
	writeln('Se creo el archivo binario');
	close(a);
	close(ae);
end;

procedure RecorrerAB(var a:ArchivoBinario; var mae:ArchivoBinario);
var emp,regm,aux: empleado; comisionEAct : real;
begin
	reset(a);
	assign(mae,'ArchivoMaestroUno');
	rewrite(mae);
	leer(a,emp);
	while (emp.codEmpleado <> valorAlto) do begin
		aux := emp;
		comisionEAct := 0;
		while (emp.codEmpleado <> valorAlto) and (emp.codEmpleado = aux.codEmpleado) do begin
			comisionEAct := comisionEAct + emp.montoComision;
			leer(a,emp);
		end;
		regm.codEmpleado := aux.codEmpleado;
		regm.nombre := aux.nombre;
		regm.montoComision := comisionEAct;
		write(mae,regm);
	end;
	close(a);
	close(mae);
end;

procedure imprimirMae(var m:ArchivoBinario);
var emp: empleado;
begin
	writeln('Mostrara en pantalla los datos de los empleados');
	write('. . .');
	reset(m);
	leer(m,emp);
	while emp.codEmpleado <> valorAlto do begin
		write(emp.nombre);
		write(emp.codEmpleado);
		write(emp.montoComision);
		leer(m,emp);
	end;
	close(m);
end;

var
at : Text;
ab : ArchivoBinario;
maestro : ArchivoBinario;
begin
assign(at,'empleados');
CrearArchivoEmpleadosB(at,ab);

RecorrerAB(ab,maestro);

imprimirMae(maestro);

end.
