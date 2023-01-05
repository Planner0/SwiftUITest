//
//  LoginView.swift
//  TestSwiftUI
//
//  Created by ALEKSANDR POZDNIKIN on 04.01.2023.
//

import SwiftUI

struct LoginView: View {
    
    @State private var userAgreed = true
    
    var body: some View {
        VStack(alignment: .center) {
            Image("logo")
                .resizable()
                .frame(width: 100, height:100)
                .offset(y:-50)
            LoginForm()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
struct LoginForm: View {
    enum Field: Hashable {
        case usernameField
        case passwordField
    }
    
    @State private var username = ""
    @State private var password = ""
    @FocusState private var focusedField: Field?
    
    var body: some View {
        
        VStack (spacing: 0.5){
            TextField("Email or Phone", text: $username)
                .focused($focusedField, equals: .usernameField)
                .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 0))
                .frame(width: 360.0, height: 50.0)
            Divider()
            SecureField("Password", text: $password)
                .focused($focusedField, equals: .passwordField)
                .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 0))
                .frame(width: 360.0, height: 50.0)
        }
        .background(Color(red: 0.561, green: 0.561, blue: 0.561, opacity: 0.097))
        
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(.gray, lineWidth: 0.5)
        )
        
        .padding(EdgeInsets(top: 0, leading: 16, bottom: 12, trailing: 16))
        
        Button("Log In") {
            if username.isEmpty {
                focusedField = .usernameField
            } else if password.isEmpty {
                focusedField = .passwordField
            } else {
                // handleLogin(username, password)
            }
        }
        .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
        .buttonStyle(CustomStyle(colors: [Color(red: 0.316, green: 0.504, blue: 0.724)], width: 360, heigth: 50))
    }
}
