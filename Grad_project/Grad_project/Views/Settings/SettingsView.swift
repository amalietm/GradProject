//
//  SettingsView.swift
//  Grad_project
//
//  Created by Amalie Morch on 21/04/2023.
//

//MARK: SETTINGS VIEW

import SwiftUI

//ENUM - MUSIC STREAMER
enum buttonState {
    case spotify
    case apple
    case none
}

struct SettingsView: View {
    
//    VARIABLES
    @Environment(\.dismiss) private var dismiss
    
    @State private var email = ""
    @State private var isEmailValid = true
    
    @State private var measurement = "Metric"
    @State private var device = "Apple Watch"
    @State private var dataPermission = false
    @State private var showAlert = false
    @State private var buttonState: buttonState = .none

    var body: some View {
//        CONTENT
        NavigationStack {
            VStack {
                Form {
                    // FUTURE: make sure email input is an email
                    HStack {
//                      EMAIL
                        TextField("Email", text: $email)
                            .keyboardType(.emailAddress)
                            .keyboardType(.emailAddress)
                        ZStack {
                            if !isEmailValid {
                                Text("Invalid email")
                                    .foregroundColor(.red)
                            }
                        }
                    }
//                    RUNNER LEVEL
                    Section {
                        Text("Runner level")
                        SelectedButtonsLevel()
                            .padding(.vertical, 20)
                    }
//                    DATA PERMISSION
                    Toggle("Data permission", isOn: $dataPermission)
                        .toggleStyle(SwitchToggleStyle(tint: .blue))
                    
//                    WATCH SYNCING
                    Section {
                        NavigationLink(destination: WatchSyncView()) {
                            HStack {
                                Text("Setup:")
                                Text(device)
                                    .foregroundColor(.gray)
                                Spacer()
                                Image(systemName: "applewatch")
                                    .font(.largeTitle)
                            }
                            
                        }
                        
//                        SYNC MUSIC STREAMER
                        HStack(spacing: 20) {
                            Text("Sync to:")
                            Spacer()
                            Button(action: {
                                buttonState = .spotify
                            }) {
                                Text("Spotify")
                                    .foregroundColor(buttonState == .spotify ? .black : .gray)
                            }
            
                            .onTapGesture {
                                if buttonState == .spotify {
                                    buttonState = .none
                                } else {
                                    buttonState = .spotify
                                    if buttonState == .apple {
                                        buttonState = .spotify
                                    }
                                }
                            }
                            Button(action: {
                                buttonState = .apple
                            }) {
                                Text("Apple Music")
                                    .foregroundColor(buttonState == .apple ? .black : .gray)
                            }
            
                            .onTapGesture {
                                if buttonState == .apple {
                                    buttonState = .none
                                } else {
                                    buttonState = .apple
                                    if buttonState == .spotify {
                                        buttonState = .apple
                                    }
                                }
                            }
                        }
                    }
                    
//                    TERMS OF SERVICE
                    Button {
                        showAlert = true
                    } label: {
                        Text("Terms of service")
                            .foregroundColor(Colors.blue)
                    }
                    .alert("Lucky you, there are no terms", isPresented: $showAlert) {
                        Button("OK", role: .cancel) { }
                    }
                    
                }
                
//                BUTTONS - clear choices & save choices
                HStack(spacing: 20) {
                    Button{} label: {
                        Text("Clear")
                    }
                    .buttonStyle(LightSquareButtonStyle())
                    Button{
                        validateEmail()
                        //                    saveSettings
                    } label: {
                        Text("Save")
                    }
                    .buttonStyle(DarkSquareButtonStyle())
                }
            }
            
//            NAVIGATION
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .tint(.black)
                    }
                }
                
            }
        }
    }
    
//    FUNCTIONS
    func saveSettings() {
        //
    }
    
    func validateEmail() {
        let emailRegex = "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        isEmailValid = emailPredicate.evaluate(with: email)
    }

}





    
