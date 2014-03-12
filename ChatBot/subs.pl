% Chatbot word substitution database.

:- module(subs, [substitute/2]).

substitution('HE\'S', 'HE IS').
substitution('SHE\'S', 'SHE IS').
substitution('THEY\'RE', 'THEY ARE').
substitution('I\'M', 'I AM').
substitution('U', 'YOU').
substitution('R', 'ARE').
substitution('UR', 'YOUR').

substitute([], Acc, Acc).
substitute([H|T], Acc, Subs) :-
	(   substitution(H, S)
	->  substitute(T, [S|Acc], Subs)
	;   substitute(T, [H|Acc], Subs)   ).
substitute(Input, Output) :-
	substitute(Input, [], Rev),
	reverse(Rev, Output).
