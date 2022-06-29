//
//  OxfordAPIError.swift
//  StudyCards
//
//  Created by Bakdaulet Berdikul on 06.06.2022.
//

import Foundation

enum OxfordAPIError: String, Error {
    case badRequest = "Error 400: Error 400: Missing parameters in the request."
    case forbidden = "Error 403: Unauthorized request (potentially a problem at the API key level)."
    case notFound = "Error 404: Word not found."
    case tooManyRequests = "Error 429: Too many requests have been made in a short period of time. Please try again later."
    case serverError = "Error 500: Server error."
    case apiError = "An error has occurred."
    case invalidURL = "Error: Invalid URL."
    case networkError = "An Error has occurred, no Internet connection."
    case decodeError = "An error occurred while decoding the downloaded data."
    case downloadError = "An error occurred while downloading the data."
    case unknown = "Unknown error."
}
