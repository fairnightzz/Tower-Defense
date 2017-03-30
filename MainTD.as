package
{
	import flash.display.MovieClip;
	import flash.events.*;
	import flash.utils.Timer;
	public class MainTD extends MovieClip
	{
		
		var eArray:Array;
		var eTimer:Timer;
		var waypoint_x:Array;
		var waypoint_y:Array;
		var way:int=0;

		public function MainTD()//CONSTRUCTOR - runs when the program starts
		//it has the same name as the class name - runs ONLY ONCE
		{
			eTimer=new Timer(2000)
			eArray=new Array()
			waypoint_x=new Array(-100,130,130,225,225,360,360,135,135,435,435,515,515,435,435,135,135)
			waypoint_y=new Array(230,230,170,170,375,375,110,110,45,45,105,105,175,175,290,290,400)
			
	
			stage.addEventListener(Event.ENTER_FRAME,gameLoop);
			eTimer.addEventListener(TimerEvent.TIMER,enemyTimer);
			eTimer.start();
			
		}//end CONSTRUCTOR
		
		public function enemyTimer(t:TimerEvent)
		{
			var minion:enemy=new enemy();
			minion=new enemy()
			minion.x=-100;
			minion.y=230;
			stage.addChild(minion)
			eArray.push(minion)
			eTimer.start();
			trace(eArray)
		}
		
		public function gameLoop(e:Event)
		{
			for (var j:int=0;j<eArray.length;j++)
			{
				if (eArray[j].x<550)
				{
					if (waypoint_x[way+1]==eArray[j].x)
					{
						if (waypoint_y[way+1]<eArray[j].y)
						{
							eArray[j].y+=-5;
							
						}
						else if (waypoint_y[way+1]>eArray[j].y)
						{
							eArray[j].y+=5;
							
						}
						else
						{
							way++;//is there a way to ++ the number in array[] without using a variable because 
							//if i use a variable, it changes the things right after it.
						}
						
					}
					else if (waypoint_y[way+1]==eArray[j].y)
					{
						
						if (waypoint_x[way+1]<eArray[j].x)
						{
							eArray[j].x+=-5;
							
						}
						else if (waypoint_x[way+1]>eArray[j].x)
						{
							eArray[j].x+=5;
							
						}
						else
						{
							way++;
						}
					}
					
				}
				else
				{
					stage.removeChild(eArray[j]);
					eArray.splice(j,1);
				}
			}//end of for
			
		}
	}//end class
}//end package