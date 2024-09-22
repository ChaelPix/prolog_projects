% lists
myNumberList([0, 1, 2, 3]).
myLetterList([a, b, c, d]).

% ------------------------------------------------- get head and tail of a list
head_tail([Head | Tail], Head, Tail).

% ------------------------------------------------- get sum
% ex: myNumberList(L), head_tail(L, Head, Tail).
% ex: head_tail([5, 6, 7], H, T), sum(T, S).

sum([], 0).

% rule
sum([Head | Tail], S) :-
    sum(Tail, SommeTail), % will call agin sum but without the new head
    S is Head + SommeTail. % add every head to het final sum

% ------------------------------------------------- check if  element is in list
% ex: ?- element(3, [3, 4, 5]).

% rule
element(X, [X | _]).    % rule 1: X is head of list
element(X, [_ | Tail]) :- element(X, Tail). % rule 2: if rule 1 false, check again with the tail list to see if in the list.

% ------------------------------------------------- check if element is first in list
% ex: ? ?- is_first(5, [5, 2, 3]).

% rule
is_first(X, [X | _]).

% ------------------------------------------------- matrices
% ex:   matrice(T), maplist(head_tail, T, Heads, _).
%       T = [[1, 2, 3], [4, 5, 6], [7, 8, 9]],
%       Heads = [1, 4, 7].
matrice([
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
]).