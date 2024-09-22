% Facts about parentage
man(albert).
man(bob).
woman(alice).
woman(betty).
woman(ela).

% Clauses for the predicate father/2 -> /2 = 2 params
father(albert, bob).
father(albert, betty).
father(albert, ela).

% Clauses for the predicate mother/2
mother(alice, bob).
mother(alice, betty).
mother(alice, ela).

%sister
sister(X, Y) :-
    woman(X), woman(Y),
    father(P, X), father(P, Y),
    mother(M, X), mother(M, Y),
    X \= Y. 

% Definition of a parent
parent(X, Y) :- father(X, Y).
parent(X, Y) :- mother(X, Y).
