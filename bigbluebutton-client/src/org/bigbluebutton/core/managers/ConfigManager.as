/**
* BigBlueButton open source conferencing system - http://www.bigbluebutton.org/
*
* Copyright (c) 2010 BigBlueButton Inc. and by respective authors (see below).
*
* This program is free software; you can redistribute it and/or modify it under the
* terms of the GNU Lesser General Public License as published by the Free Software
* Foundation; either version 2.1 of the License, or (at your option) any later
* version.
*
* BigBlueButton is distributed in the hope that it will be useful, but WITHOUT ANY
* WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
* PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
*
* You should have received a copy of the GNU Lesser General Public License along
* with BigBlueButton; if not, see <http://www.gnu.org/licenses/>.
* 
*/
package org.bigbluebutton.core.managers {
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import org.bigbluebutton.core.Config2;
	import org.bigbluebutton.core.vo.Config;
	
	public class ConfigManager {

		public var configs:Config;
		
		public function setConfig(conf:Config):void {
			this.configs = configs;
		}
		
		private var _config:Config2 = null;
		
		public function loadConfig():void {
			var urlLoader:URLLoader = new URLLoader();
			urlLoader.addEventListener(Event.COMPLETE, handleComplete);
			var date:Date = new Date();
			urlLoader.load(new URLRequest("conf/config.xml" + "?a=" + date.time));			
		}		
		
		private function handleComplete(e:Event):void{
			_config = new Config2(new XML(e.target.data));	
		}
		
		public function get config():Config2 {
			return _config;
		}
	}
}