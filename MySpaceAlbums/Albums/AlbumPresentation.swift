//
//  AlbumPresentation.swift
//  MySpaceAlbums
//
//  Created by Talha Gölcügezli on 13.01.2023.
//

import Foundation

struct AlbumPresentation {
    let id : String
    let albumName : String
    let singerName : String
    let image : URL
    let genre : [Genre]
    let url : URL
}

extension AlbumPresentation {
    init(album: Albums) {
        self.init(id: album.id, albumName: album.name, singerName: album.artistName, image: album.image,genre: album.genres, url: album.url)
    }
}
