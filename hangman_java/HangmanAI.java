import java.io.*;
import java.util.*;

public class HangmanAI {
   private ArrayList<String> dictionary;
   private ArrayList<Character> alphabet;
   
   public HangmanAI() {
      try {
         this.dictionary = new ArrayList<String>();
         this.alphabet = new ArrayList<Character>();
         Scanner letters = new Scanner(new File("alphabet.txt"));
         Scanner file = new Scanner(new File("words.txt"));
         
         while (file.hasNext()) {
            dictionary.add(file.next());
         }
         
         while (letters.hasNext()) {
            alphabet.add(letters.next().charAt(0));
         }
      }
      
      catch (Exception e) {
         System.out.println("System can not find the required dictionary file. \nObject can not be created.");
      }
   }
   
   
   public char play() {
      //return this.randomGuess();
      return this.guess();
   }
   
   public char guess() {
      char guess;
      //Random rnd = new Random();
      guess = this.decide();//alphabet.get(rnd.nextInt(alphabet.size()));
      this.wait(1000);
      System.out.println("I choose " + "'" + guess + "'");
      this.wait(1000);
      return guess;     
   }
   
   public char randomGuess() {
      try {
         Random rnd = new Random();
         int randomWord = rnd.nextInt(dictionary.size());
         int randomLetter = rnd.nextInt(dictionary.get(randomWord).length());
         Thread.sleep(1000);
         System.out.println("I choose " + "'" + dictionary.get(randomWord).charAt(randomLetter) + "'");
         return dictionary.get(randomWord).charAt(randomLetter); 
      }
      
      catch (Exception e) {
         System.out.println("Please do not interrupt the process.");
         return ' ';
      }
   }
   
   public void checkForSize(Hangman hangman) {
      int size = hangman.askNumberOfLetters();
      for (int i=0;i<dictionary.size();i++) {
         if (dictionary.get(i).length() != size) {
            this.dictionary.remove(i);
            i--;
         }
         
         else {
            continue;
         }
      }
   }
   
   public void remove(char c) {
      for (int i=0;i<this.dictionary.size();i++) {
         if (this.dictionary.get(i).indexOf(c) < 0) {
            continue;  
         }
         
         else {
            this.dictionary.remove(i);
            i--;
         }
      }
   }

   
   public void updateLetter(char c) {
      for (int i=0;i<this.dictionary.size();i++) {
         if (this.dictionary.get(i).indexOf(c) >= 0) {
            continue;  
         }
         
         else {
            this.dictionary.remove(i);
            i--;
         }
      }    
   }
   
   public void print() {
      System.out.println("Words: ");
      for (String word : dictionary) {
         System.out.print(word + ", ");
      }
   }
   
   public void updateAlphabet(char c) {
      if (this.alphabet.indexOf(c) >= 0) {
         this.alphabet.remove(this.alphabet.indexOf(c));
      }
   }
   
   public char decide() {
      HashMap<Character,Integer> stat = new HashMap<Character,Integer>();
      char most = ' ';
      
      for (int i=0;i<this.alphabet.size();i++) {
         stat.put(this.alphabet.get(i),0);
      }
      
      for (int i=0;i<this.dictionary.size();i++) {
         for (int j=0;j<this.dictionary.get(i).length();j++) {
            if (this.alphabet.contains(this.dictionary.get(i).charAt(j))) {
               int value = stat.get(this.dictionary.get(i).charAt(j));
               stat.put(this.dictionary.get(i).charAt(j),value+1);
            }
         }
      }
      
      Iterator<Character> itr = stat.keySet().iterator();
      int max = 0;
      
      while (itr.hasNext()) {
         char current = itr.next();
         int count = stat.get(current);
         
         if (count < max) {
            continue;
         }
         
         else {
            max = count;
            most = current;
         }     
      }
      System.out.println(dictionary);
      return most;
   }
   
   public void check(char[] c) {
      for (int i=0;i<this.dictionary.size();i++) {
         int min = Math.min(this.dictionary.get(i).length(),c.length);
         for (int j=0;j<min;j++) {
            if (c[j] != ' ' && c[j] == this.dictionary.get(i).charAt(j)) {
               continue;   
            }
            
            else if (c[j] == ' ') {
               continue;
            }
            
            else {
               this.dictionary.remove(i);
               i--;
               break;
            }
         }
      }
   }
   
   public void wait(int x) {
      try {
         Thread.sleep(x);
      }
      
      catch (InterruptedException e) {
         System.out.println("Please do not interrupt the process.");
      }
   }
   
   public void removeExcessLetter(char[] array, char c) {
      for (int i=0;i<this.dictionary.size();i++) {
         int min = Math.min(this.dictionary.get(i).length(),c.length);
         for (int j=0;j<min;j++) {
            if (c[j] != ' ' && c[j] == this.dictionary.get(i).charAt(j)) {
               continue;   
            }
            
            else {
               this.dictionary.remove(i);
               i--;
               break;
            }
         }
      }
   }
}      
      
      
      
      
        