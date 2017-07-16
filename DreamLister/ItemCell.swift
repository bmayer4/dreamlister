//
//  ItemCell.swift
//  DreamLister
//
//  Created by Brett Mayer on 7/9/17.
//  Copyright © 2017 Devslopes. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {
    
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .currency
        nf.minimumFractionDigits = 2
        nf.maximumFractionDigits = 2
        return nf
    }()


    @IBOutlet weak var thumb: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var details: UILabel!
    @IBOutlet weak var type: UILabel!
 
    func configureCell(item: Item) {
        title.text = item.title
        //price.text = String(item.price)
        price.text = numberFormatter.string(from: NSNumber(value: item.price))  //yesss
        details.text = item.details
        thumb.image = item.toImage?.image as? UIImage  //as? UIImage because Imager is saved as transformable in db
        type.text = item.toItemType?.type
    }

}
