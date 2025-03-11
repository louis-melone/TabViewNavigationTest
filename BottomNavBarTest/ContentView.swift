//
//  ContentView.swift
//  BottomNavBarTest
//
//  Created by Louis Melone on 3/3/25.
//

import SwiftUI
import TabBar

struct ContentView: View {
    @StateObject var coordinator: EnglishCoordinator = EnglishCoordinator()
    @State var visibility: TabBarVisibility = .visible
    @State private var selection: Item = .eng

    var body: some View {
        TabBar(selection: $selection, visibility: $visibility) {
            navigationStack
                .tabItem(for: Item.eng)
            placeholderStack
                .tabItem(for: Item.span)
        }
    }

    var navigationStack: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.initialDestination
                .navigationDestination(for: EnglishDestination.self) { $0 }
                .onTapGesture {
                    visibility = .invisible
                    coordinator.path.append(.londonView)
                }
                .onAppear {
                    visibility = .visible
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

#Preview {
    ContentView()
}
