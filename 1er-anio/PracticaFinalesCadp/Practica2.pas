program dos
type 
venta= record
	numventa: integer;
	cantprodu: integer;
	tipopago : string;
end;
lista = ^nodo;
nodo = record
	dato: venta;
	sig : lista;
end;

procedure leerventa(var v: venta);
begin
	readln(v.numventa);
	readln(v.cantprodu);
	readln(v.tipopago);
end;

procedure cargarLista(var l:lista){se dispone}

function cumple(num: integer): boolean;
var par,imp,dig: integer;
begin
	while (num <> 0) do begin
		dig := num mod 10;
		if (dig mod 2 = 0) then
			par := par + 1
		else
			imp := imp + 1;
		num := num div 10;
	end;
	cumple := (par >= 2)
end;

procedure insertar(var l: lista; v: venta);
var ant,act,nue: lista;
begin
	new(nue);
	nue^.dato := v;
	nue^.sig := nil;
	if (l = nil) then begin
		nue^.sig := l;
		l := nue;
	end
	else begin
		act := l;
		while (act <> nil) and (v.cantprodu > act^.dato.cantprodu) do begin
			ant := act;
			act := act^.sig;
		end;
		if (act = l) then
			l := nue;
		else
			ant^.sig := nue;
		nue^.sig := act;
	end;
end;
procedure armarLista2(l: lista; var l2:lista);
begin
	while (l <> nil) do begin
		if cumple(l^.dato.cantprodu) then
			insertar(l2,l^dato);
		l := l^.sig;
	end;
end;

var
l,l2: lista;
begin
l:= nil;
l2:= nil;
cargarLista(l);
armarLista2(l,l2);
end.

/// PUNTO 2
los dos programas son validos, con la diferencia que en el A la variable "d" es un vector y en el B la variable "d" es de tipo vector,
donde el vector esta declarado en el type.

/// PUNTO 3
memoria estatica : 21760 + 8 + 272 = 22040bytes
memoria dinamica : 40x4 : 160bytes

/// PUNTO 4
tiempo de ejecucion = 406 + 1 + 642 : 1049
	for i 			(3.N + 2) + N(cuerpo) = 406
					 3.80 + 2 + 80.2
		if then			Condicion + caso extremo = 	1 + 1 = 2
			else        
	1 ut
	while C(n+1) + n(cuerpo)	2(80+1) + 80 (6) = 642
		1
		if then(1+2)
		2
/// PUNTO 5
a) falso. el tipo de dato para un subrango debe ser simple pero ordinal.
b) falso. que el programa incluya modulos no garantiza la eficiencia del programa, podria pasar el caso del mal manejo de memoria con los modulos
c) verdadero. comparten el mismo tipo de dato la funcion con los parametros.
d) verdadero. un for i puede ser reemplazado por un repeat until ya que los dos se ejecutan 1,2 o mas veces.
e) falso. la comunicacion tambien llegar a darse a traves de variables globales del programa.
