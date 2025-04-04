/*
Cinque colleghi vanno al ristorante per festeggiare la promozione di uno di loro. Ordinano tutti piatti diversi, ciascun collega sceglie un primo e un secondo.
Il cameriere pero` fa confusione, e cosi` Bizzi riceve il primo piatto che era stato chiesto da Dotti.
Costa ha ricevuto (esattamente) uno dei piatti ordinati da Dotti, mentre Dotti non ha ricevuto piatti ordinati da Costa.
Fantini ha ricevuto due piatti ordinati due persone diverse.
Aldini ha ricevuto almeno un piatto ordinato da Bizzi.
Si trovi la soluzione in cui il cameriere ha fatto meno errori, fra quelle che rispettano le regole date sopra.
*/

/* consiglio i problemi di ottimizzazione hanno una struttura base
    csp(L) :-
        imponi_vincoli(L),
        funzione_obiettivo(L,C),
        minimize(labeling(L), C).
*/

% variabili => Bizzi (2),Dotti (4),Costa (3),Fantini (5),Aldini (1)
% ordine(Bizzi, X) 
% Domini => [0,0]
:- lib(fd).

ristorante(L) :-
    L = [A_primo, A_secondo, B_primo, B_secondo, C_primo, C_secondo, D_primo, D_secondo, F_primo, F_secondo],
    L :: 1..5,
    (A_primo #= 2 #\/ A_secondo #= 2),
    B_primo #= 4,
    (C_primo #= 4 #\/ C_secondo #= 4),
    (D_primo #\= 3 #/\ D_secondo #\= 3),
    (F_primo #\= 5 #/\ F_secondo #\= 5) #/\ (F_primo #\= F_secondo),
    alldifferent([A_primo,B_primo,C_primo,D_primo,F_primo]),
    alldifferent([A_secondo, B_secondo, C_secondo, D_secondo, F_secondo]),
    /* funzione obiettivo da minimizzare con C costo */
    A_primo #\= 1 #<=> E1,
    A_secondo #\= 1 #<=> E2,
    B_primo #\= 2 #<=> E3,
    B_secondo #\= 2 #<=> E4,
    C_primo #\= 3 #<=> E5,
    C_secondo #\= 3 #<=> E6,
    D_primo #\= 4 #<=> E7,
    D_secondo #\= 4 #<=> E8,
    F_primo #\= 5 #<=> E9,
    F_secondo #\= 5 #<=> E10,
    C #= E1 + E2 + E3 + E4 + E5 + E6 + E7 + E8 + E9 + E10,
    minimize(labeling(L), C).

