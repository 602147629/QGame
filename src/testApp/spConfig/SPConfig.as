package testApp.spConfig
{
	import com.qgame.core.animation.AnimationManager;
	import com.qgame.core.animation.data.ActionInfo;
	
	import flash.geom.Point;
	import flash.utils.Dictionary;

	public class SPConfig
	{
		public function SPConfig()
		{
		}
		
		public static function initConfig():void
		{
			var action:String = "呼吸";
			var actionDic:Dictionary = new Dictionary();
			var actionInfo:ActionInfo = new ActionInfo();
			actionInfo.actionName = action;
			actionInfo.dir = 1;
			actionInfo.startFrame = 0;
			actionInfo.endFrame = 9;
			var offsetV:Vector.<Point> = new Vector.<Point>();;
			for (var j:int = actionInfo.startFrame; j <= actionInfo.endFrame; j++) 
			{
				//offsetV.push(new Point(configXML["f"+j].@x,configXML["f"+j].@y));
			}
			actionInfo.offsetPoint = offsetV;
			AnimationManager.instance.addAction("jsonarrayformat",actionInfo);
		}
	}
}