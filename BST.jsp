<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>二叉搜索树</title>
 
 <style>
     canvas {
       cursor: pointer;
       border: 1px solid black;
     }
     .txt {
    color:#333;
    line-height:normal;
    font-family:"Microsoft YaHei",Tahoma,Verdana,SimSun;
    font-style:normal;
    font-variant:normal;
    font-size-adjust:none;
    font-stretch:normal;
    font-weight:normal;
    margin-top:0px;
    margin-bottom:0px;
    margin-left:0px;
    padding:4px 4px;
    font-size:14px;
    outline-width:medium;
    outline-style:none;
    outline-color:invert;
    border-radius:3px;
    text-shadow:0px 1px 2px #fff;
    background-attachment:scroll;
    background-repeat:repeat-x;
    background-position-x:left;
    background-position-y:top;
    background-size:auto;
    background-origin:padding-box;
    background-clip:border-box;
    background-color:rgb(255,255,255);
    margin-right:8px;
    border: 1px solid #ccc;
}
.txt:focus {
     border: 1px solid #fafafa;
    -webkit-box-shadow: 0px 0px 6px #007eff;
     -moz-box-shadow: 0px 0px 5px #007eff;
     box-shadow: 0px 0px 5px #007eff;   
    
}
.btn {
    line-height: 1.499;
    position: relative;
    display: inline-block;
    white-space: nowrap;
    text-align: center;
    border: 1px solid transparent;
    cursor: pointer;
    -webkit-transition: all .3s cubic-bezier(.645, .045, .355, 1);
    transition: all .3s cubic-bezier(.645, .045, .355, 1);
    padding: 2px 25px;
    font-size: 14px;
    font-weight:bold;
    font-family: 微软雅黑,宋体,Arial,Helvetica,Verdana,sans-serif;
    border-radius: 5px;
    color: #f2f2f2;
    background-color: #2f435e;
    border-color: #3f597c;
    text-shadow: 0 -1px 0 rgba(0,0,0,0.12);
    -webkit-box-shadow: 0 2px 0 rgba(0,0,0,0.045);
    box-shadow: 0 2px 0 rgba(0,0,0,0.045);
}
.btn:hover{
background:#4c6d99;
}
.btn1 {
    line-height: 1.499;
    position: relative;
    display: inline-block;
    white-space: nowrap;
    text-align: center;
    border: 1px solid transparent;
    cursor: pointer;
    -webkit-transition: all .3s cubic-bezier(.645, .045, .355, 1);
    transition: all .3s cubic-bezier(.645, .045, .355, 1);
    padding: 2px 25px;
    font-size: 14px;
    font-weight:bold;
    font-family: 微软雅黑,宋体,Arial,Helvetica,Verdana,sans-serif;
    border-radius: 5px;
    color: #f2f2f2;
    background-color: #a03c3c;
    border-color: #c24040;
    text-shadow: 0 -1px 0 rgba(0,0,0,0.12);
    -webkit-box-shadow: 0 2px 0 rgba(0,0,0,0.045);
    box-shadow: 0 2px 0 rgba(0,0,0,0.045);
}
.btn1:hover{
background:#de5454;
}
.btn2 {
    line-height: 1.499;
    position: relative;
    display: inline-block;
    white-space: nowrap;
    text-align: center;
    border: 1px solid transparent;
    cursor: pointer;
    -webkit-transition: all .3s cubic-bezier(.645, .045, .355, 1);
    transition: all .3s cubic-bezier(.645, .045, .355, 1);
    padding: 2px 25px;
    font-size: 14px;
    font-weight:bold;
    font-family: 微软雅黑,宋体,Arial,Helvetica,Verdana,sans-serif;
    border-radius: 5px;
    color: #f2f2f2;
    background-color: #ba670c;
    border-color: #ca7416;
    text-shadow: 0 -1px 0 rgba(0,0,0,0.12);
    -webkit-box-shadow: 0 2px 0 rgba(0,0,0,0.045);
    box-shadow: 0 2px 0 rgba(0,0,0,0.045);
}
.btn2:hover{
background:#dd892d;
}

