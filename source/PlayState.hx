package;

import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	override public function create():Void
	{
		super.create();
		var text = new FlxText(0, 0, 0, "hello world", 64);
		text.screenCenter();	
		text.setFormat(null , 32, FlxColor.RED, CENTER, SHADOW, FlxColor.PINK);
		text.bold = true;
		text.borderSize = 5;
		text.moves = true;
		text.velocity.set(50, 25);

		add(text);
		
		for (i in 0...16)
		{
			var spr = new Hero(0, 0);
			spr.screenCenter();
			add(spr);
		}
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
	
}