//
//  ToDoView.swift
//  Grad_project
//
//  Created by Amalie Morch on 01/05/2023.
//

import SwiftUI

/*
 MVVM architecture
 
 Model - data point
 View - UI
 ViewModel - manages models for View
 */

struct ToDoView: View {
    
    // variable of type ListViewModel created and set it to a new ListViewModel
    // to observe the changes of the object so the view can update, you need a property wrapper
    // when classes are created in the initialiser, the best property wrapper to use is the @StateObject
    // now that object is created it could be passed directly into the ListView()/ UI, but it's more effecient to put it into the environment as an EnvironmentObject
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some View {
        NavigationStack {
            ListsView()
        }
        // on entire navigationview, so all the navigationviews have access to it, add the observable object:
        .environmentObject(listViewModel)
    }
}

struct ToDoView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoView()
    }
}

// use coredata for large amounts of data
// use @appstorage for smaller amounts of data like user profile of preferences

// explore json files to start out from or use primarily instead of model? 
