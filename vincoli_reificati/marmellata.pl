:- lib(fd).
/* Di 6 bambini esattamente 2 hanno rubato la marmellata, ma chi ?*/
/* Aldo, Dario, Elio, Bruno, Carlo, Franco */
/* Uno dei 5 bambini ha nominato 2 innocenti, gli altri 1 innocente e 1 colpevole */
marmellata(Aldo_ruba, Dario_ruba, Elio_ruba, Bruno_ruba, Carlo_ruba, Franco_ruba) :-
    [Aldo, Dario, Elio, Bruno, Carlo] :: [0..1], /* dicono la verità? */
    [Aldo_ruba, Dario_ruba, Elio_ruba, Bruno_ruba, Carlo_ruba, Franco_ruba] :: [0..1],
    ((Dario_ruba #= 0) #/\ (Elio_ruba #= 0)) #<=> Aldo, /* se è vero Aldo = 1 , Dario ed Elio sono innocenti , se invece Aldo = 0, Dario o Elio o nessuno dei due è innocente*/
    ((Carlo_ruba #=0) #/\ (Franco_ruba #=0)) #<=> Bruno,
    ((Franco_ruba #=0) #/\ (Elio_ruba #=0)) #<=> Carlo,
    ((Aldo_ruba #=0) #/\ (Elio_ruba #=0)) #<=> Dario,
    ((Carlo_ruba #=0) #/\ (Bruno_ruba #=0)) #<=> Elio,
    /* Aldo #=1 #/\ Bruno #=1 #/\ Carlo#=1 #/\ Dario#=1 #/\ Elio#=1, */
    Dario_ruba + Elio_ruba #< 2, /* coppie impossibili */
    Carlo_ruba + Franco_ruba #< 2,
    Franco_ruba + Elio_ruba #< 2,
    Aldo_ruba + Elio_ruba #< 2,
    Carlo_ruba + Bruno_ruba #< 2,
    (Aldo + Bruno + Carlo + Dario + Elio) #= 1, /* solo uno dei bambini ha detto la verità */
    (Aldo_ruba + Dario_ruba + Elio_ruba + Bruno_ruba + Carlo_ruba + Franco_ruba) #= 2, /* solo 2 hanno rubato */
    labeling([Aldo_ruba, Dario_ruba, Elio_ruba, Bruno_ruba, Carlo_ruba, Franco_ruba]).
    /* 
    labaws.cvu2gskuisvi.eu-central-1.rds.amazonaws.com
    52.57.244.195
     */
    



