//
//  CustomTabBar.swift
//  BottomNavBarTest
//
//  Created by Louis Melone on 3/11/25.
//

import SwiftUI
import Combine
import TabBar

enum Item: Int, Tabbable {
    case eng = 0
    case span
    
    var icon: String {
        switch self {
            case .eng:
                return "house" // Name of icon of first item.
            case .span:
                return "gear"// Name of icon of second item.
        }
    }
    
    var title: String {
        switch self {
            case .eng:
                return "English" // Title of first item.
        case .span:
                return "Spanish" // Title of second item.
        }
    }
}
