% Main bot module file.

:- module(chatbot, [respond_loop/0]).
:- use_module('./Dependency/string_operations', [escape_punctuation/2]).
:- use_module(subs, [substitute/2]).
:- use_module(responses, [response/2]).
:- module(chatbot).

parse(Raw, Output) :-
	upcase_atom(Raw, Up),
	atom_codes(Up, Codes),
	escape_punctuation(Codes, Punc),
	atom_codes(Atom, Punc),
	atomic_list_concat(List, ' ', Atom),
	substitute(List, Subs),
	atomic_list_concat(Subs, ' ', Output).

respond(Query, Response) :-
	parse(Query, Parsed),
	responses:response(Parsed, Response).

respond_loop :-
	prompt(_, 'User> '),
	read_line_to_codes(user_input, Input),
	atom_codes(Atom, Input),
	write('Bot: '),
	(   respond(Atom, _)
	->  respond(Atom, Resp)
	;   responses:response('UNMATCHED', Resp)	  ),
	writeln(Resp),
	respond_loop.

:- respond_loop.
