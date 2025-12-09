% Iteration 3: Movement System
% Implements movement predicates for navigating the maze
% New predicates: move/5, is_valid_move/4

find_exit(Maze, _Actions) :-
    validate_maze(Maze),
    find_start(Maze, Row, Col),
    move(Row, Col, right, NewRow, NewCol),
    format('Move right: (~w,~w) -> (~w,~w)~n', [Row, Col, NewRow, NewCol]),
    fail.

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

move(Row, Col, up, NewRow, Col) :-
    NewRow is Row - 1.

move(Row, Col, down, NewRow, Col) :-
    NewRow is Row + 1.

move(Row, Col, left, Row, NewCol) :-
    NewCol is Col - 1.

move(Row, Col, right, Row, NewCol) :-
    NewCol is Col + 1.

is_valid_move(Maze, Row, Col, Action) :-
    move(Row, Col, Action, NewRow, NewCol),
    is_valid_position(Maze, NewRow, NewCol).