//
//  ItemCell.swift
//  DreamLister
//
//  Created by Brett Mayer on 7/9/17.
//  Copyright © 2017 Devslopes. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {

    @IBOutlet weak var thumb: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var details: UILabel!
 
    func configureCell(item: Item) {
        title.text = item.title
        price.text = String(item.price)
        details.text = item.details
    }

}
