//
//  TextFieldView.swift
//  Grad_project
//
//  Created by Amalie Morch on 29/04/2023.
//

import SwiftUI

// textfields are limited to one line
// texteditor has a default  height of infinity
struct TextFieldView: View {
    @State var textFieldText: String = ""
    @State var dataArray: [String] = []
    
    @State var textEditorText: String = "this is the starting text"
    @State var savedText: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextEditor(text: $textEditorText)
                    .frame(height: 250)
                // color Multiply only works if text color is black
                    .colorMultiply(Color.gray.opacity(0.2))
                Button(action: {
                    // overwrites previously saved info
                    savedText = textEditorText
                }, label: {
                    Text("Save")
                        .padding()
                        .background(textIsAppropriate() ? Color.blue : Color.gray)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                })
                
                Text(savedText)
                Spacer()
            }
            .padding()
            
            VStack {
                
                // if action to return when button pressed: onEditingChanged, if action to run when return button pressed: onCommit, if special format ex value to be included in text ($): formatter
                TextField("type something", text: $textFieldText)
                    .padding()
                    .background(Color.blue.opacity(0.2).cornerRadius(10))
                    .padding(.horizontal)
                Button {
                    if textIsAppropriate() {
                        saveText()
                    }
                } label: {
                    Text("Save")
                        .padding()
                        .background(textIsAppropriate() ? Color.blue : Color.gray)
                            .cornerRadius(10)
                        .foregroundColor(.white)
                }
                // ! used to do the opposite of textIsAppropriate
                .disabled(!textIsAppropriate())
                // creating an id for each item in the data
                ForEach(dataArray, id: \.self) { data in
                    Text(data)
                }
            }
        }
    }
    func textIsAppropriate() -> Bool {
        if textFieldText.count >= 3 {
            return true
        }
        return false
    }
    
    func saveText() {
        dataArray.append(textFieldText)
        textFieldText = ""
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView()
    }
}
