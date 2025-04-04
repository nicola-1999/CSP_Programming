/* Un bimbo colleziona N blocchi numerati da 1 a N
    vuole mettere i blocchi in sequenza in modo che :
    i due blocchi '1' abbiano 1 blocco che li separa
    i due blocchi '2' abbiano 2 blocchi che li separa
    ...
    i due blocchi 'N' abbiano N blocchi che li separa.
        Ad esempio, una soluzione per N=4 è la seguente:

            4 1 3 1 2 4 3 2

    Variabili :  N contiene il numero dei blocchi e la inserisce l'utente

    Domini :

    Vincoli : il blocco_i deve 
            1) iniziare con il valore i
            2) avere esattamente i elementi
            3) il valore successivo agli i-elementi deve essere proprio i.

*/

:- lib(fd).
:-lib(fd_global).

langford(N,L) :-
    Max_len is N*2,
    length(L,Max_len),
    L :: 1..Max_len, /*lista di uscita nella forma [Start_blocco1, End_blocco1, Start_blocco2, End_blocco2, ..., Start_bloccoN, End_bloccoN] */
    length(Ldiff, N), /* lista che tiene traccia della durata dei vari blocchi */
    Ldiff :: 1..N+1,
    fd_global:alldifferent(L), /* blocchi diversi non posso iniziare o finire allo stesso istante */
    distanze(L,2,Ldiff),
    fd_global:alldifferent(Ldiff), /* ogni blocco ha una durata diversa */
    labeling(L).

distanze([],_,[]).
distanze([A,B|T], I, [Di|T2]) :-
    B - A #= I,
    Di #= B - A,
    I2 is I + 1,
    distanze(T,I2,T2).

    
    