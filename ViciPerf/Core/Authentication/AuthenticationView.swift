//
//  AuthenticationView.swift
//  ViciPerf
//
//  Created by Jason Mesa on 3/8/24.
//

import SwiftUI
import GoogleSignIn  //imported google for the google button
import GoogleSignInSwift

@MainActor
final class AuthenticationViewModel: ObservableObject {
    
    let signInAppleHelper = SignInAppleHelper()
    
    func signInGoogle() async throws {
        let helper = SignInGoogleHelper()
        let tokens = try await helper.signIn()
        try await AuthenticationManager.shared.signInWithGoogle(tokens: tokens)
    }
    
    func signInApple() async throws {
        let helper = SignInAppleHelper()
        let tokens = try await helper.startSignInWithAppleFlow()
        try await AuthenticationManager.shared.signInWithApple(tokens: tokens)
    }
}

    
struct AuthenticationView: View {
    
    @StateObject private var viewModel = AuthenticationViewModel()
    @Binding var showSignInView: Bool
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image("LOGO3")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                    .opacity(1.0)
                
                VStack{
                    Text("WELCOME!")
                        .font(.custom("SF Pro", fixedSize: 0))
                        .padding()
                        .foregroundColor(.white)
                        .bold()
                        .opacity(0.0)
                        .padding(105)
                    NavigationLink {
                        SignInEmailView(showSignInView: $showSignInView)
                    } label: {
                        Text("Sign in with Email")
                            .font(.system(size: 15.5))
                            .bold()
                            //.font(.headline)
                            .foregroundColor(.black)
                            .frame(height: 40)
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .cornerRadius(10)
                        
                    }
                    VStack {
                        Button(action: {
                            Task {
                                do {
                                    try await viewModel.signInApple()
                                    showSignInView = false
                                } catch {
                                    print(error)
                                }
                            }
                        }, label: {
                            SignInWithAppleButtonViewRepresentable(type: .default, style: .white)
                                .allowsHitTesting(false)
                        })
                        .frame(height: 40)
                        Spacer()
                    }
                    }
                    
                    GoogleSignInButton(viewModel: GoogleSignInButtonViewModel(scheme: .light, style: .icon, state: .normal)) {
                        Task {
                            do {
                                try await viewModel.signInGoogle()
                                showSignInView = false
                            } catch {
                                print(error)
                            }
                        }
                    }
                    //style changes color of apple button so that it can contrast navigationView
                    //The label wraps the button so it is clickable but the view is not tapped
            }
        }
    }
}
    struct AuthenticationView_Previews: PreviewProvider {
        static var previews: some View {
            NavigationStack {
                AuthenticationView(showSignInView: .constant(false))
            }
        }
    }

