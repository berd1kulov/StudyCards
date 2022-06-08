//
//  LanguageViewModel.swift
//  StudyCards
//
//  Created by Bakdaulet Berdikul on 08.06.2022.
//

import Foundation

class LanguageViewModel {
    
    var languageFields = [CellConfigurator]()
    
    func fetchAllDatas() {
        languageFields.append(LanguageTVCellConfigurator(
            item: Language(language: "English", icon: "eng", key: "en"))
        )
        
        languageFields.append(LanguageTVCellConfigurator(
            item: Language(language: "Russian", icon: "rus", key: "ru"))
        )
        
        languageFields.append(LanguageTVCellConfigurator(
            item: Language(language: "Kazakh", icon: "kaz", key: "kz"))
        )
        
        languageFields.append(LanguageTVCellConfigurator(
            item: Language(language: "Turkish", icon: "tur", key: "tr"))
        )
        
    }
    
}
