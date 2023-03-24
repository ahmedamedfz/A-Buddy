//
//  OnBoardingForm.swift
//  A-Buddy
//
//  Created by Yovita Handayiani on 23/03/23.
//

import SwiftUI

struct OnBoardingForm: View {
    @State private var test = ""
    @State private var selection = 0
    var tests = ["Select Name", "Yovita Handayiani", "me", "mine", "you", "your", "yours", "our", "ours"]
    
    var body: some View {
        ZStack{
            VStack{
                Form(){
                    Section(header:  Image("FormHeader").resizable().frame(width: 166, height: 29).padding(EdgeInsets(top: 10, leading: 0, bottom: 5, trailing: 0))){
                        Text("Who are you on this list?").font(.system(size: 17, design: .rounded)).listRowSeparator(.hidden)
                        
                        Picker(selection: $selection, label: EmptyView()){
                            ForEach(0..<tests.count, id: \.self) {
                                Text(self.tests[$0])
                            }
                        }.pickerStyle(.menu).tint(Color(red: 49/255, green: 175/255, blue: 171/255)).font(.system(size: 17, design: .rounded)).overlay(VStack{Divider()
                                .frame(width: 303,height: 1)
                            .background(Color(red: 49/255, green: 175/255, blue: 171/255)).offset(x: 7, y: 15)})
                        Text("What should we call you?").font(.system(size: 17, design: .rounded)).listRowSeparator(.hidden)
                        
                        TextField(text: $test, prompt: Text("Required").font(.system(size: 17, design: .rounded)).foregroundColor(Color(red: 49/255, green: 175/255, blue: 171/255))){
                            
                        }.font(.system(size: 17, design: .rounded)).foregroundColor(Color(red: 49/255, green: 175/255, blue: 171/255)) .overlay(VStack{Divider()
                                .frame(width: 303,height: 1)
                            .background(Color(red: 49/255, green: 175/255, blue: 171/255)).offset(x: 7, y: 15)})
                        Text("When is your Birthday?").font(.system(size: 17, design: .rounded)).listRowSeparator(.hidden)
                        TextField(text: $test, prompt: Text("Required").font(.system(size: 17, design: .rounded)).foregroundColor(Color(red: 49/255, green: 175/255, blue: 171/255))){
                            
                        }.font(.system(size: 17, design: .rounded)).overlay(VStack{Divider()
                                .frame(width: 303,height: 1)
                            .background(Color(red: 49/255, green: 175/255, blue: 171/255)).offset(x: 7, y: 15)}).foregroundColor(Color(red: 49/255, green: 175/255, blue: 171/255))
                        Text("Your WhatsApp number?").font(.system(size: 17, design: .rounded)).listRowSeparator(.hidden)
                        TextField(text: $test, prompt: Text("Required").font(.system(size: 17, design: .rounded)).foregroundColor(Color(red: 49/255, green: 175/255, blue: 171/255))){
                            
                        }.font(.system(size: 17, design: .rounded)).overlay(VStack{Divider()
                                .frame(width: 303,height: 1)
                            .background(Color(red: 49/255, green: 175/255, blue: 171/255)).offset(x: 7, y: 15)}).foregroundColor(Color(red: 49/255, green: 175/255, blue: 171/255))
                    }
                }.scrollContentBackground(.hidden)
            }.frame(width: 360, height: 486)
                .background(Color.white).cornerRadius(42)
            Button {
                print("test")
            } label: {
                Image("PrevButton").resizable().frame(width: 43, height: 43)
            }.offset(x: 80, y:200)
            
            Button {
                print("test")
            } label: {
                Image("NextButton").resizable().frame(width: 43, height: 43)
            }.offset(x: 140, y:200)
        } .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            .background(Color(red: 254/255, green: 219/255, blue: 165/255))
    }
}

struct OnBoardingForm_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingForm()
    }
}
