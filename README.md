# Ingenieria del Software II 
[![Build Status](https://travis-ci.org/hectorbm/klatllams-aardvarks.svg?branch=master)](https://travis-ci.org/hectorbm/klatllams-aardvarks)
[![Coverage Status](https://coveralls.io/repos/github/hectorbm/klatllams-aardvarks/badge.svg)](https://coveralls.io/github/hectorbm/klatllams-aardvarks)

## Metacello

```smalltalk
Metacello new
   baseline: 'IngSoft2';
   githubUser: 'hectorbm' project: 'klatllams-aardvarks' commitish: 'master' path: 'repository';
   load: 'development'.
```

---
Para el final agregar lo siguiente:

Para la obtencion de cartas del juego, implementar el mazo de cartas con una cantidad finita de cartas y deterministico (una vez armado):
* El mazo debe tener una cantidad fija y armarse antes de iniciar el juego con probabilidad de ocurrencia de cartas (como el tablero).
* Las cartas que se usan/descartan van a un mazo de descarte.
* Si se acaba el mazo se hace un shuffle del mazo de descarte y se ponen todas las cartas en el mazo.
* Si no hay cartas en el mazo de descarte, se debe esperar hasta que haya cartas, mientras tanto no se pueden sacar cartas del mazo.
