% Facts: Define individuals and their genders
male(john).
male(bob).
male(jim).
female(susan).
female(mary).
female(linda).

% Define parent2 relationships
parent2(john, bob).
parent2(john, mary).
parent2(susan, bob).
parent2(susan, mary).
parent2(bob, jim).
parent2(linda, jim).

% Rules for specific family relations
father(X, Y) :- male(X), parent2(X, Y).
mother(X, Y) :- female(X), parent2(X, Y).

grandfather(X, Z) :- father(X, Y), parent2(Y, Z).
grandmother(X, Z) :- mother(X, Y), parent2(Y, Z).

brother(X, Y) :- male(X), parent2(Z, X), parent2(Z, Y), X \= Y.
sister(X, Y) :- female(X), parent2(Z, X), parent2(Z, Y), X \= Y.

uncle(X, Y) :- brother(X, Z), parent2(Z, Y).
aunt(X, Y) :- sister(X, Z), parent2(Z, Y).

nephew(X, Y) :- male(X), (uncle(Y, X) ; aunt(Y, X)).
niece(X, Y) :- female(X), (uncle(Y, X) ; aunt(Y, X)).

cousin(X, Y) :- parent2(Z, X), parent2(W, Y), (brother(Z, W) ; sister(Z, W)), X \= Y.

% Example Usage:
% ?- father(john, bob).   % Should return true
% ?- brother(john, mary). % Should return false
