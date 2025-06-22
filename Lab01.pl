"""
Code for the LAB 1 of Artificial Intelligence 2,
Khalid Hasan Ador and Pauline Laval
"""

medlem(X,[X|R]). 
medlem(X,[Y|R]) :- medlem(X,R).
% For question 5
abba(agneta, anni-frid, bjorn, benny).

% For question 6
largest_element(X, [X]).
largest_element(X, [X|Rest]) :- largest_element(Y, Rest), X >= Y.
largest_element(Y, [X|Rest]) :- largest_element(Y, Rest), Y > X.

smallest_element(X, [X]).
smallest_element(X, [X|Rest]) :- smallest_element(Y, Rest), X =< Y.
smallest_element(Y, [X|Rest]) :- smallest_element(Y, Rest), Y < X.

difference(Diff, List) :-
	largest_element(Max, List),
	smallest_element(Min, List),
	Diff is Max - Min.


% For question 7
% mean/2: calculates the mean (average) of a list
mean(List, Mean) :-
    sum_list(List, Sum),
    length(List, Len),
    Len > 0,     % avoid division by zero
    Mean is Sum / Len.

% concat/3: concatenates two lists
% concat is deprecated, can use atom_concat
concat([], L, L).
concat([H|T], L2, [H|R]) :- concat(T, L2, R).


analyze_list(List, Length, Sum, Mean, Reversed, Concatenated) :-
    length(List, Length),
    sum_list(List, Sum),
    mean(List, Mean),
    reverse(List, Reversed),
    concat(List, Reversed, Concatenated).





% For Question 8
% Addition
peano_add(0, Y, Y).
peano_add(f(X), Y, f(Z)) :- peano_add(X, Y, Z).


% Substraction
peano_sub(X, 0, X).
peano_sub(f(X), f(Y), Z) :- peano_sub(X, Y, Z).


% Multiplication
peano_mul(0, _, 0).
peano_mul(f(X), Y, Z) :-
    peano_mul(X, Y, Z1),
    peano_add(Y, Z1, Z).


% Division
peano_div(X, Y, 0) :- peano_lt(X, Y).  % if X < Y, quotient is zero
peano_div(X, Y, f(Q)) :-
    peano_sub(X, Y, Z),
    peano_div(Z, Y, Q).

peano_lt(0, f(_)).
peano_lt(f(X), f(Y)) :- peano_lt(X, Y).


% Extra
peano_to_int(0, 0).
peano_to_int(f(P), N) :-
    peano_to_int(P, N1),
    N is N1 + 1.

