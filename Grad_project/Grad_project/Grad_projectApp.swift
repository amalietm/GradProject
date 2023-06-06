//
//  Grad_projectApp.swift
//  Grad_project
//
//  Created by Amalie Morch on 19/04/2023.
//

import SwiftUI
import Firebase

// swift UI apps dont have app delegate
// certain firebase packages require app delegate
// UI kit uses app delegate to host root of app 
@main
struct Grad_projectApp: App {
    
    init() {
        // without app delegate
        FirebaseApp.configure()
    }
    var body: some Scene {
        
        WindowGroup {
            NavigationStack {
                CustomTabBarView()
            }
        }
    }
}
