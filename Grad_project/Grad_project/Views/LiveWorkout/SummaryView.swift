//
//  WorkoutSummaryView.swift
//  Grad_project
//
//  Created by Amalie Morch on 26/04/2023.
//

//MARK: SUMMARY VIEW
import SwiftUI

struct SummaryView: View {

//    VARIABLES
    @Environment(\.dismiss) var dismiss
    
    @State var performance: Double = 2
    @State var valueGoalResults: String = "3"
    
    @Binding var interval: String
    @Binding var time: String
    @Binding var recordedDistance: String
    @Binding var notes: String
    @Binding var currentTime: String
    @Binding var goal: String
    @Binding var selectedGoalValue: String
    @Binding var minutes: Int
    @Binding var seconds: Int

    
    var body: some View {
//        CONTENT
        NavigationStack {
            
            VStack{
//                WORKOUT
                Text("RUN")
                    .italic()
                    .font(.system(size: 80, weight: .bold))
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, alignment: .leading)
                HStack {
//                    MAP
                    Image("Map")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200)
                        .padding(.bottom)
                    VStack(alignment: .leading, spacing: 20) {
//                        DATA SUMMARIZED
//                        INTERVAL
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Interval")
                                .fontWeight(.semibold)
                            Text(interval)
                        }
//                        DISTANCE
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Distance")
                                .fontWeight(.semibold)
                            Text("\(recordedDistance) KM")
                        }
//                        TIME
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Time")
                                .fontWeight(.semibold)
                            Text(currentTime)
                        }
                        
                    }
                    .padding(20)
                }
                .font(.body)
                VStack {
//                    GOAL AND RESULTS
                    HStack {
                        Text("Goal for workout")
                        Spacer()
                        if goal.isEmpty {
                            Text("")
                        } else {
                            Text("\(valueGoalResults)/\(goal) \(selectedGoalValue)")
                                .textCase(.uppercase)
                        }
                    }
                        .font(Font.system(.title3))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(20)
                    
//                    GOAL SLIDER
                    Slider(value: Binding(
                        get: {
                            let parsedGoal = Double(goal) ?? 1
                            return (Double(valueGoalResults) ?? 0 / parsedGoal) * 100
                        },
                        set: { _ in }
                    ), in: 0...100, step: 1.0)
                    .disabled(true)
                    .colorMultiply(Color.blue)
                    .padding()

                    .disabled(true)
                    .colorMultiply(Color.blue)
                    .padding()
                }
                
//                STYLING
                .frame(width: 340, height: 180)
                .background(.black, in:RoundedRectangle(cornerRadius: 10))
                .shadow(color: Color.black.opacity(0.4), radius: 10, x: 0, y: 7)
                
//                NOTES
                VStack(alignment: .leading){
                    // update notes if anything is added
                    Text("Notes")
                        .padding()
                        .font(.title2)
                        .fontWeight(.bold)
                    TextEditor(text: $notes)
                        .font(.body)
                        .foregroundColor(.gray)
                        .frame(height: 100).cornerRadius(10)
                        .colorMultiply(Color("LightGrey"))
                        .padding([.bottom, .horizontal])
                    //                        .foregroundColor(Color("Orange"))
                }
                .padding(.top)
                .padding([.horizontal])
            }
            .foregroundColor(.black)
            
//            NAVIGATION
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: StatsView(totalDistance: .constant(""),
                                                          totalTime: .constant(""),
                                                          totalWorkouts: .constant(""),
                                                          interval: $interval,
                                                          valueGoalResults: $valueGoalResults,
                                                          currentTime: $currentTime,
                                                          selectedGoalValue: $selectedGoalValue),
                    
                        label: {
                        Button {
                           dismiss()
                        } label: {
                            Image(systemName: "xmark")
                                .tint(.black)
                                .font(.body)
                        }
                    })
                }
            }
            .foregroundColor(.black)
            .onAppear {
                updateValueGoalResults()
            }
        }
    }
    
//    FUNCTION
    func updateValueGoalResults() {
        if selectedGoalValue == "KM" {
            valueGoalResults = String(Double(recordedDistance) ?? 0)
        } else if selectedGoalValue == "MIN" {
            let totalSeconds = minutes * 60 + seconds
            valueGoalResults = String(totalSeconds)
        } else {
            valueGoalResults = "?"
        }
    }

}

