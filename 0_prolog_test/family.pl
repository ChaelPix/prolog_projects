% Facts about parentage
man(albert).
man(bob).
woman(alice).
woman(betty).

% Clauses for the predicate father/2 -> /2 = 2 params
father(albert, bob).
father(albert, betty).

% Clauses for the predicate mother/2
mother(alice, bob).
mother(alice, betty).

% Definition of a parent
parent(X, Y) :- father(X, Y).
parent(X, Y) :- mother(X, Y).
