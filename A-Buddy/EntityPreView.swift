//
//  buddyDetailView.swift
//  A-Buddy
//
//  Created by Ahmad Fariz on 23/03/23.
//

import SwiftUI
import CoreData

struct EntityPreView: View {
    let buddy: Buddy
    private let bluePrimaryColor = Color(red: 49/255, green: 175/255, blue: 171/255)
    private let redSecondaryColor = Color(red: 255/255, green: 143/255, blue: 145/255)
    private let padEdge = EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0)
        
    private let itemFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .none
        return formatter
    }()
    
    var body: some View {
        VStack () {
            if buddy.isScanned || buddy.itsMe
            {
                VStack(alignment: .leading){
                    Text(buddy.buddyNick ?? "nickname")
                        .font(.system(size: 17, design: .rounded))
                        .bold()
                        .foregroundColor(bluePrimaryColor)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                    HStack{
                        Image("PhoneNumber")
                            .resizable()
                            .frame(width: 18, height: 22)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5))
                        Text(buddy.buddyPhoneNumber ?? "")
                            .font(.system(size: 14, design: .rounded))
                            .bold()
                            .foregroundColor(bluePrimaryColor)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 65))
                    }
                    HStack{
                        Image("Birthdate").resizable().frame(width: 22, height: 19).padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5))
                        Text("\(buddy.buddyBirthday ?? Date(), formatter: itemFormatter)")
                            .font(.system(size: 14, design: .rounded))
                            .bold()
                            .foregroundColor(bluePrimaryColor)

                    }
                }.padding(padEdge)

            }else{
                HStack(){
                    Image("Lock")
                        .resizable()
                        .frame(width: 15, height: 18)
                    Text(buddy.buddyNick ?? "nickname")
                        .font(.system(size: 17, design: .rounded))
                        .bold()
                        .foregroundColor(redSecondaryColor)
                    Spacer()
                    Divider()
                    Button {
                        print("test")
                    } label: {
                        Image("Camera")
                            .resizable()
                            .frame(width: 50, height: 50)
                    }.padding()
                    
                }.padding(padEdge)
                //Divider()
            }
        }
    }
}



	
