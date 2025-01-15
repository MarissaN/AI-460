%The Facts
parent(aron, bianca).
parent(aron, ben).
parent(bianca, chuck).
parent(ben, chris).
parent(chuck, dan).
parent(chuck, diana).
parent(chris, dennis).
parent(dan, engela).
parent(diana, eureka).
parent(ace, brown).
parent(brown, chris).
parent(john, cathy).
parent(water, sara).
parent(sara, cathy).
parent(cathy, dennis).

male(aron).
male(ben).
male(chuck).
male(john).
male(chris).
male(dan).
male(eureka).
male(water).

female(brown).
female(sara).
female(cathy).
female(diana).
female(bianca).
female(engela).

husband(ben, brown).
husband(john, sara).
husband(chris, cathy).

%The rules
grandparent(X,Y) :- parent(X,Z), parent(Z,Y).
ancestor(X,Y):- parent(X,Y).
ancestor(X,Y):- parent(X,Z), ancestor(Z,Y).
des(X,Y):- parent(Y,X).
des(X,Y):- parent(Z,X), des(Z,Y).
fatherinlaw(X,Y):- 
    male(X),
    parent(X, Z),
    husband(Z, Y).
sister(X,Y):-parent(Z,X),parent(Z,Y),female(X),X\==Y.
brother(X,Y):-parent(Z,X),parent(Z,Y),male(X),X\==Y.
nephew(X,Y):- parent(Z,X),sister(Z,Y),male(X),X\==Y.
nephew(X,Y):- parent(Z,X), brother(Z,Y),male(X),X\==Y.
