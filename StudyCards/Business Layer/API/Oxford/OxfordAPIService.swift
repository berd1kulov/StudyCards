//
//  OxfordAPIService.swift
//  StudyCards
//
//  Created by Bakdaulet Berdikul on 06.06.2022.
//

import Foundation

final class OxfordAPIService: APIService {
    
    private let networkRequest = NetworkRequest()
    
    func searchTranslate(currentLanguage: String, translateLanguage: String, word: String, completion: @escaping (Result<OxfordTranslateResponse, OxfordAPIError>) -> ()) {
        networkRequest.getRequest(endpoint: .searchTranslate(currentLanguage: currentLanguage, translateLanguage: translateLanguage, word: word), completion: completion)
    }
}
