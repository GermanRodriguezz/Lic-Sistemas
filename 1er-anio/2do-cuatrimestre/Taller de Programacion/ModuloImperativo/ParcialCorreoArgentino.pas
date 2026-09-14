{Correo Argentino desea analizar la información de los paquetes enviados durante 2024. De cada paquete enviado se
conoce: código de envío, DNI del emisor, DNI del receptor, cantidad de objetos en el paquete y peso del paquete en
gramos. Realice un programa que contenga e invoque a:

a. Un módulo que lea la información de paquetes enviados y retorne una estructura con todos los paquetes leídos.
La estructura debe ser eficiente para buscar por peso del paquete en gramos. La lectura finaliza al leer un paquete
con código de envío 0.

b. Un módulo que reciba la estructura generada en a) y dos valores, y retorne una lista con todos los paquetes
enviados cuyo peso está entre los dos valores recibidos.

c. Un módulo que reciba la estructura generada en a) y retorne toda la información del paquete enviado con mayor
cantidad de objetos.}

program parcial;

type
paquete = record
	codenvio : integer;
	dniemisor: integer;
	dnirecep : integer;
	cantObjetos : integer;
	pesoPaquete : integer;
end;

arbol = ^nodoArbol;
nodoArbol = record
	dato : paquete;
	HI : arbol;
	HD : arbol;
end;

lista = ^nodoLista;
nodoLista = record
	dato : paquete;
	sig : lista;
end;

procedure leer(var p : paquete);
begin
	readln(p.codenvio);
	if (p.codenvio <> 0) then begin
		readln(p.dniemisor);
		readln(p.dnirecep);
		readln(p.cantObjetos);
		readln(p.pesoPaquete);
	end;
end;

procedure insertar(var a : arbol; p : paquete);
var  nue : arbol;
begin
	if (a = nil) then begin // si tengo el arbol vacio lo que hago es crear un nuevo nodo
		new(nue);
		nue^.dato := p;
		nue^.HI := nil;
		nue^.HD := nil;
		a := nue;
	end
	else begin // si lo que quiero agregar es mas chico que lo que tengo en el arbol voy por el hijo izq
		if (p.pesoPaquete < a^.dato.pesoPaquete) then
			insertar(a^.HI, p)
		else // si es igual o mas grande voy por el hijo derecho
			insertar(a^.HD,p);
	end;
end;

procedure agg(var l: lista; p: paquete);
var  nue: lista;
begin
	new(nue);
	nue^.dato := p;
	nue^.sig := l;
	l := nue;
end;

procedure retornarLista(var l: lista; a: arbol; valor1, valor2: integer);
begin
    if (a <> nil) then begin
        if (a^.dato.pesoPaquete >= valor1) and
           (a^.dato.pesoPaquete <= valor2) then begin // si el peso donde estoy parado esta entre los valores 

            agg(l, a^.dato);						// agrego a la lista
            retornarLista(l, a^.HI, valor1, valor2); // llamo recursivo por hijo izq;
            retornarLista(l, a^.HD, valor1, valor2); // llamo recursivo por hijo der;
        end
        else if (a^.dato.pesoPaquete < valor1) then // aca pregunto si estoy en el borde izq
            retornarLista(l, a^.HD, valor1, valor2)	// llamo con el hijo derecho
        else
            retornarLista(l, a^.HI, valor1, valor2);// llamo con el hijo izquierdo porque todavia no llegue al mas izquierdo
    end;
end;

procedure buscarMayor(a : arbol, var max : paquete);
begin
	if (a <> nil) then begin
		if (a^.dato.cantObjetos > max.cantObjetos)then
			max := a^.dato;
		buscarMayor(a^.HI,max);
		buscarMayor(a^.HD,max);
	end;
end;

procedure cargarArbol(var a: arbol);
var p : paquete;
begin
	leer(p);
	while (p.codenvio <> 0) do begin
		insertar(a,p);
		leer(p);
	end;
end;

var a : arbol; l : lista; maximo : paquete;
	valor1 , valor2 : integer;
begin 
	a := nil;
	l := nil;
	
	//modulo a
	cargarArbol(a);
	
	//modulo b
	writeln('ingrese valor 1 ');
	readln(valor1);
	writeln('ingrese valor 2');
	readln(valor2);
	retornarLista(l,a,valor1,valor2);
	
	//modulo c
	maximo.cantObjetos := -1;
	buscarMayor(a,maximo);
end;
