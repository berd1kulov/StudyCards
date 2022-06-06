//
//  DataModel.swift
//  StudyCards
//
//  Created by Bakdaulet Berdikul on 06.06.2022.
//

import Foundation

// MARK: - OxfordTranslateResponse
struct OxfordTranslateResponse: Codable {
    let id: String?
    let metadata: Metadata
    let results: [WordResult]?
    let word: String?
}

// MARK: - Metadata
struct Metadata: Codable {
    let operation, provider, schema: String?
}

// MARK: - WordResult
struct WordResult: Codable {
    let id, language: String?
    let lexicalEntries: [LexicalEntry]?
    let type, word: String?
}

// MARK: - LexicalEntry
struct LexicalEntry: Codable {
    let entries: [Entry]?
    let language: String?
    let lexicalCategory: LexicalCategory?
    let text: String?
}

// MARK: - Entry
struct Entry: Codable {
    let pronunciations: [Pronunciation]?
    let senses: [Sense]?
}

// MARK: - Pronunciation
struct Pronunciation: Codable {
    let audioFile: String?
    let dialects: [String]?
    let phoneticNotation, phoneticSpelling: String?
}

// MARK: - Sense
struct Sense: Codable {
    let datasetCrossLinks: [DatasetCrossLink]?
    let examples: [Example]?
    let id: String?
    let translations: [Translation]?
}

// MARK: - DatasetCrossLink
struct DatasetCrossLink: Codable {
    let entryID, language, senseID: String?

    enum CodingKeys: String, CodingKey {
        case entryID = "entry_id"
        case language
        case senseID = "sense_id"
    }
}

// MARK: - Example
struct Example: Codable {
    let text: String?
    let translations: [Translation]?
}

// MARK: - Translation
struct Translation: Codable {
    let language, text: String?
}

// MARK: - LexicalCategory
struct LexicalCategory: Codable {
    let id, text: String?
}

// MARK: - ErrorMessage
struct ErrorMessage: Codable {
    let error: String
}
