//
//  SignInViewModel.swift
//  ViciPerf
//
//  Created by Jason Mesa on 3/27/24.
//

import Foundation


@MainActor
final class SignInEmailViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    
    // Incorporate validation instead of just a print out
    // Can do validation to require a more intense password
    func signUp() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            print("Please enter a valid email address or password.")
            return
        }
        
        let authDataResult = try await AuthenticationManager.shared.createUser(email: email, password: password)
        try await UserManager.shared.createNewUser(auth: authDataResult)
    }
    
    func signIn() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            print("Please enter a valid email address or password.")
            return
        }
        
            try await AuthenticationManager.shared.signInUser(email: email, password: password)
    }
}
