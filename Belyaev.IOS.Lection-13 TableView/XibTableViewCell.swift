//
//  XibTableViewCell.swift
//  Belyaev.IOS.Lection-13 TableView
//
//  Created by максим  кондратьев  on 08.06.2021.
//

import UIKit

class XibTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var switchLabel: UISwitch!

    @IBAction func switchAction(_ sender: UISwitch) {
    }
    
    func configureCell(_ task: Tasks){
        titleLabel.text = task.title
        descriptionLabel.text = task.description
        switchLabel.isOn = task.isActiveSwitch
        
        
    }
    
}
