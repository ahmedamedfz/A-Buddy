//
//  OnBoarding.swift
//  A-Buddy
//
//  Created by Yovita Handayiani on 22/03/23.
//

import SwiftUI

struct OnBoarding: View {
    var body: some View {
        VStack{
            ZStack{
                Image("OnBoarding").resizable().frame(width: 282, height: 307).padding(EdgeInsets(top: -30, leading: 0, bottom: 0, trailing: 0))
                Button {
                    print("test")
                } label: {
                    Image("NextButton").resizable().frame(width: 43, height: 43)
                }.offset(x: 140, y:170)
            }.frame(width: 360, height: 430)
                .background(Color.white).cornerRadius(42)
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .background(Color(red: 254/255, green: 219/255, blue: 165/255))
    }
}

struct OnBoarding_Previews: PreviewProvider {
    static var previews: some View {
        OnBoarding()
    }
}
