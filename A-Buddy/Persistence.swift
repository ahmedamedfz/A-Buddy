//
//  Persistence.swift
//  A-Buddy
//
//  Created by Ahmad Fariz on 20/03/23.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()
    
    static var preview: PersistenceController = {
        
        let viewContext = shared.container.viewContext
        
        let path = Bundle.main.path(forResource: "DataBuddy", ofType: "csv")
        if let listFile = try? String(contentsOfFile: path ?? "") {
            let lines = listFile.components(separatedBy: "\n")
            // NOTE: There is also a CSV format that uses ',' as a separator
            // So verify if yours uses ';' or ','
            let rows: [[String: String]] = lines.compactMap() {
                (item) -> [String: String]? in
                let components = item.components(separatedBy: ";")
                if components.count != 2 {
                    return nil
                }
                let name = components[0]
                let id = components[1]
                let nickname = name.components(separatedBy: " ").first ?? ""
                let dict = [
                    "id":    id,
                    "name": name,
                    "nickBuddy" : nickname
                ]
                return dict
            }
            for row in rows {
                let fetchRequest: NSFetchRequest<Buddy> = Buddy.fetchRequest()
                fetchRequest.predicate = NSPredicate(format: "buddyName == %@", row["name"] ?? "")
                do {
                    let results = try viewContext.fetch(fetchRequest)
                    if let existingBuddy = results.first {
                        // Update the existing object
                        existingBuddy.buddyName = row["name"]
                        // Update other properties as needed
                    } else {
                        // Create a new object
                        let newEntity = Buddy(context: viewContext)
                        newEntity.buddyName = row["name"]
                        newEntity.buddyNick = row["nickBuddy"]
                        newEntity.id = UUID()
                        newEntity.itsMe = false
                        newEntity.isScanned = false
                        // Set other properties as needed
                    }
                } catch {
                    print("Error fetching data: \(error)")
                }
            }
        }
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return shared
    }()
    
    let container: NSPersistentContainer
    
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "A_Buddy")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}
