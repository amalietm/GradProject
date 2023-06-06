//
//  blaaa.swift
//  Grad_project
//
//  Created by Amalie Morch on 30/04/2023.
//

import SwiftUI

struct blaaa: View {
    @State var minutes: Int = 00
    @State var seconds: Int = 00
    
    @State var timerIsPaused: Bool = true
    
    @State var timer: Timer? = nil
    
    var body: some View {
        VStack {
            Text("\(minutes):\(seconds)")
            if timerIsPaused {
                HStack {
                    Button(action:{
                        print("RESTART")
                    }){
                        Image(systemName: "backward.end.alt")
                            .padding(.all)
                    }
                            .padding(.all)
                                      Button(action:{
                                        self.startTimer()
                                        print("START")
                                      }){
                                        Image(systemName: "play.fill")
                                          .padding(.all)
                                      }
                                      .padding(.all)
                                    }
                                  } else {
                                    Button(action:{
                                      print("STOP")
                                      self.stopTimer()
                                    }){
                                      Image(systemName: "stop.fill")
                                        .padding(.all)
                                    }
                                    .padding(.all)
                                  }
                                }
                              }
            func startTimer(){
                timerIsPaused = false
                // 1. Make a new timer
                timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ tempTimer in
                    // 2. Check time to add to H:M:S
                    if self.seconds == 59 {
                        self.seconds = 00
                        if self.minutes == 59 {
                            self.minutes = 00
                        } else {
                            self.minutes = self.minutes + 1
                        }
                    } else {
                        self.seconds = self.seconds + 1
                    }
                }
            }
   
            func stopTimer(){
              timerIsPaused = true
              timer?.invalidate()
              timer = nil
            }
          
}

struct blaaa_Previews: PreviewProvider {
    static var previews: some View {
        blaaa()
    }
}
