//
//  ViewModel.swift
//  Grad_project
//
//  Created by Amalie Morch on 01/05/2023.
//

// MVVM architecture - viewmodel is the class where all the data behind your app is located
// if content has nothing do with UI of the view, ex function here to do with the data, then make own class by seperating view function with data functions

// when to capitalize and when not to????
import SwiftUI

struct fruitModel: Identifiable {
    let id: String = UUID().uuidString
    let name: String
    let count: Int
}

// lets app know its an observableobject and that it might change
class FruitViewModel: ObservableObject {
    
    // @State cannot be declared outside a view so we use @Published instead, inside a class
    @Published var fruitArray: [fruitModel] = []
    @Published var isLoading: Bool = false
     
    init() {
        getFruits()
    }
    
    func getFruits() {
        let fruit1 = fruitModel(name: "Orange", count: 1)
        let fruit2 = fruitModel(name: "grape", count: 4)
        let fruit3 = fruitModel(name: "melon", count: 6)
        
        isLoading = true
        // tell app that fruitArray is in this class by referencing self
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.fruitArray.append(fruit1)
            self.fruitArray.append(fruit2)
            self.fruitArray.append(fruit3)
            self.isLoading = false
        }
        
        
    }
    
    func deleteFruit(index: IndexSet) {
        fruitArray.remove(atOffsets: index)
    }
}

struct ViewModel: View {
    
//    @State var fruitArray: [fruitModel] = []
    // creating fruitmodel, but not updating it, so add property wrapper
    // @ObservedObject is the same as @State for variables, but instead for a whole class/ object
    // you dont need data to reload, even if the view does, which is why you use @StateObject; data persists
    // @StateObject for creation/ init/ first view -> @ObservedObject use for subviews
   @StateObject var fruitViewModel: FruitViewModel = FruitViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                if fruitViewModel.isLoading {
                    ProgressView()
                } else {
                    ForEach(fruitViewModel.fruitArray) { fruit in
                        HStack {
                            // this string gives more control with formatting
                            Text("\(fruit.count)")
                                .foregroundColor(.red)
                            Text(fruit.name)
                                .bold()
                        }

                    }
                    .onDelete(perform: fruitViewModel.deleteFruit)
                    NavigationLink(destination: SecondScreen(fruitViewModel: fruitViewModel),
                                   label: {Image(systemName: "arrow.right")})
                                    .font(.title)
                }
                
            }
            .listStyle(GroupedListStyle())
        }
    }
}

struct SecondScreen: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var fruitViewModel: FruitViewModel
    var body: some View {
        ZStack {
            Color.blue.ignoresSafeArea()
            VStack {
                ForEach(fruitViewModel.fruitArray) { fruit in
                    Text(fruit.name)
                    .foregroundColor(.white)
                }
            }
        }
    }
}

struct ViewModel_Previews: PreviewProvider {
    static var previews: some View {
        ViewModel()
    }
}
