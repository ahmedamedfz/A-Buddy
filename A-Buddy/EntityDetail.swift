
//
//  ProfileView.swift
//  A-buddy
//
//  Created by Ahmad Fariz on 20/03/23.
//

import SwiftUI
import CoreData
import ImagePickerModule

struct EntityDetail: View {
    
    let buddy: Buddy
    
    @State private var image: UIImage?
 
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
                    HStack{
                        Text("Together Memories")
                            .font(.system(size: 17, design: .rounded))
                            .bold()
                            .padding(10)
                    }
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
    func saveImageToDisk(image: UIImage, buddy : Buddy) -> URL? {
            let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let fileName = buddy.id?.uuidString
            let fileURL = documentsDirectory.appendingPathComponent(fileName ?? "")
            guard let data = image.jpegData(compressionQuality: 1) else { return nil }
            do {
                try data.write(to: fileURL)
                return fileURL
            } catch {
                print("Error saving image:", error)
                return nil
            }
        }
}



