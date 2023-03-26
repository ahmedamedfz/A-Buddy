//
//  SwiftUIView.swift
//  A-Buddy
//
//  Created by Ahmad Fariz on 24/03/23.
//

import SwiftUI
enum Flavor: String, CaseIterable, Identifiable {
    case chocolate, vanilla, strawberry
    var id: Self { self }
}

struct SwiftUIView: View {
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Buddy.buddyName, ascending: true)])
    private var buddy: FetchedResults<Buddy>
    @State private var selectedUser: String = "Select Name"
    @State private var selectedFlavor: String = "Chocolate"
    
    
    var body: some View {
//        List {
//            Picker("Flavor", selection: $selectedFlavor) {
//                Text("Chocolate").tag("Chocolate")
//                Text("Vanilla").tag("Vanilla")
//                Text("Strawberry").tag("Strawberry")
//            }
//        }
        ZStack {
            Picker("Name", selection: $selectedUser) {
                ForEach(buddy, id: \.self) { buddy in
                    Text(buddy.buddyName ?? "").tag(buddy.buddyName)
                }
            }
        }
        
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
