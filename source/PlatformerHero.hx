package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;

/**
 * ...
 * @author Cory Jackson
 */
class PlatformerHero extends FlxSprite 
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		this.makeGraphic(25, 150, FlxColor.YELLOW);
		this.acceleration.y = 60;
		this.maxVelocity.y = 150;
	}
	
	override public function update(elapsed:Float):Void
	{
		//movement();
		var leftPressed:Bool = FlxG.keys.pressed.LEFT;
		var rightPressed:Bool = FlxG.keys.pressed.RIGHT;
		var upPressed:Bool = FlxG.keys.pressed.Z;

		if (leftPressed) { //left
			if (leftPressed && rightPressed){
					leftPressed = rightPressed = false;
			}
			else {
			this.acceleration.x = -50;
			}
		} 
		else if (rightPressed) { //right
			this.acceleration.x = 50;
		}
		else if (upPressed){ //up
			this.velocity.y = -200;
		}
		else { //stop
			this.acceleration.x = 0;
			this.acceleration.y = 60;
			this.velocity.x = 0;
			//this.velocity.y = 0;
		}
		super.update(elapsed);
	}
	
}