//
//  TabBar.swift
//  ViciPerf
//
//  Created by Brent Lin on 4/16/24.
//

import SwiftUI
struct TabBar: View {
   
    @State private var selectedTab = "home"
    @StateObject private var viewModel = SettingsViewModel()
    @Binding var showSignInView: Bool
        
    var body: some View {
                VStack (spacing: 0) {
                    switch selectedTab {
                    case "back":
                        ContentView()
                    case "profile":
                        AccountView()
                   case "settings":
                        SettingsView(showSignInView: $showSignInView)
                    default:
                        ContentView()
                    }
                    Divider()
                    HStack {
                        Button(action: {
                            selectedTab = "back"
                        }) {
                            Image(systemName: "arrow.left")
                                .foregroundColor(selectedTab == "back" ? .white : .white)
                                .scaleEffect(selectedTab == "back" ? 1.25 : 1.0)
                                .font(.system(size: 22))
                                Spacer()
                        }
                        Button(action: {
                            selectedTab = "profile"
                        }) {
                            Image(systemName: "person")
                                .foregroundColor(selectedTab == "profile" ? .white : .white)
                                .scaleEffect(selectedTab == "profile" ? 1.25 : 1.0)
                                .font(.system(size: 22))
                                Spacer()
                        }
                        Button(action: {
                            selectedTab = "settings"
                        }) {
                            Image(systemName: "gear")
                                .foregroundColor(selectedTab == "settings" ? .white : .white)
                                .scaleEffect(selectedTab == "settings" ? 1.25 : 1.0)
                                .font(.system(size: 22))
                
                        }
                    }
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .background(Color.black)
                    
                    //.cornerRadius()
                    //.padding(.horizontal)
                    .padding(.bottom)
                }
                .ignoresSafeArea()
            }
        }
struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar(showSignInView: .constant(false))
        
    }
}


