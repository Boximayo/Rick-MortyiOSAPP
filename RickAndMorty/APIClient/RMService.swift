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
    
    public func execute(_ request:RMRequest, completion: @escaping () -> Void){
        
    }
}
