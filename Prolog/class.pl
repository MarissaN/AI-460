% Define the prerequisite relationships
prerequisite(cs100,cs105).
prerequisite(cs102,cs206).
prerequisite(cs105,cs201).
prerequisite(cs201,cs301).
prerequisite(cs206,cs301).
prerequisite(cs206,cs420).
prerequisite(cs301,cs403).
prerequisite(cs420,cs526).
prerequisite(cs403,cs555).

% Define a predicate to check if X is a prerequisite of Y
is_prerequisite(X, Y) :-
    prerequisite(Y, X).

% Define a predicate to find all transitive prerequisites leading to a course
transitive_prerequisite(X, Y) :-
    is_prerequisite(X, Y).
transitive_prerequisite(X, Y) :-
    is_prerequisite(X, Z),
    transitive_prerequisite(Z, Y),
    \+ X = Y. % Prevents cycles in the prerequisite graph

% Define a predicate to find all possible courses to take after class X
validclass(X, Y) :-
    setof(Course, transitive_prerequisite(Course, X), Y).

% Define a predicate to check if X and Y share possible courses to take
is_validclass(X, Y) :-
    validclass(X, CoursesX),
    validclass(Y, CoursesY),
    intersection(CoursesX, CoursesY, Common),
    \+ length(Common, 0).
    
