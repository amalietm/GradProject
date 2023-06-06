//
//  SavedViewPost.swift
//  Grad_project
//
//  Created by Amalie Morch on 24/04/2023.
//

// MARK: SAVED VIEW POST
import SwiftUI

struct SavedViewPost: View {
    
//    VARIABLES
    @Binding var title: String
    @Binding var environment: Bool
    @Binding var interval: String
    @Binding var time: String
    @Binding var workoutLiked : Bool
    @Binding var backgroundColor : Color
    @Binding var fontColor: Color
    @Binding var likedWorkouts: [WorkoutModel]
    
    var body: some View {
//        CONTENT
        VStack{
            VStack {
                HStack {
//                    WORKOUT
                    HStack(spacing: 20){
                        Text("RUN")
                            .padding(.horizontal)
//                        ENVIRONMENT
                        Text(environment ? "(OUT)" : "(IN)")
                            .italic()
                    }
                    .frame(minWidth: 140)
                    .fontWeight(.semibold)
                    Divider()
                        .frame(width:2, height: 70)
                        .overlay(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    HStack(spacing: 25) {
                        
//                        LINK: COUNTDOWN WORKOUT
                        NavigationLink {
                            LoadingView(time: $time,
                                        backgroundColor: $backgroundColor,
                                        fontColor: $fontColor,
                                        interval: $interval,
                                        goal: .constant(""),
                                        notes: .constant(""),
                                        selectedGoalValue: .constant(""),
                                        minutes: .constant(0))
                        } label: {
//                            PLAY
                            Image(systemName: "play.fill")
                                .font(.title2)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal)
                        }
                        Divider()
                            .frame(width:2, height: 70)
                            .overlay(.black)
                        
//                        LIKED
                        Image(systemName: workoutLiked ? "heart.fill" : "heart")
                        // if heart toggled -> remove from array
                            .font(.title2)
                            .padding()
                    }
                    }
                    .padding(.horizontal)
                    .border(.black, width: 2)
                
                HStack{
                    VStack(spacing: 10)  {
//                        INTERVAL
                        HStack {
                            Text("Interval")
                            Spacer()
                            Text(interval)
                        }
                        HStack {
//                            TIME
                            Text("Time")
                            Spacer()
                            Text("\(time) MIN")
                        }
                    }
                    .padding()
                    .fontWeight(.semibold)
                }
                .padding(.horizontal)
                .padding(.bottom)
        }
    }
//        STYLING
         .background(Rectangle()
             .fill(Color(.white))
             .shadow(
                 color: .black,
                 radius: CGFloat(0),
                 x: CGFloat(-7), y: CGFloat(7))
             )
             .border(.black)
             .padding(.bottom, 20)
             .padding(.horizontal, 30)
    }
    
}

