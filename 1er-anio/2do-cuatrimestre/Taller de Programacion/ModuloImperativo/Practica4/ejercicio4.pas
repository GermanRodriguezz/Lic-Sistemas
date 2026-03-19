program ejercicio4;
type 

prestamo = record
	isbn : integer;
	numsocio: integer;
	dia: integer;
	mes : integer;
	cantdiasprestados : integer;
end;

prestamoL = record
	numso: integer;
	dia: integer;
	mes: integer;
	cantdiasp: integer;
end;
listacant = ^nodolista;
nodolista = record
	dato : prestamoL;
	sig: listacant;
end;

prestamo2 = record
	isbn : integer;
	lista : listacant;
end;

arboluno = ^nodouno;
nodouno = record
	dato : prestamo;
	hi: arboluno;
	hd: arboluno;
end;

arboldos = ^nododos;
nododos = record
	dato : prestamo2;
	hi : arboldos;
	hd : arboldos;
end;

listaF = ^nodo;
nodo = record
  pres: prestamosL;
  sig: listaF;
end;

reg3 = record
  isbn: integer;
  lista := listaF;
end;

arboltres = ^nodo3;
nodo3 = record;
  dato: reg3;
  hi: arboltres;
  hd: arboltres;
end;

facu=record 
	isbn:integer;
	cant:integer
	end; 


listaG=^nodo4
nodo4 = record 
	dato: facu;
	sig:listaG;
	end; 



procedure leerPrestamos(var p:prestamo);
begin
	writeln('Ingrese ISBN'); readln(p.isbn);
	if p.isbn <> 0 then begin
		p.numsocio := random(250)+1;
		writeln('numero del socio ',p.numsocio);
		p.dia := random(31)+1;
		writeln('el dia es ',p.dia);
		p.mes:= random(12)+1;
		writeln('el mes fue ',p.mes);
		p.cantdiasprestados := random(15)+1;
		writeln('los dias prestados fueron ',p.cantdiasprestados);
	end;
end;

procedure insertar1(var a:arboluno; p : prestamo);
begin
	if a = nil then begin
		new(a);
		a^.dato:= p;
		a^.hi := nil;
		a^.hd := nil;
	end
	else if a^.dato.isbn > p.isbn then 
			insertar1(a^.hi,p)
			else
				insertar1(a^.hd,p);
end;

procedure agregar(var l: listacant; p: prestamoL);
var
	aux,nue: listacant;
begin
	new(nue);
	nue^.dato := p;
	nue^.sig := nil;
	if l = nil then
		l := nue
		else begin
			aux := l;
			while aux^.sig <> nil do
				aux := aux^.sig;
			aux^.sig := nue;
		end;
end;

procedure insertar2(var a: arboldos; p: prestamo);
var
	PL: prestamoL;
begin
	if a = nil then begin
		new(a);
		a^.dato.isbn := p.isbn;
		a^.dato.lista := nil;
		PL.numso:= p.numsocio;
		PL.dia := p.dia;
		PL.mes := p.mes;
		PL.cantdiasp := p.cantdiasprestados;
		agregar(a^.dato.lista,PL);
		a^.hi := nil;
		a^.hd := nil;
	end
	else begin 
		if a^.dato.isbn = p.isbn then begin
			PL.numso:= p.numsocio;
			PL.dia := p.dia;
			PL.mes := p.mes;
			PL.cantdiasp := p.cantdiasprestados;
			agregar(a^.dato.lista,PL);
			end
		else if a^.dato.isbn > p.isbn then
				insertar2(a^.hi,p)
				else
					insertar2(a^.hd,p);
		end;
end;

procedure cargarArboles(var a1: arboluno; var a2:arboldos);
var
	p: prestamo;
begin
	leerPrestamos(p);
	while p.isbn <> 0 do begin
		insertar1(a1,p);
		insertar2(a2,p);
		leerPrestamos(p);
	end;
end;

function isbnmasgrandearbol1(a: arboluno): integer;
begin
	if a <> nil then
		if a^.hd <> nil then
			isbnmasgrandearbol1:= isbnmasgrandearbol1(a^.hd)
			else
				isbnmasgrandearbol1 := a^.dato.isbn;
end;

function isbnmaschicoarbol2(a: arboldos): integer;
begin
	if a <> nil then
		if a^.hi <> nil then
			isbnmaschicoarbol2:= isbnmaschicoarbol2(a^.hi)
			else
				isbnmaschicoarbol2 := a^.dato.isbn;
end;

