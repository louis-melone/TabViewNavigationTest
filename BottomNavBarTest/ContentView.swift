//
//  ContentView.swift
//  BottomNavBarTest
//
//  Created by Louis Melone on 3/3/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var coordinator: EnglishCoordinator = EnglishCoordinator()

    var body: some View {
        TabView {
            navigationStack
                .tabItem {
                    Text("Eng")
                }
            placeholderStack
                .tabItem {
                    Text("Span")
                }
        }
    }

    var navigationStack: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.initialDestination
                .navigationDestination(for: EnglishDestination.self) { $0 }
                .onTapGesture {
                    UITabBar.changeTabBarState(shouldHide: true)
                    coordinator.path.append(.londonView)
                }
                .onAppear {
                    UITabBar.changeTabBarState(shouldHide: false)
                }
        }
    }

    var placeholderStack: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hola, mundo")
        }
        .padding()
    }
}

// https://stackoverflow.com/questions/75450229/problem-when-trying-to-hide-tab-bar-swiftui

extension UIView {
    func allSubviews() -> [UIView] {
        var allSubviews = subviews
        for subview in subviews {
            allSubviews.append(contentsOf: subview.allSubviews())
        }
        return allSubviews
    }
}

extension UITabBar {
    private static var originalY: Double?
    
    public static func changeTabBarState(shouldHide: Bool) {
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        windowScene?.windows.first(where: { $0.isKeyWindow })?.allSubviews().forEach({ view in
            if let tabBar = view as? UITabBar {
                if !tabBar.isHidden && shouldHide {
                    originalY = (tabBar.superview?.frame.origin.y)!
                    tabBar.superview?.frame.origin.y = (tabBar.superview?.frame.origin.y)! + 4.5
                } else if tabBar.isHidden && !shouldHide {
                    guard let originalY else {
                        return
                    }
                    tabBar.superview?.frame.origin.y = originalY
                }
                tabBar.isHidden = shouldHide
                tabBar.superview?.setNeedsLayout()
                tabBar.superview?.layoutIfNeeded()
            }
        })
    }
}
