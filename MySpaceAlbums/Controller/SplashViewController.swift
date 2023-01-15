//
//  SplashViewController.swift
//  MySpaceAlbums
//
//  Created by Talha Gölcügezli on 14.01.2023.
//

import UIKit

class SplashViewController: UIViewController {

    var imageView : UIImageView = {
       let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 400, height: 300))
        imageView.image = UIImage(named: "splash")
        return imageView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(imageView)
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
            self.performSegue(withIdentifier: "toHomeVC", sender: nil)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.center = view.center
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.animation()
        }
    }
    
    func animation() {
        UIView.animate(withDuration: 1) {
            let size = self.view.frame.size.width * 2
            let xposition = size - self.view.frame.width
            let yposition = self.view.frame.height - size
            
            self.imageView.frame = CGRect(x: -Int(xposition/2), y: Int(yposition), width: Int(size), height: Int(size))
            self.imageView.alpha = 0
        }
    }
    



}
