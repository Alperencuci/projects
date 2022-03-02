import java.util.*;
import java.io.*;

public class Hangman {
   private char[] word;
   private boolean[] guess;
   private Scanner input;
   private int lives;
   private boolean AI;
      
   // Default constructor 
   public Hangman() {
      try {
         Dictionary list = new Dictionary();
         String s = list.random();
         this.word = new char[s.length()];
         this.guess = new boolean[s.length()];
         this.input = new Scanner(System.in); 
         this.lives = 7;
         this.preGame(s);
         this.AI = false;
      }
      
      catch (FileNotFoundException e) {
         System.out.println("System can not find the required dictionary file. \nObject can not be created.");
      }
   }
   
   public Hangman(boolean bo) {
      try {
         Dictionary list = new Dictionary();
         String s = list.random();
         this.word = new char[s.length()];
         this.guess = new boolean[s.length()];
         this.lives = 7;
         this.preGame(s);
         this.AI = bo;
      }
      
      catch (FileNotFoundException e) {
         System.out.println("System can not find the required dictionary file. \nObject can not be created.");
      }
   }
   
   // Set-up the gameplay
   public void preGame(String s) {
      this.putLetters(s);
   }
   
   public int play() {
      if (!AI) {
         return this.playWithUser();
      }
      
      else {
         return this.playWithAI();
      }
   }
      
   // Gameplay method with user
   public int playWithUser() {
      while (true) {
         boolean round = false;
         System.out.println("\nRemaining lives: " + this.lives);
         System.out.println("Enter a letter: ");
         char letter = Character.toLowerCase(input.next().charAt(0));
      
         for (int i=0;i<word.length;i++) {
         
            if (Character.toLowerCase(word[i]) == letter || word[i] == ' ') {
               guess[i] = true;
               round = true;
            }
            
            else {
               continue;          
            }         
         }
        
         this.printCurrent();
         
         if (round) {
         
         }
         
         else {
            lives--; 
         }
         
         if (this.checkFinish()) {
            System.out.println("\nCongratulations! You have won!!!");
            break;
         }
         
         else if (!this.checkFinish() && lives == 0) {
            System.out.println("\nNo lives remaining. You have lost!!!");
            System.out.print("The secret word was ");
            this.printWord();
            break;
         }
         
         else {
            continue;
         }
      } 
      
      return lives;     
   }
   
   // Gameplay method with AI
   public int playWithAI() {
      HangmanAI computer = new HangmanAI();
      char[] current = new char[guess.length];
      
      for (int i=0;i<current.length;i++) {
         current[i] = ' ';
      }
      
      computer.checkForSize(this);
      
      while (true) {
         boolean round = false;
         computer.check(current);
         
         computer.wait(1000);
         System.out.println("\nRemaining lives: " + this.lives);
         computer.wait(1000);
         System.out.println("Enter a letter: ");
         char letter = Character.toLowerCase(computer.play());

         for (int i=0;i<word.length;i++) {
         
            if (Character.toLowerCase(word[i]) == letter || word[i] == ' ') {
               guess[i] = true;
               round = true;       
               current[i] = letter; 
               
            }
            
            else {
               //computer.removeExcessLetter(current,letter);
               continue;          
            }         
         }
         
         if (round) {
            computer.updateLetter(letter);
         }
         
         else {
            lives--;
            computer.remove(letter);
         }
         this.printCurrent();
         computer.updateAlphabet(letter);
              
         if (this.checkFinish()) {
            System.out.println("\nCongratulations! You have won!!!");
            break;
         }
         
         else if (!this.checkFinish() && lives == 0) {
            System.out.println("\nNo lives remaining. You have lost!!!");
            System.out.print("The secret word was ");
            this.printWord();
            break;
         }
         
         else {
            continue;
         }
      }
      
      return lives;     
   }
      
   // Filling the array
   public void putLetters(String s) {
      for (int i=0;i<s.length();i++) {
         word[i] = s.charAt(i);
      }
   }     
      
      
   // Check if the game is finished
   public boolean checkFinish() {
      boolean finish = true;
      for (int i=0;i<guess.length;i++) {
         if (guess[i]) {
            finish = true;
         }
               
         else {
            finish = false;
            break;              
         }
      }
      return finish;
   } 
      
   // Prints the current game
   public void printCurrent() {
      for (int i=0;i<word.length;i++) {
         if (guess[i]) {
            System.out.print(word[i]);
         }
         
         else {
            System.out.print("_ ");
         }
      }
   }
   
   public int askNumberOfLetters() {
      return word.length;
   }
   
   public void printWord() {
      for (int i=0;i<this.word.length;i++) {
         System.out.print(word[i]);
      }
      System.out.println();
   }
}