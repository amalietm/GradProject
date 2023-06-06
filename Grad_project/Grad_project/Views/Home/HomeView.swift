//
//  HomeView.swift
//  Grad_project
//
//  Created by Amalie Morch on 19/04/2023.
//
//MARK: HOME VIEW

import SwiftUI
import Combine


struct HomeView: View {
    
//   VARIABLES
    @State private var isSelected = false
    @State private var isSelected2 = false
    @State var showAddRun = false
    
    var body: some View {
//        CONTENT
        NavigationStack {
            VStack {
                UnderlineView()
                    .navigationTitle("Today's")
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
