//
//  NoItemsView.swift
//  Grad_project
//
//  Created by Amalie Morch on 03/05/2023.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var animate : Bool = false
    var body: some View {
            ScrollView {
                VStack(spacing: 10) {
                    Text("")
                        .font(.title)
                        .fontWeight(.semibold)
                    Text("are you productive, the add items to the list")
                        .padding(.bottom, 20)
                    NavigationLink(
                        destination: AddView(),
                        label: {
                            Text("add something")
                                .foregroundColor(.white)
                                .frame(height: 55)
                                .frame(maxWidth: .infinity)
                                .background(animate ? Colors.blue : Colors.purple)
                                .cornerRadius(10)
                        })
                    .padding(.horizontal, animate ? 30 : 50)
                    .shadow(
                        color:animate ? Colors.blue.opacity(0.7) : Colors.purple.opacity(0.7),
                        radius: animate ? 30 : 10,
                        x: 0,
                        y: animate ? 50 : 30)
                    .scaleEffect(animate ? 1.1 : 1.0)
                    .offset(y: animate ? -7 : 0)
                }
                .multilineTextAlignment(.center)
                .padding(40)
                // when appears its gonna add an animation
                .onAppear(perform: addAnimation)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
// animation will wait 1.5 sec and then toggle
    func addAnimation() {
        // make sure animate is false, cause if it is true we're gonna return out of function
        guard !animate else {return}
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
            Animation
                .easeInOut(duration: 2.0)
                .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            NoItemsView()
                .navigationTitle("Title")
        }
    }
}
