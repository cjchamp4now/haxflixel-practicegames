package;

import flixel.FlxState;
import flixel.text.FlxText;


class PlayState extends FlxState
{
	override public function create():Void
	{
		super.create();
		super.create();
		var text = new FlxText(0, 0, 0, "hello world", 64);
		text.screenCenter();	
		add(text);
		
		var hero1 = new Hero(5, 5);
		var hero2 = new Hero(100, 100);
		var hero3 = new Hero(0, 0);
		hero3.screenCenter();
		hero1.screenCenter();
		add(hero1);
		add(hero2);
		add(hero3);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}