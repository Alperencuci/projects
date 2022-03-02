import java.io.*;
import java.util.*;

public class Game {
   public static void main(String[] args) throws FileNotFoundException {
      
      
      //MovieDictionary list = new MovieDictionary();
      //Hangman hangman = new Hangman(list.random());
      //Scanner file = new Scanner(new File("words.txt"));
      //computer.play(hangman);
      
      
      Hangman hangman1 = new Hangman();
      Hangman hangman2 = new Hangman(true);
      
      compete(hangman1,hangman2);
      //maxWin();
      
   }
   
   
   public static void compete(Hangman Hangman1, Hangman Hangman2) {
      int player1 = Hangman1.play();
      int player2 = Hangman2.play();
      
      if (player1 > player2) {
         System.out.println("User have won!");
      }
      
      else if (player2 > player1) {
         System.out.println("Computer have won!");
      }
      
      else {
         System.out.println("It's a tie!");
      }
   }
   
   public static void maxWin() {
      int totalWin = 0;
      while (true) {
         Hangman hangman2 = new Hangman(true);
         int AI = hangman2.play();
         if (AI != 0) {
            totalWin++;
         }
         
         else {
            break;
         }
      }
      System.out.println("Total Wins: " + totalWin);
   }
}
