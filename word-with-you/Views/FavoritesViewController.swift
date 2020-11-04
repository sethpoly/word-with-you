//
//  FavoritesViewController.swift
//  word-with-you
//
//  Created by Seth Polyniak on 11/4/20.
//  Copyright © 2020 Seth Polyniak. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collection: UICollectionView!
    
    // List of devotions in selected series
    let devotionNames = ["Devotion 1","Devotion 2","Devotion 3","Devotion 4"]
    
    // List of devotion images in selected series
    let devotionImages = [UIImage(named: "login_placeholder"),UIImage(named: "login_placeholder"),UIImage(named: "login_placeholder"),UIImage(named: "login_placeholder")]
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return devotionNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionCell
        let devotionImg = devotionImages[indexPath .row]
        let devotionTitle = devotionNames[indexPath .row]
        cell.photo.image = devotionImg
        cell.title.text = devotionTitle
        
        return cell
    }
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

class CollectionCell: UICollectionViewCell {
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
