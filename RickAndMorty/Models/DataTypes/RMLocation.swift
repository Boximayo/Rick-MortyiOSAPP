//
//  RMLocation.swift
//  RickAndMorty
//
//  Created by Mayo Gonzalez ortega on 22/02/25.
//

import Foundation


struct RMLocation: Codable {
    let id: Int
    let name, type, dimension: String
    let residents: [String]
    let url: String
    let created: String
}
