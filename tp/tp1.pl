%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ?- [tp1].
% true.

% ?- pere(odilon, marcel).
% false.

% ?- mere(odilon, pauline).
% false.

% ?- mere(X, edouard).
% X = genevieve .

% ?- pere(roger, R).
% R = roseline .

% ?- grand_parent(P, blaise).
% P = roger .

% ?- frere_ou_soeur(pauline, X).
% X = roger .

% ?- tante(marcel, X).
% false.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% --------------------------- faits
homme(odilon).
homme(roger).
homme(vincent).
homme(arnaud).
homme(marcel).
homme(edouard).
homme(marius).
homme(blaise).

femme(genevieve).
femme(pauline).
femme(melanie).
femme(paule).
femme(tatiana).
femme(roseline).
femme(prisca).
femme(agnes).
femme(martine).

couple(0, (odilon, genevieve)).
couple(1, (roger, melanie)).
couple(2, (edouard, tatiana)).
couple(3, (vincent, roseline)).
couple(4, (marcel, paule)).

enfant(roger, 0).
enfant(pauline, 0).
enfant(edouard, 0).
enfant(roseline, 1).
enfant(marcel, 1).
enfant(marius, 2).
enfant(prisca, 2).
enfant(agnes, 3).
enfant(arnaud, 3).
enfant(martine, 4).
enfant(blaise, 4).

% --------------------------- predicats
    % X = pere, y = fils
pere(X, Y) :- 
    homme(X),
    enfant(Y, N), 
    couple(N, (X, _)).

mere(X, Y) :- 
    femme(X),
    enfant(Y, N), 
    couple(N, (_, X)).

soeur(X, Y) :- 
    femme(X),
    enfant(X, C1),
    enfant(Y, C2),
    C1 = C2.

frere(X, Y) :- 
    homme(X),
    enfant(X, C1),
    enfant(Y, C2),
    C1 = C2.

frere_ou_soeur(X, Y) :- 
    enfant(X, C1),
    enfant(Y, C2),
    C1 = C2.

oncle(X, Y) :-
    homme(X),
    enfant(Y, N), 
    couple(N, (P, M)),
    (frere_ou_soeur(X, P) ; frere_ou_soeur(X, M)).

tante(X, Y) :-
    femme(X),
    enfant(Y, N), 
    couple(N, (P, M)),
    (frere_ou_soeur(X, P) ; frere_ou_soeur(X, M)).

grand_parent(X, Y) :-
    enfant(Y, N), 
    couple(N, (P, M)),
    (enfant(P, NP), couple(NP, (X, _)) ;
     enfant(P, NP), couple(NP, (_, X)) ;
     enfant(M, NM), couple(NM, (X, _)) ;
     enfant(M, NM), couple(NM, (_, X))).