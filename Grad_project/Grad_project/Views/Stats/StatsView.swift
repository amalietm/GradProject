//
//  combinedGraphAttempt.swift
//  Grad_project
//
//  Created by Amalie Morch on 24/05/2023.
//

//MARK: STATS VIEW
import SwiftUI

struct StatsView: View {

//  VARIABLES
    var tabs = ["Weekly", "Monthly"]
    var textElements = ["Workouts", "Running distance"]
    
    @State var selectedTab = "Weekly"
    @State private var selectedText = "Workouts"
    @State var showAddRun : Bool = false
    @State private var streakCounter = 0
    
    @Binding var totalDistance: String
    @Binding var totalTime: String
    @Binding var totalWorkouts: String
    @Binding var interval: String
    @Binding var valueGoalResults: String
    @Binding var currentTime: String
    @Binding var selectedGoalValue: String


    var body: some View {
//      CONTENT
        NavigationStack {
            ScrollView(){
                VStack {
                    
                    SegementedPicker(selected: $selectedTab, options: tabs)
                        .padding()
                    
                    combinedGraph2(totalDistance: totalDistance, totalTime: totalTime, totalWorkouts: totalWorkouts, streakCounter: $streakCounter, selectedTab: $selectedTab, data: workoutData[selectedTab] ?? [])
                        .padding()
                    RecentWorkoutPreviewView(interval: $interval, environment: .constant(false), currentTime: $currentTime, goal: .constant(""), selectedGoalValue: $selectedGoalValue, valueGoalResults: $valueGoalResults)
                    //                .animation(.easeOut(duration: 0.5), value: selectedTab)
                }
//              SUB-VIEW
                .fullScreenCover(isPresented: $showAddRun, content: {
                    // do not add conditional logic
                    AddRunView(interval: $interval, date: .constant(Date()), time: .constant("hello"), environment: .constant(true), notes: .constant("hello"), goal: .constant(""), selectedGoalValue: $selectedGoalValue)
                })
//              NAVIGATION
                .navigationTitle("Statistics")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            showAddRun.toggle()
                        } label: {
                            Image(systemName: "plus")
                                .tint(.black)
                        }
                    }
                    
                }
            }
        }
        
    }

}

//MARK: GRAPH
struct combinedGraph2: View {

//  VARIABLES
    @State var selected: Int?
    @State var showAlert = false
    @State private var previousTab: String = ""
    @State var totalDistance: String
    @State var totalTime: String
    @State var totalWorkouts: String
    @State private var selectedWorkoutMin: CGFloat?
    
    @Binding var streakCounter: Int
    @Binding var selectedTab: String

    var data: [Daily]
    var colors = [Colors.purple, Colors.blue]
    
    var body: some View {
//      CONTENT
//      Bar chart
        VStack(alignment: .leading, spacing: 25) {
            ScrollViewReader { scrollViewProxy in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        ForEach(data) { work in
                            // bars
                            VStack {
                                VStack {
                                    Spacer(minLength: 0)
//                                  Styling
                                    if let graphText = getTextAboveGraph(work: work) {
                                            Text(graphText)
                                                .foregroundColor(Colors.blue)
                                                .bold()
                                                .padding(.bottom, 5)
                                    }
                     
                                    RoundedRectangle(cornerRadius: 10)
                                            .fill(getBarColor(work: work))
                                            .frame(width: 30, height: getHeight(value: work.workoutMin))
                                    

                                }
                                .frame(height: 230)
                                .onTapGesture {
                                    withAnimation(.easeOut) {
                                        selected = work.id
                                    }
                                }
                                if selectedTab == "Monthly" {
                                    Text(work.day)
                                        .font(.caption)
                                        .foregroundColor(Colors.blue)
                                }
                            }
                            .onAppear {
                                scrollViewProxy.scrollTo(work.id, anchor: .trailing)
                            }
                            
                        }
                    }
                }

                .onChange(of: selectedTab) { _ in
                    selectedWorkoutMin = nil
                }
            }
            
//          SELECTED TAB
            Text(selectedTab == "Weekly" ? "Weeks" : "Months")
                .font(.title)
                .italic()
                .bold()
                .foregroundColor(Colors.purple)
            
//          BUTTONS - feature choice of filtering
            HStack {
                Text("Workouts")
                    .foregroundColor(.white)
                    .background(.black)
                    .padding(10)
                    .padding(.horizontal, 10)
                    .background(
                        RoundedRectangle(cornerRadius: 30)
                            
                    )
                Button{
                    showAlert = true
                } label: {
                    Text("Distance")
                        .foregroundColor(.gray)
                        .padding(10)
                        .padding(.horizontal, 10)
                        .background(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(.gray, lineWidth: 2)
                        )
                }
                
                .modifier(FeatureAlert(alertPresented: $showAlert))
            }
        }
        .padding()
        .cornerRadius(10)
        .padding()
        
