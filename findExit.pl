% Iteration 1: Basic maze validation
% Ensures maze has exactly one start and at least one exit

find_exit(Maze, _Actions) :-
    validate_maze(Maze),
    fail. % Just here as a block for now

validate_maze(Maze) :-
    flatten(Maze, Flat),
    count_occurrences(Flat, s, StartCount),
    count_occurrences(Flat, e, ExitCount),
    StartCount =:= 1,
    ExitCount >= 1.

count_occurrences([], _, 0).
count_occurrences([Element|Rest], Element, Count) :-
    !,
    count_occurrences(Rest, Element, RestCount),
    Count is RestCount + 1.
count_occurrences([_|Rest], Element, Count) :-
    count_occurrences(Rest, Element, Count).