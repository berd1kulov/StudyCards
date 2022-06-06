//
//  CustomTextField.swift
//  StudyCards
//
//  Created by Bakdaulet Berdikul on 06.06.2022.
//

import UIKit

class CustomTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func commonInit(){
        //TODO: - will define it later
        self.placeholderColor = UIColor.white
    }
    
    var placeholderColor: UIColor = UIColor.lightGray{
        didSet{
            self.setPlaceholderColor()
        }
    }
    
    private func setPlaceholderColor(){
        self.attributedPlaceholder = NSAttributedString(string: self.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor: placeholderColor])
    }

}
