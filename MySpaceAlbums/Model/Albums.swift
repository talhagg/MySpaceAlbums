//
//  Albums.swift
//  MySpaceAlbums
//
//  Created by Talha Gölcügezli on 13.01.2023.
//

import Foundation

public struct Albums : Decodable {
    
    public enum CodingKeys : String, CodingKey {
        case id
        case artistName
        case name
        case releaseDate
        case image = "artworkUrl100"
        case genres
        case url
    }
    
    public let id : String
    public let artistName : String
    public let name : String
    public let releaseDate : String
    public let image : URL
    public let genres : [Genre]
    public let url : URL
}

public struct Genre : Decodable {
    public let name : String
}
