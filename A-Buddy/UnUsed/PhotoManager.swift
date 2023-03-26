//
//  PhotoManager.swift
//  A-Buddy
//
//  Created by Ahmad Fariz on 21/03/23.
//

import Foundation
import UIKit
import CoreData

struct PhotoManager {
    
    let context: NSManagedObjectContext
    
    func addImage(to entity: Buddy, image: UIImage) {
        let imageData = image.jpegData(compressionQuality: 1.0)
        entity.photoWithBuddy = imageData
        saveContext()
    }
    
    func changeImage(in entity: Buddy, image: UIImage) {
        let imageData = image.jpegData(compressionQuality: 1.0)
        entity.photoWithBuddy = imageData
        saveContext()
    }
    
    private func saveContext() {
        do {
            try context.save()
        } catch let error {
            print("Error saving context: \(error.localizedDescription)")
        }
    }
    
    
    
}




