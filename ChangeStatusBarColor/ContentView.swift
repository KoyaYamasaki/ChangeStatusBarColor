//
//  ContentView.swift
//  ChangeStatusBarColor
//
//  Created by 山崎宏哉 on 2023/05/01.
//

import UIKit
import SwiftUI

enum ThemeColor {
    case light
    case dark
}

struct ContentView: View {
    @State var viewThemeColor: ThemeColor = .light
    var body: some View {
        TabView {
            FirstTabView(viewThemeColor: $viewThemeColor)
                .tabItem {
                    Label("contntView", systemImage: "house")
                }

            AnotherTabView(viewThemeColor: $viewThemeColor)
                .tabItem {
                    Label("anotherTabView", systemImage: "person")
                }
        }
//        .onReceive($viewThemeColor) { statusBarStyle in
//            if viewThemeColor == .light {
//                print("onReceive LightModeStatusFontColor :", statusBarStyle.rawValue)
//                StatusBarConfigurator.shared.statusBarStyle = .darkContent
//            } else if viewThemeColor == .dark {
//                print("onReceive DarkModeStatusFontColor :", statusBarStyle.rawValue)
//                StatusBarConfigurator.shared.statusBarStyle = .lightContent
//            }
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewThemeColor: .dark)
    }
}
