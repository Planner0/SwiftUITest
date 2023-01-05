//
//  mainView.swift
//  TestSwiftUI
//
//  Created by ALEKSANDR POZDNIKIN on 04.01.2023.
//

import SwiftUI

struct MainView: View {
    var body: some View {

        TabView {
                Demo()
                    .tabItem {
                        Label("Feed", systemImage: "house.fill")
                    }
                    .toolbarBackground(.visible, for: /*@START_MENU_TOKEN@*/.tabBar/*@END_MENU_TOKEN@*/)
                LoginView()
                    .tabItem {
                        Label("Profile", systemImage: "person.crop.circle.fill")
                    }
                ContentView()
                    .tabItem {
                        Label("Player", systemImage: "music.note")
                    }
                TextView()
                    .tabItem {
                        Label("Video", systemImage: "play.rectangle.fill")
                    }
                MapView()
                    .tabItem {
                        Label("Recorder", systemImage: "mic.fill")
                    }
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
