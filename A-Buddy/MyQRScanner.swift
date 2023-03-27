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
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View{
        CodeScannerView(codeTypes: [.qr]) { response in
            switch response {
            case .success(let result):
                print(result)
                let dateFormatter = ISO8601DateFormatter()
                let string = result.string
                let lines = string.split(separator: "\n")
//                let birthdate = lines[2]
//                let birthday = dateFormatter.date(from:String(birthdate))
                if String(lines[0]) == buddy.buddyName {
                    buddyManager.updateBuddy(buddy: buddy, newName: String(lines[1]), newBirthday: dateFormatter.date(from: String(lines[2])) ?? Date.now, newPhoneNumber: String(lines[3]), itsScanned: true)
                }
                presentationMode.wrappedValue.dismiss()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
