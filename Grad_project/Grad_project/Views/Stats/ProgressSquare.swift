//
//  ProgressSquare.swift
//  Grad_project
//
//  Created by Amalie Morch on 26/04/2023.
//

//MARK: PROGRESS SQUARE
import SwiftUI

struct ProgressSquare: View {
    
//    VARIABLES
    var totalDistance: String
    var totalTime: String
    var totalWorkouts: String
    
    var body: some View {
//        CONTENT
        HStack {
//            DISTANCE
            if totalDistance.isEmpty {
                            Text("— KM")
                                .font(Font.system(.title3))
                                .fontWeight(.semibold)
                                .padding(10)
                        } else if let totalWorkoutsValue = Double(totalWorkouts) {
                            let formattedTotalWorkouts = String(format: "%.0f", totalWorkoutsValue)
                            Text("\(formattedTotalWorkouts) KM")
                                .font(Font.system(.title3))
                                .fontWeight(.semibold)
                                .padding(10)
                        } else {
                            // Handle the case where the conversion fails
                            Text("Invalid value")
                                .font(Font.system(.title3))
                                .fontWeight(.semibold)
                                .padding(10)
                        }
            Divider().frame(width: 2).overlay(.black)
//            TIME
            if totalTime.isEmpty {
                            Text("— MIN")
                                .font(Font.system(.title3))
                                .fontWeight(.semibold)
                                .padding(10)
                        } else if let totalWorkoutsValue = Double(totalWorkouts) {
                            let formattedTotalWorkouts = String(format: "%.0f", totalWorkoutsValue)
                            Text("\(formattedTotalWorkouts) MIN")
                                .font(Font.system(.title3))
                                .fontWeight(.semibold)
                                .padding(10)
                        } else {
                            // Handle the case where the conversion fails
                            Text("Invalid value")
                                .font(Font.system(.title3))
                                .fontWeight(.semibold)
                                .padding(10)
                        }
            Divider().frame(width: 2).overlay(.black)
//            WORKOUTS
            if totalWorkouts.isEmpty {
                            Text("— RUNS")
                                .font(Font.system(.title3))
                                .fontWeight(.semibold)
                                .padding(10)
                        } else if let totalWorkoutsValue = Double(totalWorkouts) {
                            let formattedTotalWorkouts = String(format: "%.0f", totalWorkoutsValue)
                            Text("\(formattedTotalWorkouts) RUNS")
                                .font(Font.system(.title3))
                                .fontWeight(.semibold)
                                .padding(10)
                        } else {
                            // Handle the case where the conversion fails
                            Text("Invalid value")
                                .font(Font.system(.title3))
                                .fontWeight(.semibold)
                                .padding(10)
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
        .border(.black).frame(height: 60)
    }
}
