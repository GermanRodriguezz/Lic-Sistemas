program parcial;
type
rangomes = 1..12;
vectormontos = array [rangomes] of real;

compra = record
	codcliente: integer;
	numfactura: integer;
	nummes: rangomes;
	montogastado : real;
end;

info = record
	comp : compra;
	vector : vectormontos;
end;

arbol = ^nodoarbol;
nodoarbol = record
	dato : info;
	hi : arbol;
	hd : arbol;
end;

procedure leerCompra(var c:compra);
begin
	c.codcliente := random(1000);
	if (c.codcliente <> 0) then begin
		c.numfactura:= random(2000)+ 1000;
		c.nummes := random(12)+1;
		c.montogastado:= random(20000)/(random(10)+1);
	end;
end;

procedure inicializarVector(var v:vectormontos);
var i: rangomes;
begin
	for i:= 1 to 12 do 
		v[i] := 0;
end;

procedure insertar(var a:arbol;c:compra);
begin
	if (a = nil) then begin
		new(a);
		a^.dato.comp := c;
		inicializarVector(a^.dato.vector);
		a^.dato.vector[c.nummes] := c.montogastado;
		a^.hi := nil;
		a^.hd := nil;
	end
	else if (a^.dato.comp.codcliente = c.codcliente) then 
			a^.dato.vector[c.nummes] := a^.dato.vector[c.nummes] + c.montogastado
		else if (a^.dato.comp.codcliente > c.codcliente) then
				insertar(a^.hi,c)
			else
				insertar(a^.hd,c);
end;

procedure cargarArbol(var a:arbol);
var c:compra;
begin
	leerCompra(c);
	while (c.codcliente <> 0) do begin
		insertar(a,c);
		leerCompra(c);
	end;
end;

procedure imprimirOrd(a:arbol);
begin
	if (a <> nil) then begin
		imprimirOrd(a^.hi);
		writeln(a^.dato.comp.codcliente);
		imprimirOrd(a^.hd);
	end;
end;

procedure imprimirVector(v:vectormontos);
var i:rangomes;
begin
	for i := 1 to 12 do 
		writeln('monto del mes ' , i , ' : ', v[i]:2:2);
end;

procedure sacarmax(v:vectormontos; var mes:rangomes);
var i:rangomes; max:real;
begin
	max := -1;
	for i := 1 to 12 do begin
		if (v[i] > max) then begin
			max := v[i];
			mes := i;
		end;
	end;
end;

procedure moduloB(a:arbol; codigo: integer; var mesmax:rangomes);
begin
	if (a <> nil) then begin
		if (a^.dato.comp.codcliente = codigo) then begin
			imprimirVector(a^.dato.vector);
			sacarmax(a^.dato.vector,mesmax)
		end
		else if (a^.dato.comp.codcliente > codigo) then
				moduloB(a^.hi,codigo,mesmax)
			else
				moduloB(a^.hd,codigo,mesmax);
	end;
end;

procedure moduloC(a:arbol; mes:integer; var cant:integer);
begin
	if (a <> nil) then begin
		if(a^.dato.vector[mes] = 0) then
			cant := cant + 1;
		moduloC(a^.hi,mes,cant);
		moduloC(a^.hd,mes,cant);
	end;
end;

var
a:arbol;
cod: integer;
mes: rangomes;
cant: integer;
begin
randomize;
a := nil;
cargarArbol(a);
writeln('imprimira arbol ordenado');
imprimirOrd(a);

writeln('ingrese codugo de cliente');
readln(cod);
moduloB(a,cod,mes);
writeln('el mes con mayor gasto hecho por el cliente ', cod , ' es ....', mes);

writeln('ingrese un mes');
readln(mes);
moduloC(a,mes,cant);
writeln('la cantidad de clientes que no gastaron nada en el mes ', mes ,' fueron ', cant);
end.

