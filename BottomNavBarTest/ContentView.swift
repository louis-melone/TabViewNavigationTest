//
//  ContentView.swift
//  BottomNavBarTest
//
//  Created by Louis Melone on 3/3/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var coordinator: EnglishCoordinator = EnglishCoordinator()
    @State var hideTabBar: Bool = false

    var body: some View {
        NavigationStack {
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
    }

    var navigationStack: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.initialDestination
                .onTapGesture {
                    coordinator.path.append(.londonView)
                }
                .navigationDestination(for: EnglishDestination.self) { $0 }
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
