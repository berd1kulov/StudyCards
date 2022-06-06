//
//  HomeViewController.swift
//  StudyCards
//
//  Created by Bakdaulet Berdikul on 05.06.2022.
//

import UIKit
import JJFloatingActionButton

class HomeViewController: BaseVC {

    let actionButton = JJFloatingActionButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        configureActionButton()
    }
    
    fileprivate func configureActionButton() {
        actionButton.buttonColor = UIColor.primaryBlue
        
        let wordFAB = actionButton.addItem()
        wordFAB.titleLabel.text = "Word"
        wordFAB.titleLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
        wordFAB.imageView.image = UIImage(named: "word_fab")
        wordFAB.buttonColor = UIColor.primaryBlue
        wordFAB.buttonImageColor = .white
        wordFAB.action = { item in
            // Do something
        }
        
        let folderFAB = actionButton.addItem()
        folderFAB.titleLabel.text = "Folder"
        folderFAB.titleLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
        folderFAB.imageView.image = UIImage(named: "folder_fab")
        folderFAB.buttonColor = UIColor.primaryBlue
        folderFAB.buttonImageColor = .white
        folderFAB.action = { item in
            // Do something
        }
        
        actionButton.display(inViewController: self)
    }
    
}

