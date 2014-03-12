% Some string operations.

:- module(string_operations, [escape_punctuation/2]).

str_lowercase([], A, A).
str_lowercase([H|T], Acc, Output) :-
        (   H > 64, H < 91
        ->  X is H+32
        ->  str_lowercase(T, [X|Acc], Output)
        ;   str_lowercase(T, [H|Acc], Output)  ).
str_lowercase(Input, Output) :-
        str_lowercase(Input, [], Out),
        reverse(Out, Output).

str_uppercase([], A, A).
str_uppercase([H|T], Acc, Output) :-
        (   H > 96, H < 123
        ->  X is H-32
        ->  str_uppercase(T, [X|Acc], Output)
        ;   str_uppercase(T, [H|Acc], Output)  ).
str_uppercase(Input, Output) :-
        str_uppercase(Input, [], Out),
        reverse(Out, Output).

escape_punctuation([], A, A).
escape_punctuation([H|T], Acc, X) :-
        Punctuation =
           [126,33,63,64,35,36,37,94,38,42,40,41,95,123,125,91,93,58,34,124,92,59,44,60,46,62,47],
        (   member(H, Punctuation)
        ->  escape_punctuation(T, Acc, X)
        ;   escape_punctuation(T, [H|Acc], X)  ).
escape_punctuation(In, Out) :-
        escape_punctuation(In, [], Out1),
        reverse(Out1, Out).

filter_out([], _, A, A).
filter_out([H|T], Filter, Acc, Out) :-
        (  member(H, Filter)
        -> filter_out(T, Filter, Acc, Out)
        ;  filter_out(T, Filter, [H|Acc], Out)  ).
filter_out(In, Filter, Out) :-
        filter_out(In, Filter, [], X),
        reverse(X, Out).
