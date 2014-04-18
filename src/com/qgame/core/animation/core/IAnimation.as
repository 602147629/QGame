package com.qgame.core.animation.core
{
	public interface IAnimation
	{
		function set style(value:String):void;
		function get style():String;
		function play(action:String,dir:int = -1):void;
		function stop():void;
		function update():void;
		function dispose():void;
	}
}