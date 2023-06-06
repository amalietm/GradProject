//
//  WorkoutOverviewView.swift
//  Grad_project
//
//  Created by Amalie Morch on 20/04/2023.
//

//MARK: WORKOUT OVERVIEW 
import SwiftUI

struct WorkoutOverviewView: View {
//    VARIABLES
    @State var showSettings : Bool = false
    @Environment(\.dismiss) private var dismiss
    
    var workout: WorkoutModel
    
    var body: some View {
//      CONTENT
        NavigationStack {
            ZStack {
                Text("")
//                NAVIGATION
                .navigationTitle("Workout")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            showSettings.toggle()
                        } label: {
                            Image(systemName: "gearshape")

                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "xmark")

                        }
                    }
                }
                .tint(.black)
//              SUB-VIEW: SETTINGS
                .fullScreenCover(isPresented: $showSettings, content: {
                    SettingsView()
                })
//              CONTENT
                ScrollView {
                    VStack {
                            WorkoutOverviewPost(
                                interval: workout.interval,
                                time: workout.time,
                                goal: workout.goal,
                                notes: workout.notes,
                                environment: workout.environment,
                                backgroundColor: .constant(.white),
                                fontColor: .constant(.blue))
                    }
                }
                
            }
        }
    }
}




