//
//  AppStorageNotes.swift
//  Grad_project
//
//  Created by Amalie Morch on 01/05/2023.
//

// @AppStorage is swiftUI version of user defaults in UIKit
// mini database to save information so when user closes app, the info is saved
// only use for small amounts of data

import SwiftUI

struct AppStorageNotes: View {
    
    // chance we dont know userName, so set to nil
//    @State var currentUserName: String?
    // users first time using app so there will be no value in the userkey
    // no longer need to set variables into userDefaults or fetch variables from userDefault
    /* example of that:
     UserDefaults.standard.set(name, forKey: "name")
     // when app is reopened it will look for value saved under "name" and add to variable
     .onAppear {
         currentUserName = UserDefaults.standard.string(forKey: "name")
     } */
    // automatically pulls name from key when app is opened
    
    // if sentence added to any other view in app, you still have access to the variable
    @AppStorage("name") var currentUserName: String?
    
    var body: some View {
        VStack(spacing: 20) {
            // dont use ! to forefully unwrap -> telling xcode its a 100% sure we have a value, when we dont aka code crashes
            // if ?? then you give a value if it is nil/ no value in variable
            /* if you dont want a placeholder, use
                if let name = currentUserName {
                Text(name)
            */
            Text(currentUserName ?? "add name here")
            Button("Save") {
                let name = "emily"
                currentUserName = name
                // save name under key, so data is fetched later, its saved under the key name
                // user defaults is dictionary behind the scenes that the entire app has access to
            }
        }

    }
}

struct AppStorageNotes_Previews: PreviewProvider {
    static var previews: some View {
        AppStorageNotes()
    }
}
