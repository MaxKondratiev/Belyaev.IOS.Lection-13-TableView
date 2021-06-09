//
//  myTableViewCell.swift
//  Belyaev.IOS.Lection-13 TableView
//
//  Created by максим  кондратьев  on 08.06.2021.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var myLabel: UILabel!
    
    func configure(_ task: Tasks) {
        myLabel.text = task.title
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
