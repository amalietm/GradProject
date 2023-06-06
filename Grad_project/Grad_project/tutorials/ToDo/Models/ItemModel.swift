//
//  ItemModel.swift
//  Grad_project
//
//  Created by Amalie Morch on 01/05/2023.
//

import Foundation

// Immutable struct - all items are let, so they wont change
// confer to codable so we can decode and incode ItemModel / transform into data and out of data
struct ItemModel: Identifiable, Codable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    // customising so if there is an existing id, it wont create a new one
    // removing let id string from top so it's not created automatically, its set through initializer
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        // want to reference id but also want to incldue default case in case there is no string so you can still initialize variable with random id string
       // with paramter for id in the () we can initialize an item model with an id if we give it a string or without an id and it will create one
       // when calling model, if you want to update item , use initializer with id. if creating new model, use the one withoout as you dont have an id to reference
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    // create function to update item model
    // return a ItemModel
    // this will be called within an item model, cause we already have an item model, then call updateCompletion
    // cannot change variables unless through function - making sure all logic as to updating model is within this function
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
