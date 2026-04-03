program final;

empleado = record
    nombre : string;
    anio : integer;
    salario : real;
end;

lista = ¨nodo;

nodo = record
    dato : empleado;
    sig : lista;
end;

regadicional = record
    anio : integer;
    monto : real;
    cantidadEmpleados;
end;

listaNueva : nodoAd ;
nodoAd = record
    dato : regadicional;
    sig : listaNueva;
end;

procedure insertarOrd(var l: listaNueva; reg: regadicional);
var nue, ant, act : listaNueva;
begin
    new (nue);
    nue.dato := reg;
    nue.sig := nil;
    if (l = nil) then
        l := nue;
    else begin
        ant := l;
        act := l;
        while (act <> nil) and (act.dato.cantidadEmpleados < reg.cantidadEmpleados) do begin
            ant  := act;
            act := act.sig;
        end
        if (act = l) then
            nue.sig := l;
            l := nue;
        end
        else
            ant.sig := nue;
            nue.sig := act;
    end;
end;

procedure procesar(l : lista);
var

begin
    while (l <> nil) do begin
        anioactual := l.dato.anio
        montoDelAnio = 0;
        while (l <> nil) and (anioactual = l.dato.anio)do begin
            montoDelAnio := montoDelAnio + l.dato.salario;
            cantidadEmpleados := cantidadEmpleados + 1;
            l : l.sig;
        end;
        regadicional.anio = anioactual;
        regadicional.monto = montoDelAnio;
        regadicional.cantidadEmpleados := cantidadEmpleados;
        insertarOrd(ln,regadicional);
    end;
    cant := 0;
    writeln("Los anios en los que nacieron mas empleados son");
    while (ln <> nil) and (cant < 10) do begin
        writeln(ln.dato.anio + ln.dato.montoDelAnio);
        cant := cant +1;
        ln := ln.sig;
    end;
end;





var
begin
end.