% Base de Conocimientos

% vive(Persona, Caracteristicas)
%casa(metrosCuadrador)
vive(juan, casa(120)).
vive(fer, casa(110)).

% depto(ambientes, baños)
vive(nico, depto(3, 2)).
vive(alf, depto(3, 1)).
vive(vale, depto(4, 1)).

% loft(añoDeConstruccion)
vive(julian, loft(2000)).

%Felipe no se modela -> principio de universo cerrado.

%seQuiereMudar(Persona, Lugar).
seQuiereMudar(rocio, casa(90)).

%vivenEn(Persona, Barrio).
vivenEn([alf, juan, nico, julian], almagro).
viveEn(juan, almagro).
viveEn(nico, almagro).
viveEn(julian, almagro).
viveEn(vale, flores).
viveEn(fer, flores).

%--------------------------------------------------------------
% Punto 2
%--------------------------------------------------------------

% esBarrioCopado(Barrio): verdadero si todas las personas del barrio viven en un propiedad copada.
esBarrioCopado(Barrio):-
    viveEn(_, Barrio),
    forall(viveEn(Persona, Barrio), viveEnPropiedadCopada(Persona)).  

viveEnPropiedadCopada(Persona):-
    vive(Persona, Propiedad),
    esPropiedadCopada(Propiedad).

esPropiedadCopada(casa(MetrosCuadrados)):-
    MetrosCuadrados > 100.

esPropiedadCopada(depto(CantAmbientes, _)):-
    CantAmbientes > 3.

esPropiedadCopada(depto(_, CantBanios)):-
    CantBanios > 1.

esPropiedadCopada(loft(AnioDeConstruccion)):-
    AnioDeConstruccion > 2015.

%--------------------------------------------------------------
% Punto 3
%--------------------------------------------------------------

esBarrioCaro(Barrio):-
    viveEn(_, Barrio),
    forall(viveEn(Persona, Barrio), not(viveEnPropiedadBarata(Persona))).

viveEnPropiedadBarata(Persona):-
    vive(Persona, Propiedad),
    esPropiedadBarata(Propiedad).

esPropiedadBarata(loft(AnioDeConstruccion)):-
    AnioDeConstruccion < 2005.

esPropiedadBarata(casa(MetrosCuadrados)):-
    MetrosCuadrados < 90.

esPropiedadBarata(depto(CantAmbientes, _)):-
    CantAmbientes < 3.

%--------------------------------------------------------------
% Punto 4
%--------------------------------------------------------------

% valorDeInmuebleDe(Persona, Valor):  valor expresado en dolares.
valorDeInmuebleDe(juan, 150000).
valorDeInmuebleDe(nico, 80000).
valorDeInmuebleDe(alf, 75000).
valorDeInmuebleDe(julian, 140000).
valorDeInmuebleDe(vale, 95000).
valorDeInmuebleDe(fer, 60000).

% sin recursividad, para comprar una propiedad.
puedoComprarLaCasaDe(Persona, DineroDisponible):-
    vive(Persona, _),
    valorDeInmuebleDe(Persona, Valor),
    DineroDisponible >= Valor.


/*
debe ser recursivo usando el predicado sublista([], [])
sublista([_|cola], Sublista):-
    sublista(cola, Sublista).
*/
% quePuedoComprarCon(Dinero, PropiedadesQuePuedoComprar).
/*
sublista([], []).
sublista([_|cola], Sublista):-
    sublista(cola, Sublista).
sublista([Cabeza|cola], [Cabeza|Sublista]):-
    sublista(cola, Sublista).


quePuedoComprarCon(Dinero, PropiedadesQuePuedoComprar):-
    listaDeValroesDeInmuebles([Cabeza|Cola]),

    Dinero is Dinero - Cabeza,
    valorDeInmuebleDe(Persona, Cabeza),
    append(PropiedadesQuePuedoComprar, [Persona], PropiedadesQuePuedoComprar).

listaDeValroesDeInmuebles(ListaDeValores):-
    findall(Valor, valorDeInmuebleDe(_, Valor), ListaDeValores).
*/


    