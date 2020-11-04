//
//  SeriesViewController.swift
//  word-with-you
//
//  Created by Seth Polyniak on 11/4/20.
//  Copyright © 2020 Seth Polyniak. All rights reserved.
//

import UIKit

class SeriesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableview: UITableView!
    
    // Series images
    let seriesImages = [UIImage(named: "login_placeholder"),UIImage(named: "login_placeholder"),UIImage(named: "login_placeholder"),UIImage(named: "login_placeholder"),UIImage(named: "login_placeholder"),UIImage(named: "login_placeholder")]
    
    // Series titles
    let seriesTitles = ["Series 1", "Series 2","Series 3","Series 4","Series 5","Series 6"]
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return seriesTitles.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let seriesTitle = seriesTitles[indexPath .row]
        let seriesImage = seriesImages[indexPath .row]
        cell.title.text = seriesTitle
        cell.photo.image = seriesImage
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    
}

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
