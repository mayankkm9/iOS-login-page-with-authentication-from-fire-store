//
//  firebaseloginwindowApp.swift
//  firebaseloginwindow
//
//  Created by mayank kumar mongia on 29/01/23.
//

import SwiftUI
import Firebase


@main
struct firebaseloginwindowApp: App {
    @StateObject var dataManager = DataManager()
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
           ContentView()
          // ListView()
            
            .environmentObject(dataManager)
        }
    }
}
