easy_game(sell).
easy_game(shot).
easy_game(gear).
easy_game(sure).
easy_game(fire).
easy_game(glow).
easy_game(week).
easy_game(ones).
easy_game(sick).
easy_game(oath).
easy_game(oily).


normal_game(trial).
normal_game(close).
normal_game(refer).
normal_game(alter).
normal_game(three).
normal_game(spike).
normal_game(spark).
normal_game(spain).
normal_game(after).
normal_game(again).


hard_game(spies).
hard_game(joins).
hard_game(tires).
hard_game(trick).
hard_game(tried).
hard_game(skies).
hard_game(terms).
hard_game(third).
hard_game(fries).
hard_game(price).
hard_game(tribe).
hard_game(texas).
hard_game(tanks).



very_hard_game(meeting).
very_hard_game(offline).
very_hard_game(sending).
very_hard_game(setting).
very_hard_game(warrior).
very_hard_game(writing).
very_hard_game(warning).
very_hard_game(affront).
very_hard_game(wishing).
very_hard_game(sterile).
very_hard_game(melting).
very_hard_game(dancing).
very_hard_game(testing).
very_hard_game(letting).
very_hard_game(acquire).
very_hard_game(heading).
very_hard_game(calling).
very_hard_game(selling).
very_hard_game(winning).


play:-
    clear,
    asserta(current_attempt(1)),
    write("Choose the difficulty [1 -> Easy [default], 2 -> Normal, 3 -> Hard, 4 -> Very Hard]: "),
    read(Difficulty),
    check_difficulty(Difficulty, X), asserta(n_chars(X)),
    n_chars(NChar), write("Number of chars: "), write(NChar), nl,
    words(Difficulty, L), write("Possible words: "), write(L), nl,
    write("Number of attempts: "), attempts(Attempts), write(Attempts),
    create_guess(L),
    make_guess(L).

check_difficulty(D, X):-
    D =:= 4, !, X = 7;
    D =:= 2, !, X = 5;
    D =:= 3, !, X = 5;
    X = 4.

words(Difficulty, L) :-
    Difficulty =:= 4, ! , findall(X, very_hard_game(X), L), asserta(attempts(5));
    Difficulty =:= 2, ! , findall(X, normal_game(X), L), asserta(attempts(5));
    Difficulty =:= 3, ! , findall(X, hard_game(X), L), asserta(attempts(4));
    findall(X, easy_game(X), L), asserta(attempts(5)).

clear:-
    tty_clear,
    abolish(my_guess/1),
    abolish(current_attempt/1),
    abolish(attempts/1).

create_guess(List):-
    random_member(Random, List), print_line, nl, write("I make my guess. Now we can start to play!"),
    print_line,
    asserta(my_guess(Random)).


make_guess(List):-
    current_attempt(Y),
    nl, write("Attempt n. "), write(Y),
    nl, write("Choose a word from: "), write(List), nl, read(Choose),
    check_if_word_exist(Choose, List),
    my_guess(Word),
    compare_guess(Choose, Word, Winning),
    Winning = true, !;
    current_attempt(Y), attempts(X),
    Y < X, abolish(current_attempt/1), Z is Y + 1, asserta(current_attempt(Z)),
    make_guess(List);
    !, my_guess(Word), nl, write("You lose. My guess was '"), write(Word), write("'.").


check_if_word_exist(Word, L):-
    member(Word, L), !; nl, write("You insert a wrong word."), print_line, fail.


compare_guess(UserWord, MyWord, Win):-
    string_to_list(UserWord, ListUserWord),
    string_to_list(MyWord, ListMyWord),
    !, compareList(ListUserWord, ListMyWord, Count), nl, nl,
    write("Likeness:  "), length(ListUserWord, Length), write(Count), write("/"), write(Length),
    print_line,
    check_win(Count, Length, Win).

string_to_list(String, List):-
    atom_chars(String, List).



check_win(Likewise, Length, Win):-
    Likewise = Length, !, nl, write("YOU WIN!"), Win = true; Win = false.


compareList([], [], 0).
compareList([H|T], [A|C], Count):-
    if_equal(H, A, Equal),
    compareList(T, C, Count1), Count is Count1 + Equal.



if_equal(A, B, Equal):-
    A = B, !, Equal = 1; Equal = 0.


print_line:-
    nl, nl, nl, write("-----------------------------------------------------").
