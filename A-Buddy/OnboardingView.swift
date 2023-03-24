//
//  OnBoardingForm.swift
//  A-Buddy
//
//  Created by Yovita Handayiani on 23/03/23.
//
import SwiftUI
import CoreData

struct OnBoardingForm: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Buddy.buddyName, ascending: true)])
    private var buddy: FetchedResults<Buddy>
    
    @State private var selectedUser: Buddy?
    @State private var name: String = ""
    @State private var birthday: String = ""
    @State private var phoneNumber: String = ""
    var body: some View {
        VStack {
            ZStack {
                ZStack {
                   Form{
                        Section(header:
                                    Image("FormHeader")
                                        .resizable()
                                        .frame(width: 166, height: 29)
                                        .padding(EdgeInsets(top: 10, leading: 0, bottom: 5, trailing: 0))) {
                                    Text("Who are you on this list?")
                                        .font(.system(size: 17, design: .rounded))
                                        .listRowSeparator(.hidden)
                                    Picker(selection: $selectedUser, label: EmptyView()) {
                                            ForEach(buddy, id: \.self) { buddy in
                                                Text(self.buddy.buddyName!)
                                            }
                                }
                                .font(.system(size: 17, design: .rounded))
                                .foregroundColor(Color(red: 49/255, green: 175/255, blue: 171/255))
                                
                                Text("What should we call you?")
                                    .font(.system(size: 17, design: .rounded))
                                    .listRowSeparator(.hidden)
                                
                                TextField("Required", text: $name)
                                    .font(.system(size: 17, design: .rounded))
                                    .foregroundColor(Color(red: 49/255, green: 175/255, blue: 171/255))
                                  
                                
                                Text("When is your Birthday?")
                                    .font(.system(size: 17, design: .rounded))
                                    .listRowSeparator(.hidden)
                                
                                TextField("Required", text: $birthday)
                                    .font(.system(size: 17, design: .rounded))
                                    .foregroundColor(Color(red: 49/255, green: 175/255, blue: 171/255))
                                   
                                
                                Text("Your WhatsApp number?")
                                    .font(.system(size: 17, design: .rounded))
                                    .listRowSeparator(.hidden)
                                
                                TextField("Required", text: $phoneNumber)
                                    .font(.system(size: 17, design: .rounded))
                                
                            }
                            .font(.system(size: 17, design: .rounded))
                            .foregroundColor(Color(red: 49/255, green: 175/255, blue: 171/255))
                    }
                }
                .scrollContentBackground(.hidden)
                Button {
                print("test")
                }
                label:
                {
                Image("NextButton")
                        .resizable()
                        .frame(width: 43, height: 43)
                }
                .offset(x: 140, y:200)
            }
            .frame(width: 360, height: 486)
            .background(Color.white).cornerRadius(42)
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .background(Color(red: 254/255, green: 219/255, blue: 165/255))
    }
}
struct OnBoardingForm_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingForm().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
