///1
program parcial;
type
publicacion = record
    titulo : string[30];
    nombreautor : string[30];
    dniautor : integer;
    tipopubli : 1..12;
end;

lista = ^nodo;
nodo = record
    dato : publicacion;
    sig : lista;
end;

registroAutor = record
    cant : integer;
    autor : string;
    l : lista;
end;

vectorContador = array [1..12] of integer;

procedure leerPublicacion(var p:publicacion);
begin
    writeln(ingrese dni);
    readln(p.dni);
    if p.dni <> 0 then begin
        writeln('ingrese titulo');
        readln(p.titulo);
        writeln('ingrese nombreautor');
        readln(p.nombreautor);
        writeln('ingrese tipopubli');
        readln(p.tipopubli);
    end;
end;

procedure inicializarVec(var v: vectorContador);
var i: integer;
begin
    for i := 1 to 12 do
        v[i] := 0;
end;

procedure insertarOrdernado(var l: lista, p: publicacion);
var ant, act, nue: lista;
begin
    new(nue);
    nue^.dato := p;
    nue^.sig := nil;
    if l = nil then
        l := nue
    else begin
        act := l;
        while (act <> nil) and (p.dni < act^.dato.dni) do begin  {caso en que no se encuentra el espacio}
            ant := act;
            act := act^.sig;
        end;
        if act = l then begin   {encontre y si esta en el mismo lugar, el nuevo apunta a L, lo engancho atras }
            nue^.sig := l;
            l := nue;
        end
        else
            ant^.sig := nue; {sino esta en el medio}
        nue^.sig := act;
    end
end;

procedure cargarLista(var l: lista);
var p: publicacion;
begin
    leerPublicacion(p);
    while p.dni <> 0 do begin 
        insertarOrdernado(l,p);
        leerPublicacion(p);
    end;
end;

procedure procesar(l: lista; var v: vectorContador);
var autoract : string; autorpubli, i,maxcant, tipomax: integer;
begin
    while l <> nil do begin
        v[l^.dato.tipopubli] := v[l^.dato.tipopubli] + 1;
        autoract := l^.dato.nombreautor;
        autorpubli := 0;
        while (l <> nil) and (l^.dato.nombreautor = autoract) do begin
            autorpubli := autorpubli + 1;
            l := l^.sig;
        end;
        write('el autor ', autoract, 'tiene ', autorpubli, 'publicaciones hechas');
    end;
    maxcant := 0;
    for i := 1 to 12 do begin
        if v[i] > maxcant then begin
            maxcant := v[i];
            tipomax := i;
        end;
    end;
    write('el tipo de publicacion con mayor cantidad de publicaciones es ', tipomax);
end;



var
l : lista; v: vectorContador;
begin
l := nil;
inicializarVec(v);
cargarLista(l);
procesar(l,vec);
end;
///2
calculo de memoria estatica del punto 1
l : puntero 4 bytes
v : vector 12 * 4 bytes 
                            4 + 48 = 56 bytes;
///3
///4
///5
tiempo de ejecucion del punto 3
program prueba
var c: integer;

    procedure calcular()
    begin
    b := 10;                    1 ut
        while b>0 do begin      c(n + 2) + n(cuerpo) -> 1(5 + 2) + 5(6)
            a := a+b            2UT
            b := b-2            2UT
            c := c-b            2UT
    end;
var
    a,b : integer;
begin
    b := 80; 1ut
    c := 30; 1ut
    calcular() 38ut   -> 40ut
end.
