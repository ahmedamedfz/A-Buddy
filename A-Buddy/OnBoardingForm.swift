//
//  OnBoardingForm.swift
//  A-Buddy
//
//  Created by Yovita Handayiani on 23/03/23.
//

import SwiftUI

struct OnBoardingForm: View {
    @State private var test = ""
    @State private var selection = "Select name"
    let tests = ["i", "my", "me", "mine", "you", "your", "yours", "our", "ours"]
    
    var body: some View {
        VStack{
            ZStack{
                
                ZStack{
                    
                    Form{
                        Section(header:  Image("FormHeader").resizable().frame(width: 166, height: 29).padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))){
                            Text("Who are you on this list?").font(.system(size: 17, design: .rounded))
                            Picker("Select name", selection: $selection){
                                ForEach(tests, id: \.self){
                                    Text($0)
                                }
                            }.font(.system(size: 17, design: .rounded)).foregroundColor(Color(red: 49/255, green: 175/255, blue: 171/255))
                            Text("What should we call you?").font(.system(size: 17, design: .rounded))
                            TextField(text: $test, prompt: Text("Required")){
                                
                            }.font(.system(size: 17, design: .rounded))
                            Text("When is your Birthday?").font(.system(size: 17, design: .rounded))
                            TextField(text: $test, prompt: Text("Required")){
                                
                            }.font(.system(size: 17, design: .rounded))
                            Text("Your WhatsApp number?").font(.system(size: 17, design: .rounded))
                            TextField(text: $test, prompt: Text("Required")){
                              
                            }.font(.system(size: 17, design: .rounded))
                        }
                    }
//                    .background(Color.green)
//                    .onAppear { // ADD THESE
//                      UITableView.appearance().backgroundColor = .clear
//                    }
//                    .onDisappear {
//                      UITableView.appearance().backgroundColor = .systemGroupedBackground
//                    }
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
                }
                
               
            }.frame(width: 360, height: 486)
                .background(Color.white).cornerRadius(42)
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .background(Color(red: 254/255, green: 219/255, blue: 165/255))
    }
}

struct OnBoardingForm_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingForm()
    }
}
