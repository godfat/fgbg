
package org.godfat.fgbg{
import org.godfat.Wrapper;
import flash.display.Sprite;

public class Fgbg{
  public function Fgbg(uri_fg: String, uri_bg: String, parent: Sprite){
    parent_ = parent;
    body_ = Sprite(parent_.addChild(new Sprite()));

    fg_ = new Wrapper(uri_fg, body_);
    bg_ = new Wrapper(uri_bg, body_);
  }

  public function get fg(){ return fg_; }
  public function get bg(){ return bg_; }

  private parent_: Sprite;
  private body_: Sprite;
  private fg_: Wrapper;
  private bg_: Wrapper;
}
}
