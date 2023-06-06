//
//  Haptic.swift
//  Grad_project
//
//  Created by Amalie Morch on 05/05/2023.
//

import SwiftUI

class HapticManager {
    static let instance = HapticManager() // singleton
    
    func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        // function to make phone vibrate
        generator.notificationOccurred(type)
    }
    
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
        
    }
}

struct Haptic: View {
    var body: some View {
        VStack {
            Button("success") {HapticManager.instance.notification(type: .success)}
            Button("error") {HapticManager.instance.notification(type: .error)}
            Button("warning") {HapticManager.instance.notification(type: .warning)}
            Button("soft") {HapticManager.instance.impact(style: .soft)}
            Button("heavy") {HapticManager.instance.impact(style: .heavy)}
            Button("light") {HapticManager.instance.impact(style: .light)}
            Button("medium") {HapticManager.instance.impact(style: .medium)}
            Button("rigid") {HapticManager.instance.impact(style: .rigid)}
        }
    }
}

struct Haptic_Previews: PreviewProvider {
    static var previews: some View {
        Haptic()
    }
}
