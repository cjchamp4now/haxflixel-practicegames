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
		var mathstuffx = thelocation.x % 256;
		var mathstuffy = thelocation.y % 256;
		//replaceColor(FlxColor.RED,  , false);
		var mathstuffz:Float = 65535 * mathstuffx + 255 * mathstuffy + mathstuffy;
		var convertedmath:Int = Std.int(mathstuffz);
		this.color = convertedmath;
		//replaceColor(FlxColor.RED, convertedmath , false);
		movement();
		super.update(elapsed);
		//this.color = this.getScreenPosition
		
	}
	
	public function movement():Void
	{
		var rando = FlxG.random.int(0, 359);
		velocity.set(speed, 0);
		velocity.rotate(FlxPoint.weak(0, 0), rando);
		animation.play("move", false, false, 0);
	}
}