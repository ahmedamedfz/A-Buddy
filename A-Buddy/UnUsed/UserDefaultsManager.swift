////
////  UserDefaultsManager.swift
////  A-Buddy
////
////  Created by Ahmad Fariz on 25/03/23.
////
//
//import Foundation
//
//class UserDefaultsManager {
//    static let shared = UserDefaultsManager()
//    private let defaults = UserDefaults.standard
//    
//    private init() {}
//    
//    func setUser(name: String, nickname : String) {
//        defaults.set(name, forKey: "userName")
//        defaults.set(nickname, forKey: "userNick")
//    }
//    func getUser() -> User? {
//        if let name = defaults.string(forKey: "userName"),
//                   let nickname = defaults.string(forKey: "userNick") {
//                    return User(name: name, nickname: nickname)
//                }
//                return nil
//    }
//}
