
package org.godfat.fgbg{
import org.godfat.Wrapper;
import flash.display.Sprite;

public class Composer{
  public function Composer(fg_uri: String, bg_uri: String, parent: Sprite,
    width: Number, height: Number)
  {
    parent_ = parent;
    body_ = Sprite(parent_.addChild(new Sprite()));

    bg_ = new Wrapper(bg_uri, body_, width, height);
    fg_ = new Wrapper(fg_uri, body_, width, height);
  }

  public function get fg(){ return fg_; }
  public function get bg(){ return bg_; }

  private var parent_: Sprite;
  private var body_: Sprite;
  private var fg_: Wrapper;
  private var bg_: Wrapper;
}
}
