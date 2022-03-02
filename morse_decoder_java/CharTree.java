// Alperen Cucioglu CS211 Homework Assignment 8
// 8 November 2019

// Simple binary tree class that includes methods to construct a
// tree of chars, to print the structure, and to print the data
// using a preorder, inorder or postorder traversal.  The trees
// built have nodes numbered starting with 1 and numbered
// sequentially level by level with no gaps in the tree.  The
// documentation refers to these as "sequential trees."


import java.util.*;
import java.io.*;

public class CharTree {
    private CharTreeNode overallRoot;

    // Constructor for CharTree with a file to read the letters from
    public CharTree(int level,Scanner file) {
        if (level <= 0) { // If level is less than 1, throw the exception
            throw new IllegalArgumentException("level: " + level);
        }
        overallRoot = buildTree(level,file); // Call the node constructor
    }

        
    private CharTreeNode buildTree(int level,Scanner file) {
        if (level == 0) { // If the level is 0, return null (Base Case)
            return null;
        } 
        else {
            String s = file.next(); // Read the next item from the file scanner
            char c = s.charAt(0); // Convert that letter to a char
            
            if (c == '?') { // If char is ?, then a null node is constructed,
                return new CharTreeNode(' ',buildTree(level-1,file), buildTree(level-1,file));
            }
            
            else { // Else, construct a node with a data of that char
                return new CharTreeNode(c,buildTree(level-1,file), buildTree(level-1,file));
            }
        }
    }

    // post: prints the tree contents using a preorder traversal
    public void printPreorder() {
        System.out.print("preorder:");
        printPreorder(overallRoot);
        System.out.println();
    }

    // post: prints the tree contents using a preorder traversal
    // post: prints in preorder the tree with given root
    private void printPreorder(CharTreeNode root) {
        if (root != null) {
            System.out.print(" " + root.data);
            printPreorder(root.left);
            printPreorder(root.right);
        }
    }

    // post: prints the tree contents using a inorder traversal
    public void printInorder() {
        System.out.print("inorder:");
        printInorder(overallRoot);
        System.out.println();
    }

    // post: prints in inorder the tree with given root
    private void printInorder(CharTreeNode root) {
        if (root != null) {
            printInorder(root.left);
            System.out.print(" " + root.data);
            printInorder(root.right);
        }
    }

    // post: prints the tree contents using a postorder traversal
    public void printPostorder() {
        System.out.print("postorder:");
        printPostorder(overallRoot);
        System.out.println();
    }

    // post: prints in postorder the tree with given root
    private void printPostorder(CharTreeNode root) {
        if (root != null) {
            printPostorder(root.left);
            printPostorder(root.right);
            System.out.print(" " + root.data);
        }
    }

    // post: prints the tree contents, one per line, following an
    //       inorder traversal and using indentation to indicate
    //       node depth; prints right to left so that it looks
    //       correct when the output is rotated.
    public void printSideways() {
        printSideways(overallRoot, 0);
    }

    // post: prints in reversed preorder the tree with given
    //       root, indenting each line to the given level
    private void printSideways(CharTreeNode root, int level) {
        if (root != null) {
            printSideways(root.right, level + 1);
            for (int i = 0; i < level; i++) {
                System.out.print("    ");
            }
            System.out.println(root.data);
            printSideways(root.left, level + 1);
        }
    }
    
    // Method to get the root of the CharTree
    public CharTreeNode getRoot() {
        return overallRoot;
    }
    
    public String easyEncode(char c) {
        char[] list = { 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L','M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '1', '2', '3', '4', '5', '6', '7', '8', '9', '0'};
        String[] morse = {".-", "-...", "-.-.", "-..", ".", "..-.", "--.", "....", "..", ".---", "-.-", ".-..", "--", "-.", "---", ".---.", "--.-", ".-.", "...", "-", "..-", "...-", ".--", "-..-", "-.--", "--..", ".----", "..---", "...--", "....-", ".....", "-....", "--...", "---..", "----.", "-----",};
        int index = -1;
        for (int i=0;i<list.length;i++) {
            if (list[i] == c) {
               index = i;
            }
        }
        return morse[index];
    }
        
    public String encode(String str) {
        CharTreeNode current = this.overallRoot;
        String result = "";
        String s = "";
        char c;
         
        for (int i = 0; i<str.length(); i++) {
            c = str.charAt(i);
            result = this.searchTree(current, c, s);
            System.out.print(" ");
            }
        return result;
    }   
 
    private String searchTree(CharTreeNode current, char c, String s) {
 
        if (current.data == c) { 
            return s;
        } 
        
        else {
            if (current.left != null) {
                return searchTree(current.left, c, s + ".");
            }
            else if (current.right != null) {
                return searchTree(current.right, c, s + "-");
            }       
            return s;
        }
    }
}