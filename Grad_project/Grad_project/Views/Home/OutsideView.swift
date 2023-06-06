//
//  OutsideView.swift
//  Grad_project
//
//  Created by Amalie Morch on 21/04/2023.
//

//MARK: OUTSIDE VIEW
import SwiftUI

struct OutsideView: View {
    
//    VARIABLES
    @State var showAlert = false
    @Binding var tabIndex: Int
    
    var body: some View {
        
//        CONTENT
        NavigationStack {
            VStack {
                Spacer()
                Text("Yet to come.")
                    .font(.system(size: 80, weight: .bold))
                    .italic()
                    .padding(.horizontal)
                    .padding(.bottom, 70)
                    .onAppear {
                        self.showAlert = true
                    }
//                Alert for the view to be a future feature - takes user back to Inside view
                    .alert("This feature is yet to come", isPresented: $showAlert, actions: {
                            Button("OK", role: .cancel) {
                                tabIndex = 0
                            }
                        })
                
                
            }
            
        }
    }
}
