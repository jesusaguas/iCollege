import Foundation

import UIKit

func MoveAnimationNext(Label: UILabel){
    let PositionAnimation = CABasicAnimation(keyPath: "position")
    PositionAnimation.fromValue = NSValue(cgPoint)
    PositionAnimation.fromValue = NSValue(cgPoint: <#T##CGPoint#>(x: Label.center.x + 70, y:Label.center.y))
    
    let fadeAnimation = CABasicAnimation(keyPath: "opacity")
    
}

func MoveAnimationBack(Label: UILabel){
    
}
