//
//  AlbumListContracts.swift
//  MySpaceAlbums
//
//  Created by Talha Gölcügezli on 13.01.2023.
//

import Foundation

protocol AlbumListViewProtocol {
    var delegate : AlbumListViewDelegate? { get set }
    func updateAlbums(_ albumList: [AlbumPresentation])
}

protocol AlbumListViewDelegate : class {
    func didSelectedAlbum(at index : Int)
}





