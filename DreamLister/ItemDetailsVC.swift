//
//  ItemDetailsVC.swift
//  DreamLister
//
//  Created by Brett Mayer on 7/9/17.
//  Copyright © 2017 Devslopes. All rights reserved.
//

import UIKit
import CoreData

class ItemDetailsVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var storePicker: UIPickerView!
    @IBOutlet weak var titleField: CustomTextField!
    @IBOutlet weak var priceField: CustomTextField!
    @IBOutlet weak var detailsField: CustomTextField!
    
    var stores = [Store]()
    
    var itemToEdit: Item?  //we aren't always editing in this view
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let topItem = self.navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        }
    
        storePicker.delegate = self
        storePicker.dataSource = self
        
//        let store = Store(context: context)
//        store.name = "Best Buy"
//        
//        let store2 = Store(context: context)
//        store2.name = "Tesla Dealership"
//        
//        let store3 = Store(context: context)
//        store3.name = "Frys Electronics"
//        
//        let store4 = Store(context: context)
//        store4.name = "Target"
//        
//        let store5 = Store(context: context)
//        store5.name = "Amazon"
//        
//        let store6 = Store(context: context)
//        store6.name = "Sears"
//        
//        ad.saveContext()
        
         getStores()
        
        if itemToEdit != nil {
            loadItemData()
        }

    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let store = stores[row]
        return store.name
    }
 
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //how many rows there are
        return stores.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        //how many columns there are
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //update when selected

    }
    
    //a diff way to use core data other than using the fetched results controller
    func getStores() {
        let fetchRequest: NSFetchRequest<Store> = Store.fetchRequest()
        
        do {
            self.stores = try context.fetch(fetchRequest)
            self.storePicker.reloadAllComponents()  //kind of like the tableView.reloadData
        } catch {
            //handle error
        }
    }

    @IBAction func savePressed(_ sender: UIButton) {
        
        //let item = Item(context: context)   //so we don't create duplicate entry
        var item: Item!
        
        if itemToEdit ==  nil {
            item = Item(context: context)
        } else {
            item = itemToEdit  //core data takes care of the rest for us, will know behind the scense to update existing one
        }
   
        if let title = titleField.text {
            item.title = title
        }
        
        if let price = priceField.text {  //need to use numberFormatter to make decimal 2 places, QA "price decimal"
            item.price = (price as NSString).doubleValue
        }
        
        if let details = detailsField.text {
            item.details = details
        }
        
        //assigning a store via this relationship to this specific newly created item
        item.toStore = stores[storePicker.selectedRow(inComponent: 0)]  //inComponent is not row, it is column, we have 1
       
        ad.saveContext()
        
        _ = navigationController?.popViewController(animated: true)

    }
    
    func loadItemData() {
        if let item = itemToEdit {
            titleField.text = item.title
            priceField.text = String(item.price)
            detailsField.text = item.details
            
            if let store = item.toStore {
                for i in 0..<stores.count {
                    let s = stores[i]
                    
                    if s.name == store.name {
                        storePicker.selectRow(i, inComponent: 0, animated: false)
                        print("did it, named: \(s.name)")
                    }
                    
                    }
                
                }
            
            }
        }
    
}
