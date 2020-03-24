package model;

public class BinarySearchTreeNode {
	 private int data;    //节点数据
	 private int sign;
	 private BinarySearchTreeNode LeftChild; //左子节点的引用
	 private BinarySearchTreeNode RightChild; //右子节点的引用
	    //打印节点内容
	 public void display(){
	     System.out.println(data);
	 }
	 public BinarySearchTreeNode() {
	 }
	 public BinarySearchTreeNode(int data) {
		 this.data = data;
		 this.sign = '#';
		 this.LeftChild = null;
		 this.RightChild = null;
	 }
	 public int getData() {
		 return data;
	 }
	 public int getSign() {
	     return sign;
	 }
	 public void setData(int data) {
	     this.data = data;
	 }
	 public void setSign(int sign) {
	     this.sign = sign;
	 }
	 public BinarySearchTreeNode getLeftChild() {
	     return LeftChild;
	 }
	 public void setLeftChild(BinarySearchTreeNode leftChild) {
	     this.LeftChild = leftChild;
	 }
	 public BinarySearchTreeNode getRightChild() {
	     return RightChild;
	 }
	 public void setRightChild(BinarySearchTreeNode rightChild) {
	     this.RightChild = rightChild;
	 }        
}
