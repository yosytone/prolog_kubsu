sub_posl([],_):-!.
sub_posl(_,[]):-fail,!.
sub_posl([H|Sub_list],[H|List]):-sub_posl(Sub_list,List),!.
sub_posl(Sub_list,[_|List]):-sub_posl(Sub_list,List).

sub_set([],[]).
sub_set([H|Sub_set],[H|Set]):-sub_set(Sub_set,Set).
sub_set(Sub_set,[_|Set]):-sub_set(Sub_set,Set).

in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).


sprava_next(_,_,[_]):-fail.
sprava_next(A,B,[A|[B|_]]).
sprava_next(A,B,[_|List]):-sprava_next(A,B,List).

sleva_next(_,_,[_]):-fail.
sleva_next(A,B,[B|[A|_]]).
sleva_next(A,B,[_|List]):-sleva_next(A,B,List).

next_to(A,B,List):-sprava_next(A,B,List).
next_to(A,B,List):-sleva_next(A,B,List).

el_no(List,Num,El):-el_no(List,Num,1,El).
el_no([H|_],Num,Num,H):-!.
el_no([_|Tail],Num,Ind,El):-Ind1 is Ind+1,el_no(Tail,Num,Ind1,El).

pr_ein:- Houses=[_,_,_,_,_],

		in_list(Houses,[red,english,_,_,_]),
		in_list(Houses,[_,spanish,_,dog,_]),
		in_list(Houses,[green,_,coffee,_,_]),
		in_list(Houses,[_,ukrain,tea,_,_]),
		sprava_next([green,_,_,_,_],[white,_,_,_,_],Houses),
		in_list(Houses,[_,_,_,ulitka,old_gold]),
		in_list(Houses,[yellow,_,_,_,kool]),
		el_no(Houses,3,[_,_,milk,_,_]),
		el_no(Houses,1,[_,norway,_,_,_]),
		next_to([_,_,_,_,chester],[_,_,_,fox,_],Houses),
		next_to([_,_,_,_,kool],[_,_,_,horse,_],Houses),
		in_list(Houses,[_,_,orange,_,lucky]),
		in_list(Houses,[_,japan,_,_,parlament]),
		next_to([_,norway,_,_,_],[blue,_,_,_,_],Houses),


		in_list(Houses,[_,WHO1,water,_,_]),
		in_list(Houses,[_,WHO2,_,zebra,_]),
		write(Houses), nl,
		write(WHO1), write(" drink water"),nl,write(WHO2),
                write(" hold zebra").

% Task 2.  Беседует трое друзей: Белокуров, Рыжов, Чернов. Брюнет 
% сказал Белокурову: “Любопытно, что один из нас блондин, другой брюнет, 
% третий - рыжий, но ни у кого цвет волос не соответствует фамилии”. Какой 
% цвет волос у каждого из друзей?

task_2:- Friends = [_,_,_],
    in_list(Friends,[belokurov,_]),
    in_list(Friends,[rizhov,_]),
    in_list(Friends,[chernov,_]),
    in_list(Friends,[_,riziy]),
    in_list(Friends,[_,blond]),
    in_list(Friends,[_,brunet]),
	not(in_list(Friends,[belokurov,brunet])),
    (   in_list(Friends,[belokurov,brunet]);in_list(Friends,[belokurov,riziy])),
    (   in_list(Friends,[rizhov,brunet]);in_list(Friends,[rizhov,blond])),
    (   in_list(Friends,[chernov,blond]);in_list(Friends,[chernov,riziy])),
    write(Friends).

% Task 3. Три подруги вышли в белом, зеленом и синем платьях и 
% туфлях. Известно, что только у Ани цвета платья и туфлей совпадали. Ни 
% туфли, ни платье Вали не были белыми. Наташа была в зеленых туфлях. 
% Определить цвета платья и туфель на каждой из подруг.

