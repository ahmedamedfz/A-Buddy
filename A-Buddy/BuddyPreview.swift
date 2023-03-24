//
//  BuddyPreview.swift
//  A-Buddy
//
//  Created by Ahmad Fariz on 23/03/23.
//

import SwiftUI
import CoreData

struct BuddyPreview {
    let buddy: Buddy
    
    var body: some View {
        VStack(){
            if !buddy.isScanned
            {
                HStack(){
                    Image("Lock").resizable().frame(width: 18, height: 19)
                    Text(buddy.buddyNick ?? "nickname").font(.system(size: 17, design: .rounded)).bold().foregroundColor(Color(red: 255/255, green: 143/255, blue: 145/255))
                    Divider()
                    Button {
                        print("test")
                    } label: {
                        Image("Camera").resizable().frame(width: 50, height: 49)
                    }.padding()
                }.padding(EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 0))
                Divider()
            }
            else
            {
                    VStack(alignment: .leading){
                        Text(buddy.buddyNick ?? "nickname").font(.system(size: 17, design: .rounded)).bold().foregroundColor(Color(red: 49/255, green: 175/255, blue: 171/255)).padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                        HStack{
                            Image("PhoneNumber").resizable().frame(width: 18, height: 22).padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5))
                            Text("\(buddy.buddyPhoneNumber)").font(.system(size: 16, design: .rounded)).bold().foregroundColor(Color(red: 49/255, green: 175/255, blue: 171/255)).padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 65))
                            Image("Birthdate").resizable().frame(width: 22, height: 19).padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5))
                            Text("\(buddy.buddyBirthday ?? Date())").font(.system(size: 16, design: .rounded)).bold().foregroundColor(Color(red: 49/255, green: 175/255, blue: 171/255))
                            
                        }
                    }.padding(EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 0))
                Divider()
                }
            Text("ola")
            }
        }
    }

