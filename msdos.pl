sr([i|X],X).
sr([want|X],X).
sr([the|X],X).
sr([give|X],X).
sr([of|X],X).
sr([is|X],X).
sr([be|X],X).
sr([if|X],X).
sr([make, it|X],X).
sr([which|X],X).
sr([are|X],X).
sr([of|X],X).
sr([from|X],X).
sr([know|X],X).
sr([to, know|X],X).
sr([need|X],X).
sr([to, need|X],X).
sr([can|X],X).
sr([there|X],X).
sr([this|X],X).
sr([any|X],X).
sr([me|X],X).
sr([my|X],X).
sr([please|X],X).
sr([would|X],X).
sr([you|X],X).
sr([with|X],X).
sr([about|X],X).
sr([to, copy|X],[copy|X]).
sr([disk,in,drive|X],[drive|X]).
sr([disk,in|X],[drive|X]).
sr([disk|X],[drive|X]).
sr([what,files|X],[file|X]).
sr([what|X],[file|X]).
sr([file|X],[files|X]).
sr([everything|X],[all,file|X]).
sr([every|X],[all|X]).
sr([the, whole, drive|X],[all, file|X]).
sr([on, the, Y, drive|X],[on, drive, Y|X]).
sr([on, my, Y, drive|X],[on, drive, Y|X]).
sr([on, Y, drive|X],[on, drive, Y|X]).
sr([contents, Y, the, drive|X],[contents, drive, Y|X]).
sr([to, see, Y|X],[contents, Y|X]).
sr([to, run, Y|X],[run, Y|X]).
sr([process|X],[run|X]).
sr([launch|X],[run|X]).
sr([load|X],[run|X]).
sr([fire|X],[run|X]).
sr([move, to|X],[change|X]).
sr([take|X],[change|X]).
sr([switch|X],[change|X]).
sr([jump|X],[change|X]).
sr([to, run|X],[run|X]).
sr([to, process|X],[run|X]).
sr([to, launch|X],[run|X]).
sr([to, load|X],[run|X]).
sr([to, fire|X],[run|X]).
sr([to, move, to|X],[change|X]).
sr([to, take|X],[change|X]).
sr([to, switch|X],[change|X]).
sr([to, jump|X],[change|X]).
sr([tell|X],[help|X]).
sr([assist|X],[help|X]).
sr([to, help|X],[help|X]).
sr([to, tell|X],[help|X]).
sr([to, assist|X],[help|X]).
sr([get, me|X],[find|X]).
sr([find, me|X],[find|X]).
sr([get, me, to|X],[find|X]).
sr([where|X],[find|X]).
sr([where, is|X],[find|X]).
sr([locate|X],[find|X]).
sr([search|X],[find|X]).
sr([search, for|X],[find|X]).
sr([a, kind, of|X],[type|X]).
sr([a, sort, of|X],[type|X]).
sr([a, type, of|X],[type|X]).
sr([text|X],[txt|X]).
sr([webpage|X],[html|X]).
sr([image|X],[gif|X]).
sr([music|X],[mp3|X]).
sr([word|X],[doc|X]).
sr([excel|X],[xls|X]).
sr([powerpoint|X],[ppt|X]).
sr([prolog|X],[pl|X]).
sr([to, move |X],[move|X]).
sr([to, shift |X],[move|X]).
sr([to, transfer |X],[move|X]).
sr([to, relocate |X],[move|X]).
sr([to, send |X],[move|X]).
sr([shift |X],[move|X]).
sr([transfer |X],[move|X]).
sr([moved |X],[move|X]).
sr([relocate |X],[move|X]).
sr([send |X],[move|X]).
sr([put, Y, in |X],[move, Y, to|X]).
sr([to, put, Y, in |X],[move, Y, to|X]).
sr([must |X],[force|X]).
sr([forced |X],[force|X]).
sr([to, force |X],[force|X]).
sr([to, compel |X],[force|X]).
sr([compel |X],[force|X]).


simplify(List,Result) :-
  sr(List,NewList),
  !,
  simplify(NewList,Result).
  
simplify([W|Words],[W|NewWords]) :-
  simplify(Words,NewWords)
  .

simplify([],[]).
  
tr([q],[q]).
tr([quit],[quit]).
tr([file,on,drive,X],['cmd /k dir ',X,':']).
tr([file,on,X,drive],['cmd /k dir ',X,':']).
tr([X,file,on,drive,Y],['cmd /k dir ',Y,':*.',X]).
tr([X,file,on,Y,drive],['cmd /k dir ',Y,':*.',X]).
tr([content,X],['cmd /k dir ',X,':']).
tr([content, drive, X],['cmd /k dir ',X,':']).
tr([content, X, drive],['cmd /k dir ',X,':']).
tr([copy,all,file,from,drive,X,to,drive,Y], ['cmd /k copy ',X,':*.* ',Y,':']).
tr([file,on,directory,X],['cmd /k dir ','\\',X]).
tr([run,X],['cmd /k call ', X,'.bat']).
tr([run, batch,X],['cmd /k call ', X,'.bat']).
tr([run, batch,file,X],['cmd /k call ', X,'.bat']).
tr([run, X, at | Y],RBAT) :-
   construct_file_path('cmd /k call ', X, Y, R),
   append(R,'.bat', RBAT).
tr([run, batch, X, at | Y],RBAT) :-
   construct_file_path('cmd /k call ',X, Y, R),
   append(R,'.bat', RBAT).
tr([run, batch, file, X, at | Y],RBAT) :-
   construct_file_path('cmd /k call ',X, Y, R),
   append(R,'.bat', RBAT).
