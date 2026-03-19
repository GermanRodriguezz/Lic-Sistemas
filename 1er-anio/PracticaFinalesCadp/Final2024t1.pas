///1
///2
///3
Memoria estatica 

registro =
    nombre : string = 256
    nota : integer = 6
    datos : ^ = 4           = 266 bytes

vector [1..100] of registro 

v : vector / = 26600 bytes
i , h : integer / = 12 bytes
e : registro / = 266 bytes  = 26600 + 278 = 26878 bytes

Memoria dinamica
FOR J := 1 TO I DO begin
    new(v[j].datos) 

i = en el peor de lo casos toma el valor 100
v[j].datos = integer;

100 * 6 = 600 bytes
end;
///4
tiempo de ejecucion.
i := 0;                 1 UT
while () and () do begin            C(N+1) + N(CUERPO)
                                    C = 3
                                    N = 100
                                    CUERPO = 4
    e.datos := nil;     1 UT
    i := i + 1;         2 UT
    v[i] := e;          1 UT
end;                                3(100+1) + 100(4)
                                    303 + 400 = 703 UT

for j := 1 to i do begin                    (3N + 2) + N(CUERPO)
                                            N = 100
                                            CUERPO = 2

    v[j].datos^ := v[j].nota MOD 10     2UT
end;                                        (3*100 + 2) + 100(2)
                                            302 + 200 = 502 UT
703 + 502 + 1 = 1206 UT





///5