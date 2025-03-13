//
//  ContentView.swift
//  BottomNavBarTest
//
//  Created by Louis Melone on 3/3/25.
//

import SwiftUI

struct ContentView: View {
    struct ContentView: View {
        var body: some View {
            TabBarControllerWrapper()
                .edgesIgnoringSafeArea(.all)
        }
    }
}

struct TabBarControllerWrapper: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UITabBarController {
        return TabBarController()
    }
    
    func updateUIViewController(_ uiViewController: UITabBarController, context: Context) {}
}

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Home"
        
        let button = UIButton(type: .system)
        button.setTitle("Push Over Tab Bar", for: .normal)
        button.addTarget(self, action: #selector(pushOverTabBar), for: .touchUpInside)
        
        button.frame = CGRect(x: 50, y: 200, width: 300, height: 50)
        view.addSubview(button)
    }
    
    @objc func pushOverTabBar() {
        let newViewController = FullScreenViewController()
        // Desired Functionality in SwiftUI
        newViewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(newViewController, animated: true)
    }
}

class FullScreenViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        let closeButton = UIButton(type: .system)
        closeButton.setTitle("Go Back", for: .normal)
        closeButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        closeButton.frame = CGRect(x: 50, y: 200, width: 300, height: 50)
        view.addSubview(closeButton)
    }
    
    @objc func goBack() {
        navigationController?.popViewController(animated: true)
    }
}

class NavigationViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Navigation"
        
        let button = UIButton(type: .system)
        button.setTitle("Push With Tab Bar", for: .normal)
        button.addTarget(self, action: #selector(pushWithTabBar), for: .touchUpInside)
        
        button.frame = CGRect(x: 50, y: 200, width: 300, height: 50)
        view.addSubview(button)
    }
    
    @objc func pushWithTabBar() {
        let newViewController = NormalPushViewController()
        navigationController?.pushViewController(newViewController, animated: true)
    }
}

class NormalPushViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        
        let closeButton = UIButton(type: .system)
        closeButton.setTitle("Go Back", for: .normal)
        closeButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        closeButton.frame = CGRect(x: 50, y: 200, width: 300, height: 50)
        view.addSubview(closeButton)
    }
    
    @objc func goBack() {
        navigationController?.popViewController(animated: true)
    }
}

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeVC = UINavigationController(rootViewController: ViewController())
        homeVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        
        let navigationVC = UINavigationController(rootViewController: NavigationViewController())
        navigationVC.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 1)
        
        viewControllers = [homeVC, navigationVC]
    }
}

