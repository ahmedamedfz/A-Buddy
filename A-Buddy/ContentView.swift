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
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Buddy.buddyName, ascending: true)],
        animation: .default)
    private var entity: FetchedResults<Buddy>
    private let photoManager = PhotoManager(context: PersistenceController.shared.container.viewContext)
    @State var isShowingPopup = true
    @State var selectedUser = ""
    @State var name = ""
    @State var birthday = ""
    @State var phoneNumber = ""
    
    var body: some View {
        ZStack {
                        Color.black.opacity(0.4)
                            .edgesIgnoringSafeArea(.all)
                            .onTapGesture {
                                self.isShowingPopup = false
                            }
                        VStack {
                            HStack {
                                Spacer()
                                Button(action: {
                                    self.isShowingPopup = false
                                }) {
                                    Image(systemName: "xmark.circle.fill")
                                        .font(.title)
                                        .foregroundColor(.red)
                                }
                                .padding()
                            }
                            
                            // Add the form inside the container view
                            AddUserForm(selectedUser: $selectedUser, name: $name, birthday: $birthday, phoneNumber: $phoneNumber, buddy: entity)
                            
                            // Add a button to submit the form
                            Button(action: {
                                print("Form submitted")
                                // Dismiss the popup form after submitting the form
                                self.isShowingPopup = false
                            }) {
                                Text("Close")
                            }
                        }
            NavigationView {
                List {
                    ForEach(entity){
                    entity in NavigationLink{
                            PersonalView(buddy: entity)
                        } label: {
                            EntityPreView(buddy: entity)
                        }
                    }
                }
                .padding(EdgeInsets(top: 50, leading: 0, bottom: 0, trailing: 0))
                .toolbar {}
                .navigationBarItems(leading: HStack {
                    Image("ProfilePicture")
                        .resizable()
                        .frame(width: 92, height: 92)
                        .clipShape(Circle())
                        .shadow(color: Color(red: 220/255, green: 220/255, blue: 220/255), radius: 10, x: 0, y: 3)
                    Text("Nickname")
                        .font(.system(size: 22, design: .rounded))
                        .bold()
                }.padding(EdgeInsets(top: 100, leading: 0, bottom: 0, trailing: 0)))
                
            }
        }.background(Color(red: 254/255, green: 219/255, blue: 165/255))
    }
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
    }
}
