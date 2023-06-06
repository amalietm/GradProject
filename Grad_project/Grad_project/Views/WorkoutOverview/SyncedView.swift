//
//  SyncedView.swift
//  Grad_project
//
//  Created by Amalie Morch on 20/04/2023.
//

//MARK: SYNCED VIEW
import SwiftUI

struct SyncedView: View {
    
//    VARIABLES
    var buttonState: buttonState
    
    var body: some View {
//        CONTENT
        RoundedRectangle(cornerRadius: 30)
            .frame(width: 300, height: 60)
            .overlay (
                HStack {
                    Text("Synced to")
                        .font(Font.system(.title3))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Spacer()
                    
//                 MUSIC STREAMER OPTIONS
                    switch buttonState {
                                case .spotify:
                                    Image("spotify")
                                        .resizable()
                                        .scaledToFit()
                                        .scaleEffect(0.6)
                                        .foregroundColor(.white)
                                case .apple:
                                    Image("appleMusic")
                                        .resizable()
                                        .scaledToFit()
                                        .scaleEffect(1.2)
                                        .foregroundColor(.white)
                                case .none:
                                    Text("No icon selected")
                                        .font(.headline)
                                        .padding()
                                        .foregroundColor(.white)
                                }
                }
                .padding(.horizontal)
            )
            .padding(.horizontal)
    }
}
