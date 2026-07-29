program final;
encomienda = record
	dniemisor: integer;
	dnireceptor : integer;
	ciudaddestino : string;
	peso : real;
end;

infoEncomienda = record
	citydest : string;
	totalencomienda : integer;
	pesototal : real;
end;

arbol = ^nodoarbol;

nodoarbol = record
	dato : infoEncomienda;
	HI : arbol;
	HD : arbol;
end;

lista = ^nodolista;

nodolista = record
	dato :
	sig : lista;
end;

procedure leer(var e: encomienda);
var
begin
	readln(e.peso);
	if (e.peso <> 0) then begin
		readln(e.dniemisor);
		readln(e.dnireceptor);
		readln(e.ciudaddestino);
	end;
end;

procedure insertar(var a : arbol; e : encomienda);
begin
	if (a = nil) then begin
		new(a);
		a^.dato.dniemi := e.dniemisor;
		a^.dato.dnirecep := e.dnireceptor;
		a^.dato.citydest := e.ciudaddestino;
		a^.dato.totalencomienda := 1;
		a^.dato.pesototal := e.peso;
		a^.HI := nil;
		a^.HD := nil;
	end
	else begin
		if (e.ciudaddestino = a^.dato.citydest)then begin
			a^.dato.totalencomienda := a^.dato.totalencomienda +1;
			a^.dato.pesototal := a^.dato.pesototal + e.peso;
		end
		else if (e.ciudaddestino < a^.dato.citydest) then 
			insertar(a^.HI,e)
		else
			insertar(a^.HD,e);
	end;
end;
// a
procedure cargarArbol(var a:arbol);
var e: encomienda;
begin
	leer(e);
	while (e.peso <> 0) do begin
		insertar(a,e);
		leer(e);
	end;
end;


//b

procedure agregar(var l: lista; e: infoEncomienda);
var ant, act, nue : lista;
begin
	new(nue);
	nue^.dato := e;
	act := l;
	while (act <> nil) and (act^.dato.pesototal < e.pesototal) do begin
		ant := act;
		act := act^.sig;
	end;
	if (act = l) then begin
		nue^.sig := l;
		l := nue;
	end
	else begin
		ant^.sig := nue;
		nue^.sig := act;
	end;
end;

procedure retornarLista(a : arbol; var l : lista; valor : integer);
var
begin
	if (a <> nil) then begin
		retornarLista(a^.HI,l,valor);
		if (a^.dato.totalencomienda > valor)then begin
			agregar(l,a^.dato);
		end;
		retornarLista(a^.HD,l,valor);
	end;
end;
// c

function buscarCiudad(a : arbol; city : string): infoEncomienda;
begin
	if (a <> nil) then begin
		if (city = a^.dato.citydest) then 
			buscarCiudad := a^.dato;
		else if (city < a^.dato.citydest) then 
			buscarCiudad := buscarCiudad(a^.HI,city);
			else
				buscarCiudad := buscarCiudad(a^.HD,city);
	end
	else 
		buscarCiudad := nil;
end;


