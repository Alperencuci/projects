// Alperen Cucioglu CS211 Final Project
// 15 November 2019
// This program decodes a file with a given input of dots and dashes to a english letter message

import java.util.*; // For File
import java.io.*; // For Scanner

public class MorseDecode {

   public static void main(String[] args) throws FileNotFoundException {
          
      Scanner morseFile = new Scanner(new File("decode.txt")); // A scanner for the file which is about to be decoded
      String s = decode(morseFile); // Calls the method
      Scanner sentence = new Scanner(s);
      System.out.println();
      encoder(sentence);
   }
   
   public static String decode(Scanner morseFile) throws FileNotFoundException {
      Scanner file = new Scanner(new File("morsecode.txt")); // A reference CharTree for morse code
      CharTree t = new CharTree(6,file);
      String encode = "";
      
      while (morseFile.hasNext()) {
      String letter = morseFile.next(); // Take the item 1 by 1 for each letter
      CharTreeNode current = t.getRoot();
      
      
         for (int i=0;i<letter.length();i++) {
            // For every character in the item, go left for dot and go right for dash
            if (letter.charAt(i) == '.') {
               current = current.left;
            }
            
            else if (letter.charAt(i) == '-') {
               current = current.right;
            }  
            else { // If neither, just add a space
               System.out.print(" ");
            }
         
         }
         encode += current.data;
         System.out.print(current.data); // Print the lettter 
      }
      return encode;
   }
   
   public static void encoder(Scanner sentence) throws FileNotFoundException {
      Scanner file = new Scanner(new File("morsecode.txt")); // A reference CharTree for morse code
      CharTree t = new CharTree(6,file);
      
      while (sentence.hasNext()) {
         String word = sentence.next(); // Taking the scanner word by word
         char c; 
         for (int i=0;i<word.length();i++) { // Traverse all the characters in the string
             c = word.charAt(i);
             System.out.print(t.easyEncode(c)); // Call the method
             System.out.print(" "); // A space between the letters
         }
         System.out.print("/"); // Slash for seperating the words
      }
   }
}