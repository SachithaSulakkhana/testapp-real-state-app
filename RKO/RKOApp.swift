//
//  RKOApp.swift
//  RKO
//
//  Created by Sachitha Sulakkhana on 2022-03-13.
//
import SwiftUI
import Firebase

@main
struct RKOApp: App {
    init() {
           FirebaseApp.configure()
       }
    

    var body: some Scene {
        WindowGroup {
            
               signupview()
           

        }
    }
}
