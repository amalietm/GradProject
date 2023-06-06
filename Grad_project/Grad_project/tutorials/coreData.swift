//
//  coreData.swift
//  Grad_project
//
//  Created by Amalie Morch on 22/05/2023.
//

import SwiftUI

struct UserModel: Identifiable {
    let id = UUID().uuidString
    let name: String?
    let points: Int
    let isVerified: Bool
}

class ArrayModificationViewModel: ObservableObject {
    @Published var dataArray: [UserModel] = []
    @Published var filteredArray: [UserModel] = []
    // from array of users to an array of strings
    // if downloading data, you can convert it to a user model in same way
    @Published var mappedArray: [String] = []
    
    init() {
        getUsers()
        updateFilteredArray()
    }
    
    func updateFilteredArray() {
        // sort
        /*
         // compares two objects in array -> puts data in order
         filteredArray = dataArray.sorted(by: { $0.points > $1.points})
         */
        // filter
        /*
         filteredArray = dataArray.filter({ $0.isVerified})
         */
        // map
        /*
                mappedArray = dataArray.map( {$0.name})
        // if variable is optional
        mappedArray = dataArray.compactMap({ $0.name})
        */
        // complex filtering
        mappedArray = dataArray
            .sorted(by: { $0.points > $1.points})
            .filter({ $0.isVerified})
            .compactMap({ $0.name})

    }
    
    func getUsers() {
        let user1 = UserModel(name: "Nick", points: 5, isVerified: true)
        let user2 = UserModel(name: nil, points: 15, isVerified: false)
        let user3 = UserModel(name: "Anna", points: 22, isVerified: true)
        self.dataArray.append(contentsOf: [
            user1,
            user2,
            user3
        ])
    }
}

struct coreData: View {
    
    @StateObject var vm = ArrayModificationViewModel()
    var body: some View {
        VStack {
            // strings dont conform to identifiable to you use hashable instead
            ForEach(vm.mappedArray, id: \.self) { name in
                Text(name)
                    .font(.title)
            }
//            ForEach(vm.filteredArray) { user in
//                Text(user.name)
//                HStack {
//                    Text("points: \(user.points)")
//                    if user.isVerified {
//                        Image(systemName: "flame.fill")
//                    }
//                }
//            }
        }
    }
}

struct coreData_Previews: PreviewProvider {
    static var previews: some View {
        coreData()
    }
}
