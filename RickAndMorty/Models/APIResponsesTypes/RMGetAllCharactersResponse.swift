//
//  RMGetAllCharactersResponse.swift
//  RickAndMorty
//
//  Created by Mayo Gonzalez ortega on 03/03/25.
//

import Foundation

struct RMGetAllCharactersResponse: Codable {

    struct Info: Codable {
        let count: Int
        let pages: Int
        let next: String
    }
    
    let info: Info
    let results: [RMCharacter]
}

