//
//  StartView.swift
//  Grad_project
//
//  Created by Amalie Morch on 06/06/2023.
//

//MARK: START VIEW
import SwiftUI

struct StartView: View {
    
//    VARIABLES
    @State var isPressed = false
    @State var yOffset: CGFloat = 0
    @State var backgroundColor = Colors.purple
    @State var fontColor = Colors.blue
    
    var body: some View {
        
//        CONTENT
        NavigationStack {
            ZStack {
                backgroundColor.edgesIgnoringSafeArea(.all)
//                LINK: LOADING VIEW
                NavigationLink(destination: LoadingView(time: .constant("30"),
                                                        backgroundColor: $backgroundColor,
                                                        fontColor: $fontColor,
                                                        interval: .constant(""),
                                                        goal: .constant(""),
                                                        notes: .constant(""),
                                                        selectedGoalValue: .constant(""), minutes: .constant(0))) {
                    Text("Start")
                        .font(.system(size: 110, weight: .bold))
                        .italic()
                        .foregroundColor(fontColor)
                        .offset(y: yOffset)
                        .onAppear {
                            withAnimation(Animation.easeInOut(duration: 1).repeatForever()) {
                                yOffset = 50
                            }
                        }
                }
            }
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
