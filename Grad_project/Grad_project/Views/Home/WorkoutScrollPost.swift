//
//  WorkoutScrollPost.swift
//  Grad_project
//
//  Created by Amalie Morch on 23/04/2023.
//

//MARK: WORKOUT SCROLL POST
import SwiftUI

struct WorkoutScrollPost: View {
    
//    VARIABLES
    @State var workoutLiked : Bool
    
    @Binding var likedWorkouts: [WorkoutModel]
    
    var title: String
    var interval: String
    var time: String
    var onLike: () -> Void

    var body: some View {
//        CONTENT
        NavigationStack {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(Colors.purple)
                    .frame(width: 200, height: 230)
                    .modifier(ShadowOpacityModifier(opacityShadow: .gray))
                
                    .overlay(
                        VStack {
                            VStack {
                                HStack {
//                                    TITLE
                                    Text(title)
                                        .font(.title2)
                                        .fontWeight(.semibold)
                                        .padding(.top)
                                        .padding(.leading, 10)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .frame(width: 140, height: 80)
                                    NavigationLink(destination: StartView()) {
                                        
//                                        LIKE
                                        Button(action: {
                                            onLike()
                                            self.workoutLiked.toggle()
                                        }) {
                                            Image(systemName: workoutLiked ? "heart.fill" : "heart")
                                                .foregroundColor(Colors.blue)
                                                .font(.title2)
                                                .frame(width: 10)
                                                .padding(.trailing)
                                                .frame(maxWidth: .infinity, alignment: .trailing)
                                        }
                                    }
                                    
                                }
                                .padding(.horizontal)
                                HStack {
//                                    INTERVAL
                                    VStack(alignment:.leading , spacing: 10) {
                                        Text("Interval")
                                            .textCase(.uppercase)
                                            .bold()
                                        Text(interval)
                                    }
                                    Spacer()
//                                    TIME
                                    VStack(alignment:.leading , spacing: 10) {
                                        Text("Time")
                                            .bold()
                                            .textCase(.uppercase)
                                        Text( "\(time) min")
                                    }
                                    
                                }
                                .padding(.horizontal, 20)
                            }
                            .foregroundColor(Colors.blue)
                            
//                          START
                            HStack{
                                Text("Start")
                                    .fontWeight(.semibold)
                                Image(systemName: "play")
                                    .padding(10)
                            }.tint(.black)
                                .padding([.horizontal])
                                .modifier(ShadowSolidModifier())
                                .border(.black)
                                .padding(.bottom, 20)
                                .frame(maxHeight: .infinity, alignment: .bottom)
                            
                        }
                    ).padding(.trailing)
            
        }
    }
}


