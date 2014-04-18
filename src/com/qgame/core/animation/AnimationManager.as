package com.qgame.core.animation
{
	import com.qgame.core.animation.data.ActionInfo;
	import com.qgame.core.animation.data.SpriteSheetFrameVO;
	import com.qgame.core.resource.ResManager;
	
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.text.engine.Kerning;
	import flash.ui.Keyboard;
	import flash.utils.Dictionary;

	public class AnimationManager
	{
		private static var _instance:AnimationManager;
		
		private var _actionDic:Dictionary;
		private var _spriteSheetData:Dictionary;
		public function AnimationManager()
		{
			this._actionDic = new Dictionary();
			this._spriteSheetData = new Dictionary();
		}
		
		public function addAction(style:String,actionInfo:ActionInfo):void
		{
			var tempDic:Dictionary = this._actionDic[style];
			if(tempDic == null)
			{
				tempDic = new Dictionary();
				this._actionDic[style] = tempDic;
			}
			var key:String = actionInfo.actionName + "_" + actionInfo.dir;
			tempDic[key] = actionInfo;
		}
		
		public function getAction(style:String,actionName:String,dir:int):ActionInfo
		{
			var key:String;
			if(dir == -1)
			{
				key = actionName;	
			}
			else
			{
				key = actionName + "_" + dir
			}
			var actionInfo:ActionInfo = this._actionDic[style][key] as ActionInfo;
			return actionInfo;
		}
		
		/**
		 * 获得SWF角色动作的bitmpdata 
		 * @param style 类别
		 * @param actionName 动作名称
		 * @param dir	动作方向
		 * @param frame	帧
		 * @return 
		 * 
		 */
		public function getSWFAnimationBD(style:String,actionName:String,dir:int,frame:int):BitmapData
		{
			var bd:BitmapData = ResManager.instance.getSWFAnimationBD(style,actionName,dir,frame);
			return bd;
		}
		
		public function addSpriteSheetData(style:String,data:String):void
		{
			var frame:Object = JSON.parse(data);
			for each (var item:* in frame.frames) 
			{
				var spSheet:SpriteSheetFrameVO = new SpriteSheetFrameVO();
				spSheet.actionName = item.filename;
				spSheet.x = item.frame.x;
				spSheet.y = item.frame.y;
				spSheet.width = item.frame.w;
				spSheet.height = item.frame.h;
				spSheet.offetX = item.spriteSourceSize.x;
				spSheet.offetY = item.spriteSourceSize.y;
				this._spriteSheetData[style + "_" + spSheet.actionName] = spSheet;
			}
		}
		
		public function getSpriteSheetBD(style:String,actionName:String,dir:int,frame:int):BitmapData
		{
			var bd:BitmapData;
			var source:BitmapData = ResManager.instance.getBD(style);
			var rect:Rectangle;
			var spFrame:SpriteSheetFrameVO = this._spriteSheetData[style + "_" + actionName + "_" + dir + "_000" + frame] as SpriteSheetFrameVO;
			rect = new Rectangle(spFrame.x,spFrame.y,spFrame.width,spFrame.height);
			
			bd = new BitmapData(rect.width,rect.height);
			bd.copyPixels(source,rect,new Point());
			return bd;
		}

		public static function get instance():AnimationManager
		{
			if(_instance == null)
			{
				_instance = new AnimationManager();
			}
			return _instance;
		}

	}
}