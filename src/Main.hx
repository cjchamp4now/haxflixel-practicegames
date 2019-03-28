package ;

import flixel.FlxGame;
import openfl.display.Sprite;


class Main extends FlxSprite
{
	public function new()
	{
		super();
		addChild(new FlxGame(0, 0, PlayState));
	}
}