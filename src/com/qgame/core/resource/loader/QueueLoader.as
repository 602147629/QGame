package com.qgame.core.resource.loader
{
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;

	/**
	 * 队列加载器 
	 * @author wang
	 * 
	 */
	public class QueueLoader
	{
		private static var _instance:QueueLoader;
		private var _isLoading:Dictionary;
		
		private var _urlLoader:URLLoader;
		private var _loader:Loader;
		private var _loadercontext:LoaderContext;
		public function QueueLoader()
		{
			initLoader();
		}
		
		private function initLoader():void
		{
			this._isLoading = new Dictionary();
			this._urlLoader = new URLLoader();
			this._urlLoader.dataFormat = URLLoaderDataFormat.BINARY;
			this._urlLoader.addEventListener(Event.COMPLETE,onUrlLoaded);
			this._urlLoader.addEventListener(IOErrorEvent.IO_ERROR,onIOError);
			
			this._loadercontext = new LoaderContext(false,ApplicationDomain.currentDomain);
			this._loader = new Loader();
			this._loader.contentLoaderInfo.addEventListener(Event.COMPLETE,onLoaded);
		}
		
		protected function onLoaded(event:Event):void
		{
			trace("loaded");
		}
		
		protected function onIOError(event:IOErrorEvent):void
		{
			trace("res load error:" + event.text);
		}
		
		protected function onUrlLoaded(event:Event):void
		{
			var byteArr:ByteArray = this._urlLoader.data as ByteArray;
			this._loader.loadBytes(byteArr,this._loadercontext);
		}
		
		public function load(url:String):void
		{
			if(_isLoading[url])
			{
				return;
			}
			this._isLoading[url] = url;
			this._urlLoader.load(new URLRequest(url));
			
		}

		public static function get instance():QueueLoader
		{
			if(_instance == null)
			{
				_instance = new QueueLoader();
			}
			return _instance;
		}

	}
}