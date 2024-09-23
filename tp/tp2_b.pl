% I/ 1 Representer ces mets par un ensemble de predicats.
entree(fois_gras).
entree(salade_gourmande).
entree(crudites).
entree(tomates_mozzarella).

viande(entrecote).
viande(magret_canard).
viande(dinde_fermiere).

poisson(truite_meuniere).
poisson(brochet_de_loire).
poisson(cube_de_bar).

dessert(mousse_chocolat).
dessert(sorbet).
dessert(ile_flottante).
dessert(poire_belle_helene).

% 2 Definir le predicat plat/1, qui decrit un plat comme etant compose soit de viande, soit de poisson.
plat(X) :- 
    (viande(X) ; poisson(X)), !.

% 3 Definir le predicat menu/3, qui decrit un repas compose d'une entree, d'un plat (viande ou poisson donc) et d'un dessert.
menu(X, Y, Z) :-
    entree(X),
    plat(Y),
    dessert(Z).

% 4 A chaque met de la carte on associe une valeur energetique (en kilocalories). Definir le predicat calories/2, qui associe à chaque met sa valeur calorifique
calories(fois_gras, 208).
calories(salade_gourmande, 154).
calories(crudites, 81).
calories(tomates_mozzarella, 109).
calories(entrecote, 537).
calories(magret_canard, 382).
calories(dinde_fermiere, 405).
calories(truite_meuniere, 260).
calories(brochet_de_loire, 256).
calories(cube_de_bar, 292).
calories(mousse_chocolat, 136).
calories(sorbet, 60).
calories(ile_flottante, 95).
calories(poire_belle_helene, 114).

% 5 Definir le predicat menu_kc/4, qui permet de connaître le nombre total de kilocalories d'un menu.
menu_kc(E, P, D, C) :- 
    calories(E, CalE),  
    calories(P, CalP),  
    calories(D, CalD),
    C is CalE + CalP + CalD.

% II/ Quelles sont les requêtes (prédicats) à exprimer pour afficher :
% 1) la liste des repas proposés par le restaurant,
% ?- menu(X, Y, Z)
%
% 2) la liste des repas à base de viande,
% ?- viande(X).
%
% 3) la liste des repas de moins de 800 kilocalories,
% ?- menu_kc(E, P, D, C), C < 800.
%
% 4) la liste des repas de plus de 600 kilocalories et de moins de 800 kilocalories,
% ?- menu_kc(E, P, D, C), C > 600, C < 800.
%
% 5) l'ensemble des viandes et poissons de moins de 400 kilocalories,
% ?- viande(V), poisson(P), calories(V, C), C < 400, calories(P, C2), C2 < 400.
%
% 6) la liste des repas dont le dessert a moins de 100 kilocalories.
% ?- menu(E, P, D), calories(D, C), C < 100.
