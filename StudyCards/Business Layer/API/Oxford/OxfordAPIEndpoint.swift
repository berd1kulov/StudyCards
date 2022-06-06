//
//  OxfordAPIEndpoint.swift
//  StudyCards
//
//  Created by Bakdaulet Berdikul on 06.06.2022.
//

import Foundation

enum OxfordAPIEndpoint {
    case searchTranslate(currentLanguage: String, translateLanguage: String, word: String)
    
    var baseURL: String {
        return "https://od-api.oxforddictionaries.com/api/v2/"
    }
    
    var path: String {
        switch self {
     
        case .searchTranslate(let currentLanguage, let translateLanguage, let word):
            return "translations/\(currentLanguage)/\(translateLanguage)/\(word)?strictMatch=false"
        }
    }
}
