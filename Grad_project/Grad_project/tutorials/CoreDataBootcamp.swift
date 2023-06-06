//
//  CoreDataBootcamp.swift
//  Grad_project
//
//  Created by Amalie Morch on 22/05/2023.
//

import SwiftUI
import CoreData


class CoreDataViewModel: ObservableObject {
    
    var container: NSPersistentContainer
    @Published var savedEntities: [FruitEntity] = []
        
        init() {
            container = NSPersistentContainer(name: "FruitsContainer")
            container.loadPersistentStores { (description, error) in
                if let error = error {
                    print("error \(error)")
                }
            }
            fetchFruits()
    }
    func fetchFruits() {
        let request = NSFetchRequest<FruitEntity>(entityName: "FruitEntity")
        
        do {
            savedEntities = try container.viewContext.fetch(request)
        } catch let error {
            print("error \(error)")
        }
    }
        func addFruit(text: String) {
            let newFruit = FruitEntity(context: container.viewContext)
            newFruit.name = text
            saveData()
        }
        func saveData() {
            do {
                try container.viewContext.save()
                fetchFruits()
            } catch let error {
                print("error \(error)")
            }
        }
    
}

struct CoreDataBootcamp: View {
    
    @StateObject var vm = CoreDataViewModel()
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct CoreDataBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        CoreDataBootcamp()
    }
}
