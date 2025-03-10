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
        NavigationStack(path: $coordinator.path) {
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
            .navigationDestination(for: EnglishDestination.self) { $0 }
        }
    }

    var navigationStack: some View {
        coordinator.initialDestination
            .onTapGesture {
                hideTabBar = true
                coordinator.path.append(.londonView)
            }
            .onAppear {
                hideTabBar = false
            }
            .toolbar(hideTabBar ? .hidden : .visible, for: .tabBar)
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

#Preview {
    ContentView()
}
