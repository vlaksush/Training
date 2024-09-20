//
//  PixabayService.swift
//  PhotoExplorer
//
//  Created by Ravi Shankar on 18/09/24.
//

import Foundation
import Alamofire

class PixabayService {
    enum PixabayError: Error {
        case invalidAPIKey
    }
    
    static let shared = PixabayService()
    private init() {}
    
    private let baseURL = "https://pixabay.com/api/"
    private let apiKey = "YOUR_API_KEY_HERE"
    
    func searchPhotos(query: String, completion: @escaping (Result<[Photo], Error>) -> Void) {
        guard apiKey != "YOUR_API_KEY_HERE" else {
            completion(.failure(PixabayError.invalidAPIKey))
            return
        }
        
        let parameters: [String: Any] = [
            "key": apiKey,
            "q": query,
            "image_type": "photo",
            "per_page": 50
        ]
        
        AF.request(baseURL, parameters: parameters).responseDecodable(of: PixabayResponse.self) { response in
            switch response.result {
            case .success(let pixabayResponse):
                completion(.success(pixabayResponse.hits))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
