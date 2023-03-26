//
//  MyQRGenerator.swift
//  A-Buddy
//
//  Created by Ahmad Fariz on 25/03/23.
//

import SwiftUI
import CoreImage.CIFilterBuiltins

struct MyQRGenerator: View {
    let buddy: Buddy
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    
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
                        .overlay(
                            VStack {Divider().frame(width: 1000, height: 1).offset(x: 7, y: 18)
                            }
                        )
                        
                        HStack {
                            Text("Birthday")
                                .font(.system(size: 17, design:.rounded))
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 41))
                            Text("\(buddy.buddyBirthday ?? Date(), formatter: itemFormatter) ")
                        }
                        .listRowSeparator(.hidden)
                        .overlay(
                            VStack {Divider().frame(width: 1000, height: 1).offset(x: 7, y: 18)
                            }
                        )
                        HStack{
                            Text("Phone Number")
                                .font(.system(size: 17, design: .rounded))
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 25))
                            Text(buddy.buddyPhoneNumber ?? "")
                        }
                        .listRowSeparator(.hidden)
                        .overlay(
                            VStack{Divider().frame(width: 1000,height: 1).offset(x: 7, y: 18)})
                        HStack{
                            Spacer()
                            Text("My QR")
                                .font(.system(size: 17, design: .rounded))
                                .padding(10)
                            Spacer()
                        }.listRowSeparator(.hidden)
                        HStack{
                            Spacer()
                            Image(uiImage: generateQRCode(from: "\(buddy.buddyName ?? "")\n\(buddy.buddyNick ?? "")\n\(formattedBirthday(buddy.buddyBirthday!))\n\(buddy.buddyPhoneNumber ?? "")"))
                                .interpolation(.none)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 200, height: 200)
                            Spacer()
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
                }.offset(y: -540)
            }
        }
    }
    
    func generateQRCode(from string: String) -> UIImage {
        let data = Data(string.utf8)
        filter.setValue(data, forKey: "inputMessage")
        
        if let outputImage = filter.outputImage {
            if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
                return UIImage(cgImage: cgimg)
            }
        }
        
        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
    
    func formattedBirthday(_ date: Date) -> String {
        let dateFormatter = ISO8601DateFormatter()
        return dateFormatter.string(from: date)
    }
    private let itemFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .none
        return formatter
    }()
}
