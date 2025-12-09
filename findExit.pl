% Iteration 2: Position Finding and Cell Access
% Adds ability to find positions in maze and access cells at coordinates
% New predicates: find_start/3, find_in_maze/4, get_cell/4, in_bounds/3, is_valid_position/3

find_exit(Maze, _Actions) :-
    validate_maze(Maze),
    find_start(Maze, StartRow, StartCol),
    format('Start at (~w, ~w)~n', [StartRow, StartCol]),
    fail. % Just a block here for now

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

find_start(Maze, Row, Col) :-
    find_in_maze(Maze, s, Row, Col).

find_in_maze(Maze, Value, Row, Col) :-
    find_in_rows(Maze, Value, 0, Row, Col).

find_in_rows([CurrentRow|_], Value, RowIndex, RowIndex, Col) :-
    find_in_cols(CurrentRow, Value, 0, Col), !.
find_in_rows([_|RestRows], Value, RowIndex, Row, Col) :-
    NextIndex is RowIndex + 1,
    find_in_rows(RestRows, Value, NextIndex, Row, Col).

find_in_cols([Value|_], Value, ColIndex, ColIndex) :- !.
find_in_cols([_|RestCols], Value, ColIndex, Col) :-
    NextIndex is ColIndex + 1,
    find_in_cols(RestCols, Value, NextIndex, Col).

get_cell(Maze, Row, Col, Value) :-
    nth0(Row, Maze, RowList),
    nth0(Col, RowList, Value).

in_bounds(Maze, Row, Col) :-
    length(Maze, NumRows),
    NumRows > 0,
    Row >= 0,
    Row < NumRows,
    nth0(Row, Maze, RowList),
    length(RowList, NumCols),
    Col >= 0,
    Col < NumCols.

is_valid_position(Maze, Row, Col) :-
    in_bounds(Maze, Row, Col),
    get_cell(Maze, Row, Col, Cell),
    Cell \= w.