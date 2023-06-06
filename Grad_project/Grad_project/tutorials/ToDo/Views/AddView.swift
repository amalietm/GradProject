//
//  AddView.swift
//  Grad_project
//
//  Created by Amalie Morch on 01/05/2023.
//

import SwiftUI

struct AddView: View {
    
    //want to append items to the model. since view model is in the environment, we have access to it
    @EnvironmentObject var listViewModel: ListViewModel
    // when creating a new item we wanna use the text that's in the textfield to create that item.
    // all logic to create new item and adding to array we wanna put in the listViewModel.
    @State var textFieldText: String = ""
    @Environment(\.dismiss) var dismiss
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("type something", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color("LightGrey"))
                    .cornerRadius(10)
                
                Button{ saveButtonPressed()}
                label: {
                    Text("save")
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(.blue)
                        .cornerRadius(10)
                
                }
            }
            .padding(14)
        }
        .navigationTitle("Add item")
        // alert can be added anywhere in view and it would work
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveButtonPressed() {
        // text is appropriate, then run rest of function
        if textIsAppropriate() {
            // when button is pressed call:
            // title will be the textFieldText referenced above
            listViewModel.addItem(title: textFieldText)
            dismiss()
        }
    }
    // add logic to addItem
    // check that input is long enough
    // if text is appropriate function will return true
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            // set title before you call the alert
            alertTitle = "you need more characters"
            // show alert when text is appropriate fails
            showAlert.toggle()
            return false
        }
        // to exit function
        // if equal to or more than 3, return true
        return true
    }
    
    // return an alert
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
