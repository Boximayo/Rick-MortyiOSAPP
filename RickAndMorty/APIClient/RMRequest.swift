//
//  RMRequest.swift
//  RickAndMorty
//
//  Created by Mayo Gonzalez ortega on 25/02/25.
//

import Foundation


/// Object that represent a single API call
final class RMRequest {
    // Base url
    // Endpoint
    // Path components
    // Query parameters

    private struct Constants {
        static let baseURLString = "https://rickandmortyapi.com/api"
    }
    
    private  let endpoint: RMEndpoint
    private  let pathComponents: [String]
    private  let queryParameters: [URLQueryItem]
    
    /// Constucted url for the api request in string format
    private var urlString: String {
        var string = Constants.baseURLString
        string += "/"
        string += endpoint.rawValue
        
        if !pathComponents.isEmpty {
            pathComponents.forEach { string += "/\($0)" }
        }
        
        if !queryParameters.isEmpty {
            string += "?"
            let argumentString = queryParameters.compactMap({
                guard let value = $0.value else { return nil }
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            
            string += argumentString
        }
        return string
    }
    
    public var url: URL? {
        return URL(string: urlString)
    }
    
    public let httpMethod: String = "GET"
    
    // MARK: - Public
    
    init(endpoint: RMEndpoint, pathComponents: [String] = [], queryParameters: [URLQueryItem] = []) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
}