//      STREAK CIRCLES
        streakCircle(streakCounter: $streakCounter, selectedTab: $selectedTab)
        Spacer()
        ProgressSquare(totalDistance: totalDistance, totalTime: totalTime, totalWorkouts: totalWorkouts)
            .padding(.bottom, 30)

    }
    
//  FUNCTIONS
    func getHeight(value: CGFloat) -> CGFloat {
        guard let tabData = workoutData[selectedTab] else {
            return 0
        }
        
        let maxWorkoutMin = tabData.max(by: { $0.workoutMin < $1.workoutMin })?.workoutMin ?? 0
        let maxHeight: CGFloat = 200
        
        if maxWorkoutMin > 0 {
            let scaledHeight = (value / maxWorkoutMin) * maxHeight
            return min(scaledHeight, maxHeight)
        }
        return 0
    }
    
    func getBarColor(work: Daily) -> Color {
        if selected == work.id {
            return Colors.purple
        } else if work.id == data.last?.id && selected == nil {
            return Colors.purple
        } else {
            return Colors.blue
        }
    }
    
    func getTextAboveGraph(work: Daily) -> String? {
        if selected == work.id || (work.id == data.last?.id && selected == nil) {
            if work.workoutMin > 0 {
                if selected == work.id && (selectedWorkoutMin == nil || work.workoutMin > selectedWorkoutMin!) {
                    selectedWorkoutMin = work.workoutMin
                    streakCounter = Int(work.workoutMin)
                }
                return String(format: "%.0f", work.workoutMin)
            }
        }
        return nil
    }
}

//MARK: STREAK CIRCLE
struct streakCircle: View {
    
//  VARIABLES
    @Binding var streakCounter: Int
    @Binding var selectedTab: String
    
    var highestValue: CGFloat {
            guard let tabData = workoutData[selectedTab] else {
                return 0
            }
            return tabData.map { $0.workoutMin }.max() ?? 0
        }
    
    var body: some View {
//      CONTENT
        VStack {
            HStack(spacing: 30) {
                Spacer()
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Current")
                        .font(.body)
                        .foregroundColor(.gray)
                    Text("🔥\(streakCounter)")
                            .bold()
                            .italic()
                }
                .overlay(
                    Circle()
                        .stroke(Colors.blue, lineWidth: 10)
                        .frame(width: 130, height: 130)
                )
                Spacer()
                Spacer()
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Best")
                        .font(.body)
                        .foregroundColor(.gray)
                    Text("👟\(String(format: "%.0f", highestValue))")
                        .bold()
                        .italic()
                }
                .overlay(
                    Circle()
                        .stroke(Colors.blue, lineWidth: 10)
                        .frame(width: 130, height: 130)
                )
                Spacer()
                
            }
            .font(.title)
            .padding()
            .padding(.vertical, 30)
            .frame(maxHeight: 70)
        }
        .onAppear {
                    updateStreakCounter()
                }
                .onChange(of: selectedTab) { _ in
                    updateStreakCounter()
                }
    }
    
//  FUNCTION
    private func updateStreakCounter() {
            guard let tabData = workoutData[selectedTab] else {
                return
            }
            
            let lastWorkoutMin = tabData.last?.workoutMin ?? 0
            streakCounter = Int(lastWorkoutMin)
        }
    
}




