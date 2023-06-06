//
//  WorkoutPost.swift
//  Grad_project
//
//  Created by Amalie Morch on 25/04/2023.
//

//MARK: RECENT WORKOUT POST
import SwiftUI

struct WorkoutPost: View {
    
//  VARIABLES
    @Binding var environment: Bool
    @Binding var date: Date
    @Binding var currentTime: String
    @Binding var notes: String
    @Binding var goal: String
    @Binding var valueGoalResults: String
    @Binding var selectedGoalValue: String
    @Binding var goalAchieved : Bool
    @Binding var interval: String
    
    var body: some View {
//      CONTENT
        VStack {
            HStack{
                HStack{
//                    WORKOUT
                    Text("RUN")
                    
//                    ENVIRONMENT
                    if !environment {
                        Text("(IN)")
                            .italic()
                    } else {
                        Text("(OUT)")
                            .italic()
                    }
                }
                .padding([.horizontal])
                Divider()
                    .frame(width:2, height: 70)
                    .overlay(.black)
                Text(date, style: .date)
                    .padding()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .fontWeight(.bold)
            .border(.black, width: 2)
            
                VStack(spacing: 10){
//                    INTERVAL
                    HStack()  {
                        Text("Interval")
                            .fontWeight(.semibold)
                        Spacer()
                        Text(interval)
                    }
//                    TIME
                    HStack()  {
                        Text("Time")
                            .fontWeight(.semibold)
                        Spacer()
                        Text(currentTime)
                    }
//                    DISTANCE
                    HStack()  {
                        Text("Distance")
                            .fontWeight(.semibold)
                        Spacer()
                    }
                }
                .padding(20)
                Divider()
                    .frame(width:.infinity, height: 2)
                    .overlay(.black)
                
//            NOTES
                VStack(alignment: .leading){
                    Text("Notebook")
                        .padding([.vertical])
                        .fontWeight(.bold)
                    TextEditor(text: $notes)
                        .frame(height: 250).cornerRadius(10)
                        .colorMultiply(Color("LightGrey"))
                        .padding([.bottom, .horizontal])
                        .foregroundColor(.gray)

                }
                .padding([.horizontal])
                Divider()
                    .frame(width:.infinity, height: 2)
                    .overlay(.black)
                
//              GOAL
                HStack{
                    Text("Goal")
                        .fontWeight(.bold)
                    Spacer()
//                    WORKOUT RESULT GOAL
                    Text("\(valueGoalResults)/\(goal) \(selectedGoalValue)")
                    .pickerStyle(.wheel)
                    .frame(width: 70, height: 100)
                    .padding(.horizontal, 20)
                    
//                    GOAL ACHIEVED
                    if valueGoalResults == goal {
                                        Image(systemName: "checkmark.circle.fill")
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                    } else {
                                        Image(systemName: "checkmark.circle")
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                    }
                }
                .padding([.horizontal])
        }
//      STYLING
        .background(Rectangle()
            .fill(Color(.white))
            .shadow(
                color: .black,
                radius: CGFloat(0),
                x: CGFloat(-7), y: CGFloat(7))
        )
        .border(.black)
        .padding([.horizontal])
        .padding([.bottom], 30)
    }
}


