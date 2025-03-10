//
//  RMService.swift
//  RickAndMorty
//
//  Created by Mayo Gonzalez ortega on 25/02/25.
//

import Foundation


/// Primary API service object to get Rick And Morty data
final class RMService {
    
    /// Shared singleton instance
    static let shared = RMService()
    
    
    /// privatized constructor
    private init(){}
    
    enum RMServiceError: Error {
        case failedToCreateRequest
        case failedToGetData
    }
    public func execute<T: Codable>(
        _ request:RMRequest,
        expecting type: T.Type,
        completion: @escaping (Result<T, Error>) -> Void){
        
            guard let urlRequest = self.request(from: request) else {
                completion(.failure(RMServiceError.failedToCreateRequest))
                return
            }
            
            let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
                guard let data = data, error == nil else {
                    completion(.failure(error ?? RMServiceError.failedToGetData))
                    return
                }
                
                // DEcode response
                
                do {
                    let result = try JSONDecoder().decode(type.self, from: data)
                    completion(.success(result))
                    
                }catch{
                    completion(.failure(error))
                }
            }
            task.resume()
    }
    
    
    
    private func request(from rmRequest: RMRequest) -> URLRequest? {
        
        guard let url = rmRequest.url else { return nil }
        
        var request = URLRequest(url: url)
        request.httpMethod = rmRequest.httpMethod
        
        return request
    }
}
