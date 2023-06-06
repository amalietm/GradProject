//
//  WorkoutOverviewPost.swift
//  Grad_project
//
//  Created by Amalie Morch on 27/04/2023.
//
//MARK: WORKOUT OVERVIEW POST
import SwiftUI

struct WorkoutOverviewPost: View {

//    VARIABLES
    @State var interval: String
    @State var time: String
    @State var goal: String
    @State var notes: String = "Do you have any notes?"
    @State var selectedGoalValue = "KM"
    @State var environment: Bool
    
    @Binding var backgroundColor: Color
    @Binding var fontColor: Color
    
    let goalValue = ["Min", "KM", "Pace"]

    var body: some View {
//        CONTENT
        VStack {
            ToggleSwitchInactive(environment: $environment)
                .padding(.vertical)
//          Content
            VStack {
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
                        Text("\(time) min")
                    }
                }
                .padding(20)
                Divider()
                    .overlay(.black)
//                NOTES
                VStack(alignment: .leading){
                    Text("Notebook")
                        .padding([.vertical])
                        .fontWeight(.bold)
                    TextEditor(text: $notes)
                        .frame(height: 250).cornerRadius(10)
                        .colorMultiply(Color("LightGrey"))
                        .padding([.bottom, .horizontal])
                        .foregroundColor(Colors.blue)
                    
                }
                .padding([.horizontal])
                Divider()
                    .overlay(.black)
//                GOAL
                HStack{
                    Text("Goal")
                        .fontWeight(.bold)
                    Spacer()
                    TextField("", text: $goal)
                        .padding(10)
                        .background(Color(.gray).opacity(0.2).cornerRadius(10))
                        .frame(maxWidth: 80)
                        .padding(.vertical)
                        .foregroundColor(Colors.blue)
//                    GOAL VALUE
                    Picker("", selection: $selectedGoalValue) {
                        ForEach(goalValue, id: \.self) {
                            Text($0)
                        }
                    }
                    .colorInvert()
                    .colorMultiply(Colors.blue)
                    .pickerStyle(.wheel)
                    .frame(width: 70, height: 100)
                    Image(systemName: "checkmark.circle")
                        .font(Font.system(.title))
                }
                .padding([.horizontal])
                
                
            }
//           Styling
            .background(Rectangle()
                .fill(Color(.white))
                .shadow(
                    color: .black,
                    radius: CGFloat(0),
                    x: CGFloat(-7), y: CGFloat(7))
            )
            .border(.black)
            .padding([.horizontal])
            .padding(.vertical)
            
//          SYNCED VIEW
            SyncedView(buttonState: .spotify)
                .padding(.vertical)
            
//          BUTTON: START WORKOUT
            StartRunningButton(time: $time,
                               interval: $interval,
                               goal: $goal,
                               notes: $notes,
                               selectedGoalValue: $selectedGoalValue,
                               backgroundColor: $backgroundColor,
                               fontColor: $fontColor)
        }
    }
}

