
package org.godfat.fgbg{
import org.godfat.Wrapper;
import flash.display.Sprite;

public class Fgbg{
  public function Fgbg(fg_uri: String, bg_uri: String, parent: Sprite,
    bg_width: Number, bg_height: Number)
  {
    parent_ = parent;
    body_ = Sprite(parent_.addChild(new Sprite()));

    bg_ = new Wrapper(bg_uri, body_, bg_width, bg_height);
    fg_ = new Wrapper(fg_uri, body_);
  }

  public function get fg(){ return fg_; }
  public function get bg(){ return bg_; }

  private var parent_: Sprite;
  private var body_: Sprite;
  private var fg_: Wrapper;
  private var bg_: Wrapper;
}
}
