//
//  ViewController.swift
//  MySpaceAlbums
//
//  Created by Talha Gölcügezli on 13.01.2023.
//

import UIKit


class ViewController: UIViewController {
  
    @IBOutlet var customView: MainView!  {
        didSet {
            customView.delegate = self
        }
    }

    var album : Albums!
    var service : TopAlbumsServiceProtocol! = TopAlbumsService()
    private var albumsList : [Albums] = []
    var count : Int = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        service.fetchTopAlbums(urlString: Util.Url.url, completion: { result in
            switch result {
            case .success(let value):
                self.albumsList = value.results
                let albumPresentations = value.results.map(AlbumPresentation.init)
                self.customView.updateAlbums(albumPresentations)
            case .failure(let error):
                print(error)
            }
        })
        
        
        title = "Top 50 Albums"
               
    }
}

extension ViewController : AlbumListViewDelegate {
    func didSelectedAlbum(at index: Int) {
        self.album = albumsList[index]
        performSegue(withIdentifier: "webVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "webVC" {
            let destinationVC = segue.destination as! WebViewController
            destinationVC.selectedWebsites = album.url.absoluteString
        }
    }
}




