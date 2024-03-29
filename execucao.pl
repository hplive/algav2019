
% para a maquina ma  as opera��es a partir das encomendas %
:- dynamic opsRealizadas/1.
:- dynamic opsPorRealizar/1.

iniciar:-
    operacoes([H|T]),
    write(H),ln,write(T).




aStarMaqA(Orig,Dest,Cam,Custo):-
    aStar2Maq(Dest,[(_,0,[Orig])],Cam,Custo).




aStar2MaqA(Dest,[(_,Custo,[Dest|T])|_],Cam,Custo):-
    reverse([Dest|T],Cam).
aStar2MaqA(Dest,[(_,Ca,LA)|Outros],Cam,Custo):-
    LA=[Act|_],
    findall((CEX,CaX,[X|LA]),
            (Dest\==Act,edge(Act,X,CustoX),\+ member(X,LA),
             CaX is CustoX + Ca, estimativa(X,Dest,EstX),
             CEX is CaX +EstX),Novos),
    append(Outros,Novos,Todos),
    write('Novos='),write(Novos),nl,
    sort(Todos,TodosOrd),
    write('TodosOrd='),write(TodosOrd),nl,
    aStar2Maq(Dest,TodosOrd,Cam,Custo).

estimativaMaqA(Nodo1,Nodo2,Estimativa):-
    node(Nodo1,X1,Y1),
    node(Nodo2,X2,Y2),
    Estimativa is sqrt((X1-X2)^2+(Y1-Y2)^2).
