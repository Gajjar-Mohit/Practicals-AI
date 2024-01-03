% Define the initial state of the jugs (0 liters initially)
state(0, 0).

% Define the capacities of the jugs
capacity(jugA, 3).
capacity(jugB, 5).

% Define the target amount
target(4).

% Define the pouring actions
pour(jugA, jugB) :- state(A, B), capacity(jugA, CapA), capacity(jugB, CapB),
                   A > 0, B < CapB, Amount is min(A, CapB - B), NewA is A - Amount, NewB is B + Amount, state(NewA, NewB).

pour(jugB, jugA) :- state(A, B), capacity(jugA, CapA), capacity(jugB, CapB),
                   B > 0, A < CapA, Amount is min(B, CapA - A), NewA is A + Amount, NewB is B - Amount, state(NewA, NewB).

% Define the goal state
goal(State) :- target(Target), state(_, Target).

% Solve the problem using depth-first search
solve(State, _) :- goal(State).
solve(State, Visited) :- \+ member(State, Visited), pour(JugFrom, JugTo), solve(State, [State|Visited]).

% Example Usage:
% ?- solve(state(0, 0), []). 
