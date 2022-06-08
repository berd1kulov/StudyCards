//
//  UIView + Ext.swift
//  StudyCards
//
//  Created by Bakdaulet Berdikul on 06.06.2022.
//

import UIKit

extension UIView {
    
    func transformScale() {
        let pulsate = CASpringAnimation(keyPath: "transform.scale")
        pulsate.duration = 0.5
        pulsate.repeatCount = 0
        pulsate.autoreverses = false
        pulsate.fromValue = 0.94
        pulsate.toValue = 0.99
        pulsate.autoreverses = false
        pulsate.initialVelocity = 0
        pulsate.damping = 1
        layer.add(pulsate, forKey: nil)
    }

    func registerUIG(_ target: Any, _ action: Selector, _ gesture: UIGestureRecognizer) {
        gesture.addTarget(target, action: action)
        isUserInteractionEnabled = true
        addGestureRecognizer(gesture)
    }
    
    func updateViewWithAnimation(_ duration: CGFloat) {
        UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 1,
                       initialSpringVelocity: 0, options: [.curveEaseOut]) { [weak self] in
            guard let self = self else { return }
            self.layoutIfNeeded()
        }
    }
    
}
