//
//  ContentView.swift
//  A-Buddy
//
//  Created by Ahmad Fariz on 20/03/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Buddy.itsMe, ascending: true)])
    private var users: FetchedResults<Buddy>
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Buddy.buddyName, ascending: true)],
        animation: .default)
    private var entity: FetchedResults<Buddy>
    
    var body: some View {
        let searchValue = true
        let filteredResults = users.filter { $0.itsMe == searchValue }
        let theUser = filteredResults.first
        NavigationView {
            ZStack {
                List {
                    ForEach(entity){
                        entity in NavigationLink{
                            PersonalView(tappedBuddy: entity)
                        } label: {
                            EntityPreView(buddy: entity)
                        }
                    }
                }
                .padding(EdgeInsets(top: 50, leading: 0, bottom: 0, trailing: 0))
                .toolbar {}
                
                HStack {
                        Image("ProfilePicture")
                            .resizable()
                            .frame(width: 92, height: 92)
                            .clipShape(Circle())
                            .shadow(color: Color(red: 220/255, green: 220/255, blue: 220/255), radius: 10, x: 0, y: 3)
                        Text((theUser?.buddyName ?? ""))
                            .font(.system(size: 22, design: .rounded))
                            .bold()
                    }.offset(y:-330)
                }
            }.background(Color(red: 254/255, green: 219/255, blue: 165/255))
        }
    }
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
    }