.btn3 {
    line-height: 1.499;
    position: relative;
    display: inline-block;
    white-space: nowrap;
    text-align: center;
    border: 1px solid transparent;
    cursor: pointer;
    -webkit-transition: all .3s cubic-bezier(.645, .045, .355, 1);
    transition: all .3s cubic-bezier(.645, .045, .355, 1);
    padding: 2px 25px;
    font-size: 14px;
    font-weight:bold;
    font-family: 微软雅黑,宋体,Arial,Helvetica,Verdana,sans-serif;
    border-radius: 5px;
    color: #f2f2f2;
    background-color: #416e55;
    border-color: #4b8264;
    text-shadow: 0 -1px 0 rgba(0,0,0,0.12);
    -webkit-box-shadow: 0 2px 0 rgba(0,0,0,0.045);
    box-shadow: 0 2px 0 rgba(0,0,0,0.045);
}
.btn3:hover{
background:#55a078;
}






 </style>
 <script>
    // 这个方法用来储存每个圆圈对象
    function Circle(x, y, radius, color) {
      this.x = x;
      this.y = y;
      this.radius = radius;
      this.color = color;
      this.isSelected = false;
    }
    function BSTree(data,parent,x, y,l) {
    	this.data = data;
    	this.parent = parent;
    	this.leftchild = null;
    	this.rightchild = null;
    	this.sign = null;
        this.lx = x;
        this.ly = y;
        this.isSelect = false;
        this.level = l;
      }
 
    // 保存画布上所有的圆圈
    var circles = [];
    var canvas;
    var context;
    var bstree = [];
    var root ;
    var p;
    var xy;
    var i;
 
    window.onload = function() {
      canvas = document.getElementById("canvas");
      context = canvas.getContext("2d");
      canvas.onmousedown = canvasClick;
    };
    
    
    //插入节点
    function insertNode(){
    	var level=0;
    	var parent;
    	var data=document.getElementById("key").value;
    	if(root == null){
    		root=new BSTree(data,null,500,30,0);
    		p = root;
    		parent = p;
    		bstree.push(root);
    	}else{
    		p = root;
    		while(p!=null){
    			parent = p;
    			if(parseInt(p.data) > parseInt(data)){
    				level++;
    				p = p.leftchild;
    				if(p == null){
    					var v = new BSTree(data,parent,parent.lx-(250/level),parent.ly+70,-level);    					
    					p = v;
    					parent.leftchild = p;
    					bstree.push(v);
    					break;
    				}
    			}else{
    				level++;
    				p = p.rightchild;
    				if(p == null){
    					var y = new BSTree(data,parent,parent.lx+(250/level),parent.ly+70,level);    					
    					p = y;
    					parent.rightchild = p;
    					bstree.push(y);
    					break;
    				}
    			}
    		}
    	}
    	context.strokeStyle = 'rgb(47,67,94)';
    	if(root == p){
    		
    	}
    	else if(parent.rightchild == p){
    		drawRowLine(parent.lx,parent.ly+20,p.lx,p.ly-20);	
    	}
    	else{
    		drawRowLine(parent.lx,parent.ly+20,p.lx,p.ly-20);
    	}
    	context.beginPath();
    	context.arc(p.lx,p.ly,20,0,Math.PI*2,true);
    	context.stroke();
    	context.font="14px 微软雅黑" //设置字体样式
    	context.fillText(data,p.lx-10,p.ly+7);//绘制实心文字
    }
    
    
    //删除节点
    function deleteNode( ){
        var node = null;    
    	for(var i=0; i<bstree.length; i++) {
    		node = bstree[i];
    		if (node.isSelect) {
    			if(node!=null){
    				deleteN(node,node.parent);
    				//bstree.splice(i,1);
    				draw();
    			}  
    		}
    	}
    }
    function deleteN(n,parent){
    	if (n.leftchild == null) {
    		if(parent==null){
    			root = n.rightchild;
    			n.rightchild.parent = root;
    			for(var i=0; i<bstree.length; i++) {
         			if(bstree[i] == n) {
         		          this.splice(i, 1);
         		          break;
         		    }
         		}
    		}
    		else if(parent.leftchild == n){		
         		parent.leftchild = n.rightchild;
         		if(n.rightchild!=null)
         		n.rightchild.parent = parent;
         		for(var i=0; i<bstree.length; i++) {
         			if(bstree[i] == n) {
         		          this.splice(i, 1);
         		          break;
         		    }
         		}
         	}
         	else if(parent.rightchild == n){
         		parent.rightchild = n.rightchild; 
         		if(n.rightchild!=null)
         		n.rightchild.parent = parent;
         		for(var i=0; i<bstree.length; i++) {
         			if(bstree[i] == n) {
         		          this.splice(i, 1);
         		          break;
         		    }
         		}
         	}
         }
         else if (n.rightchild==null) {
        	 if(parent==null){
        		 root = n.leftchild;
        		 n.leftchild.parent = root;
        		 for(var i=0; i<bstree.length; i++) {
          			if(bstree[i] == n) {
          		          this.splice(i, 1);
          		          break;
          		    }
          		}
        	 }
        	 else if(parent.leftchild == n){
         		parent.leftchild = n.leftchild;
         		if(n.leftchild!=null)
         		n.leftchild.parent = parent;
         		for(var i=0; i<bstree.length; i++) {
         			if(bstree[i] == n) {
         		          this.splice(i, 1);
         		          break;
         		    }
         		}
         	}
         	else if(parent.rightchild==n){
         		parent.rightchild = n.leftchild; 
         		if(n.leftchild!=null)
         		n.leftchild.parent = parent;
         		for(var i=0; i<bstree.length; i++) {
         			if(bstree[i] == n) {
         		          this.splice(i, 1);
         		          break;
         		    }
         		}
         	}
         }
         else {
         	var parent1 = n;
         	var current = n.rightchild;
     		var minNode = current;
     		current = current.leftchild;
     	    while(current != null){
     	    	parent1 = minNode;
     	        minNode = current;
     	        current = current.leftchild;
     	    }
     	    n.data = minNode.data;
     	   deleteN(minNode,parent1);
         }
    }
    
    function searchNode() {
		var current = root;
		var data=document.getElementById("key").value;
		draw();
	    while(current != null){
	        if(parseInt(current.data) > parseInt(data)){//当前值比查找值大，搜索左子树
	            current = current.leftchild;
	        }else if(parseInt(current.data) < parseInt(data)){//当前值比查找值小，搜索右子树
	            current = current.rightchild;
	        }else{
	        	for(var i=0; i<bstree.length; i++) {
	        		if(current == bstree[i]){
	        			context.strokeStyle = 'rgb(47,67,94)';
	        			context.fillStyle = 'rgb(47,67,94)';
	        			context.beginPath();
	        	    	context.arc(current.lx,current.ly,20,0,Math.PI*2,true);
	        	    	context.fill();
	        	    	context.stroke();
	        	    	context.fillStyle = "white";
	        	    	context.font="14px 微软雅黑"; //设置字体样式
	        	    	context.fillText(current.data,current.lx-10,current.ly+7);//绘制实心文字
	        		}
	        	}
	        	break;
	        }
	    }
	    if(current == null)
	    alert("没有该结点");//遍历完整个树没找到，返回null
	}
    
    function addRandomCircle() {
      // 为圆圈计算一个随机大小和位置
      var radius = randomFromTo(10, 60);
      var x = randomFromTo(0, canvas.width);
      var y = randomFromTo(0, canvas.height);
 
      // 为圆圈计算一个随机颜色
      var colors = ["green", "blue", "red", "yellow", "magenta", "orange", "brown", "purple", "pink"];
      var color = colors[randomFromTo(0, 8)];
 
      // 创建一个新圆圈
      var circle = new Circle(x, y, radius, color);
 
      // 把它保存在数组中
      circles.push(circle);
 
      // 重新绘制画布
      drawCircles();
    }
 
    //清空画布
    function clearCanvas() {
      // 去除所有圆圈
      bstree = [];
      root = null;
 
      // 重新绘制画布.
      drawCircles();
    }
 
    //绘制
    function drawCircles() {
      // 清除画布，准备绘制
      context.clearRect(0, 0, canvas.width, canvas.height);   
      var tl=0;
      function Order(r,le){
			if(r!=null){
				if(r==root){
					root.lx=500;
					root.ly=30;
					root.level=0;
					root.parent=null;
					le++;
				}else{
					r.lx=r.parent.lx+250/le;
					r.ly=r.parent.ly+70;
					r.level=le;
					le=Math.abs(le)+1;
				}
				function rowpoint(r){
					if(r!=root){
						drawRowLine1(r.parent.lx,r.parent.ly+20,r.lx,r.ly-20);
					}
					context.strokeStyle = 'rgb(47,67,94)';
					context.fillStyle = "white";
					context.beginPath();
			    	context.arc(r.lx,r.ly,20,0,Math.PI*2,true);
			    	if (r.isSelect) {
			            context.lineWidth = 5;
			          }
			          else {
			            context.lineWidth = 1;
			          }
			    	context.fill();
			    	context.stroke();
			    	context.fillStyle =  "black";
			    	context.font="14px 微软雅黑" //设置字体样式
			    	context.fillText(r.data,r.lx-10,r.ly+7);//绘制实心文字
				}
				setTimeout(rowpoint(r),5);
			    Order(r.leftchild,-le);  //先根遍历左子树
			    Order(r.rightchild,le);  //先根遍历右子树
			}
		}
        Order(root,tl);
 
      // 遍历所有圆圈
    }
    
    function draw(){
        context.clearRect(0, 0, canvas.width, canvas.height);   
        var tl=0;
        function Order(r,le){
  			if(r!=null){
  				if(r==root){
  					root.lx=500;
  					root.ly=30;
  					root.level=0;
  					root.parent=null;
  					le++;
  				}else{
  					r.lx=r.parent.lx+250/le;
  					r.ly=r.parent.ly+70;
  					r.level=le;
  					le=Math.abs(le)+1;
  				}
  				function rowpoint(r){
  					if(r!=root){
  						drawRowLine1(r.parent.lx,r.parent.ly+20,r.lx,r.ly-20);
  					}
  					context.strokeStyle = 'rgb(47,67,94)';
  					context.fillStyle = "white";
  					context.beginPath();
  			    	context.arc(r.lx,r.ly,20,0,Math.PI*2,true);
  			    	context.lineWidth = 1;
  			    	context.fill();
  			    	context.stroke();
  			    	context.fillStyle =  "black";
  			    	context.font="14px 微软雅黑" //设置字体样式
  			    	context.fillText(r.data,r.lx-10,r.ly+7);//绘制实心文字
  				}
  				setTimeout(rowpoint(r),5);
  			    Order(r.leftchild,-le);  //先根遍历左子树
  			    Order(r.rightchild,le);  //先根遍历右子树
  			}
  		}
          Order(root,tl);
    }
 
    //获取被选结点
    var previousSelectedCircle;
 
    function canvasClick(e) {
      // 取得画布上被单击的点
      var clickX = e.pageX - canvas.offsetLeft;
      var clickY = e.pageY - canvas.offsetTop;
 
      // 查找被单击的圆圈
      for(var i=bstree.length-1; i>=0; i--) {
        var node = bstree[i];
        //使用勾股定理计算这个点与圆心之间的距离
        var distanceFromCenter = Math.sqrt(Math.pow(node.lx - clickX, 2) 
            + Math.pow(node.ly - clickY, 2));
        // 判断这个点是否在圆圈中
        if (distanceFromCenter <= 20) {
          // 清除之前选择的圆圈
          if (previousSelectedCircle != null) previousSelectedCircle.isSelect = false;
          previousSelectedCircle = node;
           
          //选择新圆圈
          node.isSelect = true;
 
          //更新显示
          drawCircles();
 
          //停止搜索
          return;
        }
      }
    }
 
    //在某个范围内生成随机数
    function randomFromTo(from, to) {
      return Math.floor(Math.random() * (to - from + 1) + from);
    }
    
    
    //画线
    function drawRowLine(startX,startY,endX,endY){	
    	var iLen = 0;
    	var flag = 0;
    	var length = endY-startY;
    	var k = (endX-startX)/(endY-startY);
    	function rowLine(){		
    		if(iLen<=length){		
    			context.lineWidth = 1;
    			context.moveTo(startX,startY);	
    			startX=startX+k;
    			startY=startY+1;
    			context.lineTo(startX,startY);	
    			iLen++;			
    			context.stroke();
    			}else{		
    				
    			}	
    		}
    	//while(iLen<=length) {iLen++;setTimeout(rowLine,5000);}
    	setInterval(rowLine,5);
    }
    
    function drawRowLine1(startX,startY,endX,endY){	  
    	context.lineWidth = 1;
    	context.moveTo(startX,startY);	    			
    	context.lineTo(endX,endY);		
    	context.stroke(); 
    }
    
    
    
  //先序遍历
    function PreO(){
    	var r = root;
		i=0;
		PreOrder(r);
		var node;
		for(var j=bstree.length-1; j>=0; j--){
			node = bstree[j];
			
		}
    }
	  function PreOrder(r){
			if(r!=null){
				r.sign=i;
				i++;
				function rowpoint(r){
					context.strokeStyle = 'rgb(47,67,94)';
					context.fillStyle = 'rgb(255,140,140)';
					context.beginPath();
			    	context.arc(r.lx,r.ly,20,0,Math.PI*2,true);
			    	context.fill();
			    	context.stroke();
			    	context.fillStyle = 'rgb(47,67,94)';
			    	context.font="14px 微软雅黑" //设置字体样式
			    	context.fillText('('+r.sign+')'+r.data,r.lx-20,r.ly+7);//绘制实心文字
				}
				setTimeout(function (){rowpoint(r);},i*800);
			    PreOrder(r.leftchild);  //先根遍历左子树
			    PreOrder(r.rightchild);  //先根遍历右子树
			}
 		}
	  
   
	
		     
	//中序遍历
	function InO(){
		var r = root;
		i=0;
		InOrder(r);
		var node;
		for(var j=bstree.length-1; j>=0; j--){
			node = bstree[j];
			
		}
	}
	function InOrder(r){
		if(r!=null){
			var l = r.leftchild;
			var t = r.rightchild;
			InOrder(r.leftchild);  //中根遍历左子树
			r.sign=i;
			i++;
			function rowpoint(r){
				context.strokeStyle = 'rgb(47,67,94)';
				context.fillStyle = 'rgb(255,200,140)';
				context.beginPath();
		    	context.arc(r.lx,r.ly,20,0,Math.PI*2,true);
		    	context.fill();
		    	context.stroke();
		    	context.fillStyle = 'rgb(47,67,94)';
		    	context.font="14px 微软雅黑" //设置字体样式
		    	context.fillText('('+r.sign+')'+r.data,r.lx-20,r.ly+7);//绘制实心文字
			}
			setTimeout(function (){rowpoint(r);},i*800);
		    InOrder(r.rightchild);  //中根遍历右子树
		}
	}
	
	
	
	//后序遍历
	function PostO(){
		var r = root;
		i=0;
		PostOrder(r);
		var node;
		for(var j=bstree.length-1; j>=0; j--){
			node = bstree[j];
			
		}
	}
	
	function PostOrder(r){
		if(r!=null){
			var l = r.leftchild;
			var t = r.rightchild;
			PostOrder(l);  //后根遍历左子树
			PostOrder(t);  //后根遍历右子树
			r.sign=i;
			i++;
			function rowpoint(r){
				context.strokeStyle = 'rgb(47,67,94)';
				context.fillStyle = 'rgb(130,240,185)';
				context.beginPath();
		    	context.arc(r.lx,r.ly,20,0,Math.PI*2,true);
		    	context.fill();
		    	context.stroke();
		    	context.fillStyle = 'rgb(47,67,94)';
		    	context.font="14px 微软雅黑" //设置字体样式
		    	context.fillText('('+r.sign+')'+r.data,r.lx-20,r.ly+7);//绘制实心文字
			}
			setTimeout(function (){rowpoint(r);},i*800);
		}
	}
	
 </script>
</head>   
 
<body>
 
  <canvas id="canvas" width="1000" height="500">
  </canvas>
 
  <div>
    <input type="text" name="key" id="key"  class="txt"  style="width:100px;"/>
    <button onclick="insertNode()" class="btn">插入节点</button>
    <button onclick="deleteNode()" class="btn">删除节点</button>
    <button onclick="searchNode()" class="btn">查找节点</button>
    <button onclick="PreO()" class="btn1">先序遍历</button>
    <button onclick="InO()" class="btn2">中序遍历</button>
    <button onclick="PostO()" class="btn3">后序遍历</button>
    <button onclick="clearCanvas()" class="btn">清空树</button>
  </div>
  
</body>
</html>