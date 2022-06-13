//
//  UINavigationBar + Ext.swift
//  StudyCards
//
//  Created by Bakdaulet Berdikul on 08.06.2022.
//

import UIKit

extension UINavigationBar {
    func toggle() {
        if self.layer.zPosition == -1 {
            self.layer.zPosition = 0
            self.isUserInteractionEnabled = true
        } else {
            self.layer.zPosition = -1
            self.isUserInteractionEnabled = false
        }
    }
}
