//
//  ContentView.swift
//  Abuddy
//
//  Created by Yovita Handayiani on 20/03/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(){
            ZStack(alignment: .trailing){
                Image("bgfayfay").ignoresSafeArea()
                Image("QRSymbol").padding(EdgeInsets(top: -130, leading: -80, bottom: 0, trailing: 0))
            }
            HStack{
                Image("profile_fayfay").resizable().frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .overlay{
                        Circle().stroke(.gray, lineWidth: 0)
                    }.shadow(color: Color(red: 220/255, green: 220/255, blue: 220/255), radius: 10,x: 0, y: 3)
                Text("Unknown")
            }.offset(x: -100, y: -115)
            //cart lock
            VStack(alignment: .leading){
                Text("Friends List")
                HStack{
                    Image("profile_fayfay").resizable().frame(width: 75, height: 75)
                        .clipShape(Circle())
                        .overlay{
                            Circle().stroke(.gray, lineWidth: 1)
                        }
                    HStack(){
                        VStack{
                            Text("Nickname")
                            Text("Fullname")
                        }
                        VStack{
                                Text("Phone Number")
                                Text("Birthdate")
                        }.frame(maxWidth: 100, maxHeight: 100)
                            .background(Color(red: 254/255, green: 219/255, blue: 165/255))
                    }
                }.background(Color(red: 255/255, green: 143/255, blue: 145/255)).cornerRadius(10)
                    .shadow(color: Color(red: 220/255, green: 220/255, blue: 220/255), radius: 10,x: 3, y: 0)
            }
            
            //cart unlock
            VStack(alignment: .leading){
                HStack{
                    Image("profile_fayfay").resizable().frame(width: 55, height: 55)
                        .clipShape(Circle())
                        .overlay{
                            Circle().stroke(.gray, lineWidth: 1)
                        }
                    HStack(){
                        VStack{
                            Text("Nickname").foregroundColor(.white).bold().font(.system(size: 16, design: .rounded))
                            Text("Fullname").foregroundColor(.white).font(.system(size: 14, design: .rounded))
                        }
                        VStack{
                                Text("Phone Number").foregroundColor(Color(red: 49/255, green: 175/255, blue: 171/255)).font(.system(size: 14, design: .rounded))
                                Text("Birthdate").foregroundColor(Color(red: 49/255, green: 175/255, blue: 171/255)).font(.system(size: 14, design: .rounded))
                        }.frame(maxWidth: 100, maxHeight: 100)
                            .background(Color.white)
                    }
                }.background(Color(red: 49/255, green: 175/255, blue: 171/255)).cornerRadius(10)
                    .shadow(color: Color(red: 220/255, green: 220/255, blue: 220/255), radius: 10,x: 3, y: 0)
            }
            
            Spacer()
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

