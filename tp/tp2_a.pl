% homme(paul, grand, brun, mur).
% femme(lea, petit, brun, mur).

celibataire(paul, homme, moyen, brun, mur).
celibataire(pierre, homme,  moyen, blond, jeune).
celibataire(jean, homme,  petit, brun, mur).

celibataire(marie, femme,  moyen, blond, moyen).
celibataire(eva, femme, petit, blond, jeune).
celibataire(lea, femme, grand, rousse, jeune).

pref_physique(paul, grand, rousse, jeune).
pref_physique(pierre, petite, blond, jeune).
pref_physique(jean, petit, blond, moyen).
pref_physique(marie, grand, brun, moyen).
pref_physique(eva, moyen, blond, jeune).
pref_physique(lea, moyen, brun, mur).

types_musique(0, classique).
types_musique(1, rock).
types_musique(2, jazz).

musique(paul, [0]).
musique(pierre, [1]).
musique(jean, [2]).
musique(marie, [0, 1, 2]).
musique(eva, [1]).
musique(lea, [2]).

litterature(paul, aventure).
litterature(pierre, science_fiction).
litterature(jean, policier).
litterature(marie, aventure).
litterature(eva, science_fiction).
litterature(lea, aventure).

type_sport(0, natation).
type_sport(1, tennis).
type_sport(2, jogging).

sport(paul, [0]).
sport(pierre, [1]).
sport(jean, [1]).
sport(marie, [0]).
sport(eva, [0, 1]).
sport(lea, [0]).

convient_physiquement(X, Y) :-
    celibataire(Y, _, TailleX, CheveuxX, AgeX),
    pref_physique(X, TailleX, CheveuxX, AgeX).

ont_meme_musique(X, Y) :-
    musique(X, Musique1),
    musique(Y, Musique2),
    (in_list(Elem, Musique1), in_list(Elem, Musique2)), !.

ont_meme_sport(X, Y) :-
    sport(X, Sport1),
    sport(Y, Sport2),
    (in_list(Elem, Sport1), in_list(Elem, Sport2)), !.

in_list(X, [X | _]).   
in_list(X, [_ | Tail]) :- 
    in_list(X, Tail).

ont_meme_gout(X, Y) :-
    ont_meme_musique(X, Y),
    litterature(X, Livre),
    litterature(Y, Livre),
    ont_meme_sport(X, Y).

couple_assorti(X, Y) :-
    celibataire(X, S1, _, _, _), 
    celibataire(Y, S2, _, _, _),
    S1 \= S2,
    convient_physiquement(X, Y),
    convient_physiquement(Y, X),
    ont_meme_gout(X, Y).