//
//  AddRunFormView.swift
//  Grad_project
//
//  Created by Amalie Morch on 27/04/2023.
//

//MARK: ADD RUN FORM
import SwiftUI

struct AddRunFormView: View {
    
//    VARIABLES
    @State var selectedEnvironment = "IN"
    @State var dateOfWorkout: Date = Date()
    @State var interval: String
    @State var selectedHour: Int = 0
    @State var selectedMinute: Int = 0
    @State var goal: String
    @State var notes: String
    @State var selectedGoalValue = "KM"
    @State var goalAchieved : Bool = false
    
    var notesText: String = "Do you have any notes?"
    let environment = ["IN", "OUT"]
    let startingDate: Date = Calendar.current.date(from: DateComponents(year: 2023)) ?? Date()
    let endingDate: Date = Date()
    let goalValue = ["Min", "KM", "Pace"]
    
    var body: some View {
        
//        CONTENT
        VStack {
            HStack{
                HStack{
//                    WORKOUT
                    Text("RUN")
                        .frame(width: 45)
                        .font(.title3)
//                    ENVIRONMENT
                    Picker("", selection: $selectedEnvironment) {
                        ForEach(environment, id: \.self) {
                            Text($0)
                        }
                    }
                    .fontWeight(.none)
                    .italic()
                    .colorInvert()
                    .colorMultiply(Colors.blue)
                    .pickerStyle(.wheel)
                    .frame(width: 100, height: 80)
                }
                .padding(.horizontal)
                
//                DATE
                DatePicker("",
                           selection: $dateOfWorkout,
                           in: startingDate...endingDate,
                           displayedComponents: .date)
                    .padding()
                    .colorInvert()
                    .colorMultiply(Colors.blue)
            }
            .fontWeight(.bold)
        
            VStack(spacing: 20){
//                INTERVAL
                HStack{
                    Text("Interval")
                        .fontWeight(.semibold)
                        .padding(.vertical,12)
                    Spacer()
                    TextField("", text: $interval)
                        .padding(10)
                        .background(Color(.gray).opacity(0.2).cornerRadius(10))
                        .frame(maxWidth: 80)
                        .padding(.vertical)
                }
//                TIME
                HStack {
                    Text("Time")
                        .fontWeight(.semibold)
                    Spacer()
                    HStack {
                        Picker("hours", selection: self.$selectedHour) {
                            ForEach(0 ..< 24) { number in
                                Text("\(selectedHour) h")
                            }
                        }
                        .labelsHidden()
                        .pickerStyle(WheelPickerStyle())
                        
                        Picker("minutes", selection: self.$selectedMinute) {
                            ForEach(0 ..< 60) { number in
                                Text("\(selectedMinute) m")
                            }
                        }
                    }
                    .labelsHidden()
                    .pickerStyle(WheelPickerStyle())
                    .frame(width: 120, height: 80)
                        .colorInvert()
                        .colorMultiply(Colors.blue)
                }
            }
            .padding(.horizontal)
      
            Divider()
                .overlay(.black)
            
//            NOTES
            VStack(alignment: .leading){
                Text("Notebook")
                    .padding([.vertical])
                    .fontWeight(.bold)
                TextEditor(text: $notes)
                    .onTapGesture {
                        if notes == "Do you have any notes?" {
                            notes = ""
                        }
                    }
                    .frame(height: 250).cornerRadius(10)
                    .colorMultiply(Color("LightGrey"))
                    .padding(.bottom)
            }
            .padding([.horizontal])
            Divider()
                .overlay(.black)
            
//            GOAL
            HStack{
                Text("Goal")
                    .fontWeight(.bold)
                Spacer()
                TextField("", text: $goal)
                    .padding(10)
                    .background(Color(.gray).opacity(0.2).cornerRadius(10))
                    .frame(maxWidth: 80)
                    .padding(.vertical)
//                GOAL VALUE
                Picker("", selection: $selectedGoalValue) {
                    ForEach(goalValue, id: \.self) {
                        Text($0)
                    }
                }
                .colorInvert()
                .colorMultiply(Colors.blue)
                .pickerStyle(.wheel)
                .frame(width: 70, height: 100)
                
//                GOAL ACHIEVED
                Button(action: {
                    self.goalAchieved.toggle()
                }) {
                    Image(systemName: self.goalAchieved == true ? "checkmark.circle.fill" : "checkmark.circle")
                        .resizable()
                        .frame(width: 30, height: 30)
                }
            }
            .padding([.horizontal])
        }
        .foregroundColor(Colors.blue)
        .padding()
        .padding([.horizontal])
        .padding([.bottom], 30)
    }
    
//    FUNCTION
    func textIsAppropriate() -> Bool {
        if notesText.count >= 3 {
            return true
        }
        return false
    }
    
}

