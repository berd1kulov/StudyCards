//
//  HomeViewModel.swift
//  StudyCards
//
//  Created by Bakdaulet Berdikul on 08.06.2022.
//

import UIKit

class HomeViewModel{
    var wordsFields = [WordFolder]()
    
    func fetchAllDatas() {
        wordsFields.append(WordFolder(words: [WordResult(id: "001", language: "en", lexicalEntries: nil, type: nil, word: "Apple"),
                                              WordResult(id: "002", language: "en", lexicalEntries: nil, type: nil, word: "Gray"),
                                              WordResult(id: "003", language: "en", lexicalEntries: nil, type: nil, word: "Flame"),
                                              WordResult(id: "004", language: "en", lexicalEntries: nil, type: nil, word: "Play"),
                                              WordResult(id: "005", language: "en", lexicalEntries: nil, type: nil, word: "Hello")],
                                      folder: "Words"))
        wordsFields.append(WordFolder(words: [WordResult(id: "001", language: "en", lexicalEntries: nil, type: nil, word: "Day"),
                                              WordResult(id: "002", language: "en", lexicalEntries: nil, type: nil, word: "Night"),
                                              WordResult(id: "003", language: "en", lexicalEntries: nil, type: nil, word: "Moon")],
                                      folder: "FrameWork"))
        wordsFields.append(WordFolder(words: [],
                                      folder: "Study"))
    }
}
