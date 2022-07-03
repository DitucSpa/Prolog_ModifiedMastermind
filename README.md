# Prolog_ModifiedMastermind
A simple modified version of Mastermind written in Prolog. <br>
You need to have SWI-PROLOG for playing this game. You can find the software [here](https://www.swi-prolog.org/download/stable). For uploading the file "modified_mastermind.pl" on SWI-PROLOG, digit the path where you have saved the file. For example:<br>
```bash
consult("/Users/.../modified_mastermind.pl").
```
Remember that it is important to put the  *.*  char (dot) at the end of each command.<br>
There are some commands that you can use:<br>
play.&ensp;&ensp;&ensp;&ensp;&ensp;(start a new game);<br>
clear.&ensp;&ensp;&ensp;&ensp;(clear the console). <br>
<br>
<br>
# The Game
The game is similar to Mastermind, but you will use words instead of colours. After selecting the difficulty, the CPU-Player provides you a list of possible words. Your objective is to guess the right word from the list. The CPU-Player provides you also some help; it gives you a "Likeness" result, which is how close your guess is to the CPU-Player's word. If there is a char in the right position, the Likeness is increased. But if you write a word with the same chars of the CPU-Player's word, but in a different position, the Likeness is zero. You can find an example below:<br>
<img src="https://user-images.githubusercontent.com/90385079/177033891-9ad969ac-2437-45e4-9736-2aba18906832.png" width="800"/><br>

<br><br>You can find other information on "Report.pdf".
<br>[Gianluca Di Tuccio](https://github.com/DitucSpa), [Lorenzo Orsini](https://github.com/lorenzo-orsini)
