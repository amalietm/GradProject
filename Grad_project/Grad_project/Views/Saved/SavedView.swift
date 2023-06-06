//
//  SavedView.swift
//  Grad_project
//
//  Created by Amalie Morch on 24/04/2023.
//

//MARK: SAVED VIEW
import SwiftUI

struct SavedView: View {

//  VARIABLES
    @Binding var time: String
    @Binding var interval: String
    @Binding var environment: Bool
    
    var body: some View {
        
//        CONTENT
        NavigationStack {
            ScrollView(){
                ForEach(1..<4) { index in
                    SavedViewPost(title: .constant(""),
                                  environment: $environment,
                                  interval: $interval,
                                  time: $time,
                                  workoutLiked: .constant(true),
                                  backgroundColor: .constant(.white),
                                  fontColor: .constant(.blue),
                                  likedWorkouts: .constant([]))
                }
            }
            .padding(.top, 20)
            .navigationTitle("Saved")
                
        }
    }
}

