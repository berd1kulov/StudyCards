//
//  APIService.swift
//  StudyCards
//
//  Created by Bakdaulet Berdikul on 06.06.2022.
//

import Foundation

protocol APIService {
    
    func searchTranslate(currentLanguage: String,
                         translateLanguage: String,
                         word: String,
                         completion: @escaping(Result<OxfordTranslateResponse, OxfordAPIError>) -> ()
    )
}
