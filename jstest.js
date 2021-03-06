    let inp = prompt("Enter number of sides of Polygon");

	let canvas = document.getElementById('canvas_1');
	let cx = canvas.getContext("2d");
    
    let n = inp , arm = 50;
    let ang = Math.PI * (n - 2) / n; 
 
    
    class pt {
         constructor(x , y){
         	this.x = x;
         	this.y = y;
         }
    }
    
    let rot = (p , a) => {
        let ret = new pt(p.x * Math.cos(a) - p.y * Math.sin(a) , p.x * Math.sin(a) + p.y * Math.cos(a));
        return ret;
    };
    
    let op = (p , a , b) => {
        let ret = new pt((p.x - a) , (p.y - b));
        return ret;
    };



    let suru = new pt(0 , 0) , ses = new pt(arm , 0);
    cx.beginPath();
    cx.strokeStyle = "red";
    cx.lineWidth = "4";

    cx.moveTo(300 , 300);
    cx.lineTo(Math.abs(op(ses , -300 , 300).x) , Math.abs(op(ses , -300 , 300).y));
    cx.moveTo(300 , 300); 
    // //cx.stroke();

    for(let i = 2; i <= n;i++) {

        let prev_line = new pt( op(ses, suru.x , suru.y).x , op(ses , suru.x , suru.y).y );
     //   console.log(prev_line.x + " " + prev_line.y);
        let cur_line_suru = rot(prev_line , ang);
       // console.log(cur_line_suru.x + " " + cur_line_suru.y);
        cur_line_suru.x += suru.x;
        cur_line_suru.y += suru.y;
           
        cx.lineTo(Math.abs(op(cur_line_suru , -300 , 300).x) , Math.abs(op(cur_line_suru , -300 , 300).y));
        
        ses = suru;
        suru = cur_line_suru;

    }

    cx.stroke();

