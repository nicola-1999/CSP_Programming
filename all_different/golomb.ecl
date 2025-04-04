/* risolvere il problema del righello di Golomb 
    scrivere un predicato golomb(L,N,Lmax)
    * N tacche del righello
    * Lmax è il valore max del righello
    * L è la lista di uscita

    le distanze tra due tacche qualsiasi devono essere tutte diverse tra loro */
:- lib(fd).

/* slide 123 cap1 */
labelingff([]).
labelingff(L) :-
    deleteff(X,L,R),
    indomain(X),
    labelingff(R).

/* csp */
golomb(L,N,Lmax) :-
    length(L,N),
    L :: 0..Lmax,
    alldifferent(L),
    ordina(L),
    distanze(L, DL),
    alldifferent(DL),
    /*    
            ListaDistanze = [D12,D13,D14,D23,D24,D34] almeno 2 predicati O(n^2)
            LD :: 1 ..6,
            D12 #= T2 - T1,
            alldifferent(ListaDistanze) */
    labelingff(L).

/* concatena tutte le distanze e le fornisce in uscita a DL */
distanze([],[]).
distanze([_],[]).
distanze([H|T], DL) :-
    distanze_loop(H,T,DLp),
    distanze(T,DLt), /* DLt = Distance List tail */
    append(DLp,DLt, DL).

/* calcola le distanze parziali [D12,D13,D14] ...*/
distanze_loop(_,[],[]).
distanze_loop(H1, [H2|T], [Di|DLp]) :-
    Di #= H2 - H1,
    distanze_loop(H1,T,DLp). /* DLp = Distance List partial */

    
/* ordina in senso crescente una lista*/
ordina([]).
ordina([_]).

ordina([A,B|T]) :-
    A #< B,
    ordina([B|T]).