//
//  SignInGoogleHelper.swift
//  ViciPerf
//
//  Created by Jason Mesa on 4/8/24.
//

import Foundation
import GoogleSignIn
import GoogleSignInSwift

struct GoogleSignResultModel {
    let idToken: String
    let accessToken: String
    let name: String?
    let email: String?
}

final class SignInGoogleHelper{
    
    @MainActor
    func signIn() async throws -> GoogleSignResultModel {
        guard let topVC = Utilities.shared.topViewController() else {
            throw URLError(.cannotFindHost)
        }
        
        let gidSignInResult = try await GIDSignIn.sharedInstance.signIn(withPresenting: topVC)
        
        guard let idToken = gidSignInResult.user.idToken?.tokenString else {
            throw URLError(.badServerResponse)  //customize error
        }
        
        let accessToken = gidSignInResult.user.accessToken.tokenString
        let name = gidSignInResult.user.profile?.name
        let email = gidSignInResult.user.profile?.email

        
        let tokens = GoogleSignResultModel(idToken: idToken, accessToken: accessToken, name: name, email: email)
        return tokens
    }
}
