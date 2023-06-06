//
//  ChallengeView.swift
//  Grad_project
//
//  Created by Amalie Morch on 23/04/2023.
//

//MARK: CHALLENGE VIEW
import SwiftUI

struct ChallengeView: View {

//    VARIABLES
    @State var time: String
    @State var backgroundColor = Colors.blue
    @State var fontColor = Color.white
    
    var title: String
    var description: String
    
    var body: some View {
        
//        CONTENT
        ZStack {
//          INFO
            VStack(alignment: .leading, spacing: 20){
//                TITLE
                HStack {
                    Text(title)
                    Spacer()
                    Text("\(time) MIN")
//                    Text("\(time) MIN")
                }
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(Colors.purple)
                
                Text(description)
                .foregroundColor(.white)
                .font(.title3)
                
//              LINK TO WORKOUT
                NavigationLink {
                    LoadingView(time: $time, backgroundColor: $backgroundColor, fontColor: $fontColor, interval: .constant(""), goal: .constant(""), notes: .constant(""), selectedGoalValue: .constant(""), minutes: .constant(0))
                } label: {
                    Text("Start ")
                    Image(systemName: "play.circle.fill")
                        .padding(10)
                }
                .font(.title3)
                .foregroundColor(Colors.blue)
                .frame(maxWidth: .infinity)
                .background(Colors.purple)
                .cornerRadius(10)
                .fontWeight(.semibold)
            }
            .padding()
            
//          STYLING
            .background(RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Colors.blue)
                .modifier(ShadowOpacityModifier(opacityShadow: Colors.blue))
            )
            Text("NEW")
                .font(.caption)
                .foregroundColor(.white)
//                .padding(.vertical, 10)
                .padding(20)
                .background(
                    Circle()
                        .foregroundColor(.black)
                )
                .frame(maxWidth: .infinity, alignment: .trailing)
                .offset(x: 10, y: -95)
        }
        .padding(.horizontal)
    }
}




            
    
