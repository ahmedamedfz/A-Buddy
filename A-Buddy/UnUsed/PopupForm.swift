//
//  PopupForm.swift
//  A-Buddy
//
//  Created by Ahmad Fariz on 24/03/23.
//
import SwiftUI
import CoreData

struct AddUserForm: View {
    @Binding var selectedUser: String
    @Binding var name: String
    @Binding var birthday: String
    @Binding var phoneNumber: String
    var buddy: FetchedResults<Buddy>
    
    var body: some View {
        Form {
            Section(header:
                        Image("FormHeader")
                .resizable()
                .frame(width: 166, height: 29)
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 5, trailing: 0))) {
                    Text("Who are you on this list?")
                        .font(.system(size: 17, design: .rounded))
                        .listRowSeparator(.hidden)
                    Picker("Select name", selection: $selectedUser) {
                        ForEach(buddy, id: \.self) { buddy in
                            Text(buddy.buddyName ?? "Unknown")
                        }
                    }
                    .font(.system(size: 17, design: .rounded))
                    .foregroundColor(Color(red: 49/255, green: 175/255, blue: 171/255))
                    
                    Text("What should we call you?")
                        .font(.system(size: 17, design: .rounded))
                        .listRowSeparator(.hidden)
                    
                    TextField("Required", text: $name)
                        .font(.system(size: 17, design: .rounded))
                        .foregroundColor(Color(red: 49/255, green: 175/255, blue: 171/255))
                    
                    
                    Text("When is your Birthday?")
                        .font(.system(size: 17, design: .rounded))
                        .listRowSeparator(.hidden)
                    
                    TextField("Required", text: $birthday)
                        .font(.system(size: 17, design: .rounded))
                        .foregroundColor(Color(red: 49/255, green: 175/255, blue: 171/255))
                    
                    Text("Your WhatsApp number?")
                        .font(.system(size: 17, design: .rounded))
                        .listRowSeparator(.hidden)
                    
                    TextField("Required", text: $phoneNumber)
                        .font(.system(size: 17, design: .rounded))
                    
                }
                .font(.system(size: 17, design: .rounded))
                .foregroundColor(Color(red: 49/255, green: 175/255, blue: 171/255))
            }
    }
}


