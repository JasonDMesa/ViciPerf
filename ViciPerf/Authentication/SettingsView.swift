//
//  SettingsView.swift
//  ViciPerf
//
//  Created by Jason Mesa on 3/11/24.
//

import SwiftUI

//Should try to load the users email into the view model before calling the resetPassword func

@MainActor
final class SettingsViewModel: ObservableObject {
    
    
    func signOut() throws {
        try AuthenticationManager.shared.signOut()
    }
    
    func deleteAccount() async throws{
        try await AuthenticationManager.shared.delete()
    }
    
    func resetPassword() async throws {
        let authUser = try AuthenticationManager.shared.getAuthenticatedUser()
        
        guard let email = authUser.email else {
            throw URLError(.fileDoesNotExist) //need to throw a specific error code
        }
                
       try await AuthenticationManager.shared.resetPassword(email: email)
    }
    
    //just verifying completion via button
    func updateEmail() async throws {
        let email = "hello123@email.com"
        try await AuthenticationManager.shared.updateEmail(email: email)
    }
    
    //just verifying completion via button
    func updatePassword() async throws {
        let password = "Hello123!"
        try await AuthenticationManager.shared.updateEmail(email: password)
    }
}

struct SettingsView: View {
    
    @StateObject private var viewModel = SettingsViewModel()
    @Binding var showSignInView: Bool
    
    var body: some View {
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
            
            emailSection
        }
        .navigationBarTitle("Settings")
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
