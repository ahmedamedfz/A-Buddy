//
//  BuddyManager.swift
//  A-Buddy
//
//  Created by Ahmad Fariz on 24/03/23.
//

import Foundation
import CoreData

class BuddyManager : ObservableObject {
    var persistentContainer: NSPersistentContainer

    init(persistentContainer: NSPersistentContainer) {
        self.persistentContainer = persistentContainer
    }

    // Create
    func createBuddy(buddyName: String, buddyNick: String) {
        let context = persistentContainer.viewContext
        let buddy = Buddy(context: context)
        buddy.buddyName = buddyName
        buddy.buddyNick = buddyNick

        do {
            try context.save()
        } catch {
            print("Error saving Buddy: \(error.localizedDescription)")
        }
    }

    // Read
    func fetchBuddies() -> [Buddy] {
        let context = persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Buddy> = Buddy.fetchRequest()

        do {
            let buddies = try context.fetch(fetchRequest)
            return buddies
        } catch {
            print("Error fetching Buddies: \(error.localizedDescription)")
            return []
        }
    }

    // Update
    func updateBuddy(buddy: Buddy, newName: String, newBirthday : Date, newPhoneNumber : String, itsScanned : Bool? = nil, itsMeTheUser : Bool? = nil) {
        let context = persistentContainer.viewContext
        buddy.buddyNick = newName
        buddy.buddyBirthday = newBirthday
        buddy.buddyPhoneNumber = newPhoneNumber
        buddy.isScanned = itsScanned ?? buddy.isScanned
        buddy.itsMe = itsMeTheUser ?? buddy.itsMe
        do {
            try context.save()
        } catch {
            print("Error updating Buddy: \(error.localizedDescription)")
        }
    }

    // Delete
    func deleteBuddy(buddy: Buddy) {
        let context = persistentContainer.viewContext
        context.delete(buddy)

        do {
            try context.save()
        } catch {
            print("Error deleting Buddy: \(error.localizedDescription)")
        }
    }
}
