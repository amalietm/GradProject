//
//  dataTutorial.swift
//  Grad_project
//
//  Created by Amalie Morch on 03/06/2023.
//

import Foundation
import Firebase

struct ToDo: Identifiable {

    // mirror datatypes in firebase
    var id: String
    var name: String
    var notes: String
}

class ToDosViewModel: ObservableObject {
    
    // array of data items - () makes it empty to contain them
    @Published var list = [ToDo]()
    
    func updateData(todoToUpdate: ToDo) {
        let db = Firestore.firestore()
        // you can merge or overwrite data
        db.collection("todos").document(todoToUpdate.id).setData(["name": "updated: \(todoToUpdate.name)"], merge: true) {error in
            if error == nil {
                self.getData()
        }
        }
    }
                                        
    
    func deleteData(todoToDelete: ToDo) {
        // get reference to database
        let db = Firestore.firestore()
        
        // specify doc to delete
        db.collection("todos").document(todoToDelete.id).delete {error in
            if error == nil {
                // no errors
                
                // update ui from main thread
                DispatchQueue.main.async {
                    // remove todo that was just deleted
                    self.list.removeAll { todo in
                        // check for the todo to remove
                        return todo.id == todoToDelete.id
                    }
                }
                
            }
            else {
                // handle errors
            }
        }
    }
    
    func addData(name: String, notes: String) {
        // get reference to database
        let db = Firestore.firestore()
        // add document to collection
        db.collection("todos").addDocument(data: ["name": name, "notes": notes]) {error in
            // check for errors
            
            if error == nil {
                // no errors
                 
                // call get data to latest data
                self.getData()
            }
            else {
                // handle errors
            }
        }
    }
    
    
    func getData() {
        // get a reference to the database
        let db = Firestore.firestore()
        // read the documents at specific path
        // grab documents and then run this code
        db.collection("todos").getDocuments { snapshot, error in
            // check for errors
            if error == nil {
                print("we did it")
                // no errors
                if let snapshot = snapshot {
                    
                    // update the list porperty and create To do's = visualize UI chanegd
                    DispatchQueue.main.async {
                        // get all docs and create todos
                        // map iterates over array and preform code on each item and return result to collection
                        self.list = snapshot.documents.map { d in
                            
                            // create todo item for each document returned
                            return ToDo(id: d.documentID,
                                        // if nil put empty string
                                        name: d["name"] as? String ?? "",
                                        notes: d["notes"] as? String ?? "")
                    }
                    
                    }
                }
            }
            else {
                // handle errors
            }
        }
    }
    
}
