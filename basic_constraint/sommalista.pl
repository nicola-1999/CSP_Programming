/*
Write a CLP(FD) predicate that enforces a variable S 
to be the sum of a list of variables with a domain.
*/
:- lib(fd).

risolvi(L,S) :-
    L :: 0..10, S :: 0..100,
    sommalista(L,S),
    labeling(L).

sommalista([],0) :- !.
sommalista([H|T], S)  :- S #= H + S1, sommalista(T,S1).

