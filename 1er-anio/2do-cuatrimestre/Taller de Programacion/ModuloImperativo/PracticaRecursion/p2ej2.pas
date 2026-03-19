program tres;
type
lista = ^nodo;

nodo = record
dato: integer;
sig: lista;
end;

procedure agregar(var l:lista;numero: integer);
var
	aux,nue:lista;
begin
new(nue);
nue^.dato := numero;
nue^.sig := nil;
if l = nil then
	l:= nue
	else begin
		aux:= l;
		while aux^.sig <> nil do 
			aux:= aux^.sig;
		aux^.sig:= nue;
	end;
end;
///incisoC///
procedure imprimirInservo(l: lista);
begin
		if l <> nil then begin
			imprimirInservo(l^.sig);
			writeln('el dato es ',l^.dato);
			end;
end;
///incisoA///
procedure cargarLista(var l: lista;min: integer; max: integer);
var
	n:integer;
begin
	n:= min + random(max-min+1);
	writeln('El numero generado es el ',n);
	if n <> 100 then begin
		agregar(l,n);
		cargarLista(l,min,max);
	end;
end;
///incisoB///
procedure imprimir (l:lista);
begin
	if l <> nil then begin
		writeln(l^.dato);
		imprimir(l^.sig);
	end;
end;
///incisoD///
procedure minimo(l: lista;var min:integer);
begin
	if l <> nil then begin
		if l^.dato < min then 
			min:= l^.dato;
		minimo(l^.sig,min);
	end;
end;

///incisoE///
function buscar(l: lista;n: integer): boolean;
begin
	if l = nil then
		buscar:= false
	else 
		if l^.dato = n then
			buscar:= true
		else
			buscar:= buscar(l^.sig,n);
end;

var
l: lista;
num,mini: integer;
i: integer;
f: integer;
begin
randomize;
l := nil;
i := 100;
f := 200;
cargarLista(l,i,f);

imprimir(l);

mini:= 9999;
minimo(l,mini);
writeln('El numero minimo de la lista fue el ',mini);

imprimirInservo(l);

writeln('Ingrese un numero a buscar'); readln(num);
if buscar(l,num) then
	writeln('Se encontro el numero :D')
	else
	writeln('No se encontro el numero :(');
end.
