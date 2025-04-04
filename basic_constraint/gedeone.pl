:- lib(fd).

/* 
In 11 years, Dario will be the age I was when he was 6 times younger than me.  
Umberto, on the other hand, is 3 years older than Dario and 3 years younger than the age difference between Dario and me.

How old is Mr. Gedeone, and how old are his grandchildren?
*/
csp(Dario,Umberto,Gedeone) :-
    Dario::1..100, Umberto::1..100,Gedeone::1..100,
    Gedeone_passato::1..100, Dario_passato::1..100,
    Dario #= Dario_passato* 6 -11, Dario_passato * 6 #= Gedeone_passato,

    Umberto #= Dario + 3, Umberto #= Gedeone - Dario -3,

    Dario_passato - Gedeone_passato #= Dario - Gedeone,
    labeling([Dario,Umberto, Gedeone]).