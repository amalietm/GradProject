//
//  LoadingView.swift
//  Grad_project
//
//  Created by Amalie Morch on 30/04/2023.
//

//MARK: LOADING VIEW
import SwiftUI

/* Future implementation
    add beeps to countdown
 */

struct LoadingView: View {
    
//    VARIABLES
    @State var timeRemaining = 3
    @State private var showTimerView = false
    @State var showAlert: Bool = false
    @State var isActive = true
    
    @Binding var time: String
    @Binding var backgroundColor: Color
    @Binding var fontColor: Color
    @Binding var interval: String
    @Binding var goal: String
    @Binding var notes: String
    @Binding var selectedGoalValue: String
    @Binding var minutes: Int
    
    @Environment(\.presentationMode) var presentationMode
        
    // add delay
    let timer = Timer.publish(every: 1, tolerance: 0.5, on: .main, in: .common).autoconnect()

    var body: some View {
        
//        CONTENT
        NavigationStack {
            ZStack {
                backgroundColor.edgesIgnoringSafeArea(.all)
                VStack {
                    Text("\(timeRemaining)")
                        .font(.system(size: 150, weight: .bold))
                        .italic()
                        .foregroundColor(fontColor)
                    
                }
            }
            
//            COUNTDOWN
            .onReceive(timer) { time in
                guard isActive else { return }
                
                if timeRemaining > 0 {
                    timeRemaining -= 1
                }
                
                if timeRemaining == 0 {
                    showTimerView = true
                    timer.upstream.connect().cancel()
                }
            }
//            LINK: TIMER
            .navigationDestination(isPresented: $showTimerView) {
                TimerView(minutes: minutes,
                          description: "Seconds",
                          backgroundColor: $backgroundColor,
                          fontColor: $fontColor,
                          interval: $interval,
                          goal: $goal,
                          notes: $notes,
                          selectedGoalValue: $selectedGoalValue,
                          recordedDistance: "—",
                          recordedBPM: "—",
                          time: $time)

            }
            
//            NAVIGATION
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showAlert.toggle()
                        isActive = false
                    } label: {
                        Image(systemName: "xmark")
                            .tint(fontColor)
                    }
                    .alert(isPresented: $showAlert, content: {
                        getAlert()
                    })
                }
            }
        }
    }
    
//    FUNCTION
    func getAlert() -> Alert {
        return Alert(
            title: Text("This workout will not be saved if you choose to stop now."),
            message: Text("Do you wish to stop the workout?"),
            primaryButton: .destructive(Text("Stop")) {
                presentationMode.wrappedValue.dismiss()
            },
            secondaryButton: .cancel(Text("Cancel")){
                isActive = true
            }
        )
    }
}


