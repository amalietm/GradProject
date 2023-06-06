//
//  ListViewModel.swift
//  Grad_project
//
//  Created by Amalie Morch on 03/05/2023.
//

import Foundation
// make ListViewModel into an environmental object
// gonna be used throughout entire app so variable is created at the beginning, main file of app

// conform to ObservableObject to observe class from views / look for updates
class ListViewModel: ObservableObject {
    // cannot use @State when in a class, so @Published
    @Published var items: [ItemModel] = [] {
        // want to save data every time list is updated
        // any time items array is changed, this function will get called
        didSet {
            saveItems()
        }
    }
    
    let itemsKey: String = "items_list"
    // when class is created a init function is calles, this is to customize that init function
    // add fake data
    init() {
        getItems()
    }
    
    // append items to array
    func getItems() {
        // instead of getting fake items, we want to append the user default items added
        /*
        let newItems = [
            ItemModel(title: "this is the first", isCompleted: false),
            ItemModel(title: "this is the second", isCompleted: true),
            ItemModel(title: "this is the third", isCompleted: false)
        ]
        
         append items to itemsArray
         since we're appending multiple items its contentsOf
        items.append(contentsOf: newItems)
        */
        //get data from user defaults
        // optional as there is a possibility there is no data, so safely unwrap
        // get data but if it's false return out of function
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            // previously converted item model to codable, but as it's an array, we have to include []
            // want type of itemModel, not an array so .self
            // guard statements can be combined
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else {return}
        
        // will return out of function if we cant get one of them, but if we can get both data and savedItems:
        self.items = savedItems
    }
    /*
     CRUD FUNCTIONS
     anytime youre dealing with data in your app, all of the functions are going to derive from the crud functions
     anytime you're dealing with data make sure you understand and can create all four of these functions to deal with the data
     Create - add
     Read - get
     Update - toggle item completion
     Delete - delete
     */
    
    
    // functions automatically compile by referncing the items array
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    // when adding item, we will have text already as it's already in View
    func addItem(title: String) {
        // with title we'll cretae a new item
        let newItem = ItemModel(title: title, isCompleted: false)
        // add item to items []
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel) {
        // get index of selected item
        // first index is the only index as items are all unique
        // loops through all the existing items of the array
        // return first case where the existing items id is the same as this item's id
       // index is optional in case no id is found, but as we know it's true, we will safely unwrap with an if statement
        /*
         if let index = items.firstIndex { (existingItem) -> Bool in
            return existingItem.id == item.id
        } {
            // run code
        }
        */
        
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            // update item at index
            // same title, but change value of isCompleted by writing an ! before
            items[index] = item.updateCompletion()
        }
    }
    
    func saveItems() {
        // @appstorage is used in a view directly while in a class it's better to use UserDefaulst
        // user default has no idea what an item model is, as we cannot save it into user defaults
        // convert item models into json data (data blob)
        /*
         1. take item model
         2. convert to data blob
         3. put data into user defaults
         4. when retrieving convert back to item model
         */
        if let encodedData = try? JSONEncoder().encode(items) {
            // put encoded data into user defaults
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
        
    }
    
    
    
}
