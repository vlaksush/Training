//
//  PixabayService.swift
//  PhotoGallery
//
//  Created by Ravi Shankar on 07/10/24.
//

import Foundation
import Alamofire

class PixabayService {
    
    static let shared = PixabayService()
    
    private init() {}
    
    let BASE_URL = "https://pixabay.com/api/"
    let API_KEY = "46044322-b7035dd9cf183d83e9ab6b326"
    
    func searchPhotos(query: String, completion: @escaping (Result<[Photo], Error>) -> Void) {

               let parameters: [String: Any] = [
                "key": API_KEY,
                "q": query,
                "image_type": "photo",
                "per_page": 200
            ]
            
            AF.request(BASE_URL, parameters: parameters).responseDecodable(of: PixabayResponse.self) { response in
                switch response.result {
                case .success(let pixabayResponse):
                    completion(.success(pixabayResponse.hits))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
      }
}
