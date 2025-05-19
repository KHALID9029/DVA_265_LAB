bird(laysan_albatross):-
    family(albatross),
    color(white).

bird(black_footed_albatross):-
    family(albatross),
    color(dark).

bird(whistling_swan):-
    family(swan),
    voice(muffled_musical_whistle).

bird(trumpeter_swan):-
    family(swan),
    voice(loud_trumpeting).

bird(mute_swan):-
    family(swan),
    voice(quite).

order(tubenose):-
    nostrils(external_tubular),
    live(at_sea),
    bill(hooked).

order(waterfowl) :- 
    feet(webbed),  
  	bill(flat).

family(albatross) :- 
  	order(tubenose),  
  	size(large),  
  	wings(long_narrow). 

family(swan) :- 
  order(waterfowl),  
  neck(long),  
  color(white),  
  flight(ponderous).

% User Interface
eats(X):- ask(eats, X).
feet(X):- ask(feet, X).
wings(X):- ask(wings, X).
neck(X):- ask(neck, X).
color(X):- ask(color, X).
nostrils(X):- ask(nostrils, X).
live(X):- ask(live,X).
bill(X):- ask(bill,X).
size(X):- ask(size,X).
flight(X):- ask(flight,X).
voice(X):- ask(voice,X).

:- dynamic known/3.
% If we already know the answer is yes for attribute A having value V, succeed immediately.
ask(A, V):-
    known(yes, A, V), % succeed if true
    !. % stop looking
% If we know anything about attribute A having value V (but it's not 'yes'), fail.
ask(A, V):-
    known(_, A, V), % fail if false
    !,
    fail.
ask(A, V):-
    write(A:V),
    write('?'),
    read(Y),
    asserta(known(Y, A, V)), %remember it
    Y == yes. % succeed or fail