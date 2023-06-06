//
//  ListsView.swift
//  Grad_project
//
//  Created by Amalie Morch on 01/05/2023.
//

import SwiftUI

struct ListsView: View {
    
    // need to reference ListViewModel instead of previous @State array, so we call environmentObject
    @EnvironmentObject var listViewModel: ListViewModel
    
    
    var body: some View {
        ZStack {
            if listViewModel.items.isEmpty {
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
                // THIS ISNT WORKING
            } else {
                List {
                    ForEach(listViewModel.items) {item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                    
                }
                .listStyle(PlainListStyle())
            }
        }
        .navigationTitle("To do List")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
               EditButton()
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink("Add", destination: AddView())
            }
        }
    }
}

struct ListsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ListsView()
        }
        // preview doesnt have environmental object as it's added when we run our project through the main file. to fix, just add to preview.
        .environmentObject(ListViewModel())
    }
}