task_3:- Girlfriends = [_,_,_],
    in_list(Girlfriends,[_,white,_]),
    in_list(Girlfriends,[_,green,_]),
    in_list(Girlfriends,[_,blue,_]),
    in_list(Girlfriends,[_,_,white]),
    in_list(Girlfriends,[_,_,green]),
    in_list(Girlfriends,[_,_,blue]),
    in_list(Girlfriends,[ann,_,_]),
    in_list(Girlfriends,[natasha,_,green]),
    in_list(Girlfriends,[valya,_,_]),

not(in_list(Girlfriends,[valya,X,X])),
not(in_list(Girlfriends,[natasha,Y,Y])),
    (in_list(Girlfriends,[ann,white,white]);in_list(Girlfriends,[ann,blue,blue])),
    not(in_list(Girlfriends,[valya,white,_])),
    not(in_list(Girlfriends,[valya,_,white])),
    write(Girlfriends).

% Task 4. На заводе работали три друга: слесарь, токарь и сварщик. Их 
% фамилии Борисов, Иванов и Семенов. У слесаря нет ни братьев, ни сестер. Он 
% самый младший из друзей. Семенов, женатый на сестре Борисова, старше 
% токаря. Назвать фамилии слесаря, токаря и сварщика.

task_4:- Workers = [_,_,_],
    in_list(Workers,[borisov,_,[sister],_]),
    in_list(Workers,[ivanov,_,_,_]),
    in_list(Workers,[semenov,_,_,_]),
    in_list(Workers,[_,slesar,[],25]),
    in_list(Workers,[_,tokar,_,_]),
    in_list(Workers,[_,swarshik,_,_]),
    in_list(Workers,[_,_,[],_]),
    in_list(Workers,[_,_,_,30]),
    in_list(Workers,[_,_,_,40]),
    in_list(Workers,[semenov,_,_,Age1]),
    in_list(Workers,[_,tokar,_,Age2]), Age1 > Age2,

    in_list(Workers,[Sur1,slesar,_,_]),
    in_list(Workers,[Sur2,tokar,_,_]),
    in_list(Workers,[Sur3,swarshik,_,_]),
    write(Sur1),write(" - Slesar"),nl,
    write(Sur2),write(" - Tokar"),nl,
    write(Sur3),write(" - Swarshik"),nl,
    write(Workers).

% Task 5. В бутылке, стакане, кувшине и банке находятся молоко, 
% лимонад, квас и вода. Известно, что вода и молоко не в бутылке, сосуд с 
% лимонадом находится между кувшином и сосудом с квасом, в банке - не 
% лимонад и не вода. Стакан находится около банки и сосуда с молоком. Как 
% распределены эти жидкости по сосудам.

task_5:- Capacities = [_,_,_,_],
    in_list(Capacities,[bottle,_]),
    in_list(Capacities,[glass,_]),
    in_list(Capacities,[kuvshin,_]),
    in_list(Capacities,[banka,_]),
    in_list(Capacities,[_,milk]),
    in_list(Capacities,[_,limonade]),
    in_list(Capacities,[_,kvas]),
    in_list(Capacities,[_,water]),

    not(in_list(Capacities,[bottle,milk])),
    not(in_list(Capacities,[bottle,water])),

    next_to([_,limonade],[kuvshin,_],Capacities),
    next_to([_,limonade],[_,kvas],Capacities),

    not(in_list(Capacities,[banka,limonade])),
    not(in_list(Capacities,[banka,water])),

    next_to([glass,_],[banka,_],Capacities),
    next_to([glass,_],[_,milk],Capacities),
    write(Capacities).

% Task 6. Воронов, Павлов, Левицкий и Сахаров – четыре талантливых 
% молодых человека. Один из них танцор, другой художник, третий-певец, а 
% четвертый-писатель. О них известно следующее: Воронов и Левицкий сидели 
% в зале консерватории в тот вечер, когда певец дебютировал в сольном 
% концерте. Павлов и писатель вместе позировали художнику. Писатель написал 
% биографическую повесть о Сахарове и собирается написать о Воронове. 
% Воронов никогда не слышал о Левицком. Кто чем занимается?

