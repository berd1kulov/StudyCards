//
//  Then + Ext.swift
//  StudyCards
//
//  Created by Bakdaulet Berdikul on 06.06.2022.
//

import UIKit

public protocol Create { }
extension NSObject: Create {}

extension Create where Self: AnyObject {
    public func then(_ block: (Self) throws -> Void) rethrows -> Self {
        try block(self)
        return self
    }
}
