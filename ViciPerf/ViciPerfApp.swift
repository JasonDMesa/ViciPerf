//
//  ViciPerfApp.swift
//  ViciPerf
//
//  Created by Jason Mesa on 3/7/24.
//  Developed by Angelica Cervantes, Brent Lin, Francisco Alacaraz, and Jason Mesa thereafter
//

import SwiftUI
import Firebase


@main
struct ViciPerfApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
          RootView()
        }
    }
}
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