task_6:- People = [_,_,_,_],
    in_list(People,[voronov,_]),
    in_list(People,[pavlov,_]),
    in_list(People,[levickiy,_]),
    in_list(People,[saharov,_]),
    in_list(People,[_,dancer]),
    in_list(People,[_,artist]),
    in_list(People,[_,singer]),
    in_list(People,[_,writer]),

    not(in_list(People,[voronov,singer])),
    not(in_list(People,[levickiy,singer])),

    not(in_list(People,[pavlov,artist])),
    not(in_list(People,[pavlov,writer])),

    not(in_list(People,[saharov,writer])),
    not(in_list(People,[voronov,writer])),
    write(People).

% Task 7. Три друга заняли первое, второе, третье места в 
% соревнованиях универсиады. Друзья разной национальности, зовут их поразному, и любят они разные виды спорта. Майкл предпочитает баскетбол и 
% играет лучше, чем американец. Израильтянин Саймон играет лучше теннисиста. Игрок в крикет занял первое место. Кто является австралийцем? 
% Каким спортом увлекается Ричард?

task_7:- Sportsmen = [_,_,_],
    in_list(Sportsmen,[michael,_,basketball,_]),
    in_list(Sportsmen,[simon,izrael,_,_]),
    in_list(Sportsmen,[richard,_,_,_]),
    in_list(Sportsmen,[_,australia,_,_]),
    in_list(Sportsmen,[_,_,kriket,1]),
    in_list(Sportsmen,[_,america,_,_]),
    in_list(Sportsmen,[_,_,tennis,_]),
    in_list(Sportsmen,[_,_,_,2]),
    in_list(Sportsmen,[_,_,_,3]),

    in_list(Sportsmen,[michael,_,_,Place1]),
    in_list(Sportsmen,[_,america,_,Place2]), Place1 < Place2,
    in_list(Sportsmen,[simon,_,_,Place3]),
    in_list(Sportsmen,[_,_,tennis,Place4]), Place3 < Place4,

    not(in_list(Sportsmen,[simon,_,tennis,_])),
    not(in_list(Sportsmen,[michael,america,_,_])),

    in_list(Sportsmen,[Who,australia,_,_]),
    in_list(Sportsmen,[richard,_,What,_]),

    write("Australian - "), write(Who),nl,
    write("Richard enjoy "), write(What),nl,
    write(Sportsmen).

% Task 8. Четыре человека играют в домино. Их фамилии Кузнецов, 
% Токарев, Слесарев и Резчиков. Профессия каждого игрока соответствует 
% фамилии одного из других игроков. Напротив Кузнецова сидит слесарь. 
% Напротив Резчикова сидит резчик. Справа от Слесарева сидит токарь. Кто 
% сидит слева от кузнеца?

naprotiv(A,B,[_,A,_,B]).
naprotiv(B,A,[A,_,B,_]).
naprotiv(B,A,[_,A,_,B]).

task_8:- Players = [_,_,_,_],
    in_list(Players,[kuznecov,_]),
    in_list(Players,[tokarev,_]),
    in_list(Players,[slesarev,_]),
    in_list(Players,[rezchikov,_]),
    in_list(Players,[_,kuznec]),
    in_list(Players,[_,tokar]),
    in_list(Players,[_,slesar]),
    in_list(Players,[_,rezchik]),

    not(in_list(Players,[rezchikov,rezchik])),
    not(in_list(Players,[kuznecov,kuznec])),
    not(in_list(Players,[tokarev,tokar])),
    not(in_list(Players,[slesarev,slesar])),

    naprotiv([kuznecov,_],[_,slesar],Players),
    naprotiv([rezchikov,_],[_,rezchik],Players),

    sprava_next([slesarev,_],[_,tokar],Players),

    sleva_next([_,kuznec],[Who,_],Players),
    write("On the left from kuznec - "),write(Who),nl,
    write(Players).
