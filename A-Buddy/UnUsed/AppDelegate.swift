//
//  AppDelegate.swift
//  A-Buddy
//
//  Created by Ahmad Fariz on 24/03/23.
//

import Foundation
import SwiftUI
import CoreData

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("Your code here")
        return true
    }
    
    lazy var persistentContainer: NSPersistentContainer = {
            let container = NSPersistentContainer(name: "A-Buddy")
            container.loadPersistentStores(completionHandler: { (storeDescription, error) in
                if let error = error as NSError? {
                    fatalError("Unresolved error \(error), \(error.userInfo)")
                }
            })
            return container
        }()
}
