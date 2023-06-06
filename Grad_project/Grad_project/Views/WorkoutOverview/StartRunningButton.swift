//
//  StartRunningButton.swift
//  Grad_project
//
//  Created by Amalie Morch on 27/04/2023.
//

//MARK: START RUNNING BUTTON
import SwiftUI

struct StartRunningButton: View {
    
//    VARIABLES
    @Binding var time: String
    @Binding var interval: String
    @Binding var goal: String
    @Binding var notes: String
    @Binding var selectedGoalValue: String
    @Binding var backgroundColor: Color
    @Binding var fontColor: Color
    
    var body: some View {
        
//        CONTENT
        NavigationStack {
//          LINK: BEGIN WORKOUT
            NavigationLink(destination: LoadingView(time: $time,
                                                    backgroundColor: $backgroundColor,
                                                    fontColor: $fontColor,
                                                    interval: $interval,
                                                    goal: $goal,
                                                    notes: $notes,
                                                    selectedGoalValue: $selectedGoalValue,
                                                    minutes: .constant(0)), label: {
                HStack {
                    Text("Start running")
                        .font(Font.system(.title3))
                        .fontWeight(.bold)
                    Spacer()
                    Divider()
                    //                    .frame(width:2, height: 45)
                    //                    .overlay(.black)
                    Image(systemName: "play.fill")
                        .padding()
                        .font(Font.system(.largeTitle))
                }
//              STYLING
                .frame(height: 60)
                .padding([.horizontal])
                .background(Rectangle()
                    .fill(Color(.white))
                    .shadow(
                        color: .black,
                        radius: CGFloat(0),
                        x: CGFloat(-7), y: CGFloat(7))
                )
                .tint(.black)
                .border(.black)
                .padding([.horizontal], 30)
            })
        }
    }
}

