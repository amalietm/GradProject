//
//  WorkoutScroll.swift
//  Grad_project
//
//  Created by Amalie Morch on 20/04/2023.
//

//MARK: WORKOUT SCROLL
import SwiftUI

var likedWorkouts: [WorkoutModel] = []

struct WorkoutScroll: View {
    
//    VARIABLES
    @State var selectedWorkout: WorkoutModel? = nil
    @State var likedWorkouts: [WorkoutModel] = []

    var workout: WorkoutModel = workouts[0]
    
    
    var body: some View {
        
//        CONTENT
        NavigationStack {
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(workouts) { workout in
                            WorkoutScrollPost(workoutLiked: workoutLiked(for: workout), likedWorkouts: $likedWorkouts, title: workout.title, interval: workout.interval, time: workout.time, onLike: { toggleLiked(for: workout) })
                            
                                .onTapGesture {
                                    selectedWorkout = workout
                                }
                        }
                    }
                }
                .padding(.leading, 30)
                .frame(maxHeight: 400)
            }
        }
//       SUB-VIEW: WORKOUT
        .fullScreenCover(item: $selectedWorkout) { workout in
            WorkoutOverviewView(workout: workout)
        }
    }
    
//  FUNCTIONS
    func workoutLiked(for workout: WorkoutModel) -> Bool {
        likedWorkouts.contains { $0.id == workout.id }
    }

    func toggleLiked(for workout: WorkoutModel) {
        if workoutLiked(for: workout) {
            likedWorkouts.removeAll { $0.id == workout.id }
        } else {
            likedWorkouts.append(workout)
        }
    }
}

// Prevents content from being cut off
extension UIScrollView {
  open override var clipsToBounds: Bool {
    get { false }
    set { }
  }
}

