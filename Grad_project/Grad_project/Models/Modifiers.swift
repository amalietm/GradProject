//
//  Modifiers.swift
//  Grad_project
//
//  Created by Amalie Morch on 05/06/2023.
//

//MARK: MODIFIERS
import SwiftUI

struct Modifiers: View {
    var body: some View {
        Text("")
    }
}

//SHADOW OPACITY
struct ShadowOpacityModifier: ViewModifier {
    
    var opacityShadow : Color
    func body(content: Content) -> some View {
        content
            .shadow(color: opacityShadow.opacity(0.6), radius: 7, x: -3, y: 4)
    }
}

//SHADOW SOLID
struct ShadowSolidModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
        .background(Rectangle()
            .fill(Color(.white))
            .shadow(
                color: .black,
                radius: CGFloat(0),
                x: CGFloat(-7), y: CGFloat(7))
        )
        .border(.black)
    }
}

//ALERT
struct FeatureAlert: ViewModifier {
    @Binding var alertPresented: Bool
    
    func body(content: Content) -> some View {
        content
            .alert("This feature is yet to come", isPresented: $alertPresented) {
                Button("OK", role: .cancel) { }
            }
    }
}
