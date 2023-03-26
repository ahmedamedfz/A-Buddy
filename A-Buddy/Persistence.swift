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
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext

        if let listFile = try? String(contentsOfFile: "/Users/ahmadfariz/Documents/Xcode/NC1/A-Buddy/A-Buddy/dataBuddy.csv") {
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
                        let newEntity = Buddy(context: viewContext)
                            newEntity.buddyName = row["name"]
                            newEntity.buddyNick = row["nickBuddy"]
                            newEntity.id = UUID()
                            newEntity.itsMe = false
                        newEntity.isScanned = false
                    // set other properties as needed
                }
                    }
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
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
