package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;

/**
 * ...
 * @author Cory Jackson
 */
class TopDownHero extends FlxSprite 
{
	public var speed = 150;
	public var colors = [FlxColor.RED, FlxColor.GREEN, FlxColor.WHITE];
	public var counter = 0;
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		this.makeGraphic(25, 25);
		this.acceleration.y = 0;
		this.maxVelocity.y = speed;
		this.maxVelocity.x = speed;
	}
	
	override public function update(elapsed:Float):Void
	{
		var leftPressed:Bool = FlxG.keys.pressed.A;
		var rightPressed:Bool = FlxG.keys.pressed.D;
		var upPressed:Bool = FlxG.keys.pressed.W;
		var downPressed:Bool = FlxG.keys.pressed.S;
		var spaceJustPressed:Bool = FlxG.keys.justPressed.SPACE;

		if (leftPressed) { //left
			this.acceleration.x = -50;
		} 
		else if (rightPressed) { //right
			this.acceleration.x = 50;
		}
		else if (upPressed){ //up
			this.acceleration.y = -50;
		}
		else if (downPressed){ //down
			this.acceleration.y = 50;
		}
		else { //stop
			this.acceleration.x = 0;
			this.acceleration.y = 0;
			this.velocity.x = 0;
			this.velocity.y = 0;
		}
		
		if (spaceJustPressed) {
			this.color = colors[counter];
			counter++;
			if (counter > colors.length -1){
				counter = 0;
			}
		}
		//var thelocation = new FlxPoint();
		//thelocation = this.getScreenPosition();
		//var px = thelocation.x;
		//var py = thelocation.y;
		//var fx = (Std.int(px) % 255);
		//var fy = (Std.int(py) % 255);
		//var fz = ((Std.int(px) + Std.int(py)) % 255);
		
		//this.color = 0xffffff & ((fx << 16) + (fy << 8) + (fz));
		movement();
		super.update(elapsed);
	}
	
	public function movement():Void
	{
		
		
		
		
		
		
		
		//var rando = FlxG.random.int(0, 359);
		//velocity.set(speed, 0);
		//velocity.rotate(FlxPoint.weak(0, 0), rando);
		//animation.play("move", false, false, 0);
		
		
		
		thescreenwrap(this);
	}
	
	public function thescreenwrap(sprite:FlxSprite):Void
	{
		if (((sprite.x + sprite.frameWidth / 2) <= 0)) 
		{
			sprite.x = FlxG.width;
		}
		else if ((sprite.x >= FlxG.width)) 
		{
			sprite.x = 0;
		}
		
		if (((sprite.y + sprite.frameHeight / 2) <= 0)) 
		{
			sprite.y = FlxG.height;
		}
		else if ((sprite.y >= FlxG.height)) 
		{
			sprite.y = 0;
		}
	}
}