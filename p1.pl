parent(john, mary).
parent(john, jim).
parent(susan, mary).
parent(susan, jim).

ancestor(X, Y) :- parent(X, Y).
ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).