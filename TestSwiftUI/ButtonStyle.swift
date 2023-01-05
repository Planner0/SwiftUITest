//
//  ButtonStyle.swift
//  TestSwiftUI
//
//  Created by ALEKSANDR POZDNIKIN on 05.01.2023.
//

import SwiftUI

struct CustomStyle: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled
    private let colors: [Color]
    private let width: CGFloat?
    private let heigth: CGFloat?
    
    init(colors: [Color] = [.mint.opacity(0.6), .mint, .mint.opacity(0.6), .mint], width: CGFloat = 50, heigth: CGFloat = 100) {
        self.colors = colors
        self.width = width
        self.heigth = heigth
    }
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
        }
        .font(.body.bold())
        .foregroundColor(isEnabled ? .white : .black)
        .padding()
        .frame(width: width, height: heigth)
        .background(backgroundView(configuration: configuration))
        .cornerRadius(10)
    }
    
    @ViewBuilder private func backgroundView(configuration: Configuration) -> some View {
        if !isEnabled {
            disabledBackground
        } else if configuration.isPressed {
            pressedBackground
        } else {
            enabledBackground
        }
    }
    
    private var enabledBackground: some View {
        LinearGradient(
            colors: colors,
            startPoint: .topLeading,
            endPoint: .bottomTrailing)
    }
    
    private var disabledBackground: some View {
        LinearGradient(
            colors: [.gray],
            startPoint: .topLeading,
            endPoint: .bottomTrailing)
    }
    
    private var pressedBackground: some View {
        LinearGradient(
            colors: colors,
            startPoint: .topLeading,
            endPoint: .bottomTrailing)
        .opacity(0.4)
    }
}

extension ButtonStyle where Self == CustomStyle {
  static var gradient: CustomStyle { .init() }
}
