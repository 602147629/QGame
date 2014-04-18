package testApp.mcConfig
{
	import com.qgame.core.animation.AnimationManager;
	import com.qgame.core.animation.data.ActionInfo;
	
	import flash.geom.Point;
	import flash.utils.Dictionary;

	public class ActionConfig
	{
		public static function initMCConfig():void
		{
			var configXML:XML = <walk framenum="8" isloop="1">
														  <f0 x="-53" y="-113" s="3"/>
														  <f1 x="-49" y="-117" s="3"/>
														  <f2 x="-45" y="-119" s="3"/>
														  <f3 x="-35" y="-116" s="3"/>
														  <f4 x="-30" y="-113" s="3"/>
														  <f5 x="-35" y="-116" s="3"/>
														  <f6 x="-40" y="-119" s="3"/>
														  <f7 x="-47" y="-117" s="3"/>
														  <f32 x="-31" y="-100" s="3"/>
														  <f33 x="-29" y="-104" s="3"/>
														  <f34 x="-32" y="-106" s="3"/>
														  <f35 x="-36" y="-104" s="3"/>
														  <f36 x="-43" y="-101" s="3"/>
														  <f37 x="-39" y="-103" s="3"/>
														  <f38 x="-29" y="-106" s="3"/>
														  <f39 x="-27" y="-104" s="3"/>
														  <f40 x="-44" y="-103" s="3"/>
														  <f41 x="-37" y="-106" s="3"/>
														  <f42 x="-36" y="-107" s="3"/>
														  <f43 x="-34" y="-105" s="3"/>
														  <f44 x="-35" y="-102" s="3"/>
														  <f45 x="-33" y="-105" s="3"/>
														  <f46 x="-34" y="-108" s="3"/>
														  <f47 x="-40" y="-106" s="3"/>
														  <f48 x="-44" y="-108" s="3"/>
														  <f49 x="-41" y="-111" s="3"/>
														  <f50 x="-41" y="-112" s="3"/>
														  <f51 x="-38" y="-109" s="3"/>
														  <f52 x="-45" y="-106" s="3"/>
														  <f53 x="-42" y="-110" s="3"/>
														  <f54 x="-40" y="-113" s="3"/>
														  <f55 x="-38" y="-111" s="3"/>
														  <f56 x="-33" y="-112" s="3"/>
														  <f57 x="-31" y="-115" s="3"/>
														  <f58 x="-34" y="-116" s="3"/>
														  <f59 x="-40" y="-114" s="3"/>
														  <f60 x="-45" y="-110" s="3"/>
														  <f61 x="-37" y="-114" s="3"/>
														  <f62 x="-33" y="-117" s="3"/>
														  <f63 x="-32" y="-115" s="3"/>
													</walk>;
			
			var action:String = "walk";
			var actionDic:Dictionary = new Dictionary();
			var actionInfo:ActionInfo;
			var frameNum:int = 8;
			for (var i:int = 0; i <= 7; i++) 
			{
				actionInfo = new ActionInfo();
				actionInfo.actionName = action;
				actionInfo.dir = i;
				actionInfo.delay = 2;
				if(i >=1 && i <= 3)
				{
					actionInfo.startFrame = (8 - i) * frameNum;
					actionInfo.isTurn = true;
				}
				else
				{
					actionInfo.startFrame = i * frameNum;
				}
				actionInfo.endFrame = actionInfo.startFrame + frameNum - 1;
				
				var offsetV:Vector.<Point> = new Vector.<Point>();;
				for (var j:int = actionInfo.startFrame; j <= actionInfo.endFrame; j++) 
				{
					offsetV.push(new Point(configXML["f"+j].@x,configXML["f"+j].@y));
				}
				actionInfo.offsetPoint = offsetV;
				
				AnimationManager.instance.addAction("boy_dw000",actionInfo);
			}
		}
		
		public function ActionConfig()
		{
			
		}
	}
}