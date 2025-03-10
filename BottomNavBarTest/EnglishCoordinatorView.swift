//
//  EnglishCoordinatorView.swift
//  BottomNavBarTest
//
//  Created by Louis Melone on 3/4/25.
//

import Combine
import SwiftUI

class EnglishCoordinator: ObservableObject {
    @Published var path: [EnglishDestination] = []
    @Published var showTabBar = Visibility.visible
    var initialDestination: EnglishDestination! = .englishView
}

enum EnglishDestination: Hashable, View {
    case londonView
    case englishView
    
    var body: some View {
        switch self {
        case .londonView:
            LondonView()
        case .englishView:
            EnglishView()
        }
    }
}

struct LondonView: View {
    var body: some View {
        Text("London Bridge")
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Text("Bottom Bar")
                }
            }
    }
}
