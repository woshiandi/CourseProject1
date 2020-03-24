<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
    <title>循环队列</title>
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
 </style>
 <script>
 function CircularQueue(n) {
     this.front = 0;
     this.rear = 0;
     this.max = n;
     this.current = 0;
     this.data = new Array(n);
   }
 var circularQueue;
 var canvas;
 var context;
 var dangle = Math.PI*2;
 var dx = Math.PI/5;
 var timer;
 window.onload = function() {
     canvas = document.getElementById("canvas");
     context = canvas.getContext("2d");
   };
   
 function creatCQ(){
	 if(circularQueue!=null)
		 alert("已有队列!");
	 else{
		 var n = document.getElementById("key").value;
		 n = parseInt(n);
		 circularQueue = new CircularQueue(n);
		 drawCircular(n);
	 } 
 }
 function clearCQ(){
	 circularQueue = null;
	 context.clearRect(0, 0, canvas.width, canvas.height);
 }
 function insertCQ(){
	 if (circularQueue.current > 0 && circularQueue.front == circularQueue.rear) {
		 alert("队列已满!");         
    }else {
    	circularQueue.data[circularQueue.rear] = document.getElementById("key").value;
    	/* context.textAlign="center";
    	context.textBaseLine="middle";
    	var a = parseInt(circularQueue.rear);
    	var b = parseInt(circularQueue.max);
    	var aa = Math.PI*2*(a/b)+1;
    	var bb = Math.PI*2*((a+1)/b)-1;
     	drawCircularText(circularQueue.data[circularQueue.rear],aa,bb);  */
    	circularQueue.rear=(circularQueue.rear+1)%circularQueue.max;
    	circularQueue.current++;
    	var n = parseInt(circularQueue.max);
     	drawCircular(n);
        
    }
 }

 function drawCircular(n){
	 context.clearRect(0, 0, canvas.width, canvas.height);
	 context.strokeStyle = 'rgb(47,67,94)';
	 context.fillStyle = "white";
	 context.lineWidth = 1;
 	for(var i=0; i<n; i++){            
 		context.beginPath();            
 		context.moveTo(500,250);                       
 		//当前扇形起始绘制弧度            
 		var startAngle = Math.PI*2*(i/n);            
 		//当前扇形借结束绘制弧度            
 		var endAngle =  Math.PI*2*((i+1)/n);            
 		//绘制扇形            
 		context.arc(500,250,200,startAngle,endAngle);            
 		context.stroke();            //填充扇形       
 		context.closePath();
 		}
 	context.lineWidth = 2;
  	context.beginPath();
	context.arc(500,250,150,0,Math.PI*2,true);
	context.stroke();
	context.fill();
	context.closePath();
	
	var num = parseInt(circularQueue.current+circularQueue.front);
	var start = parseInt(circularQueue.front);
	var end = parseInt(circularQueue.rear);
	var b = parseInt(circularQueue.max);
	var fangle=Math.PI*2*(start+0.4)/b;
	var rangle=Math.PI*2*(end+0.6)/b;
	var fx = 500+225*Math.cos(fangle);
	var fy = 250-225*Math.sin(fangle);
	var rx = 500+225*Math.cos(rangle);
	var ry = 250-225*Math.sin(rangle);
	context.font="18px 微软雅黑";
	context.fillStyle = 'rgb(47,67,94)';
	context.fillText("队首",fx,fy);
	context.fillText("队尾",rx,ry);
	
	for(var j=start;j<num;j++){
		context.textAlign="center";
    	context.textBaseLine="middle";
    	
    	var aa = Math.PI*2*(j/b)+0.1;
    	var bb = Math.PI*2*((j+1)/b)-0.1;
    	var x = j%b;
    	//context.fillStyle='rgb(47,67,94)';
    	context.strokeStyle='rgb(47,67,94)';
    	context.font="18px 微软雅黑";
     	drawCircularText(circularQueue.data[x],bb,aa); 
	}
	drawCircle1();
 }
 
 function drawCircle1(){
	 clearInterval(timer);
	 context.clearRect(500, 250, 30, 30);
	 function rowCircle(){
		context.lineWidth = 15;
		context.beginPath();
		context.strokeStyle='rgb(47,67,94)';
		context.arc(500,250,30,0,Math.PI*2,false);
		context.stroke();
		context.closePath();
		context.strokeStyle="white";
		context.beginPath();
		context.arc(500,250,30,dangle-dx,dangle,false);
		dangle=(dangle-dx)%(Math.PI*2);
		context.stroke();
		context.closePath();
		console.log(dangle);

	 }
	 timer = setInterval(rowCircle,150);
	 
 }
 function drawRowLine(startX,startY,endX,endY){	  
 	context.lineWidth = 1;
 	context.moveTo(startX,startY);	    			
 	context.lineTo(endX,endY);		
 	context.stroke(); 
 }
 
 function drawCircularText(string,startAngle,endAngle){
   var radius = 175; //圆的半径
   var angleDecrement=(startAngle-endAngle)/(string.length-1);//每个字母占的弧度
   var angle=parseFloat(startAngle); //转一下数字
   var index=0;
   var character;

   context.save();
   

   while(index<string.length){
     character=string.charAt(index);
     context.save();
     context.beginPath();
     context.translate(500+Math.cos(angle)*radius,250-Math.sin(angle)*radius);
     context.rotate(Math.PI/2-angle);   
     context.fillText(character,0,0);
     context.strokeText(character,0,0);
     angle-=angleDecrement;
     index++;
     context.restore();

   }
   context.restore();
 }
 
 
 function deleteCQ(){
	 if(circularQueue.current==0)
	    {
		 alert("队列为空!");  
	    }else
	    {
	        var o = circularQueue.data[circularQueue.front];
	        circularQueue.front=(circularQueue.front+1)%circularQueue.max;
	        circularQueue.current--;
	        var info = "删除结点"+o+"!";
	        alert(info); 
	        var n = parseInt(circularQueue.max);
	        
	        drawCircular(n);
	    }
 }
 function searchCQ(){
	 var num = parseInt(circularQueue.current+circularQueue.front);
	 var start = parseInt(circularQueue.front);
	 var d = document.getElementById("key").value;
	 var j;
	 var sign = 0;
   	context.textAlign="center";
	context.textBaseLine="middle";	
	context.font="18px 微软雅黑";
	context.lineWidth = 1;
	 for(j=start;j<num;j++){
		 var b = parseInt(circularQueue.max);
		 var x = j%b;
		 var aa = Math.PI*2*(j/b)+0.1;
	 	 var bb = Math.PI*2*((j+1)/b)-0.1;
		 if(d == circularQueue.data[x]){
	    	//context.fillStyle='rgb(120,150,240)';
	    	context.strokeStyle='rgb(120,150,240)';
	     	drawCircularText(circularQueue.data[x],bb,aa); 
	     	sign = 1;
		 }
		 else{  
			//context.fillStyle='rgb(47,67,94)';
		    context.strokeStyle='rgb(47,67,94)';
		    drawCircularText(circularQueue.data[x],bb,aa); 
		 }
	}
	 if(sign==0) alert("没有该结点!"); 
 }

 </script>
</head>

<body>
 <canvas id="canvas" width="1000" height="500">
  </canvas>
 
  <div>
    <input type="text" name="key" id="key"  class="txt"  style="width:100px;"/>
    <button onclick="creatCQ()" class="btn" >创建队列</button>
    <button onclick="clearCQ()" class="btn">删除队列</button>
    <button onclick="insertCQ()" class="btn">插入节点</button>
    <button onclick="deleteCQ()" class="btn">删除节点</button>
    <button onclick="searchCQ()" class="btn">查找节点</button>
  </div>
</body>
</html>