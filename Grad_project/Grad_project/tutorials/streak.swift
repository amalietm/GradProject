//
//  blablabla.swift
//  Grad_project
//
//  Created by Amalie Morch on 27/05/2023.
//

import SwiftUI

struct streak: View {
   
        @State private var data: [String] = []
        @State private var counter: Int = 0
        @State private var timer: Timer?

        var body: some View {
            VStack {
                Text("Counter: \(counter)")
                    .font(.title)

                Button(action: {
                    self.appendData()
                }) {
                    Text("Append Data")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .onAppear {
                self.startTimer()
            }
            .onDisappear {
                self.stopTimer()
            }
        }

        func appendData() {
            data.append("New Data")
            counter += 1
            resetTimer()
        }

        func resetTimer() {
            stopTimer()
            startTimer()
        }

        func startTimer() {
            timer = Timer.scheduledTimer(withTimeInterval: 10, repeats: false) { _ in
                counter = 0
            }
        }

        func stopTimer() {
            timer?.invalidate()
            timer = nil
        }
    

}

struct streak_Previews: PreviewProvider {
    static var previews: some View {
        streak()
    }
}
