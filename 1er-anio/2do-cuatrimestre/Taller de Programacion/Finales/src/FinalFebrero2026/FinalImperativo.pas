program final;
rango = 1..10;
type 

mensaje = record
	id : rango;
	floresJuntadas : integer;
	papelesJuntados : integer;
	calle : integer;
	avenida : integer;
end;

arbol = ^nodoArbol;

nodoArbol = record
	dato : mensaje;
	HI : arbol;
	HD : arbol;
end;

vector = array [1..10] of lista;

lista = ^nodo;

nodo = record
	dato : mensaje;
	sig : lista;
end;

procedure generarMensaje(var m: mensaje);
begin
	m.id = Random(10)+1;
	m.floresJuntadas = Random(100);
	m.papelesJuntados = Random(50);
	m.calle = Random(100)+1;
	m.avenida = Random(100)+1;
end;

procedure insertar(var a : arbol; m : mensaje);
begin
	if (a = nil)then begin
		new(a);
		a^.dato := m;
		a^.HI := nil;
		a^.HD := nil;
	end
	else
		if (m.floresJuntadas < a^.dato.floresJuntadas) then
			insertar(a^.HI,m)
		else
			insertar(a^.HD,m);
end;

procedure cargarArbol(var a: arbol);
var i : integer; m : mensaje;
begin
	a := nil;
	for i = 1 to 100 do begin
		generarMensaje(m);
		insertar(a,m);
	end;
end;

//inciso b

procedure devolverCantidad(a : arbol; inf : integer; sup : integer; var cantMsj: integer);
begin
	if (a <> nil) then begin	
		if (a^.dato.floresJuntadas < inf) then
			devolverCantidad(a^.HD,inf,sup,cant);
		else
			if (a^.dato.floresJuntadas <= sup) then
				devolverCantidad(a^.HI,inf,sup,cant);
			else begin
				cant := cant + 1;
				devolverCantidad(a^.HI,inf,sup,cant);
				devolverCantidad(a^.HD,inf,sup,cant);
			end;
	end;
end;

//inciso C

procedure insertarOrdenado(var l:lista; m : mensaje);
var ant, act, nue : lista;
begin
	new(nue);
	
	nue^.dato := m;
	
	act := l;
	
	while (act <> nil) and (act^.dato.floresJuntadas > m.floresJuntadas) do begin
		ant := act;
		act := act^.sig;
	end;
	
	if (act = nil) then begin
		nue^.sig := l;
		l := nue;
	end
	else begin
		ant^.sig := nue;
		nue^.sig := act;
	end;
end;

procedure generarEstructura(a : arbol; var vec : vector; valor : integer);
begin
	if (a <> nil)then begin
		generarEstructura(a^.HI,vec,valor)
		if (a^.dato.papelesJuntados > valor) then begin
			insertarOrdenado(v[a^.dato.id],a^.dato);
		end;
		generarEstructura(a,vec,valor);
	end;
end;

