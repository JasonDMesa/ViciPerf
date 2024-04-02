//
//  SettingsViewModel.swift
//  ViciPerf
//
//  Created by Jason Mesa on 3/27/24.
//

import Foundation


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
