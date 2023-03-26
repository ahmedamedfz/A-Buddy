//
//  MyQRScanner.swift
//  A-Buddy
//
//  Created by Ahmad Fariz on 26/03/23.
//

import Foundation
import SwiftUI
import CodeScanner

struct MyQRScanner : View {
    let buddy : Buddy
    var buddyManager = BuddyManager(persistentContainer: PersistenceController.shared.container)
    var body: some View{
        CodeScannerView(codeTypes: [.qr]) { response in
            switch response {
            case .success(let result):
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "dd-MM-yy"
                let string = result.string
                let lines = string.split(separator: "\n")
                let birthdate = lines[2]
                let birthday = dateFormatter.date(from:String(birthdate))
                buddyManager.updateBuddy(buddy: buddy, newName: String(lines[1]), newBirthday: birthday!, newPhoneNumber: String(lines[3]), itsScanned: true)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
