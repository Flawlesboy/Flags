//
//  DetailViewController.swift
//  Globe
//
//  Created by zagid on 29.10.17.
//  Copyright © 2017 zagid. All rights reserved.
//

import UIKit
import Parse

class DetailViewController: UITableViewController {
    var globe: Globe!
    
    @IBOutlet weak var countryImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countryImageView.image = globe.image
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! DetailCell
        
        switch indexPath.row {
        case 0:
            cell.fieldLabel.text = "Страна"
            cell.valueLabel.text = globe.countryName
        case 1:
            cell.fieldLabel.text = "Столица"
            cell.valueLabel.text = globe.capital
        case 2:
            cell.fieldLabel.text = "Код номера"
            cell.valueLabel.text = "\(globe.codeNumber)"
        case 3:
            cell.fieldLabel.text = "Население"
            cell.valueLabel.text = "\(globe.population)"
        case 4:
            cell.fieldLabel.text = "Площадь"
            cell.valueLabel.text = "\(globe.area)"
            
        default:
            cell.fieldLabel.text = ""
            cell.valueLabel.text = ""
        }
        
        return cell
    }
    
    
    
    
    
}
