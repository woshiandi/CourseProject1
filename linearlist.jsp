<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>链表</title>
<style>
     div{
    color:#333;
    font-family:"Microsoft YaHei",Tahoma,Verdana,SimSun;
    font-style:normal;
    font-variant:normal;
    font-size:14px;
    font-weight:bold;
     }
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
    font-size:14px;
    font-size-adjust:none;
    font-stretch:normal;
    font-weight:normal;
    margin-top:0px;
    margin-bottom:0px;
    margin-left:0px;
    padding:4px 4px;
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
    color: #f2f2f2;
    background-color: #2f435e;   
    line-height: 1.499;
    position: relative;
    padding: 2px 25px;
    display: inline-block;
    white-space: nowrap;
    border: 1px solid transparent;
    border-radius: 5px;
    border-color: #3f597c;
    box-shadow: 0 2px 0 rgba(0,0,0,0.045);
    cursor: pointer; 
    font-size: 14px;
    font-weight:bold;
    font-family: 微软雅黑,宋体,Arial,Helvetica,Verdana,sans-serif;
    text-align: center;
    text-shadow: 0 -1px 0 rgba(0,0,0,0.12);
    -webkit-box-shadow: 0 2px 0 rgba(0,0,0,0.045);
    -webkit-transition: all .3s cubic-bezier(.645, .045, .355, 1);
    transition: all .3s cubic-bezier(.645, .045, .355, 1);
    
}
.btn:hover{
    background:#4c6d99;
}
.slt{
    color: #f2f2f2;
    background-color: #2f435e;  
    line-height: 1.499;
    font-family:"Microsoft YaHei",Tahoma,Verdana,SimSun;
    position: relative;
    padding:4px 25px;
    cursor: pointer; 
    font-size:14px;
    font-weight:bold;
    font-family: 微软雅黑,宋体,Arial,Helvetica,Verdana,sans-serif;
    outline-width:medium;
    outline-style:none;
    outline-color:invert;
    border: 1px solid transparent;
    border-radius: 5px;
    border-color: #3f597c;    
    margin-right:8px;
}
.slt::-ms-expand { display: none; }
 </style>
<script src="js/jquery.min.js"></script> 
<script >
function Node(n){
	this.element = n;
	this.next = null;
	this.selected = false;
	this.nx;
	this.ny;
}

var head = new Node('head');
var current;
var canvas;
var context;
var length = 0;

window.onload = function() {
    canvas = document.getElementById("canvas");
    context = canvas.getContext("2d");
    canvas.onmousedown = canvasClick;

  };

function drawLink(){
	context.clearRect(0, 0, canvas.width, canvas.height);  
	context.strokeStyle='rgb(47,67,94)';
	context.fillStyle = 'rgb(47,67,94)';
	context.font="18px 微软雅黑";
	current = head.next;
	context.strokeRect(50,20,130,30);
	drawRowLine(130,20,130,50);
	context.fillText(head.element,65,40);
	context.fillText("next",135,40);
	drawArrow(context, 115, 50, 115, 80,30,10,3,'rgb(47,67,94)');
	
	
	for(var i=0;i<length;i++){
		if(current.selected){
			context.lineWidth = 5;
		}
		else{
			context.lineWidth = 1;
		}
		var a = parseInt(i/5);
		var x = 50+180*(i%5);
		var x1 = 50+180*(i%5+1);
		var y = 80+80*(a);
		var y1 = 80+80*(a+1);
		current.nx = x;
		current.ny = y;
		context.strokeRect(x,y,130,30);
		drawRowLine(80+x,y,80+x,30+y);
		context.fillText(current.element,15+x,20+y);
		context.fillText("next",85+x,20+y);
		
        if(i==length-1){
			
		}
		else if(i%5 == 4){
			drawArrow(context, 65+x, 30+y, 115, y1,30,10,3,'rgb(47,67,94)');
		} 
		else
			drawArrow(context, 130+x, 15+y, x1, 15+y,30,10,3,'rgb(47,67,94)');
        current = current.next;
	}	
}

function drawRowLine(startX,startY,endX,endY){	  
 	context.lineWidth = 1;
 	context.moveTo(startX,startY);	    			
 	context.lineTo(endX,endY);		
 	context.stroke(); 
 }

