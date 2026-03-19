program final
const 
	rango = 1..5;
type
participante = record
	dni : integer;
	nomyape : string;
	cat : rango;
	fecha : integer;
end;

lista = ^nodo;
nodo = record
	dato : participante;
	sig : lista;
end;

categorias = record {esta estructura sera la que vaya acumulando por categoria}
	l : lista;
	cant : integer;
end;
{este vector es donde voy a ir acumulando las listas y las cantidades}
vectorLista = array [1..5] of categorias;

listaFinal = ^nodoFinal;
nodoFinal = record
	cat: integer;
	lista : lista;
	sig : listaFinal
end;

procedure inicializarVec(var v: vectorLista);
var i : integer;
begin
	for i : 1 to 5 do begin	
		v[i].cant := 0;
		v[i] := nil;
	end;
end;
{procedimiento que carga el vector}
procedure agregar(var v:vectorLista; p:participante);
var cate: integer;
begin
	cate : p.cat;
	new(nue);
	nue^.dato := p;
	nue^.sig := v[cat].l;
	v[cat].l := nue;
	v[cat].cant := v[cat].cant + 1;
end;

procedure agregarFinal(l : lista; cat : integer; var lf: listaFinal);
var nue: listaFinal;
begin
	new(nue);
	nue^.cat := cat;
	nue^.lista := lista;
	nue^.sig := lf;
	lf := nue;
end;

procedure filtrar(v: vectorLista; var lf : listaFinal);
var
begin
	for i : 1 to 5 do begin
		if v[i].cant <= 50 then
			agregarFinal(v[i].l,i,lf);
	end;
end;

procedure cargarVector(l : lista; var v:vectorLista);
var
begin
	while l <> nil do begin
		agregar(v[l^.dato.cat].l,l^.dato);
		l := l^.sig;
	end;
end;

var
begin
end.
/// PUNTO 2
	falso, siempre es posible la comunicacion entre modulos con variables globas, las pueden usar todo el programa a las variables globales.
	verdadero, siempre sera posible la eliminacion del vector siempre y cuando se repeten los pasos a realizar como actualizar el dimF, hacer los corrimientos,etc
	verdadero, puede aparecer el mal manejo de memoria con la modularizacion.
	verdadero, es la unica manera de acceder a un elemento, de distinta manera funcionan las estructuras de datos indexadas que se pueden acceder a una posicion de memoria
		solo con un indice.
/// PUNTO 3
/// PUNTO 4
	comunicacion entre modulos
	variables globales: son variables del programa a la cual pueden acceder cualquier modulo/procedimiento modificarlas y usarlas,  se declaran por encima del type
	parametros por valor: son copias de la variable, logrando que puedan usarse sin producirse ningun tipo de cambio en su valor.
	parametros por referencia: son las direcciones de memoria de la variable, por lo tanto de esta manera si pueden modificarse.
/// PUNTO 5
	memoria estatica: 80 + 4 + 4 + 31 = 119BYTES -> 80 BYTES porque el arreglo es de 20 posiciones y el contenido de cada posicion cuesta 4 bytes 20 * 4 
	memoria dinamica: 430 - 258 = 172bytes
			 430 porque el for se ejecuta 10 veces y se reservan 43 bytes por cada iteracion
			258 porque el douwto se ejecuta 6 veces
	tiempo de ejecucion: 3n + 2 + n.cuerpo n = 10 cuerpo = 3
						 3. 10 + 2 + 10.3
						 36 + 30 = 66ut
						 
						3.n+2 + n.cuerpo  n = 5 cuerpo = 0
						3.5+2 + 5.0
						21 + 0 
						66 + 21 = 87ut
