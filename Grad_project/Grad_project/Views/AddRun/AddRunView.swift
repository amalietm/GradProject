//
//  AddRunView.swift
//  Grad_project
//
//  Created by Amalie Morch on 21/04/2023.
//

//MARK: ADD RUN VIEW
import SwiftUI

struct AddRunView: View {
    
//    VARIABLES
    @Environment(\.dismiss) private var dismiss
    
    @Binding var interval: String
    @Binding var date: Date
    @Binding var time: String
    @Binding var environment: Bool
    @Binding var notes: String
    @Binding var goal: String
    @Binding var selectedGoalValue: String
    
    var body: some View {
//        CONTENT
        NavigationStack {
            ScrollView {
                VStack {
                    
                    AddRunFormView(interval: "10x10", notes: "i wasnt feeling it", goal: "5")
                    
//                    BUTTONS
                    HStack(spacing: 20) {
                        Button{
                            // Clear input fields
                            interval = ""
                            time = ""
                            environment = false
                            notes = ""
                            goal = ""
                        } label: {
                            Text("Clear")
                        }
                            .buttonStyle(LightSquareButtonStyle())
                        Button{
                            let newWorkout = WorkoutModel(title: "",
                                                          interval: interval,
                                                          time: time,
                                                          environment: environment,
                                                          notes: notes,
                                                          goal: goal)
                                            workouts.append(newWorkout)
                                            
                        } label: {
                            Text("Add")
                        }
                            .buttonStyle(DarkSquareButtonStyle())
                    }
                }
            }
            .padding(.top)
            
//            NAVIGATION
            .navigationTitle("Add run")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .tint(.black)
                    }
                }
            }
        }
    }

}

//  FUNCTIONS
    func clearInfo() {
        print("cleared")
    }
    func addInfo() {
        print("added")
    }



    
    

