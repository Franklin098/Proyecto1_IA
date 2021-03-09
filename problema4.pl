numero(1).
numero(2).
numero(3).
numero(4).

lineas():-  write('-'), write('-'), write('-'), write('-'), write('-'), write('-'), write('-'), write('-'), write('-'),
     write('-'), write('-'),write('-'), write('-'), write('-'), write('-'), nl.

tablero(A, B, C, D) :- 
    write('| '), write(A), write('  '), write(B), write(' | '), write(C), write('  '), write(D), write(' |'), nl.

sudoku(F1C1, F1C2, F1C3, F1C4, F2C1, F2C2, F2C3, F2C4, F3C1, F3C2, F3C3, F3C4, F4C1, F4C2, F4C3, F4C4) :- 
    resolver(F1C1, F1C2, F1C3, F1C4, F2C1, F2C2, F2C3, F2C4, F3C1, F3C2, F3C3, F3C4, F4C1, F4C2, F4C3, F4C4),
    lineas(),
	tablero(F1C1, F1C2, F1C3, F1C4),
	tablero(F2C1, F2C2, F2C3, F2C4),
    lineas(),
	tablero(F3C1, F3C2, F3C3, F3C4),
	tablero(F4C1, F4C2, F4C3, F4C4),
    lineas().

esdiferente(A, B, C, D) :- numero(A), numero(B), numero(C), numero(D), A\=B, A\=C, A\=D, B\=C, B\=D, C\=D.

resolver(F1C1, F1C2, F1C3, F1C4, F2C1, F2C2, F2C3, F2C4, F3C1, F3C2, F3C3, F3C4, F4C1, F4C2, F4C3, F4C4) :-
% ----------- FILAS -----------
	esdiferente(F1C1, F1C2, F1C3, F1C4), 
	esdiferente(F2C1, F2C2, F2C3, F2C4),
	esdiferente(F3C1, F3C2, F3C3, F3C4),
	esdiferente(F4C1, F4C2, F4C3, F4C4), 
% ----------- COLUMNAS -----------
	esdiferente(F1C1, F2C1, F3C1, F4C1), 
	esdiferente(F1C2, F2C2, F3C2, F4C2), 
	esdiferente(F1C3, F2C3, F3C3, F4C3), 
	esdiferente(F1C4, F2C4, F3C4, F4C4), 
% ----------- BLOQUES -----------
	esdiferente(F1C1, F1C2, F2C1, F2C2),
	esdiferente(F1C3, F1C4, F2C3, F2C4), 
	esdiferente(F3C1, F3C2, F4C1, F4C2), 
	esdiferente(F3C3, F3C4, F4C3, F4C4).

%  sudoku(2,_,_,_,   _,1,_,_,   _,_,3,_,   _,3,_,4).
%  sudoku(_,1,_,_,   2,_,_,_,   _,_,3,_,   _,_,_,1).