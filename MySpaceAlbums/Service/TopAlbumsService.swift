//
//  TopAlbumsService.swift
//  MySpaceAlbums
//
//  Created by Talha Gölcügezli on 13.01.2023.
//

import Foundation
import Alamofire

public protocol TopAlbumsServiceProtocol {
    func fetchTopAlbums(urlString: String,completion: @escaping(Result<TopAlbumsResponse,Error>) -> Void)
}

public enum Error : Swift.Error {
    case serializationError(internal: Swift.Error)
    case networkError(internal: Swift.Error)
}

public class TopAlbumsService : TopAlbumsServiceProtocol {
    
    public init() {}
    
    public func fetchTopAlbums(urlString: String,completion: @escaping (Result<TopAlbumsResponse, Error>) -> Void) {
        AF.request(urlString).responseData { response in
            switch response.result {
            case .success(let data):
                let decoder = Decoders.plainDateDecoder
                do {
                    let response = try decoder.decode(TopAlbumsResponse.self, from: data)
                    completion(.success(response))
                }catch {
                    completion(.failure(Error.serializationError(internal: error)))
                }
                
            case .failure(let error):
                completion(.failure(Error.serializationError(internal: error)))
            }
        }
    }
}


