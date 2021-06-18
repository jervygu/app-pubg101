//
//  WeaponFullImageViewController.swift
//  pubg101
//
//  Created by Jervy Umandap on 5/28/21.
//

import UIKit
import SDWebImage

class WeaponFullImageViewController: UIViewController {
    
    lazy var weaponImageURL: URL? = URL(string: "")
    
    private let imageContainerView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let fullimageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        
        navigationController?.navigationBar.prefersLargeTitles = false
        
        view.addSubview(imageContainerView)
        imageContainerView.addSubview(fullimageView)
        
        navigationItem.largeTitleDisplayMode = .never
        
        guard let imageURL = weaponImageURL else {
            return
        }
        fullimageView.sd_setImage(with: imageURL, completed: nil)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let containerHeight = view.height*0.66
        let containerWidth = view.width*0.90
        
        imageContainerView.frame = CGRect(
            x: (view.width-containerWidth)/2,
            y: (view.height-containerHeight)/2,
            width: containerWidth,
            height: containerHeight)
//        imageContainerView.backgroundColor = .systemTeal
        
        fullimageView.frame = imageContainerView.bounds
    }
    
    
    

}
