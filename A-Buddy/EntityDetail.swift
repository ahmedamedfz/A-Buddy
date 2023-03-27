
//
//  ProfileView.swift
//  A-buddy
//
//  Created by Ahmad Fariz on 20/03/23.
//

import SwiftUI
import CoreData
import Contacts

struct EntityDetail: View {
    
    let buddy: Buddy
    let contact = CNMutableContact()
    private let bluePrimaryColor = Color(red: 49/255, green: 175/255, blue: 171/255)
    private let redSecondaryColor = Color(red: 255/255, green: 143/255, blue: 145/255)
    private let yellowComplementaryColor = Color(red: 254/255, green: 219/255, blue: 165/255)
    var body: some View {
        ZStack() {
            Image("Header")
                .resizable()
                .frame(width: 399, height: 693)
                .offset(y: -120)
                .ignoresSafeArea(.all)
            
            
            VStack {
                VStack(alignment: .leading) {
                    Form{
                        HStack {
                            Text("Full Name")
                                .font(.system(size: 17, design:.rounded))
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 30))
                            Text(buddy.buddyName!)
                        }
                        .listRowSeparator(.hidden)
                        .overlay(VStack {Divider().frame(width: 1000, height: 1).offset(x: 7, y: 18)})
                        
                        HStack {
                            Text("Birthday")
                                .font(.system(size: 17, design:.rounded))
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 41))
                            Text("\(buddy.buddyBirthday ?? Date(), formatter: itemFormatter) ")
                        }
                        .listRowSeparator(.hidden)
                        .overlay(VStack {Divider().frame(width: 1000, height: 1).offset(x: 7, y: 18)}
                        )
                        HStack{
                            Text("Phone Number")
                                .font(.system(size: 17, design: .rounded))
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 25))
                            Text(buddy.buddyPhoneNumber ?? "")
                        }
                        .listRowSeparator(.hidden)
                        .overlay(VStack{Divider().frame(width: 1000,height: 1).offset(x: 7, y: 18)})
                        HStack{
                            Text("Together Memories")
                                .font(.system(size: 17, design: .rounded))
                                .bold()
                                .padding(10)
                            Text("Coming Soon")
                        }
                    }
                    .scrollContentBackground(.hidden)
                    .padding(EdgeInsets(top: 100, leading: 0, bottom: 0, trailing: 0))
                }.frame(width: 395, height: 680)
                    .background(.white)
                    .cornerRadius(42)
                    .offset(y: 224)
                VStack{
                    Image("ProfilePicture").resizable().frame(width: 120, height: 120)
                        .clipShape(Circle())
                        .shadow(color: Color(red: 220/255, green: 220/255, blue: 220/255), radius: 10,x: 0, y: 3).offset(x:0, y:5)
                    Text(buddy.buddyNick ?? "")
                        .font(.system(size: 22, design: .rounded))
                        .bold()
                        .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                    Button("+ Add to Contacts") {
                        // Create a mutable object to add to the contact.
                        // Mutable object means an object state that can be modified after created.
                        let contact = CNMutableContact()
                        // Name
                        contact.givenName = buddy.buddyName ?? ""
                        // Phone No.
                        contact.phoneNumbers = [CNLabeledValue(label: CNLabelPhoneNumberiPhone, value: CNPhoneNumber(stringValue: buddy.buddyPhoneNumber ?? ""))]
                        // Save the created contact.
                        let store = CNContactStore()
                        let saveRequest = CNSaveRequest()
                        saveRequest.add(contact, toContainerWithIdentifier: nil)
                        do {
                            try store.execute(saveRequest)
                        } catch {
                            print("Error occur: \(error)")
                            // Handle error
                            // may add a alert...
                        }
                    }
                    .buttonStyle(.borderless)
                    .foregroundColor(bluePrimaryColor)
                    .background(Color.white)
                }.offset(y: -540)
            }
        }
    }
    private let itemFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .none
        return formatter
    }()
}



