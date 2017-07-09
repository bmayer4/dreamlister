//
//  ItemType+CoreDataProperties.swift
//  DreamLister
//
//  Created by Brett Mayer on 7/8/17.
//  Copyright © 2017 Devslopes. All rights reserved.
//

import Foundation
import CoreData


extension ItemType {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ItemType> {
        return NSFetchRequest<ItemType>(entityName: "ItemType")
    }

    @NSManaged public var type: String?
    @NSManaged public var toItem: Item?

}
