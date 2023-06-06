//
//  WorkoutsView.swift
//  Grad_project
//
//  Created by Amalie Morch on 19/04/2023.
//

//MARK: RECENT WORKOUT VIEW
import SwiftUI

/* Future implementation
     text field to have more lines visible
     text field to start at top
 */

struct WorkoutsView: View {
//  VARIABLES
    
    @State private var notes: String = ""
    @State private var goal: String = ""
    @State var showAddRun = false
    
    @Environment(\.dismiss) private var dismiss
    
    @Binding var environment: Bool
    @Binding var date: Date
    @Binding var interval: String
    @Binding var currentTime: String
    @Binding var valueGoalResults: String
    @Binding var selectedGoalValue : String
    @Binding var goalAchieved: Bool
    
    var body: some View {
//      CONTENT
        NavigationStack {
            ScrollView {
                ForEach(1..<4) { index in
                    WorkoutPost(environment: $environment,
                                date: $date,
                                currentTime: $currentTime,
                                notes: $notes,
                                goal: $goal,
                                valueGoalResults: $valueGoalResults,
                                selectedGoalValue: $selectedGoalValue,
                                goalAchieved: $goalAchieved,
                                interval: $interval)
                }
                
            }
            .padding(.top, 20)
            
//          NAVIGATION
            .navigationTitle("Recent runs")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showAddRun.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
//                  SUB-VIEW: ADD RUN
                    .fullScreenCover(isPresented: $showAddRun, content: {
                        // do not add conditional logic
                        AddRunView(interval: $interval,
                                   date: $date,
                                   time: .constant(""),
                                   environment: $environment,
                                   notes: $notes,
                                   goal: $goal,
                                   selectedGoalValue: $selectedGoalValue)
                    })
                }
                
            }
            .tint(.black)
        }
    }
}


