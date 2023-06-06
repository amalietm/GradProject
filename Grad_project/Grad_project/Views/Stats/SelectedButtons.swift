//
//  SelectedButtons.swift
//  Grad_project
//
//  Created by Amalie Morch on 23/04/2023.
//

//MARK: SELECTED BUTTONS 1
import SwiftUI

struct SelectedButtonsLevel: View {
    
//    VARIABLES
    @State private var FillButtonLeft = true
    @State private var FillButtonMiddle = false
    @State private var FillButtonRight = false
    
    var body: some View {
        
//        CONTENT
        VStack(spacing: 30){
            HStack {
//                BEGINNER
                FillButton(
                    isSelected: $FillButtonLeft,
                    FillButtonColor: .black,
                    FillButtonColorText: .white,
                    FillButtonTextLeft: "Beginner"
                )
                    
                .onTapGesture {
                    FillButtonLeft.toggle()
                    if FillButtonLeft {
                        FillButtonRight = false
                        FillButtonMiddle = false
                    } else{
                        FillButtonLeft = true
                    }
                }

//                MODERATE
                FillButton(
                    isSelected: $FillButtonMiddle,
                    FillButtonColor: .black,
                    FillButtonColorText: .white,
                    FillButtonTextMiddle: "Moderate")
                .onTapGesture {
                    FillButtonMiddle.toggle()
                    if FillButtonMiddle {
                        FillButtonRight = false
                        FillButtonLeft = false
                    } else{
                        FillButtonMiddle = true
                    }
                }
                
//                EXPERIENCED
                FillButton(
                    isSelected: $FillButtonRight,
                    FillButtonColor: .black,
                    FillButtonColorText: .white,
                    FillButtonTextRight: "Experienced")
                .onTapGesture {
                    FillButtonRight.toggle()
                    if FillButtonRight {
                        FillButtonLeft = false
                        FillButtonMiddle = false
                    } else{
                        FillButtonRight = true
                    }
                }
                
            }
        }
    }
}

//MARK: SELECTED BUTTONS 2
struct SelectedButtonTwo: View {

//    VARIABLES
    @State private var FillButtonLeft = true
    @State private var FillButtonRight = false
    
    var body: some View {
        
//        CONTENT
        VStack(spacing: 30){
//            WORKOUTS
            HStack {
                FillButton(
                    isSelected: $FillButtonLeft,
                    FillButtonColor: .black,
                    FillButtonColorText: .white,
                    FillButtonTextLeft: "Workouts"
                )
                .onTapGesture {
                    FillButtonLeft.toggle()
                    if FillButtonLeft {
                        FillButtonRight = false
                    } else{
                        FillButtonLeft = true
                    }
                }

//                DISTANCE
                FillButton(
                    isSelected: $FillButtonRight,
                    FillButtonColor: .black,
                    FillButtonColorText: .white,
                    FillButtonTextRight: "Distance")
                .onTapGesture {
                    FillButtonRight.toggle()
                    if FillButtonRight {
                        FillButtonLeft = false
                    } else{
                        FillButtonRight = true
                    }
                }

               Spacer()
                
            }
            .animation(.easeOut(duration: 0.3))
        }
    }
}

//MARK: SELCTED BUTTONS 3
struct SelectedButtons: View {
    
//    VARIABLES
    @State private var FillButtonLeft = true
    @State private var FillButtonMiddle = false
    @State private var FillButtonRight = false
    
    var body: some View {
//        CONTENT
        VStack(spacing: 30){
            HStack {
//            YES
                FillButton(
                    isSelected: $FillButtonLeft,
                    FillButtonColor: .black,
                    FillButtonColorText: .white,
                    FillButtonTextLeft: "yes"
                )
                    
                .onTapGesture {
                    FillButtonLeft.toggle()
                    if FillButtonLeft {
                        FillButtonRight = false
                        FillButtonMiddle = false
                    } else{
                        FillButtonLeft = true
                    }
                }
                
//              MAYBE
                FillButton(
                    isSelected: $FillButtonMiddle,
                    FillButtonColor: .black,
                    FillButtonColorText: .white,
                    FillButtonTextMiddle: "maybe")
                .onTapGesture {
                    FillButtonMiddle.toggle()
                    if FillButtonMiddle {
                        FillButtonRight = false
                        FillButtonLeft = false
                    } else{
                        FillButtonMiddle = true
                    }
                }
//                NO
                FillButton(
                    isSelected: $FillButtonRight,
                    FillButtonColor: .black,
                    FillButtonColorText: .white,
                    FillButtonTextRight: "no")
                .onTapGesture {
                    FillButtonRight.toggle()
                    if FillButtonRight {
                        FillButtonLeft = false
                        FillButtonMiddle = false
                    } else{
                        FillButtonRight = true
                    }
                }
                
            }
        }
    }
}

