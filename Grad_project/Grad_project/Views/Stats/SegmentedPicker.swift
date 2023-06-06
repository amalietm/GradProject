//
//  SegmentedPicker.swift
//  Grad_project
//
//  Created by Amalie Morch on 25/04/2023.
//

//SEGMENTED PICKER
import SwiftUI

struct SegementedPicker: View {
    
//    VARIABLES
    @Namespace var underline
    @Binding var selected: String
    
    let options: [String]
    
    var body: some View {
    
//        CONTENT
        VStack(alignment: .leading){
            HStack(spacing: 30) {
                ForEach(options, id: \.self) { option in
                    VStack {
                        Button{
                            selected = option
                        } label: {
                            VStack(alignment: .leading){
                                Text(option)
                                    .foregroundColor(selected == option ? Colors.blue : .secondary)
                                ZStack {
                                    Rectangle().fill(Color.primary)
                                        .frame(height: 1)
                                        .opacity(0)
                                }
                                    if selected == option {
                                        Rectangle().fill(Colors.blue)
                                            .frame(height: 1)
                                            .matchedGeometryEffect(id: "option", in: underline)
                                    }
                            }
                        }
                        .fixedSize()
                    }
                }
            }
            Rectangle()
                .frame(height: 1)
                .foregroundColor(Color.secondary.opacity(0.2))
        }
    }
}


