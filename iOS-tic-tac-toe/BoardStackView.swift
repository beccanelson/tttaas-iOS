import UIKit
import Foundation
public class BoardStackView: UIStackView, BoardView {
    
    public func setSpotToMarker(button: UIButton, marker: String) {
        button.titleLabel?.font = UIFont(name: UIConfig.defaultfont, size: 50)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        if (marker == "X") {
            button.enabled = false
            button.setTitleColor(UIConfig.player1Color, forState: .Normal)
            button.setTitle(UIConfig.player1, forState: .Normal)
        } else if marker == "O"{
            button.enabled = false
            button.setTitleColor(UIConfig.player2Color, forState: .Normal)
            button.setTitle(UIConfig.player2, forState: .Normal)
        }
    }
    
    public func show(board board: [String]) {
        onEachButton({(btn: UIButton) -> () in
            self.setSpotToMarker(btn, marker: board[btn.tag])
        })
    }
    
    public func clearSpots() {
        onEachButton({(btn: UIButton) -> () in
            btn.setTitle("", forState: .Normal)
            btn.enabled = true
        })
    }
    
    public func disableSpots() {
        onEachButton({(btn: UIButton) -> () in
            btn.enabled = false
        })
    }
    
    public func enableSpots() {
        onEachButton({(btn: UIButton) -> () in
            if (btn.titleLabel?.text == nil || btn.titleLabel?.text == ""){
                btn.enabled = true
            }
        })
    }
    
    
    public func onEachButton(function: UIButton -> ()) {
        for view in self.subviews{
            for button in view.subviews {
                let btn = button as! UIButton
                function(btn);
            }
        }
    }
}