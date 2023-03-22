//
//  ContentView.swift
//  Abuddy
//
//  Created by Yovita Handayiani on 20/03/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack(){
            Image("Header").resizable().frame(width: 389,height: 693).offset(y:-100)
            VStack{
                VStack(alignment: .leading){
                    Divider()
                    Text("Friend List").font(.system(size: 20, design: .rounded)).bold().padding(EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 0))
                    Divider()
                    
                    //Lock
                    HStack(){
                        Image("Lock").resizable().frame(width: 18, height: 19)
                        Text("Nickname").font(.system(size: 17, design: .rounded)).bold().foregroundColor(Color(red: 255/255, green: 143/255, blue: 145/255)).padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 160))
                        Button {
                            print("test")
                        } label: {
                            Image("Camera").resizable().frame(width: 50, height: 49)
                        }
                        
                    }.padding(EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 0))
                    Divider()
                    
                    //Unlock
                    VStack(alignment: .leading){
                        Text("Name").font(.system(size: 17, design: .rounded)).bold().foregroundColor(Color(red: 49/255, green: 175/255, blue: 171/255)).padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))

                        HStack{
                            Image("PhoneNumber").resizable().frame(width: 18, height: 22).padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5))

                            Text("Phone Number").font(.system(size: 16, design: .rounded)).bold().foregroundColor(Color(red: 49/255, green: 175/255, blue: 171/255)).padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 65))

                            Image("Birthdate").resizable().frame(width: 22, height: 19).padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5))

                            Text("Birthdate").font(.system(size: 16, design: .rounded)).bold().foregroundColor(Color(red: 49/255, green: 175/255, blue: 171/255))

                        }
                    }.padding(EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 0))
                    Divider()
                }.padding(EdgeInsets(top: 100, leading: 0, bottom: 0, trailing: 0))
                Spacer()
            }.frame(width: 390, height: 680).background(.white).cornerRadius(42).offset(y: 164)
            HStack{
                Button{
                    print("text")
                }label: {
                    Image("ProfilePicture").resizable().frame(width: 92, height: 92)
                        .clipShape(Circle())
                        .shadow(color: Color(red: 220/255, green: 220/255, blue: 220/255), radius: 10,x: 0, y: 3).offset(x:0, y:5)
                }
                Text("Nickname").font(.system(size: 22, design: .rounded)).bold().offset(x:10, y:20)
            }.offset(x:-50, y: -170)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

