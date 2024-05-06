//
//  SignInEmailView.swift
//  ViciPerf
//
//  Created by Jason Mesa on 3/8/24.
//
import SwiftUI
struct SignInEmailView: View {
    
    @StateObject private var viewModel = SignInEmailViewModel()
    @Binding var showSignInView: Bool
    
    var body: some View {
        
        GeometryReader { geo in
            ZStack{
                Image("LOGO3")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                    .opacity(1.0)
                VStack {
                    
                    Text("WELCOME!") //this text is invisible for the sake of spacing
                        .font(.custom("AmericanTypewriter-Semibold", fixedSize: 0))
                        .padding()
                        .foregroundColor(.white)
                        .bold()
                        .opacity(0.0)
                        
                        .padding(95)
                    TextField("Email", text: $viewModel.email)
                        .padding()
                        .frame(height: 40)
                        .frame(width: 256)
                        .background(Color.white.opacity(1.0))
                        .cornerRadius(1)
                    
                    SecureField("Password", text: $viewModel.password)
                        .padding()
                        .frame(height: 40)
                        .frame(width: 256)
                        .background(Color.white.opacity(1.0))
                        .cornerRadius(1)
                    Button {
                        Task {
                            do {
                                try await viewModel.signUp()
                                showSignInView = false
                                return
                            } catch {
                                print(error)
                            }
                            //could be seperate buttons but left as one for simplicity (revisit)
                            do {
                                try await viewModel.signIn()
                                showSignInView = false
                                return
                            } catch {
                                print(error)
                            }
                            
                        }
                        
                    } label: {
                        
                        Text("Sign In")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(height: 40)
                            .frame(width: 150)
                            .background(Color.indigo)
                            .cornerRadius(10)
                    }
                    Spacer()
                }
            }
        }
    }
}
struct SignInEmailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SignInEmailView(showSignInView: .constant(false))
        }
        
    }
    
}

