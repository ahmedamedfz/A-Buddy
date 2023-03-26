////
////  UserDefaultManager.swift
////  A-Buddy
////
////  Created by Ahmad Fariz on 25/03/23.
////
//
//import Foundation
//import CoreData
//
//class UserDefaultManager {
//    static let shared = UserDefaultManager()
//    private let defaults = UserDefaults.standard
//    private let encoder = JSONEncoder()
//    private let decoder = JSONDecoder()
//    
//    private init() {}
//    
//    func setBuddy(_ user: User) {
//        do {
//            let encoded = try encoder.encode(user)
//            defaults.set(encoded, forKey: "")
//        } catch {
//            print("cannot encode buddy")
//        }
//    }
//    
//    func getBuddy(context: NSManagedObjectContext) -> Buddy? {
//        guard let encode = defaults.data(forKey: "buddy") else {
//            return nil
//        }
//        
//        do {
//            decoder.userInfo[CodingUserInfoKey.context!] = context
//            let decoded = try decoder.decode(Buddy.self, from: encode)
//            return decoded
//        } catch {
//            print("error")
//        }
//        
//        return nil
//    }
//}
