package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author Cory Jackson
 */
class Hero extends FlxSprite 
{
	public var speed = 150;
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		this.makeGraphic(16, 30);
	}
	
	override public function update(elapsed:Float):Void
	{
		var thelocation = new FlxPoint();
		thelocation = this.getScreenPosition();
		var px = thelocation.x;
		var py = thelocation.y;
		var fx = (Std.int(px) % 255);
		var fy = (Std.int(py) % 255);
		var fz = ((Std.int(px) + Std.int(py)) % 255);
		
		this.color = 0xffffff & ((fx << 16) + (fy << 8) + (fz));
		movement();
		super.update(elapsed);
	}
	
	public function movement():Void
	{
		var rando = FlxG.random.int(0, 359);
		velocity.set(speed, 0);
		velocity.rotate(FlxPoint.weak(0, 0), rando);
		animation.play("move", false, false, 0);
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