package  
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Johanna Rasmussen
	 * 2013-12-13, HT
	 */
	public class MyRect extends Sprite
	{
		public const BOX_SIDE:int = 30;
		public var isShip:Boolean = false;
		private var isClicked:Boolean = false;
		
		public function MyRect() 
		{
			reset();
		}
		
		public function drawHit():void 				//Ritar upp gröna fyrkanter när man rycker på tilen där det finns ett skrepp.
		{
			this.graphics.beginFill(0x00FF00);
			this.graphics.drawRect(0, 0, BOX_SIDE, BOX_SIDE);
			this.graphics.endFill();
		}
		
		public function reset():void 			//Ritar upp blått vatten.
		{
			this.graphics.clear();
			this.graphics.beginFill(0x1515FF);
			this.graphics.drawRect(0, 0, BOX_SIDE, BOX_SIDE); 
			this.graphics.endFill();
			isClicked = false;
		}
		
		public function drawMiss():void 					//Ritar upp svarta fyrkanter när man trycker på tilen då det inte finns något skepp. 
		{
			this.graphics.clear();
			this.graphics.beginFill(0x000000);
			this.graphics.drawRect(0, 0, BOX_SIDE, BOX_SIDE);
			this.graphics.endFill();
		}
		
		public function clicked():String					//Den kollar om när man klickar på "isShip" om den är en träff så returnerar den "hit" som då ritar upp en grön ruta. Men om "isShip" är en miss så returnerar den "missed" och ritar upp en svart ruta. 
		{
			if (isClicked == false)
			{
				isClicked = true;
				if (isShip == true)
				{
					this.drawHit();
					return "hit";
				}
				else
				{
					this.drawMiss();
					return "missed";
				}
				return "";
			}
			return "";
		}
	}
}