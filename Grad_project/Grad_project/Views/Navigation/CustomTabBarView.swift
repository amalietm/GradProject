//
//  CustomTabBarView.swift
//  Grad_project
//
//  Created by Amalie Morch on 25/04/2023.
//

// add click events for buttons

import SwiftUI

//MARK: NAVIGATIONVIEW
struct CustomTabBarView: View {
    
//    VARIABLES
    @State var selectedIndex = 0
    
    let icons = [
    "figure.run",
    "chart.bar.fill",
    "plus.circle.fill",
    "list.clipboard",
    "heart.fill"]

//    TAB SECTIONING
    var body: some View {
        VStack {
                switch selectedIndex {
//                HOME
                case 0:
                    HomeView()
//                STATS
                case 1:
                    StatsView(totalDistance: .constant(""), totalTime: .constant(""), totalWorkouts: .constant(""), interval: .constant(""), valueGoalResults: .constant(""), currentTime: .constant(""), selectedGoalValue: .constant(""))
//                START WORKOUT
                case 2:
                    StartView()
//                RECENT WORKOUTS
                case 3:
                    WorkoutsView(environment: .constant(false), date: .constant(Date()), interval: .constant(""), currentTime: .constant(""), valueGoalResults: .constant(""), selectedGoalValue: .constant(""), goalAchieved: .constant(false))
//                SAVED
                default:
                    SavedView(time: .constant(""), interval: .constant(""), environment: .constant(false))
                }

//            STYLING
            RoundedRectangle(cornerRadius: 30)
            .stroke(.gray, lineWidth: 1)
            .background(.white)
            .frame(height: 70)
            .overlay(
                HStack {
                    ForEach(0..<5, id: \.self) { number in
                        Spacer()
                        Button(action: {
                            self.selectedIndex = number
                        }, label: {
                            
                            if number == 2 {
                                Image(systemName: "plus.circle.fill")
                                    .font(.system(
                                        size: 55,
                                        weight: .thin,
                                        design: .default))
                                    .foregroundColor(Colors.blue)
                                
                            } else {
                                Image(systemName: icons[number])
                                    .font(.title2)
                                    .foregroundColor(selectedIndex == number ? .black : .gray)
                                    .scaleEffect(selectedIndex == number ? 1.25 : 1.0)
                                    .onTapGesture {
                                        withAnimation(.easeIn(duration: 0.1)) {
                                            selectedIndex = number
                                        }
                                    }
                            }
                        })
                        
                    }
                    Spacer()
                }
                )
                .padding([.bottom, .horizontal])
        }
    }
}

struct CustomTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBarView()
    }
}