tr([change, to | Y], R) :-
	construct_directory_path('cmd /k cd ', Y, R).
tr([change, directory, to | Y], R) :-
	construct_directory_path('cmd /k cd ', Y, R).
tr([change, to, directory | Y],  R) :-
	construct_directory_path('cmd /k cd ', Y, R).
tr([help,X],['cmd /k help ', X]).
tr([help, to, X],['cmd /k help ', X]).
tr([help],['cmd /k echo This is a natural language processor, please type in normal English sentences. At the moment you can copy, change directory, change file, get help, move a file and and find a file']).
tr([find, X],['cmd /k find /V "', X, '"']).
tr([find, X, case, sensit],['cmd /k find " ', X, ' "']).
tr([find, X, type, Y],['cmd /k find /V "', X, '"', ' *.', Y]).
tr([find, X, a, Y, file],['cmd /k find /V "', X, '" *.', Y]).
tr([find, X, type, Y, file],['cmd /k find /V "', X, '" *.', Y]).
tr([find, X, in, file, Y],['cmd /k find /V "', X, '" *.', Y]).
tr([find, X, in | Y],R) :-
	insert_file_path_with_extension(Y,OUTPUT),
	append(['cmd /k find /V "', X ,'" '], OUTPUT, R).
tr([move| Y],R) :-
	construct_move_operation(['cmd /k move '], Y, R).
tr([force | Y],R):-
	construct_move_operation(['cmd /k move /Y '], Y, R).

trl([q],[exit, 0]).
trl([quit],[exit, 0]).
trl([find, X],['grep -r "', X, '"']).
trl([find, X, case, sensit],['grep -ir " ', X, ' "']).
trl([find, X, type, Y],['grep -r "', X, '"', ' *.', Y]).
trl([find, X, a, Y, file],['grep -r "', X, '" *.', Y]).
trl([find, X, type, Y, file],['grep -r "', X, '" *.', Y]).
trl([find, X, in, file, Y],['grep -r "', X, '" *.', Y]).

construct_move_operation(OPERATION, Y, R) :-
	seperate_at_to(Y,L1,L2), 
	!,
	length(L2,HOW_MANY_AFTER_TO),
	HOW_MANY_AFTER_TO > 0,
	insert_file_path_with_extension(L1,C1),
	insert_file_path(L2,C2),
	append(OPERATION, C1, TR1),
	append(TR1, [' '], TR2),
	append(TR2, C2, R).

seperate_at_to([move|T],T2,T) :- T2 = [].
seperate_at_to([change|T],T2,T) :- T2 = [].
seperate_at_to([to|T],T2,T) :- T2 = [].
seperate_at_to([H|T],[H|T2],S) :-
 seperate_at_to(T,T2,S).
seperate_at_to([],[],[]).

construct_file_path(COMMAND, X, Y, R) :-
   construct_directory_path(COMMAND, Y, T),
   append(T,[X],R).
   
 construct_directory_path(COMMAND, Y, R) :-
   insert_file_path(Y,YC),
   !,
   append([COMMAND],YC,R)
   .

/* Credit to http://stackoverflow.com/a/5882943 for this piece of code */
insert_file_path(L1, L2) :-
	insert_file_path(0, L1, L2).
insert_file_path(_,[],[]).
insert_file_path(0,[H|T],[H,'://'|TC]):-
   insert_file_path(1,T,TC).	
insert_file_path(C,[H|T],[H,'/'|TC]):-
    S is C+1,	
   insert_file_path(S,T,TC).	

insert_file_path_with_extension(L1, L2) :-	
	insert_file_path_with_extension(0, L1, L2).
insert_file_path_with_extension(_,[],[]).
insert_file_path_with_extension(0,[H|T],[H,'://'|TC]) :-
   insert_file_path_with_extension(1,T,TC).	
insert_file_path_with_extension(_,[X,Y],[X,'.',Y]).
insert_file_path_with_extension(C,[H|T],[H,'/'|TC]):-
    S is C+1,	
   insert_file_path_with_extension(S,T,TC).	   
	
	
translate(Input,Result, OS) :-
   deduplicate(Input, DeduplicatedInput),
   (    OS == unix->
		trl(DeduplicatedInput,Result)
   ; 	OS == windows ->
		tr(DeduplicatedInput,Result)
   ; fail
   ),
   !.

translate(_,[],_) :-
   write('I do not understand'),
   nl.

deduplicate([X,X|List], [X|List]).
deduplicate([X|List], [X|List]).
deduplicate([],[]).

process_commands :-
   ( current_prolog_flag(windows, true) -> process_commands(windows).
   ; current_prolog_flag(unix, true) -> process_commands(unix).
   ; write('Didn't recognise OS')
   )
	

process_commands(OS) :-
	repeat,
      write('Command -> '),
      tokenize_line(user,X),
      tokens_words(X,What),
      simplify(What,SimplifiedWords),
	  	  print(SimplifiedWords),
		  nl,
      translate(SimplifiedWords,Command,OS),
	  print(Command).
     pass_to_os(Command),
      Command == [quit],
   !.

pass_to_os([])     :- !.

pass_to_os([quit]) :- !.

pass_to_os(Command, OS) :-
   concat(Command,String),
   ( OS == windows -> win_exec(String,show)
   ; OS == unix -> shell(String,show)
   ; write('Didn't recognise OS')
   )

concat([H|T],Result) :-
   name(H,Hstring),
   concat(T,Tstring),
   append(Hstring,Tstring,Result).

concat([],[]).

append([H|T],L,[H|Rest]) :- append(T,L,Rest).
append([],L,L).