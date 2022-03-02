// Alperen Cucioglu CS211 Final Project
// 8 November 2019
// Class for storing a single node of a binary tree of ints

public class CharTreeNode {
    public char data;
    public CharTreeNode left;
    public CharTreeNode right;
                
    // constructs a leaf node with given data
    public CharTreeNode(char data) {
        this(data, null, null);
    }
                        
    // constructs a branch node with given data, left subtree,
    // right subtree
    public CharTreeNode(char data, CharTreeNode left, 
                       CharTreeNode right) {
        this.data = data;
        this.left = left;
        this.right = right;
    }
}
