//
//  CoordinatorProtocol.swift
//  SekretulkaApp
//
//  Created by Yurii Derzhylo on 28.10.2025.
//

import UIKit

protocol CoordinatorProtocol: AnyObject {
    var window: UIWindow? { get set }
    func start()
}
