//
//  ButtonViews.swift
//  Grad_project
//
//  Created by Amalie Morch on 03/05/2023.
//

//BUTTONS
import SwiftUI

//COLORS
struct Colors {
    static let blue = Color("Blue")
    static let purple = Color("Purple")
    static let lightGrey =  Color("LightGrey")
    static let green = Color("Green")
    static let nude = Color("Nude")
}

// LIGHT SQUARE BUTTON
struct LightSquareButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.black)
            .padding(.horizontal, 55)
            .padding(.vertical, 8)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .background(Rectangle()
                .fill(Color(.white))
                .shadow(
                    color: configuration.isPressed ? .black : .clear,
                    radius: CGFloat(0),
                    x: CGFloat(-7), y: CGFloat(7))
                .border(.black)
            )
    }
}

//DARK SQUARE BUTTON
struct DarkSquareButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .padding(.horizontal, 55)
            .padding(.vertical, 8)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .background(Rectangle()
                .fill(Color(.black))
                .shadow(
                    color: configuration.isPressed ? .black : .clear,
                    radius: CGFloat(0),
                    x: CGFloat(-7), y: CGFloat(7))
                    .border(.white)
            )
    }
}

//LIGHT CAPSULE BUTTON
struct LightCapsuleButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
            configuration.label
            .foregroundColor(.black)
            .padding(10)
            .background(.white)
            .cornerRadius(30)
            .overlay(
                RoundedRectangle(cornerRadius: 30)
                    .stroke(.black, lineWidth: 2)
                                    
                    )
            
    }
}

//DARK CAPSULE BUTTON
struct DarkCapsuleButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
        .foregroundColor(.white)
        .padding(10)
        .background(.black)
        .cornerRadius(30)
        .overlay(
            RoundedRectangle(cornerRadius: 30)
                .stroke(.white, lineWidth: 2)
                                
                )
    }
}

