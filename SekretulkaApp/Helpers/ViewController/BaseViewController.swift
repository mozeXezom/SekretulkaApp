//
//  BaseViewController.swift
//  SekretulkaApp
//
//  Created by Yurii Derzhylo on 28.10.2025.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Root controller: \(self)")
    }
}

extension BaseViewController: NibLoadable {}
