% ----------------- Ex 1
% predicat premier
premier(X, [X | _]).

% predicat dernier
dernier(X, [X]).
dernier(X, [_ | Tail]) :- dernier(X, Tail).

% ----------------- Ex 2
% predicat verif ordre desc
verif_liste_pnd(0, []).
verif_liste_pnd(N, [N | Reste]) :-
    N > 0,
    N1 is N - 1,
    verif_liste_pnd(N1, Reste).

% predicat verif ordre asc
verif_liste_pnc(0, []).
verif_liste_pnc(N, [N | Reste]) :-
    N > 0,
    N1 is N + 1,
    verif_liste_pnc(N1, Reste).