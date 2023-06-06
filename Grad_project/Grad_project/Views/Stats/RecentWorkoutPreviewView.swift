//
//  RecentWorkoutPreviewView.swift
//  Grad_project
//
//  Created by Amalie Morch on 26/04/2023.
//

//RECENT WORKOUT MINI
import SwiftUI

struct RecentWorkoutPreviewView: View {
    
//    VARIABLES
    @Binding var interval: String
    @Binding var environment: Bool
    @Binding var currentTime: String
    @Binding var goal: String
    @Binding var selectedGoalValue: String
    @Binding var valueGoalResults: String
    
    var lastWorkout: WorkoutModel? {
            workouts.last
        }
    
    var body: some View {
        // CONTENT
        VStack {
            HStack {
                Text("Recents")
                    .font(.title2)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.horizontal], 30)
                
//                LINK: WORKOUT
                NavigationLink(destination: WorkoutsView(environment: $environment,
                                                         date: .constant(Date()),
                                                         interval: $interval,
                                                         currentTime: $currentTime,
                                                         valueGoalResults: $valueGoalResults,
                                                         selectedGoalValue: $selectedGoalValue,
                                                         goalAchieved: .constant(false)),
                               label:{
                    Image(systemName: "arrow.right")
                        .font(.title)
                        .padding()
                        .padding(.horizontal)
                        .tint(.black)
                })
                
            }
            
//            ENVIRONEMENT
            VStack(alignment: .leading) {
                HStack {
                    if let lastWorkout = lastWorkout {
                        Text(lastWorkout.environment ? "OUT" : "IN")
                            .fontWeight(.bold)
                            .font(.title2)
                            .padding()
                    }
                                    
                Spacer()
                Spacer()
                          
//                INTERVAL
                VStack(alignment: .trailing, spacing: 5) {
                    Text("Interval")
                        .fontWeight(.bold)
                    
                    if let lastWorkout = lastWorkout {
                        Text(lastWorkout.interval)
                    }
                }
                        
                    Spacer()
                    
//                TIME
                VStack(alignment: .trailing, spacing: 5) {
                    Text("Time")
                        .fontWeight(.bold)
                    
                    if let lastWorkout = lastWorkout {
                        Text(lastWorkout.time)
                    }
                }
                
                .padding([.trailing], 40)
                }
                
//               GOAL
                if let lastWorkout = lastWorkout {
                    HStack {
                        Text("Goal")
                            .fontWeight(.bold)
                        
                        Spacer()
                        if goal.isEmpty {
                            Text("—")
                        } else {
                            Text("\(valueGoalResults) / \(lastWorkout.goal) \(selectedGoalValue)")
                        }
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(
                        Rectangle()
                            .fill(Color(.black))
                    )
                }
            }
            .padding(.top)
            .border(.black)
            .padding([.horizontal], 40)
        }
    }
}