procedure prestamosalsocioA1(a: arboluno; n: integer; var cant: integer);
begin
	if a <> nil then begin
		if a^.dato.numsocio = n then
			cant := cant + 1;
		prestamosalsocioA1(a^.hi,n,cant);
		prestamosalsocioA1(a^.hd,n,cant);
	end;
end;

procedure prestamosalsocioA2(var a: arboldos;n : integer; var cant: integer);
var
	l: listacant;
begin
	if a <> nil then begin
	      l := a^.dato.lista;
	      cant := 0;
		  while l <> nil do begin
		    if l^.dato.numso = n then 
			cant := cant + 1;
		    l := l^.sig;
		    end;
		    writeln('la cantidad de prestamos al socio ' ,l^.dato.numso, ' fueron :',cant);
		end;
		prestamosalsocioA2(a^.hi,n,cant);
		prestamosalsocioA2(a^.hd,n,cant);
	end;

procedure agregaradelante(var l:listaF; pl: prestamoL) ;
var n:listaF; 
begin 
new(n); 
n^.dato:=pl; 
n^.sig:=l;
l:=n;
end; 


procedure agregarA3(var a: arboltres; p: prestamo);
var
pl: prestamoL; nue: listaF;
begin
if a = nil then begin
  new(a);
  a^.dato.isbn := p.isbn;
  a^.dato.lista := nil;
  pl.numso := p.numso;
  pl.dia := p.dia;
  pl.mes := p.mes;
  pl.cantidiasp := p.cantdiasprestados;
  agregaradelante(a^.dato.lista,pl);
end
else if a^.dato.isbn = p.isbn then begin
      pl.numso := p.numso;
      pl.dia := p.dia;
      pl.mes := p.mes;
      pl.cantidiasp := p.cantdiasprestados;
      agregaradelante(a^.dato.lista,pl);
    end
    else 
end;

procedure generarA3(a: arboluno; var a3: arboltres);
begin
  if a <> nil then begin
    agregarA3(a3,a^.dato);
    generarA3(a^.hi,l);
    generarA3(a^.hd,l);
  end;
end;

function cantidad(lista: listaF): integer; 
var
	cant: integer;
begin 
cant :=0;
	if (lista <> nil) then begin 
			cant := cant +1;
			lista:= lista^.sig;
	end;
cantidad:=cant; 
end; 

procedure agregar(f: facu;var l: listaG);
var
	nue: listaG;
begin
	new(nue);
	nue^.dato:= f;
	nue^.sig:= l;
	l:= nue;
end;

procedure G	(a: arboldos; var l : listaG);
var f:facu; 
begin
	if a <> nil then begin
		f.cant:= cantidad(a^.dato.lista); 
		f.isbn:= a^,dato.isbn; 
		agregar(f, l); 
		G(a^.hi,l);
		G(a^.hd, l); 
	end;
end;

procedure J (a: arboldos; v1,v2: integer; var cant: integer);
var
begin
	if a <> nil then begin
		if a^.dato.isbn >= v1 then 
			if a^.dato.isbn <= v2 then begin
				cant := cant +1;
				J(a^.hi,v1,v2,cant);
				J(a^.hd,v1,v2,cant);
			end;
			else 
				J(a^.hi , v1, v2, cant)
		else
			J(a^.hd,v1,v2,cant);
	end;
end;


var
a1: arboluno; a3:arboltres; 
a2: arboldos;
numero,cant: integer;
numeroo, cantt: integer;	lg:listaG;
v1,v2: integer; 
begin
randomize;
a1 := nil;
a2:= nil;

cargarArboles(a1,a2);

writeln('el ISBN mas grande del arbol 1 es: ' ,isbnmasgrandearbol1(a1));

writeln('el ISBN mas chico del arbol 2 es: ', isbnmaschicoarbol2(a2));


writeln('ingrese un numero de socio'); readln (numero);
cant:= 0;
prestamosalsocioA1(a1,numero,cant);
	writeln('la cantidad de prestamos al socio ' ,numero, 'fueron :' ,cant);

writeln('ingrese otro numero de socio '); readln(numeroo);
cantt:= 0;
prestamosalsocioA2(a2,numeroo,cantt);

generarA3(a1,a3); 

lg:=nil 
G(a2,lg);


writeln('ingrese valor 1'); readln(v1);
writeln('ingrese valor 2'); readln(v2);
cantidad:=0;
J(a2,v1,v2,cantidad); 
	writeln('la cantidad es ', cantidad);
end.
