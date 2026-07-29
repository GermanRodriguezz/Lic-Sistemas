program final;
type
cliente = record
	dni : integer;
	compraTotal : integer;
	monto : real;
end;

compra = record
	dni : integer;
	cantProd : integer;
	monto : real;
end;

arbol = ^nodoarbol;
nodoarbol = record
	dato : cliente;
	HI : arbol;
	HD : arbol;
end;

procedure leer(var c: compras);
begin
    readln(c.dni);
    if (c.dni <> 0) then
    begin
        readln(c.cantProd);
        readln(c.monto);
    end;
end;

procedure insertar(var a: arbol; c:compra);
var
begin
	if (a = nil) then begin
		new(a);
		a^.dato.dni := c.dni;
		a^.dato.compraTotal := 1;
		a^.dato.monto := c.monto;
		a^.HI := nil;
		a^.HD := nil;
	end
	else if (a^.dato.dni = c.dni) then begin
			a^.dato.compraTotal := a^.dato.compraTotal + 1;
			a^.dato.monto := a^.dato.monto + c.monto;
		end
		else if (c.dni < a^.dato.dni) then begin
			insertar(a^.HI,c);
			end
			else
				insertar(a^.HD,c);
end;

procedure cargarArbol(var a: arbol);
var c:compra;
begin
	leer(c);
	while (c.dni <> 0) do begin
		insertar(a,c);
		leer(c);
	end;
end;

procedure agregar(var l: lista; c: cliente);
var ant, act, nue : lista;
begin
	new(nue);
	nue^.dato := c;
	act := l;
	
	while (act <> nil) and (act^.dato.dni < c.dni) do begin
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

procedure devolverListaOrdenada(a : arbol; var l : lista; valor : integer);
begin
	if (a <> nil) then begin
		devolverListaOrdenada(a^.HI,l,valor);
		if (a^.dato.compraTotal > valor) then 
			agregar(l,a^.dato);
		devolverListaOrdenada(a^.HD,l,valor);
	end;
end;




