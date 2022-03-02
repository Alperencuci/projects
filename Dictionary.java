import java.util.*;
import java.io.*;

public class Dictionary {
   String[] words;
      
   public Dictionary() throws FileNotFoundException {
      words = new String[0];
      Scanner file = new Scanner(new File("words.txt"));
            
      while (file.hasNext()) {
         int size = words.length;
         words = Arrays.copyOf(words,size+1);
         words[words.length-1] = file.next();
      }
   }
   
   
   public String random() {
      String word;
      Random rnd = new Random();
      int index = rnd.nextInt(words.length);
      word = words[index];
      return word;
   }
   
   public void print() {
      for (int i=0;i<words.length;i++) {
         System.out.println(words[i]);
      }
   }
}