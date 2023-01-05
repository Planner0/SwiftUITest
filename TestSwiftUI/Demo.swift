//
//  Demo.swift
//  TestSwiftUI
//
//  Created by ALEKSANDR POZDNIKIN on 05.01.2023.
//

import SwiftUI

struct Demo: View {
    
    @State private var counter: Float = 0
    @State private var isAlertPresented: Bool = false
    @State private var text: String = ""

    var body: some View {
        NavigationView {
            VStack {
                Text("Hello, world!")
                    .modifier(TitleModifier())
                Button("Hello world", action: {})
                
                Circle()
                    .frame(width: 30, height: 30)
                
                VStack {
                    Text("\(counter)")
                    Slider(
                        value: $counter,
                        in: 0...10,
                        onEditingChanged: { _ in })
                    
                    Button("Tap on me") { isAlertPresented = true }
                }
                Spacer()
            }
            .alert("Hello",
                   isPresented: $isAlertPresented,
                   actions: {})
            .searchable(text: $text)
            .frame(
                maxWidth: .infinity,
                alignment: .leading
            )
            .padding(.leading, 16)
            .padding(.top, 32)
        }
        .debug()
    }
}

struct TitleModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.title)
            .foregroundColor(Color.blue)
            .padding()
            .background(Color.green)
    }
}

struct Demo_Previews: PreviewProvider {
    static var previews: some View {
        Demo()
    }
}

extension View {
    func debug() -> Self {
        print("Example of view structure: \(Mirror(reflecting: self).subjectType)")
        return self
    }
}
