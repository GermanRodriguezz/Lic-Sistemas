titles = [
    "SpeedRun de Super Mario en tiempo record",
    "Charla sobre desarrollo de videojuegos",
    "Jugando al nuevo FPS del momento con amigos",
    "Musica rn vivo: improvisaciones al piano"
]

titulos_separados = [titulo.split() for titulo in titles] # titulos_separados sera una lista de lista
#donde las sublistas tendran como contenido las palabras de cada oracion de titles
print(titulos_separados)

print('MOSTRAR EN PANTALLA EL TITULO CON MAS PALABRAS')
cantidadPalabras = 0
for lista in titulos_separados:
    if len(lista) > cantidadPalabras :
        cantidadPalabras = len(lista)
        listaMaxima = lista
print(listaMaxima)