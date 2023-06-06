//
//  ListRowView.swift
//  Grad_project
//
//  Created by Amalie Morch on 01/05/2023.
//

import SwiftUI

struct ListRowView: View {
    
    // passing in the item of the type model
    let item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var item1 = ItemModel(title: "first item", isCompleted: true)
    static var item2 = ItemModel(title: "second item", isCompleted: false)
    static var previews: some View {
        Group {
            ListRowView(item: item1)
            ListRowView(item: item2)

            
        }
        .previewLayout(.sizeThatFits)
    }
}
