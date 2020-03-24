package model;
import model.BinaryTreeNode;
public class BinarySearchTree {
	private BinarySearchTreeNode root;
	public static int i;
	//初始化
	public BinarySearchTree(){}

	public BinarySearchTree(BinarySearchTreeNode root){
		this.root = root;
	}
	//根节点
	public void setRoot(BinarySearchTreeNode root){
	    this.root = root;
	}
	
	public BinarySearchTreeNode getRoot(){
		return root;
	}
	//查找node节点
	public BinarySearchTreeNode findNode(int key) {
		BinarySearchTreeNode current = root;
	    while(current != null){
	        if(current.getData() > key){//当前值比查找值大，搜索左子树
	            current = current.getLeftChild();
	        }else if(current.getData() < key){//当前值比查找值小，搜索右子树
	            current = current.getRightChild();
	        }else{
	            return current;
	        }
	    }
	    return null;//遍历完整个树没找到，返回null
	}
	
	//插入节点
	public boolean insert(int data) {
		BinarySearchTreeNode newNode = new BinarySearchTreeNode(data);
	    if(root == null){//当前树为空树，没有任何节点
	        root = newNode;
	        return true;
	    }else{
	    	BinarySearchTreeNode current = root;
	    	BinarySearchTreeNode parentNode = null;
	        while(current != null){
	            parentNode = current;
	            if(current.getData() > data){//当前值比插入值大，搜索左子节点
	                current = current.getLeftChild();
	                if(current == null){//左子节点为空，直接将新值插入到该节点
	                    parentNode.setLeftChild(newNode);
	                    return true;
	                }
	            }else{
	                current = current.getRightChild();
	                if(current == null){//右子节点为空，直接将新值插入到该节点
	                    parentNode.setRightChild(newNode);
	                    return true;
	                }
	            }
	        }
	    }
	    return false;
	}
	
	//找到最大值
	public BinarySearchTreeNode findMax(BinarySearchTreeNode root){
		BinarySearchTreeNode current = root;
		BinarySearchTreeNode maxNode = current;
	    while(current != null){
	        maxNode = current;
	        current = current.getRightChild();
	    }
	    return maxNode;
	}
	
	//找到最小值
	public BinarySearchTreeNode findMin(BinarySearchTreeNode root){
		BinarySearchTreeNode current = root;
		BinarySearchTreeNode minNode = current;
	    while(current != null){
	        minNode = current;
	        current = current.getLeftChild();
	    }
	    return minNode;
	}
	
	
	
	
	//先序遍历
	public void PreOrder(BinarySearchTreeNode node){
		if(node!=null){
			node.setSign(i);
			i++;
			System.out.println(node.getData()); //先访问根节点
		    PreOrder(node.getLeftChild());  //先根遍历左子树
		    PreOrder(node.getRightChild());  //先根遍历右子树
		}
	}
		     
	//中序遍历
	public void InOrder(BinarySearchTreeNode node){
		if(node!=null){
			InOrder(node.getLeftChild());  //中根遍历左子树
			node.setSign(i);
			i++;
		    System.out.println(node);    //访问根节点
		    InOrder(node.getRightChild());  //中根遍历右子树
		}
	}
	//后序遍历
	public void PostOrder(BinarySearchTreeNode node){
		if(node!=null){
			PostOrder(node.getLeftChild());  //后根遍历左子树
			PostOrder(node.getRightChild());  //后根遍历右子树
			node.setSign(i);
			i++;
			System.out.println(node);   //访问根节点
		}
	}
	 //删除节点
	 public void nodeDelete(BinarySearchTreeNode node,BinarySearchTreeNode parent ){
	        
	        if (node.getLeftChild()==null) {
	        	if(parent.getLeftChild()==node)
	        		parent.setLeftChild(node.getRightChild());
	        	else if(parent.getRightChild()==node)
	        		parent.setRightChild(node.getRightChild());
	        }
	        else if (node.getRightChild()==null) {
	        	if(parent.getLeftChild()==node)
	        		parent.setLeftChild(node.getLeftChild());
	        	else if(parent.getRightChild()==node)
	        		parent.setRightChild(node.getLeftChild());
	        }
	        else {
	        	BinarySearchTreeNode parent1 = node;
	        	BinarySearchTreeNode current = node.getRightChild();
	    		BinarySearchTreeNode minNode = current;
	    	    while(current != null){
	    	    	parent1 = minNode;
	    	        minNode = current;
	    	        current = current.getLeftChild();
	    	    }
	    	    int data1 = minNode.getData();
	            nodeDelete(minNode,parent1);
	            node.setData(data1);
	        }
	        System.out.println("Deleted :  "+"\n");
	    }
}
