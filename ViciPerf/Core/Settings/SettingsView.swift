//
//  SettingsView.swift
//  ViciPerf
//
//  Created by Jason Mesa on 3/11/24.
//

import SwiftUI

//Should try to load the users email into the view model before calling the resetPassword func

struct SettingsView: View {
    
    @StateObject private var viewModel = SettingsViewModel()
    @Binding var showSignInView: Bool
    
    var body: some View {
        VStack {
            HeaderView()
            List {
                Button("Sign out") {
                    Task {
                        do {
                            try viewModel.signOut()
                            showSignInView = true
                        } catch {
                            //need to apply specific error code this is just generic
                            print(error)
                        }
                    }
                }
                //should generate a pop up confirmation screen
                Button(role: .destructive) {
                    Task {
                        do {
                            try await viewModel.deleteAccount()
                            showSignInView = true
                        } catch {
                            print(error)
                        }
                    }
                } label: {
                    Text("Delete account")
                }
                if viewModel.authProviders.contains(.email) {
                    emailSection
                }
                
            }
            .onAppear {
                viewModel.loadAuthProviders()
            }
            .navigationBarTitle("Settings")
        }
    }
    
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SettingsView(showSignInView: .constant(false))
        }
    }
}

extension SettingsView {
    
    private var emailSection: some View {
        Section {
            Button("Reset Password via Email") {
                Task {
                    do {
                        try await viewModel.resetPassword()
                        print("PASSWORD RESET!")
                    } catch {
                        //need to apply specific error code this is just generic
                        print(error)
                    }
                }
            }
            
            Button("Update Password via Application") {
                Task {
                    do {
                        try await viewModel.updatePassword()
                        print("PASSWORD UPDATED!")
                    } catch {
                        //need to apply specific error code this is just generic
                        print(error)
                    }
                }
            }
            
            Button("Update Email") {
                Task {
                    do {
                        try await viewModel.updateEmail()
                        print("EMAIL UPDATED!")
                    } catch {
                        //need to apply specific error code this is just generic
                        print(error)
                    }
                }
            }
        } header: {
            Text("Email functions")
        }
    }
}
