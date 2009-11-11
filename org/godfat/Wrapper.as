
// imported from:
// http://github.com/godfat/avatarblock/commit/ac29fd544bf545ccb0bd1316eb9052d25159637a

package org.godfat{
import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.display.Loader;
import flash.net.URLRequest;
import flash.events.Event;
import flash.events.IOErrorEvent;

public class Wrapper{
  static public var ie_hack: Boolean = false;
  public function Wrapper(uri: String, parent: Sprite,
    width: Number = 0, height: Number = 0,
    callback: Function = null)
  {
    parent_ = parent;
    body_ = new Loader();
    parent_.addChild(body_);
    if(width  != 0) width_  = width;
    if(height != 0) height_ = height;

    body_.contentLoaderInfo.addEventListener(Event.COMPLETE, function(){
      if(width  != 0) body_.width  = width;
      else  width_  = body_.width;
      if(height != 0) body_.height = height;
      else  height_ = body_.height;
      callback && callback();
    });
    body_.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, callback || function(){});

    if( Wrapper.ie_hack )
      body_.load(new URLRequest(uri+"?for_suck_ie="+Math.random().toString()));
    else
      body_.load(new URLRequest(uri));
  }
  public function set mask(m: DisplayObject){
    release_mask();
    body_.mask = m;
    m.width = width_;
    m.height = height_;
    parent_.addChild(m);
  }
  public function get mask(){ return body_.mask; }
  function release_mask(){
    if( this.mask == null ) return;
    parent_.removeChild( this.mask );
  }
  public function cleanup(){
    body_.unload();
    parent_.removeChild(body_);
    body_ = null;
    parent_ = null;
  }

  private var parent_: Sprite;
  private var body_: Loader;
  private var width_: Number;
  private var height_: Number;
}

}
