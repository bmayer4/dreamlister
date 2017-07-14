//
//  Item+CoreDataClass.swift
//  DreamLister
//
//  Created by Brett Mayer on 7/8/17.
//  Copyright © 2017 Devslopes. All rights reserved.
//

import Foundation
import CoreData

@objc(Item)
public class Item: NSManagedObject {

    
    override public func awakeFromInsert() {
        super.awakeFromInsert()
        
        self.created = NSDate()  //timestamp, current date is assigned to attribute created when Item is inserted into object context
    }


}
