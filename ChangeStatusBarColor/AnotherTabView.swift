//
//  AnotherTabView.swift
//  ChangeStatusBarColor
//
//  Created by 山崎宏哉 on 2023/05/02.
//

import SwiftUI

struct AnotherTabView: View {
    @Binding var viewThemeColor: ThemeColor

    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.top)
            Text("Hello, World!")
                .foregroundColor(.white)
        }
        .onAppear {
            print("AnotherTabView onAppear")
        }
        .onDisappear {
            print("AnotherTabView onDisappear")
        }
        .darkModeStatusFontColor()
    }
}

struct AnotherTabView_Previews: PreviewProvider {
    static var previews: some View {
        AnotherTabView(viewThemeColor: .constant(.dark))
    }
}
