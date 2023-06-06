//
//  Tabs.swift
//  Grad_project
//
//  Created by Amalie Morch on 02/05/2023.
//

import SwiftUI

struct Tabs: View {
    var body: some View {
        ZStack {
            TabView {
                Color.blue
                Color.red
                Color.green
            }
            .tabViewStyle(.page)
            VStack {
                
                VStack(spacing: 30) {
                    Text("Hey, you! Congrats on your decision to run! ")
                    Text("Running is faster than walking, so you get to places faster. Run to save time - and to stay fit.")
                        .multilineTextAlignment(.trailing)
                }
                    .font(.title)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding()
                Spacer()
                HStack {
                    Button {}
                label: {
                    Image(systemName: "chevron.right")
                }
                .padding()
                .foregroundColor(.black)
                .backgroundStyle(.ultraThinMaterial)
                    
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.horizontal)
                }
            }
        }
    }
}

struct Tabs_Previews: PreviewProvider {
    static var previews: some View {
        Tabs()
    }
}
