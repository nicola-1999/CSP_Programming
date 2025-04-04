:-lib(fd).

/* risolvi([TaskNonna,TaskCane,TaskTorta]) 
Gli indici In,Ic,It sono riferiti ai 3 tasks, inoltre
corrispondono a 1 = task eseguito da Carletto,
                2 = task eseguito da Pierino,
                3 = task eseguito da Tommaso*/
/* Carletto può parlare con la nonna per 5 minuti, Pierino per 3 e Tommaso per 2,
    Carletto può distarre il cane per 4 minuti, Pierino per 2 e Tommaso per 3,
    Carletto può sottrarre la torta in 2 minuti, Pierino in 5, Tommaso in 4,

    Si può iniziare a distarre il cane solo un minuto dopo che la nonna abbia iniziato a parlare 
    e almeno 1 minuto prima che finisca
    
    Si può sottrarre la torta se sia il cane che la nonna sono distratti
     */
risolvi(In,Ic,It,Start_n, End_n, Start_c, End_c, Start_t, End_t) :-
    [In,Ic,It] :: 1..3, /* 1 = Carletto, 2 = Pierino, 3 = Tommaso */
    [Start_n,Start_c,Start_t] :: 0..5,
    [End_n,End_c,End_t] :: 0..10,
    alldifferent([In,Ic,It]),
    Dn = [5,3,2],
    Dc = [4,2,3],
    Dt = [2,5,4],
    element(In,Dn,Vnonna),
    element(Ic,Dc, Vcane),
    element(It,Dt, Vtorta),
    Start_c #>= Start_n + 1,
    Start_c #<= End_n - 1,
    Start_t #>= Start_n,
    Start_t #>= Start_c,
    End_t #<= End_n,
    End_t #<= End_c,
    /*Vnonna-1 #>= Vtorta,
    Vcane #>= Vtorta,*/
    End_n #= Vnonna + Start_n,
    End_c #= Vcane + Start_c,
    End_t #= Vtorta + Start_t,
    labeling([In,Ic,It]),
    labeling([Start_n,Start_c,Start_t]).



