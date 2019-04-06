package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.group.FlxGroup;
//import flixel.text.FlxText;
//import flixel.util.FlxColor;

class PlayState extends FlxState
{
	public var ground:FlxGroup;
	public var moveHero:TopDownHero;
	public var walltime:PlatformerHero;
	
	override public function create():Void
	{
		super.create();
		//var text = new FlxText(0, 0, 0, "hello world", 64);
		//text.screenCenter();	
		//text.setFormat(null , 32, FlxColor.RED, CENTER, SHADOW, FlxColor.PINK);
		//text.bold = true;
		//text.borderSize = 5;
		//text.moves = true;
		//text.velocity.set(50, 25);

		ground = new FlxGroup();
		for (i in 0...10) {
			ground.add(new Ground((100 + 32 * i), 300));
		}
		add(ground);
		
		moveHero = new TopDownHero(0, 0);
		moveHero.screenCenter();
		add(moveHero);
		
		walltime = new PlatformerHero(100, 100);
		add(walltime);
		
		//add(text);
		
/*		for (i in 0...16)
		{
			var spr = new Hero(0, 0);
			spr.screenCenter();
			add(spr);
		}*/
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		FlxG.collide(walltime, ground);
		//FlxG.overlap(moveHero, walltime, collideHeroAndWall);
		
	}
	
}