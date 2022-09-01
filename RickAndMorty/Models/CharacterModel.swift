//
//  CharacterModel.swift
//  RickAndMorty
//
//  Created by Juan Camilo Marín Ochoa on 30/08/22.
//

import Foundation

// MARK: - CharactersResponse
struct CharactersResponse: Decodable {
    let info: CharactersResponseInfo
    let results: [Character]
}

// MARK: - CharactersResponseInfo
struct CharactersResponseInfo: Decodable {
    let count, pages: Int
    let next, prev: String?
}

// MARK: - Character
struct Character: Decodable {
    let id: Int
    let name: String
    let status: Status
    let species, type: String
    let gender: Gender
    let origin, location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

// MARK: - Location and origin
struct Location: Decodable {
    let name: String
    let url: String
}

enum Gender: String, Decodable {
    case female = "Female"
    case male = "Male"
    case genderless = "Genderless"
    case unknown = "unknown"
}

enum Status: String, Decodable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}
