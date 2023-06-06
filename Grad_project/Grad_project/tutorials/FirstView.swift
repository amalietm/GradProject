//
//  FirstView.swift
//  Grad_project
//
//  Created by Amalie Morch on 01/05/2023.
//

import SwiftUI

struct FirstView: View {
    
    // make key for app storage all lower case and no spaces
    // if given a starting value; if there is a value, use that value, if there is not, then false
    @AppStorage("signed_in") var currentUserSignedIn: Bool = false
    
    var body: some View {
        ZStack {
            // background
            Color(.blue).ignoresSafeArea()
            
            // if user is signer in -> profile view / else -> onboarding view
            // if this is true
            if currentUserSignedIn {
                ProfileView()
                    .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .top)))
            } else {
                OnboardingView()
            }
            
            
    
     
        }
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
