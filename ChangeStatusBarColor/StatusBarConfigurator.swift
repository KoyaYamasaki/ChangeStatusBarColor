//
//  StatusBarConfigurator.swift
//  ChangeStatusBarColor
//
//  Created by 山崎宏哉 on 2023/05/02.
//

import UIKit
import SwiftUI

class StatusBarConfigurator: ObservableObject {

    private static let instance = StatusBarConfigurator()
    static var shared = instance
    
    private var window: UIWindow?
    
    private let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene

    @Published var statusBarStyle: UIStatusBarStyle = .default {
        didSet {
            window?.rootViewController?.setNeedsStatusBarAppearanceUpdate()
        }
    }

    init() {
        print("init prepare")
        if let windowScene = windowScene, window == nil {
            let window = UIWindow(windowScene: windowScene)
            let viewController = ViewController()
            viewController.configurator = self
            window.rootViewController = viewController
            window.frame = UIScreen.main.bounds
            window.alpha = 0
            self.window = window
        }
        window?.windowLevel = .statusBar
        window?.makeKeyAndVisible()
    }

    fileprivate class ViewController: UIViewController {
        weak var configurator: StatusBarConfigurator?
        override var preferredStatusBarStyle: UIStatusBarStyle { configurator?.statusBarStyle ?? self.preferredStatusBarStyle }
    }
}

extension View {
    func lightModeStatusFontColor() -> some View {
        return self.modifier(LightModeStatusFontColor())
    }

    func darkModeStatusFontColor() -> some View {
        return self.modifier(DarkModeStatusFontColor())
    }
}

struct LightModeStatusFontColor: ViewModifier {

    func body(content: Content) -> some View {
        return content
        .onAppear {
            StatusBarConfigurator.shared.statusBarStyle = .darkContent
        }
        .onDisappear {
            if StatusBarConfigurator.shared.statusBarStyle != .lightContent {
                StatusBarConfigurator.shared.statusBarStyle = .default
            }
        }
    }
}

struct DarkModeStatusFontColor: ViewModifier {

    func body(content: Content) -> some View {
        return content
            .onAppear {
                StatusBarConfigurator.shared.statusBarStyle = .lightContent
            }
            .onDisappear {
                if StatusBarConfigurator.shared.statusBarStyle != .darkContent {
                    StatusBarConfigurator.shared.statusBarStyle = .default
                }
            }
    }
}
