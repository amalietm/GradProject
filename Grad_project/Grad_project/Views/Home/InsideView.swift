//
//  InsideView.swift
//  Grad_project
//
//  Created by Amalie Morch on 21/04/2023.
//

// MARK: INSIDE VIEW
import SwiftUI

struct InsideView: View {
    
//    VARIABLES
    @State private var showAlert = false
    
    var challenge: ChallengeModel = challenges[0]
    
    var body: some View {
//      CONTENT
        ScrollView {
            VStack(spacing: 20){
                ChallengeView(time: challenge.time,
                              title: challenge.title,
                              description: challenge.description)
                    .padding(.vertical)
                WorkoutScroll()
                makeWorkoutButton
            }
            
        }
    }
    
//    BUTTON - FEATURE YET TO COME
    var makeWorkoutButton: some View {
        Button {
            showAlert = true
        }
        label: {
            HStack {
                Text("Make your own")
                    .font(Font.system(.title3))
                    .fontWeight(.semibold)
                Spacer()
                Image(systemName: "plus")
                    .font(Font.system(.largeTitle))
            }
        }
        .tint(.black)
        .padding(.vertical, 7)
        .padding(.horizontal)
        .background(Rectangle()
            .fill(Color(.white))
            .shadow(
                color: .black,
                radius: CGFloat(0),
                x: CGFloat(-7), y: CGFloat(7))
        )
        .border(.black)
        .padding(.horizontal, 30)
        .padding(.vertical)
        .modifier(FeatureAlert(alertPresented: $showAlert))
    }
}

struct InsideView_Previews: PreviewProvider {
    static var previews: some View {
        InsideView()
    }
}
