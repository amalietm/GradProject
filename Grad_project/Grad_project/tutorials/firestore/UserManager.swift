//
//  UserManager.swift
//  Grad_project
//
//  Created by Amalie Morch on 28/05/2023.
//
//
//import Foundation
//import FirebaseFirestore
//import FirebaseFirestoreSwift
//
//final class UserManager {
//    
//    func createNewUser(auth: AuthDataResultModel) async throws {
//        // dictionary
//        var userData: [String: Any] = [
//            "user_id" : auth.uid,
//            "is_anonymous" : auth.isAnonymous,
//            "data_created" : Timestamp()
//        ]
//        // optional values
//        if let email = auth.email {
//            userData["email"] = email
//        }
//        if let photoUrl = auth.photoUrl {
//            userData["photo_url"] = photoUrl
//        }
//        
//        try await Firestore.firestore().collection("users").document(userId).setData(userData, merge: false)
//    }
//}
