//
//  MainView.swift
//  MySpaceAlbums
//
//  Created by Talha Gölcügezli on 13.01.2023.
//

import UIKit
import SDWebImage
import CoreData


final class MainView : UIView {
    
    weak var delegate: AlbumListViewDelegate?
    
    var albumList : [AlbumPresentation] = []
    var filterList : [AlbumPresentation] = []
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!

    
}

extension MainView : AlbumListViewProtocol {
    func updateAlbums(_ albumList: [AlbumPresentation]) {
        self.albumList = albumList
        self.filterList = albumList
        tableView.reloadData()
    }
}

extension MainView : UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Album", for: indexPath) as! AlbumsCell
        let albums = albumList[indexPath.row]
       
        cell.albumName.text = albums.albumName
        cell.artistName.text = albums.singerName
        cell.cellImageView.sd_setImage(with: albums.image)
        cell.genreName.text = albums.genre.first?.name
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albumList.count
    }
    
}

extension MainView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelectedAlbum(at: indexPath.row)
    }
      
}

extension MainView : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
     
        if searchText.isEmpty {
            albumList = filterList
        } else {
            albumList = filterList.filter({ albums in
                if albums.albumName.range(of: searchText, options: .caseInsensitive) != nil {
                    return true
                } else if albums.singerName.range(of: searchText, options: .caseInsensitive) != nil {
                    return true
                } else {
                    return false
                }
            })
        }
     
        
        tableView.reloadData()
    }
}







