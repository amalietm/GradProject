//
//  FillButton.swift
//  Grad_project
//
//  Created by Amalie Morch on 23/04/2023.
//

//MARK: FILL BUTTON
import SwiftUI

struct FillButton: View {
    
//    VARIABLES
    @Binding var isSelected: Bool
    
    @State var FillButtonColor: Color
    @State var FillButtonColorText: Color
    
    var FillButtonTextLeft = ""
    var FillButtonTextMiddle = ""
    var FillButtonTextRight = ""
    
    var body: some View {
//        STYLING
        ZStack{
             ZStack{
                Text(FillButtonTextLeft)
                Text(FillButtonTextMiddle)
                Text(FillButtonTextRight)
            }
            .foregroundColor(isSelected ? FillButtonColorText: .black)
            .padding(10)
            .background(isSelected ?  FillButtonColor: .white)
            .cornerRadius(30)
            .overlay(
                RoundedRectangle(cornerRadius: 30)
                    .stroke(isSelected ?  FillButtonColor: .black, lineWidth: 2)
                                    
                    )
        }
        .background(.clear)
        
    }
}



