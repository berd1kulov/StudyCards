//
//  NetworkManager.swift
//  StudyCards
//
//  Created by Bakdaulet Berdikul on 06.06.2022.
//

import Foundation
import Alamofire


final class NetworkRequest {
    func getRequest<T: Decodable>(endpoint: OxfordAPIEndpoint, completion: @escaping (Result<T, OxfordAPIError>) -> ()) {
        guard let url = URL(string: endpoint.baseURL + endpoint.path) else {
            completion(.failure(.invalidURL))
            return
        }
        let oxfordHeaders: HTTPHeaders = [
            "app_id" : Constants.OXFORD_APP_ID,
            "app_key" : Constants.OXFORD_API_KEY
        ]
        
        AF.request(url, headers: oxfordHeaders).validate().responseDecodable(of: T.self) { response in
            switch response.result {
            case .success:
                guard let data = response.value else {
                    completion(.failure(.downloadError))
                    return
                }
                
                completion(.success(data))
       
            case let .failure(error):
                print("ERROR")
                guard let httpResponse = response.response else {
                    print("ERROR: \(error)")
                    completion(.failure(.networkError))
                    return
                }
                
                switch httpResponse.statusCode {
                case 400:
                    completion(.failure(.badRequest))
                case 404:
                    completion(.failure(.notFound))
                case 429:
                    completion(.failure(.tooManyRequests))
                case 500:
                    completion(.failure(.serverError))
                default:
                    completion(.failure(.unknown))
                }
            }
        }
    }
}
