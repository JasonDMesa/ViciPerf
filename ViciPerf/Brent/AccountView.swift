//
//  AccountView.swift
//  ViciPerf
//
//  Created by Jason Mesa on 4/16/24.
//

import SwiftUI
struct AccountView: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var birthdate = Date()
    var body: some View {
        NavigationView {
            ZStack {
                Color(.black)
                    .ignoresSafeArea()
                VStack {
                    HeaderView()
                        .font(.system(size: 30))
                        .bold(true)
                        .foregroundColor(.white)
                    Form {
                        
                        Section(header: Text("Personal Information")) {
                            TextField("First Name", text: $firstName)
                            TextField("Last Name", text: $lastName)
                            DatePicker("Birthdate", selection: $birthdate, displayedComponents: .date)
                            }
                        }
                    }
                    .toolbar {
                        ToolbarItemGroup(placement: .navigationBarTrailing) {
                            //Button("Save", action: saveUser)
                        }
                    }
                    .scrollContentBackground(.hidden)
                    .foregroundColor(Color.black)
                    .background(Color.gray)
        
                }
            }
        }
}
    struct AccountView_Previews: PreviewProvider {
        static var previews: some View {
            AccountView()
        }
    }


