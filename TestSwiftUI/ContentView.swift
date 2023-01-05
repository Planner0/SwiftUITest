//
//  ContentView.swift
//  TestSwiftUI
//
//  Created by ALEKSANDR POZDNIKIN on 04.01.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var vibrateOnRing = true
    @State private var darkTheme = true
    @State private var ratio = 5.0
    @State private var isEditing = false
    var body: some View {
        VStack {
            MapView()
                .frame(height: 300)
            Image(/*@START_MENU_TOKEN@*/"15"/*@END_MENU_TOKEN@*/)
                .clipShape(Circle())
                .overlay {
                    Circle().stroke(.white, lineWidth: ratio)
                }
                .shadow(radius: 7)
                .offset(y: -130)
                .padding(.bottom, -130)
            ToggleOptions(vibrateOnRing: $vibrateOnRing, darkTheme: $darkTheme)
            Text("About Turtle Rock")
                .font(.title2)
            Text("Descriptive text goes here.")
                .font(.subheadline)
                .foregroundColor(.secondary)
            Divider()
            Slider(
                value: $ratio,
                in: 0...10,
                onEditingChanged: { editing in
                    isEditing = editing
                }
            )
            .padding()
            Text("\(Int(ratio))")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(isEditing ? .red : .blue)
                .fontDesign(.rounded)
                .bold()
               Spacer()
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ToggleOptions: View {
    @Binding var vibrateOnRing: Bool
    @Binding var darkTheme: Bool
    var body: some View {
        VStack {
            Form {
                Toggle("Vibrate on Ring", isOn: $vibrateOnRing)
                Toggle("Dark Theme", isOn: $darkTheme)
            }
        }
        .frame(height: 150)
    }
}

