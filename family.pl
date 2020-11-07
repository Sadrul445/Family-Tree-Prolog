parent(haider, emran).
parent(haider, nilufa).
parent(haider, bokul).
parent(haider, binu).
parent(putul,emran ).
parent(putul, nilufa).
parent(putul, bokul).
parent(putul, binu).
parent(monira, mushi).
parent(monira, nantu).
parent(monira, faruk).
parent(monira, robi).
parent(mulkuth, mushi).
parent(mulkuth, nantu).
parent(mulkuth, faruk).
parent(mulkuth, robi).
parent(emran, tanim).
parent(emran, faiza).
parent(emran, kibria).
parent(emran, rahim).
parent(mushi, tanim).
parent(mushi, faiza).
parent(mushi, kibria).
parent(mushi, rahim).
parent(faiza, nuri).
parent(ziku, nuri).
parent(binu, shilpi).
parent(binu,saima).
parent(jalil,shipli).
parent(jalil,saima).
parent(shilpi, aisha).
parent(shilpi, arufa).

male(haider).
male(emran).
male(nantu).
male(faruk).
male(robi).
male(tanim).
male(kibria).
male(rahim).
male(ziku).
male(jalil).

female(putul).
female(monira).
female(nilufa).
female(binu).
female(bokul).
female(mushi).
female(faiza).
female(nuri).
female(shilpi).
female(aisha).
female(arufa).
female(saima).
/* rules */

mother(X, Y) :-
    parent(X, Y),
    female(X).

father(X, Y) :-
    parent(X, Y),
    male(X).

child(X, Y) :-
    parent(Y, X).

partner(X, Y) :-
    child(Z, X),
    child(Z, Y),
    X \= Y.

grandparent(X, Y) :-
    parent(X, Z),
    parent(Z, Y).

grandchild(X, Y) :-
    grandparent(Y, X).

grandfather(X, Y) :-
    grandparent(X, Y),
    male(X).

grandmother(X, Y) :-
    grandparent(X, Y),
    female(X).

paternalgrandfather(X, Y) :-
    father(X, Z),
    father(Z, Y).

maternalgrandfather(X, Y) :-
    father(X, Z),
    mother(Z, Y).

paternalgrandmother(X, Y) :-
    mother(X, Z),
    father(Z, Y).

maternalgrandmother(X, Y) :-
    mother(X, Z),
    mother(Z, Y).

greatgrandparent(X, Y) :-
    parent(P, Y),
    grandparent(X, P).

greatgrandchild(X, Y) :-
    greatgrandparent(Y, X).

son(X, Y) :-
    child(X, Y),
    male(X).

daughter(X, Y) :-
    child(X, Y),
    female(X).

granddaughter(X, Y) :-
    grandchild(X, Y),
    female(X).

grandson(X, Y) :-
    grandchild(X, Y),
    male(X).

ancestor(X, Y) :-
    parent(X, Y).

ancestor(X, Y) :-
    parent(Z, Y),
    ancestor(X, Z).

descendant(X, Y) :-
    ancestor(Y, X).

relative(X, Y) :-
    ancestor(Z, X),
    ancestor(Z, Y).

sibling(X, Y) :-
    parent(Z, X),
    parent(Z, Y),
    X \= Y.

sister(X, Y) :-
    sibling(X, Y),
    female(X),
    X \= Y.

brother(X, Y) :-
    sibling(X, Y),
    male(X),
    X \= Y.

uncle(X, Y) :-
    brother(X, Z),
    child(Y, Z).

aunt(X, Y) :-
    sister(X, Z),
    child(Y, Z).

cousin(X, Y) :-
    grandparent(Z, X),
    grandparent(Z, Y),
    \+sibling(X, Y),
    X \= Y.

cousinonceremoved(X, Y) :-
    cousin(Z, Y),
    child(X, Z).

secondcousin(X, Y) :-
    greatgrandparent(Z, X),
    greatgrandparent(Z, Y),
    \+sibling(X, Y),
    \+cousin(X, Y),
    X \= Y.

nephew(X, Y) :-
    aunt(Y, X),
    male(X);
    uncle(Y, X),
    male(X).

niece(X, Y) :-
    aunt(Y, X),
    female(X);
    uncle(Y, X),
    female(X).
