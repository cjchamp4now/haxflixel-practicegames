package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;

/**
 * ...
 * @author Cory Jackson
 */
class Hero extends FlxSprite 
{
	public var speed = 100;
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		this.makeGraphic(16, 30, FlxColor.RED, false);
	}
	
	override public function update(elapsed:Float):Void
	{
		
		var thelocation = new FlxPoint();
		thelocation = this.getScreenPosition();
		var x = thelocation.x;
		var y = thelocation.y;
		//replaceColor(FlxColor.RED,  , false);
		//var mathstuffz:Float = 65535 * mathstuffx + 255 * mathstuffy + mathstuffy;
		//var convertedmath:Int = Std.int(mathstuffz);
		this.color = 0xffffff & (((Std.int(y) % 255) << 16) + ((Std.int(x) % 255) << 8) + ((Std.int(x) + Std.int(y))));
		//this.color = convertedmath;
		movement();
		super.update(elapsed);
	}
	
	public function movement():Void
	{
		var rando = FlxG.random.int(0, 359);
		velocity.set(speed, 0);
		velocity.rotate(FlxPoint.weak(0, 0), rando);
		animation.play("move", false, false, 0);
	}
}