//
//  OnboardingView.swift
//  Grad_project
//
//  Created by Amalie Morch on 01/05/2023.
//

import SwiftUI

struct OnboardingView: View {
    
    // onboarding states
    /*
     0 - welcome screen
     1 - add name
     2 - add age
     3 - add gender
     */
    @State var onboardingState: Int = 0
    let transition: AnyTransition = .asymmetric(insertion:
            .move(edge: .trailing),
            removal: .move(edge: .leading))
    // extensions cannot store properties so always declare in original view
    // onboarding input
    @State var name: String = ""
    @State var age: Double = 50
    @State var gender: String = ""
    
    // for alert
    @State var alertTitle: String = ""
    @State var showALert: Bool = false
    
    // app storage
    @AppStorage("name") var currentUserName: String?
    @AppStorage("age") var currentUserAge: Int?
    @AppStorage("gender") var currentUserGender: String?
    @AppStorage("signed_in") var currentUserSignedIn: Bool = false
    
    // if all conditional logic is based on the same variable, rather use a switch statement
    var body: some View {
        ZStack {
            // content
            ZStack {
                // switched based on value onboardingState is
                switch onboardingState {
                case 0:
                    welcomeSection
                        .transition(transition)
                case 1:
                    addNameSection
                        .transition(transition)
                case 2:
                    addAgeSection
                        .transition(transition)
                // if anything other than cases, default will happen
                case 3:
                    addGenderSection
                        .transition(transition)
                default:
                    RoundedRectangle(cornerRadius: 25)
                        .foregroundColor(.green)
                }
            }
            // buttons
            VStack {
                Spacer()
                bottomButton
            }
            .padding(30)
        }
        .alert(isPresented: $showALert, content: {
            return Alert(title: Text(alertTitle))
        })
    }
    // make button own variable
    
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
            .background(Color.purple)
    }
}

// extension can be added anywhere in the app and it simply means you can just add more info onto another view
// MARK: COMPONENTS
extension OnboardingView {
    
    private var bottomButton: some View {
        Text(onboardingState == 0 ? "Sign up" :
                onboardingState == 3 ? "finish" : "next")
        .foregroundColor(.green)
        .frame(height: 55)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(10)
        .animation(nil)
        .onTapGesture {
            handleNextButtonPressed()
        }
    }
    
    private var welcomeSection: some View {
        VStack(spacing: 40) {
            Spacer()
            Image(systemName: "heart.text.square.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .foregroundColor(.white)
            Text("find your match")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .overlay(
                    Capsule(style: .continuous)
                        .frame(height: 3)
                        .offset(y: 5)
                        .foregroundColor(.white)
                    , alignment: .bottom
                )
            Text("this is the nr 1 app for finding your match. do you wanna give it a shot? you never know.")
                .foregroundColor(.white)
            Spacer()
            Spacer()
        }
        .multilineTextAlignment(.center)
        .padding(30)
    }
    
    private var addNameSection: some View {
        VStack(spacing: 20) {
            Spacer()

            Text("what's your name?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            TextField("Your name here", text: $name)
                .frame(height: 55)
                .padding(.horizontal)
                .background(Color.white)
                .cornerRadius(10)
            Spacer()
            Spacer()
        }

        .padding(30)
    }
    
    private var addAgeSection: some View {
        VStack(spacing: 20) {
            Spacer()

            Text("what's your age?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            
            Text("\(String(format: "%.0f", age))")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            Slider(value: $age, in: 18...100, step: 1)
                .tint(.white)
            Spacer()
            Spacer()
        }

        .padding(30)
    }
    
    private var addGenderSection: some View {
        VStack(spacing: 20) {
            Spacer()

            Text("what's your gender?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            
            Picker(selection: $gender,
                   label:
                    // count is characters in string, so if greater than 1 then put in gender, otherwise placeholder
                    Text(gender.count > 1 ? gender : "Select a gender")
                .foregroundColor(.purple)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .cornerRadius(10)
                   ,
                   content:  {
                Text("female").tag("female")
                Text("male").tag("male")
                Text("non-binary").tag("non-binary")
            })
                   .pickerStyle(MenuPickerStyle())
            
            Spacer()
            Spacer()
        }

        .padding(30)
    }
    }

// MARK: FUNCTION

extension OnboardingView {
    func handleNextButtonPressed() {
        
        // check input
        // break means youre done with switch statement
        switch onboardingState {
        case 1:
            guard name.count >= 3 else {
                // update title
                showAlert(title: "your name must be three at least characters long")
                return
            }
        case 3:
            guard gender.count > 1 else {
                showAlert(title: "select gender")
                return
            }
        default:
            break
        }
        
        // go to next section
        if onboardingState == 3 {
            signIn()
        } else {
            withAnimation(.spring()) {
                onboardingState += 1
            }
        }
    }
    
    func signIn() {
        currentUserName = name
        currentUserAge = Int(age)
        currentUserGender = gender
        withAnimation(.spring()) {
            currentUserSignedIn = true
        }

    }
    
    func showAlert(title: String) {
        alertTitle = title
        showALert.toggle()
    }
}


