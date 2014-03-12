% Chatbot response database.

:- module(responses, [response/2]).
:- use_module(properties, [bot_predicate/2]).

response('HOW ARE YOU', 'I am okay.').
response('BYE', 'Bye, bye!').
response('UNMATCHED', 'What?').
response('HOW OLD ARE YOU', Age) :- bot_predicate(age, Age).
response('WHAT IS YOUR NAME', Name) :- bot_predicate(name, Name).
