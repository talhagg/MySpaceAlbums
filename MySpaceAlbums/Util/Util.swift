//
//  Util.swift
//  MySpaceAlbums
//
//  Created by Talha Gölcügezli on 13.01.2023.
//

import Foundation


public struct Util {
    
    struct Url  {
        //https://rss.applemarketingtools.com/api/v2/us/music/most-played/25/albums.json
        static let baseUrl = "https://rss.applemarketingtools.com/api/v2/"
        static var country = "us"
        static let music = "/music/most-played/"
        static var count = "50"
        static let albums = "/albums.json"
        static let url = "\(baseUrl)\(country)\(music)\(count)\(albums)"
    }
    
}