function drawArrow(ctx, fromX, fromY, toX, toY,theta,headlen,width,color) {
    theta = typeof(theta) != 'undefined' ? theta : 30;
    headlen = typeof(theta) != 'undefined' ? headlen : 10;
    width = typeof(width) != 'undefined' ? width : 1;
    color = typeof(color) != 'color' ? color : '#000';
    // 计算各角度和对应的P2,P3坐标

    var angle = Math.atan2(fromY - toY, fromX - toX) * 180 / Math.PI,
        angle1 = (angle + theta) * Math.PI / 180,
        angle2 = (angle - theta) * Math.PI / 180,
        topX = headlen * Math.cos(angle1),
        topY = headlen * Math.sin(angle1),
        botX = headlen * Math.cos(angle2),
        botY = headlen * Math.sin(angle2);
    ctx.save();
    ctx.beginPath();
    var arrowX = fromX - topX,
        arrowY = fromY - topY;
    ctx.moveTo(arrowX, arrowY);
    ctx.moveTo(fromX, fromY);
    ctx.lineTo(toX, toY);
    arrowX = toX + topX;
    arrowY = toY + topY;
    ctx.moveTo(arrowX, arrowY);
    ctx.lineTo(toX, toY);
    arrowX = toX + botX;
    arrowY = toY + botY;
    ctx.lineTo(arrowX, arrowY);
    ctx.strokeStyle = color;
    ctx.lineWidth = width;
    ctx.stroke();
    ctx.restore();
}

//获取被选结点
var previousSelectedCircle;

function canvasClick(e) {
  // 取得画布上被单击的点
  var clickX = e.pageX - canvas.offsetLeft;
  var clickY = e.pageY - canvas.offsetTop;

  // 查找被单击的圆圈
  var c = head;
  for(var i=0; i<length; i++) {
	  c = c.next;
    // 判断这个点是否在圆圈中
    if ((clickX-c.nx)<130 & (clickY-c.ny)<30) {
      // 清除之前选择的圆圈
      if (previousSelectedCircle != null) previousSelectedCircle.selected = false;
      previousSelectedCircle = c;
       
      //选择新圆圈
      c.selected = true;

      //更新显示
      drawLink();

      //停止搜索
      return;
    }
  }
}

function clearCQ(){
	head.next = null;
	length = 0;
	context.clearRect(0, 0, canvas.width, canvas.height);  
}

function insertCQ(){
	if(length>19){
    	alert("最多插入20个结点");
    }
    else{
	var n = document.getElementById("key").value;
	var p = document.getElementById("position").value;
	p = parseInt(p);
	if(n){
		if(p>0)
			insert(n,p);
		else
			append(n);
	}
	else{
		alert("请输入结点!");
	}
    }
}

function append(n){	
	if(length>19){
    	alert("最多插入20个结点");
    }
    else{
	    current = head;
	    while(current.next){
		    current = current.next;
	    }
	    var node = new Node(n);
	    current.next = node;
	    length++;
	    drawLink();
	}
}
function insert(n,p){
	
	
	current = head;
	if(p>length)
		alert("超出链表长度!");
	else{
		for(var i=1;i<p;i++){
			current = current.next;
		}
		var node = new Node(n);
		node.next = current.next;
		current.next = node;
		length++;
		drawLink();
	}
}

function searchCQ(){
	var n = document.getElementById("key").value;
	current = head.next;
	while(current){
		if(n == current.element){
			var x = current.nx;
			var y = current.ny;
			context.fillStyle = 'rgb(47,67,94)';
			context.fillRect(x,y,130,30);
			context.fillStyle = "white";
			context.strokeStyle = "white";
			drawRowLine(80+x,y,80+x,30+y);
			
			context.fillText(current.element,15+x,20+y);
			context.fillText("next",85+x,20+y);
			break;
		}
		current = current.next;
	}
	if(current==null)
		alert("没有该结点");
}

function deleteCQ(){
	current = head;
	if(length>0){
	while(current.next){
		if(current.next.selected){
			current.next = current.next.next;
			length--;
			alert("已删除结点");
			
			break;
		}
		current = current.next;
	 }
	drawLink();
   }
	else
		alert("无结点");
}

</script>
</head>
<body>
<canvas id="canvas" width="1000" height="500">
  </canvas>

<div>
链表类型：
<%-- 
<select name="slt" id="slt" class="slt">
        <option value="singly">单向链表</option>
        <option value="doubly">双向链表</option>
</select>
--%>
    值：<input type="text" name="key" id="key"  class="txt"  style="width:100px;"/>
    位置：<input type="text" name="position" id="position" class="txt" style="width:100px;"/>
    <button onclick="insertCQ()" class="btn">插入结点</button>
    <button onclick="deleteCQ()" class="btn">删除结点</button>
    <button onclick="searchCQ()" class="btn">查找结点</button>
    <button onclick="clearCQ()" class="btn">清空结点</button>
</div>
</body>
</html>