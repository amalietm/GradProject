//
//  TimerView.swift
//  Grad_project
//
//  Created by Amalie Morch on 26/04/2023.
//

//MARK: TIMER VIEW
import SwiftUI

/* Future implementation
    components to play sounds and videos
 */

struct TimerView: View {
    
//    VARIABLES
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State var pause = false
    @State var minutes: Int = 00
    @State var seconds: Int = 00
    @State var description: String = "Seconds"
    @State var isActive = true
    
    @State var showSummary = false
    @State var isAnimating: Bool = false
    @State var showAlert: Bool = false
    @State var recordedDistance: String
    @State var recordedBPM: String
    @State var currentTime: String = ""
    
    @Binding var backgroundColor: Color
    @Binding var fontColor: Color
    @Binding var interval: String
    @Binding var goal: String
    @Binding var notes: String
    @Binding var selectedGoalValue: String
    @Binding var time: String
    
    @Environment(\.scenePhase) var scenePhase
    
    var body: some View {
//        CONTENT
        NavigationStack {
            ZStack{
                backgroundColor.edgesIgnoringSafeArea(.all)
                VStack{
//                    Timer
                    Text("\(minutes, specifier: "%02d"):\(seconds, specifier: "%02d")")
                        .onReceive(timer) { _ in
                            guard isActive else { return }
                            if !pause {
                                self.seconds += 1
                                if self.seconds == 60 {
                                    self.seconds = 0
                                    self.minutes += 1
                                    description = "Minutes"
                                }
//
                                // Check if the current time matches the binding time
                                if minutes == Int(time){
                                    // Stop the timer by setting isActive to false
                                    currentTime = "\(self.minutes):\(self.seconds)"
                                    isActive = false
                                    showSummary = true
                                }
                            }
                        }
//                    SUB-VIEW: WORKOUT SUMMARY
                        .fullScreenCover(isPresented: $showSummary, content: {
                            // do not add conditional logic
                            SummaryView(valueGoalResults: "", interval: $interval,
                                        time: $time,
                                        recordedDistance: $recordedDistance,
                                        notes: $notes,
                                        currentTime: $currentTime,
                                        goal: $goal,
                                        selectedGoalValue: $selectedGoalValue,
                                        minutes: $minutes,
                                        seconds: $seconds)
                        })
                      
                        .font(.system(size: 80, weight: .bold))
                    
//                    TIME VARIABLE
                        Text(description)
                            .font(.system(size: 40, weight: .bold))
                            .onChange(of: scenePhase) { newPhase in
                                if newPhase == .active {
                                    isActive = true
                                } else {
                                    isActive = false
                                }
                            }
                }
                
//              If workout is paused or played
                if pause  {
                    pauseScreen
                        .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .trailing)))
                        .animation(.easeIn(duration: 0.2))
                }
                else {
                    playScreen
                        .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .leading)))
                        .animation(.easeIn(duration: 0.2))
                }
            }
            .toolbar(.hidden)
            .foregroundColor(fontColor)
        }
    }
    
//    PAUSE VIEW
    var pauseScreen: some View {
//        CONTENT
        NavigationStack {
            VStack {
                ZStack{
//                    WORKOUT
                    Text("RUN")
                        .italic()
                        .padding(.horizontal)
                        .frame(maxHeight: .infinity, alignment: .topLeading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 80, weight: .bold))
                }
                HStack {
//                   PLAY BUTTON
                    Button {
                        pause.toggle()
                    } label: {
                        Image(systemName: "play.circle.fill")
                        Spacer()
                    }
                    .font(.system(size: 80, weight: .regular))
                    
//                    STOP BUTTON
                    Button {
                        showAlert.toggle()
                    } label: {
                        Image(systemName: "stop.circle.fill")
                            .font(.system(size: 80, weight: .regular))
                    }
                    
//                    ALERT
                    .alert(isPresented: $showAlert, content: {
                        getAlert()
                    })
                    
//                  SUB-VIEW: WORKOUT SUMMARY VIEW
                    .fullScreenCover(isPresented: $showSummary, content: {
                        // do not add conditional logic
                        SummaryView(interval: $interval,
                                    time: $time,
                                    recordedDistance: $recordedDistance,
                                    notes: $notes,
                                    currentTime: $currentTime,
                                    goal: $goal,
                                    selectedGoalValue: $selectedGoalValue,
                                    valueGoalResults: "",
                                    minutes: $minutes,
                                    seconds: $seconds)
                    })

                    
                }
                .tint(.black)
                .padding(.horizontal, 40)
                
            }
            .toolbar(.hidden)
        }
    }

//    PLAY VIEW
    var playScreen: some View {
//        CONTENT
        NavigationStack {
            VStack{
                HStack {
//                    BPM
                    VStack(spacing: 20) {
                        Text(recordedBPM)
                            .fontWeight(.semibold)
                        Text("BPM")
                    }
                    Spacer()
//                    DISTANCE
                    VStack(spacing: 20)  {
                        // make so in right format if less than 1k
                        Text("\(recordedDistance) KM")
                            .fontWeight(.semibold)
                        Text("Distance")
                    }
                    Spacer()
//                    INTERVAL
                        if interval.isEmpty {
                            Text("")
                        } else {
                            VStack(spacing: 20)  {
                                Text(interval)
                                    .fontWeight(.semibold)
                                Text("Interval")
                            }
                        }
                }
                .font(.system(size: 25, weight: .regular))
                .padding(.vertical)
                .padding(.horizontal, 30)

//                PAUSE BUTTON
                Spacer()
                Button{
                    pause.toggle()
                    
                } label: {
                    Image(systemName: "pause.circle.fill")
                        .font(.system(size: 80, weight: .regular))
                        .tint(.black)
                }
            }
            .toolbar(.hidden)
        }
        }
    
    //    ALERT
        func getAlert() -> Alert {
            return Alert(
                title: Text("You are stopping an ongoing workout."),
                message: Text("Do you wish to stop?"),
                primaryButton: .destructive(Text("Finish"), action: {
                    currentTime = "\(self.minutes):\(self.seconds)"
                    showSummary = true
                }),
                secondaryButton: .cancel(Text("Cancel"), action: {
                    pause.toggle()
                }))
        }
}



