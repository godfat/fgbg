
package{
import org.godfat.fgbg.Composer;
import flash.display.Sprite;

public class Main(){
  public function Main(parent: Sprite){
    const fg_uri: String = parent.loaderInfo.parameters['fg'];
    const bg_uri: String = parent.loaderInfo.parameters['bg'];
    new Composer(fg_uri, bg_uri, parent,
      parent.stage.stageWidth, parent.stage.stageHeight);
  }
}
}
