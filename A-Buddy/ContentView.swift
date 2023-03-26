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
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Buddy.buddyName, ascending: true)],animation: .default)
    private var entity: FetchedResults<Buddy>
    private let bluePrimaryColor = Color(red: 49/255, green: 175/255, blue: 171/255)
    private let redSecondaryColor = Color(red: 255/255, green: 143/255, blue: 145/255)
    
    var body: some View {
        let filteredResultsMe = users.filter { $0.itsMe}
        let theUser = filteredResultsMe.first
        let scannedOnly = users.filter{$0.isScanned}
        let scannedCount = scannedOnly.count
        NavigationView {
            ZStack {
                Color(red: 254/255, green: 219/255, blue: 165/255).edgesIgnoringSafeArea(.all)
                Image("Header").resizable().offset(y:-200).edgesIgnoringSafeArea(.all)
                List {
                    Text("Friend List").font(.system(size: 22, design: .rounded)).bold()
                    ForEach(entity){
                        entity in NavigationLink{
                            PersonalView(tappedBuddy: entity)
                        } label: {
                            EntityPreView(buddy: entity)
                        }
                    }
                }
                .padding(EdgeInsets(top: 80, leading: 0, bottom: 0, trailing: 0))
                .toolbar {}
                
                HStack {
                        Image("ProfilePicture")
                            .resizable()
                            .frame(width: 92, height: 92)
                            .clipShape(Circle())
                            .shadow(color: Color(red: 220/255, green: 220/255, blue: 220/255), radius: 10, x: 0, y: 3)
                    VStack{
                        Text((theUser?.buddyName ?? ""))
                            .font(.system(size: 22, design: .rounded))
                            .bold()
                        HStack{
                            Image(systemName: "medal.fill")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(scannedCount > 0 ? bluePrimaryColor : redSecondaryColor)
                            Image(systemName: "medal.fill")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(scannedCount > 10 ? bluePrimaryColor : redSecondaryColor)
                            Image(systemName: "medal.fill")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(scannedCount > 50 ? bluePrimaryColor : redSecondaryColor)
                            Image(systemName: "medal.fill")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(scannedCount > 90 ? bluePrimaryColor : redSecondaryColor)
                        }
                    }
                }
                .offset(x:-50,y:-320)
                }
        }
    }
}
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
    }

