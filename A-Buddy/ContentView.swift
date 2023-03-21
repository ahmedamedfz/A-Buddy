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
                    Image("profile_fayfay").resizable().frame(width: 55, height: 55)
                        .clipShape(Circle())
                        .overlay{
                            Circle().stroke(.gray, lineWidth: 1)
                        }
                    HStack(){
                        VStack{
                            Text("Nickname").foregroundColor(.white).bold().font(.system(size: 16, design: .rounded))
                        
                            Text("Scan").foregroundColor(Color(red: 49/255, green: 175/255, blue: 171/255)).font(.system(size: 12, design: .rounded)).background(.white).cornerRadius(15).shadow(color: Color(red: 220/255, green: 220/255, blue: 220/255), radius: 10,x: 3, y: 0).frame()
                        }
                        VStack{
                            Image("lock").resizable().frame(width: 28, height: 34).padding(EdgeInsets(top: 4, leading: 0, bottom: -4, trailing: 0))
                                Text("Unknown").foregroundColor(Color(red: 49/255, green: 175/255, blue: 171/255)).font(.system(size: 14, design: .rounded))
                        }.frame(maxWidth: 100, maxHeight: 100)
                            .background(Color(red: 254/255, green: 219/255, blue: 165/255))
                    }
                }.background(Color(red: 255/255, green: 143/255, blue: 145/255)).cornerRadius(15)
                    .shadow(color: Color(red: 220/255, green: 220/255, blue: 220/255), radius: 10,x: 3, y: 0)
            }
            
            //cart unlock
            VStack(alignment: .leading){
                HStack{
                    Image("profile_fayfay").resizable().frame(width: 55, height: 55)
                        .clipShape(Circle())
                        .overlay{
                            Circle().stroke(.gray, lineWidth: 1)
                        }.offset(x:20, y: 0)
                    HStack{
                        VStack(alignment: .leading){
                            Text("Nickname").foregroundColor(.white).bold().font(.system(size: 16, design: .rounded))
                            Text("Fullname").foregroundColor(.white).font(.system(size: 14, design: .rounded))
                        }.frame(width: 140, height: 100)
                        VStack(alignment: .leading){
                            Text("Phone Number").foregroundColor(Color(red: 49/255, green: 175/255, blue: 171/255)).font(.system(size: 14, design: .rounded)).padding(EdgeInsets(top: 0, leading: 0, bottom: -10, trailing: 0))
                            HStack{
                                Image("birthday").resizable().frame(width: 28, height: 30).padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: -5))
                                Text("Birthdate").foregroundColor(Color(red: 49/255, green: 175/255, blue: 171/255)).font(.system(size: 14, design: .rounded))
                            }
                        }.frame(width: 150, height: 100)
                            .background(Color.white)
                    }
                }.background(Color(red: 49/255, green: 175/255, blue: 171/255)).cornerRadius(15)
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

