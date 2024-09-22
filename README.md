```markdown
# Prolog Quick Reference

## Installation sur Ubuntu
```bash
sudo apt update
sudo apt install swi-prolog
```

## Lancer le Shell Prolog
```bash
swipl
```

## Charger un Fichier Prolog
```prolog
['nom_du_fichier.pl'].
```

## Poser des Questions
```prolog
?- predicate(argument1, argument2).
```

### Exemple
```prolog
?- parent(albert, X).
```

## Rechercher Toutes les Solutions
1. Poser la question initiale :
   ```prolog
   ?- homme(X).
   ```
2. Prolog retourne la première solution :
   ```prolog
   X = albert
   ```
3. Appuyer sur `;` (point-virgule) puis `Entrée` pour voir la solution suivante :
   ```prolog
   X = bob
   ```
4. Répéter `;` pour toutes les solutions, ou `Entrée` seul pour terminer la recherche.

## Commandes Utiles
- **Recharger un fichier :**
  ```prolog
  ['nom_du_fichier.pl'].
  ```
- **Lister les prédicats :**
  ```prolog
  listing.
  ```
- **Quitter le shell :**
  ```prolog
  halt.
  ```
```