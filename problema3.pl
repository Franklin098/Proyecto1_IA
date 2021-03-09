%---- Reverso ----  reverso([a,b,c,d,e],X).
reverso([], []).
reverso([Cabeza | Cola],Reverso):- 
    reverso(Cola, ColaReverso),
    concatenacion(ColaReverso,[Cabeza],Reverso).

concatenacion([],Lista,Lista).
concatenacion([Cabeza|Lista1],Lista2,[Cabeza|Lista3]):-concatenacion(Lista1,Lista2,Lista3).

%---- Polindrome ----  palindrome([1,2,2,1]).
palindrome(Xs):- reverso(Xs, Xs).

%---- Duplicar ----  repetir([1,2,3],R).
repetir([],[]).
repetir([X],[X-X]). 
repetir([Cola|Lista1],[Cola-Cola|Lista2]):-repetir(Lista1,Lista2).

%---- Insertar ----  insert(10,2,[1,2,3,4],R).
insertar(X,0,L1,[X|L1]). 
insertar(X,Pos,[C|R],[C|R2]):- 
    Pos1 is Pos-1, 
    insertar(X,Pos1,R,R2). 


%------- Dividir ----- dividir([2,4,6,8,10],X,Y).
dividir([],[],[]).
dividir([X],[X],[]).
dividir([X,Y|Lista],[X|Lista1],[Y|Lista2]):-
    dividir(Lista,Lista1,Lista2).