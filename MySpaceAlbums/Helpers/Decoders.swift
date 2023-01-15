//
//  Decoders.swift
//  MySpaceAlbums
//
//  Created by Talha Gölcügezli on 13.01.2023.
//

import Foundation

public enum Decoders {
    static let plainDateDecoder : JSONDecoder = {
        let decoder = JSONDecoder()
        let dateFormetter = DateFormatter()
        dateFormetter.dateFormat = "yyyy-MM-dd"
        decoder.dateDecodingStrategy = .formatted(dateFormetter)
        return decoder
    }()
}
