//
//  try.swift
//  Grad_project
//
//  Created by Amalie Morch on 30/04/2023.
//

import SwiftUI

struct userModel: Identifiable {
    let id: String = UUID().uuidString // new automatic id
    let displayName: String
    let userName: String
    let followerCount: Int
    let isVerified: Bool
    
}

struct tries: View {
    @State var users: [userModel] = [
        userModel(displayName: "Nick", userName: "nick123", followerCount: 100, isVerified: true),
        userModel(displayName: "emily", userName: "emily1245", followerCount: 325, isVerified: false),
        userModel(displayName: "chris", userName: "pandagret", followerCount: 123, isVerified: true),
        userModel(displayName: "hen", userName: "carzybish", followerCount: 536, isVerified: true)]
    
    @State private var buttonStates = Array(repeating: false, count: 2)
    let buttonTitles = ["Spotify", "Apple Music"]
    // hashable for xcode to easily make array searchable
    // id: \.self makes a fake id for each item in the array
    // identifiable means they all need an id
    // if downloading data from database, they most likely have individual id's
    var body: some View {
        
        NavigationStack {
            List {
                ForEach(users) { user in
                    HStack(spacing: 15) {
                        Circle()
                            .frame(width: 35, height: 35)
                        VStack(alignment: .leading) {
                            Text(user.displayName)
                            Text("@\(user.userName)")
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        if user.isVerified {
                            Image(systemName: "checkmark.seal.fill")
                                .foregroundColor(.blue)
                        }
                        VStack {
                            Text("\(user.followerCount)")
                            Text("followers")
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.vertical, 10)
                }
            }
            VStack {
                ForEach(buttonTitles.indices, id: \.self) { index in
                                Text(buttonTitles[index])
                                    .foregroundColor(buttonStates[index] ? .blue : .gray)
                                    .onTapGesture {
                                        selectButton(at: index)
                                    }
                            }
                    }
            if let selectedIndex = buttonStates.firstIndex(where: { $0 }) {
                            switch selectedIndex {
                            case 0:
                                Image(systemName: "heart.fill")
                                    .font(.largeTitle)
                                    .foregroundColor(.red)
                            case 1:
                                Image(systemName: "star.fill")
                                    .font(.largeTitle)
                                    .foregroundColor(.yellow)
                            default:
                                EmptyView()
                            }
                        }
        }
    }
    func selectButton(at index: Int) {
            buttonStates = buttonStates.enumerated().map { offset, _ in
                offset == index
            }
        }
}

struct tries_Previews: PreviewProvider {
    static var previews: some View {
        tries()
    }
}
