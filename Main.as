package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author Johanna Rasmussen
	 * 2013-12-13, HT
	 */
	public class Main extends Sprite 
	{
		private var t:TextField = new TextField();
		private var bigMap:Vector.<Vector.<Sprite>> = new Vector.<Vector.<Sprite>>();
		private var score:int = 0;
		private var missedScore:int = 0;		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
				t.text = "\nScore\nHits:0\nMissed:0";			//Lägger till ett textfällt som visar "Score", "Hits" och "Missed". Den gör detta eftersom utan ett text fält så kan spelet inte visa vilka vilka score man får om man träffar och missar. 
				addChild(t);
				
				t.background = true;							//Lägger till en border, bakrundsfärg, höjd, bredd, boxens y och x kordinater.
				t.backgroundColor = 0xB9B9B9;
				t.x = 470;
				t.y = 100;
				t.width = 300;
				t.height = 200;
				t.border = true;
				t.borderColor = 0x000000;
				t.textColor = 0x400040;
				
			
			for (var i:int = 0; i < 10; i++) 
			{
				var oneLine:Vector.<Sprite> = new Vector.<Sprite>();		//Lägger till 10*10 rutor, både vertikalt och horisontellt, från 0 - 9. Eftersom om man lägger ut en vektor så blir det 10 tiles i en rak linje, men om man lägger ut en vektor i en verktor så lägger den ut 10 tiles i en rak linje efter varje tile. Alltså 10 st tiles på 0 och 10 st tiles på 1 och 10 st tiles på 2, osv ända upp till 9. 
				for (var h:int = 0; h < 10; h++) 
				{
					var column:MyRect = new MyRect();
					column.x = 100 + h * (column.width + 2);
					column.y = 100 + i * (column.height + 2);
					addChild(column);
					oneLine.push(column);
					column.addEventListener (MouseEvent.CLICK, clickTile);
				}
				
				bigMap.push(oneLine);
				stage.addEventListener(KeyboardEvent.KEY_DOWN, space);
			}
			randomPlace();
		}
		
		
		private function randomPlace():void 								
		{
			var y:int = Math.random() * 7;									//Definerar x och y (ger dem värden).
			var x:int = Math.random() * 7;
			var position:int = Math.round(Math.random());					//Visar på Output Panelen vilket y och x värde den första tilen ligger på och 0 om den är horisontell och 1 om den är vertikal.
			trace(y + "," +x);
			trace (position);
			
				for (var i:int = 0; i < 3; i++) 							//Lägger tre skepp på en rad. 
				{
					
					if (position == 0) 
					{
						MyRect(bigMap[y][x + i]).isShip = true;				//Lägger dem tre tiles horisontellt på x-axeln om position = 0.
					}
					
					else 
					{
						MyRect(bigMap[y + i][x]).isShip = true;				//Lägger dem tre tiles vertikalt på y-axeln om position = 1.
					}
				}
		}
			
		private function clickTile(e:MouseEvent):void 
		{
			var test:String = MyRect(e.target).clicked();					//Gör så att man kan klicka på fyrkanterna.
																			// Få tillbaks ett värde ifråm clicked.
			if (test == "hit") 												//Lägger till ett poäng för vaje fyrkant man trycker på när det är en träff.
			{
				score += 1;
			}
			
			if (test == "missed") 											//Lägger till ett poäng för vaje fyrkant man trycker på när det är en miss.
			{
				missedScore += 1;
			}
			
			t.text = "\nScore\nHits:" + score + "\nMissed:" + missedScore;	   		//Uppdaterar poängen i textäflet när man trycker på space.
		}
		
		private function space(e:KeyboardEvent):void 
		{
			if (e.keyCode == 32) 
			{
				for (var i:int = 0; i < 10; i++) 									//Ritar upp 10*10 st nya fyrkanter.
				{ 
					for (var j:int = 0; j < 10; j++) 						
							
						MyRect(bigMap[i][j]).reset(); 			   
				}
			}
			
			randomPlace();															//Anropar funktionen "randomPlace".
			score = 0;																//Tilldelar klassen "score 0".
			missedScore = 0;														//Tilldelar klassen "missedScore 0", nollställer då poängen för "missedScore".
			t.text = "\nScore\nHits:" + score + "\nMissed:" + missedScore;			//Nollställer nollställer poängen för "score" och "missedScore".
			
			
		}
	}
}