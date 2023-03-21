//
//  Index.swift
//  A-Buddy
//
//  Created by Yovita Handayiani on 21/03/23.
//

import SwiftUI

struct Index: View {
    var body: some View {
        VStack{
            Image("Index").resizable().frame(width: 250, height: 300)
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .background(Color(red: 254/255, green: 219/255, blue: 165/255))
    }
}

struct Index_Previews: PreviewProvider {
    static var previews: some View {
        Index()
    }
}
