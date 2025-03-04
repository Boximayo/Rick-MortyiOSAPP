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
    
    public func execute<T: Codable>(
        _ request:RMRequest,
        expecting type: T.Type,
        completion: @escaping (Result<String, Error>) -> Void){
        
    }
}
