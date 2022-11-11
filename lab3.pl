%Реализовать предикат max(X,Y,Z), где Z максимальное из чисел X и Y.
max(X,Y,X):- X>=Y.
max(_,Y,Y).


%Реализовать предикат max(X,Y,U,Z), где Z максимальное из чисел X,Y и U.
max(_,Y,Y).

max(X, Y, U, X):-X>=Y, X>=U.
max(_,Y, U, Y):- Y>=U.
max(_,_,U,U).


%Реализовать предикат fact(N,X), где X – это факториал первого аргумента с помощью рекурсии вверх.
fact(1,1):-!.
fact(N,X):- N1 is N-1, fact(N1,X1), X is X1*N.


%Реализовать предикат fact(N,X), где X – это факториал первого аргумента с помощью рекурсии вниз.
fact(1, CurX, CurX):-!.
fact(N,CurX,X):-CurX1 is CurX*N, N1 is N-1, fact(N1, CurX1, X).
factorial(N,X):-fact(N,1,X).


%Реализовать предикат fib(N,X), где X – число Фибоначчи с номером N, причем 1 и 2 элемент равны 1 с помощью рекурсии вверх.
fib(0,0):-!.
fib(1,1):-!.
fib(2,1):-!.
fib(N,X):- N1 is N-1, N2 is N-2, fib(N1,X1), fib(N2,X2), X is X1+X2.


%Реализовать предикат fib(N,X), где X – число Фибоначчи с
%номером N, причем 1 и 2 элемент равны 1 с помощью рекурсии вниз.
fib(0,A,_,A):-!.
fib(N,A,B,X):- AB is A+B, N1 is N-1, fib(N1,B,AB,X).
fibonachi(N,X):-fib(N,0,1,X).


%Найти сумму цифр числа с помощью рекурсии вверх.
fib(0,A,_,A):-!.
fib(N,A,B,X):- AB is A+B, N1 is N-1, fib(N1,B,AB,X).
fibonachi(N,X):-fib(N,0,1,X).

sumnumbers(N,N):- N<10.
sumnumbers(N,X):- N>=10, D is N div 10, M is N mod 10, sumnumbers(D,X1), X is M+X1.


%Найти сумму цифр числа с помощью рекурсии вниз.
sum(0,Sum,Sum):-!.
sum(N,Sum,X):- D is N div 10, M1 is N mod 10, Sum1 is Sum + M1,sum(D,Sum1,X). 
sumnumbers1(N,X):-sum(N,0,X).


%Найти максимальную цифру числа. Реализовать предикат с помощью рекурсии вверх.
maxDigit(N,N):- N<10.
maxDigit(N,X):- N1 is N div 10, N2 is N mod 10, maxDigit(N1,X1), N2=<X1,!, X is X1.
maxDigit(N,X):- N1 is N div 10, N2 is N mod 10, maxDigit(N1,X1), N2>X1, X is N2.


%Найти максимальную цифру числа. Реализовать предикат с помощью рекурсии вниз.
mDig(0,A,A):- !.
mDig(A,B,C):- D is A mod 10, D>B, !, E is A div 10, mDig(E,D,C).
mDig(A,B,C):- D is A div 10, mDig(D,B,C).


%Найти минимальную нечетную цифру числа.
%Выполнить указанную задачу с помощью рекурсии вверх и рекурсии вниз, для каждой реализации отдельный коммит.
min(N,N):-N<10.
min(N,X):-N1 is N div 10, N2 is N mod 10, min(N1,X1), 1 is N2 mod 2, N2=<X1,!, X is N2. 
min(N,X):- N1 is N div 10, N2 is N mod 10, min(N1,X1), N2>X1, X is X1.


%Найти минимальную нечетную цифру числа. Выполнить указанную задачу с помощью рекурсии вверх и ре-
%курсии вниз, для каждой реализации отдельный коммит.
min1(0,N,N):- !.
min1(N,B,X):- D is N mod 10, 1 is D mod 2, D<B, !, E is N div 10, min1(E,D,X). 
min1(N,B,X):- D is N div 10, min1(D,B,X).
minimal(N,X):-min1(N,10,X).


%Найти НОД двух чисел.
%Проверить число на простоту.
%Найти количество делителей числа
nod(A,A,A):-!.
nod(0,B,B):-!.
nod(A,0,A):-!.
nod(A,B,X):-A>B, C is A mod B, nod(C,B,X).
nod(A,B,X):-A<B, C is B mod A, nod(A,C,X).

kol_del(1,_,1):-!.
kol_del(I,N,Count):-I1 is I-1, kol_del(I1,N,C), (0 is N mod I ->  Count is C+1;Count is C).
kol_del123(N,Count):-kol_del(N,N,Count).

simple(1):-true.
simple(X):- kol_del123(X,C), 2 is C. 


%Найти сумму всех делителей числа, взаимно простых с суммой цифр числа и не взаимно простых с произведением цифр числа.

%number 18, sum of digits = 9, prod of digits = 8
%divisors matching the condition of the task : 2, sum of divisors = 2
%number 144, sum of digits = 9, prod of digits = 16
%divisors matching the condition of the task : 2, 4, 8 č 16, sum of divisors = 30
%fun fact: 144 = sum of digits*prod of digits = 9 * 16
sum_digit(N, N):- N < 10, !.
sum_digit(N, X):- N1 is N mod 10, N2 is N div 10, sum_digit(N2, X1), X is N1 + X1.    

prod_digit(N,N) :- N < 10, !.
prod_digit(N,X) :- N1 is N mod 10, N2 is N div 10, prod_digit(N2,X1), X is X1 * N1.

is_del(Del,N):- 0 is N mod Del.

check_del(Del,N):- is_del(Del,N), sum_digit(N,S), nod(Del,S,SumNod), 1 is SumNod, 
   prod_digit(N,P), nod(Del,P,ProdNod), not(1 is ProdNod).

sum_del(_,0,Sum,X):-X is Sum, !.
sum_del(N, Count, Sum, X):- Count1 is Count - 1,  ((check_del(Count,N)) -> Sum1 is Sum + Count;Sum1 is Sum), sum_del(N,Count1,Sum1,X).
sum_del_chisla(N,X):-sum_del(N,N,0,X).
