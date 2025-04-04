:- lib(fd).

/*Write a CLP(FD) predicate that enforces a strictly decreasing
 order on a list of variables FD, given as input.
  /* In the Eclipse console write :  risolvi([A,B,C])*/
risolvi(L) :-   
    L :: 1..10,
    ordina(L),
    labeling(L).

ordina([]).
ordina([_]).
ordina([A,B|T]) :-
    A #> B,
    ordina([B|T]).

/* A #> B,
B #> C,
C #> D.
*/

/* Write a CLP(FD) predicate that enforces that
 the values of a list of variables FD are all different from each other.  */

risolvi2(L) :-   /* usage example:  risolvi([A,B,C])*/
    L :: 1..10,
    diverso(L), /* complexity : O(n^2) good solution
    labeling(L).

/*  basic case*/
diverso([_]).
/* recursive case */
diverso([H|T]) :-
    propaga_diverso(H,T),
    diverso(T).

/*  basic case */
propaga_diverso(_,[]).
/*  recursive case */
propaga_diverso(X, [H|T]) :-
    X #\= H,
    propaga_diverso(X,T).

/* naive solution, complexity : O(2^n) worst case*/

all_diff([_]).
all_diff([A,B|T]) :-
    A #\= B,
    all_diff([A|T]),
    all_diff([B|T]).
    
