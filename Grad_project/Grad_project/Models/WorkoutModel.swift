//
//  WorkoutModel.swift
//  Grad_project
//
//  Created by Amalie Morch on 05/06/2023.
//
//MARK: MODELS
import Foundation

// WORKOUT MODEL
struct WorkoutModel: Identifiable {
    let id = UUID()
    var title: String
    var interval: String
    var time: String
    var environment: Bool
    var notes: String
    var goal: String
}

// WORKOUTS
var workouts = [
    WorkoutModel(title: "Slow death", interval: "1.5x10", time: "20", environment: false, notes: "", goal: ""),
    WorkoutModel(title: "Only half bad", interval: "40x20x10", time: "10", environment: false, notes: "", goal: ""),
    WorkoutModel(title: "Sweaty mess", interval: "4x4", time: "10", environment: false, notes: "", goal: ""),
]

//CHALLENGE MODEL
struct ChallengeModel: Identifiable {
    let id: String = UUID().uuidString
    var title: String
    var time: String
    var description: String
}

// CHALLENGES
var challenges = [
    ChallengeModel(title: "Pain", time: "10", description: "A lay-down-on-the-floor moment")
]

//GRAPH MODEL
struct Daily: Identifiable, Equatable {
    var id : Int
    var day: String
    var workoutMin: CGFloat
}

//GRAPH DATA - WOULD BE COLLECTED IN FUTURE
var workoutData = [
    "Weekly" : [
        Daily(id: 0, day: "Week 1", workoutMin: 4),
        Daily(id: 1, day: "Week 2", workoutMin: 5),
        Daily(id: 2, day: "Week 3", workoutMin: 7),
        Daily(id: 3, day: "Week 4", workoutMin: 3),
        Daily(id: 4, day: "Week 5", workoutMin: 6),
        Daily(id: 5, day: "Week 6", workoutMin: 7),
        Daily(id: 6, day: "Week 7", workoutMin: 2),
        Daily(id: 7, day: "Week 8", workoutMin: 1)],
    "Monthly" : [
        Daily(id: 8, day: "Jan", workoutMin: 26),
        Daily(id: 9, day: "Feb", workoutMin: 32),
        Daily(id: 10, day: "Mar", workoutMin: 45),
        Daily(id: 11, day: "Apr", workoutMin: 12),
        Daily(id: 12, day: "May", workoutMin: 56),
//        Daily(id: 13, day: "June", workoutMin: 34),
//        Daily(id: 14, day: "July", workoutMin: 15),
//        Daily(id: 15, day: "Aug", workoutMin: 22),
//        Daily(id: 16, day: "Sep", workoutMin: 25),
//        Daily(id: 17, day: "Oct", workoutMin: 17),
//        Daily(id: 18, day: "Nov", workoutMin: 43),
//        Daily(id: 19, day: "Dec", workoutMin: 52)
    ]
]
