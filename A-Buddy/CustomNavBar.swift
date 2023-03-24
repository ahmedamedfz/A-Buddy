//
//  CustomNavBar.swift
//  A-Buddy
//
//  Created by Ahmad Fariz on 23/03/23.
//

import SwiftUI

struct CustomNavBar: View {
    var body: some View {
            HStack {
                Image("ProfilePicture")
                    .resizable()
                    .frame(width: 92, height: 92)
                    .clipShape(Circle())
                    .shadow(color: Color(red: 220/255, green: 220/255, blue: 220/255), radius: 10, x: 0, y: 3)
                Text("Nickname")
                    .font(.system(size: 22, design: .rounded))
                    .bold()
            }.padding(EdgeInsets(top: 100, leading: 0, bottom: 0, trailing: 0))
    }
}

