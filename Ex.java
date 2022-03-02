import java.io.*;
import java.util.*;

public class Ex {

   public static void main(String[] args) throws FileNotFoundException {
   
   Scanner file = new Scanner(new File("morsecode.txt"));
   while (file.hasNext()) {
   
   System.out.println(file.next());  
   }  
   }
   
}