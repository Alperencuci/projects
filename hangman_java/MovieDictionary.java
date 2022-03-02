import java.util.*;
import java.io.*;

public class MovieDictionary extends Dictionary {
   String[] movies;
      
   public MovieDictionary() throws FileNotFoundException {
      movies = new String[0];
      Scanner file = new Scanner(new File("movies.txt"));
            
      while (file.hasNext()) {
         int size = movies.length;
         movies = Arrays.copyOf(movies,size+1);
         movies[movies.length-1] = file.nextLine();
      }
   }
   
   
   public String random() {
      String movie;
      Random rnd = new Random();
      int index = rnd.nextInt(movies.length);
      movie = movies[index];
      return movie;
   }
   
   public void print() {
      for (int i=0;i<movies.length;i++) {
         System.out.println(movies[i]);
      }
   }
}