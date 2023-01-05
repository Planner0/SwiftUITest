//
//  TextView.swift
//  TestSwiftUI
//
//  Created by ALEKSANDR POZDNIKIN on 05.01.2023.
//

import SwiftUI

struct TextView: View {
    var body: some View {
        VStack{
            Text("Interfacing with UIKit")
                .modifier(TextTitle())
            Text("SwiftUI works seamlessly with the existing UI frameworks on all Apple platforms. For example, you can place UIKit views and view controllers inside SwiftUI views, and vice versa."
            )
                .modifier(TextRegular())
        }
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView()
    }
}
struct TextTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .lineLimit(1)
            .bold()
            .foregroundColor(.white)
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
            .background(Color.gray)
    }
}
struct TextRegular: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.body)
            .foregroundColor(.black)

    }
}
