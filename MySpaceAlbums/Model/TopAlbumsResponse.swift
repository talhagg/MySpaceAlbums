//
//  TopAlbumsResponse.swift
//  MySpaceAlbums
//
//  Created by Talha Gölcügezli on 13.01.2023.
//

import Foundation

public struct TopAlbumsResponse : Decodable {
    
    private enum RootCodingKey : String, CodingKey {
        case feed
    }
    
    private enum FeedCodingKey : String, CodingKey {
        case results
    }
    
    public let results : [Albums]
    
    public init(from decoder: Decoder) throws {
        let rootContainer = try decoder.container(keyedBy: RootCodingKey.self)
        let feedContainer = try rootContainer.nestedContainer(keyedBy: FeedCodingKey.self, forKey: .feed)
        self.results = try feedContainer.decode([Albums].self, forKey: .results)
    }
}
