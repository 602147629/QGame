package com.qgame.core.resource
{
	import com.qgame.core.resource.loader.QueueLoader;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.system.ApplicationDomain;
	import flash.utils.Dictionary;

	/**
	 * 资源管理器
	 * 负责资源的加载、缓存、清除等 
	 * @author wang
	 * 
	 */
	public class ResManager
	{
		private static var _instance:ResManager;
		
		private var _currentDomain:ApplicationDomain
		private var _swfExtraPicBDDic:Dictionary;
		private var _spriteSheetBDDic:Dictionary;
		private var _spriteSheetData:Dictionary;
		
		
		[Embed(source="../../../../assets/spriteSheet/jsonarrayformat.png")]
		private var PIC:Class;
		public function ResManager()
		{
			this._swfExtraPicBDDic = new Dictionary();
			this._spriteSheetBDDic = new Dictionary();
			this._spriteSheetData = new Dictionary();
			this._currentDomain = ApplicationDomain.currentDomain;
		}
		
		public function getBD(style:String):BitmapData
		{
			var bd:BitmapData = Bitmap(new PIC()).bitmapData;
			return bd;
		}
		
		public function getSWFAnimationBD(style:String,actionName:String,dir:int,frame:int):BitmapData
		{
			var key:String = _analysiClassNameFrom(style,actionName,dir,frame);
			var bd:BitmapData = this._swfExtraPicBDDic[key] as BitmapData;
			if(bd)
			{
				return bd;
			}
			else
			{
				var cls:Class = getClass(key);
				if(cls != null)
				{
					bd = new cls() as BitmapData;
					this._swfExtraPicBDDic[key] = bd;
					return bd;
				}
				else
				{
					loadRes("assets/"+ style + "_" + actionName + ".swf");
				}
				
			}
			return null;
		}
		
		private function _analysiClassNameFrom(style:String, actionName:String, dir:int,frame:int):String
		{
			return style + "_" + actionName + "_" + frame;
		}
		
		public function getClass(className:String):Class
		{
			var cls:Class;
			if(this._currentDomain.hasDefinition(className))
			{
				cls = this._currentDomain.getDefinition(className) as Class;
				return cls;
			}
			
			return null;
		}
		
		
		public function getSpriteSheetBD(style:String,actionName:String,dir:int,frame:int):BitmapData
		{
			var key:String = this._analysiClassNameFrom(style,actionName,dir,frame);
			var bd:BitmapData = this._spriteSheetBDDic[key];
			var spriteSheetBD:BitmapData;
			if(bd)
			{
				return bd;
			}
			else
			{
				spriteSheetBD = this._spriteSheetBDDic[style];
				if(spriteSheetBD)
				{
					bd.copyPixels(spriteSheetBD,null,new Point(0,0));
				}
				else
				{
					loadRes("assets/spriteSheet/" + style + ".png");
				}
			}
			return null;
		}
		
		public function addSpriteSheetData(style:String,data:String):void
		{
			this._spriteSheetData[style] = data;
		}
		
		public function loadRes(url:String):void
		{
			QueueLoader.instance.load(url);
		}

		public static function get instance():ResManager
		{
			if(_instance == null)
			{
				_instance = new ResManager();
			}
			return _instance;
		}

	}
}