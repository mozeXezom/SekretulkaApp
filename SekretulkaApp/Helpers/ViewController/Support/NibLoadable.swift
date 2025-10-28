//
//  Untitled.swift
//  SekretulkaApp
//
//  Created by Yurii Derzhylo on 28.10.2025.
//

import UIKit

/// Central place for all nib names and controller identifiers.
enum NibName: String {
    case launchViewController = "LaunchViewController"
    case introductionViewController = "IntroductionViewController"
}

/// Protocol adopted by any UIViewController or UIView loaded from a .xib file.
protocol NibLoadable: AnyObject {
    static var nibName: String { get }
    static var nib: UINib { get }
}

/// Default implementation.
extension NibLoadable where Self: UIViewController {
    static var nibName: String { String(describing: self) }
    static var nib: UINib { UINib(nibName: nibName, bundle: nil) }
}

extension NibLoadable where Self: UIView {
    static var nibName: String { String(describing: self) }
    static var nib: UINib { UINib(nibName: nibName, bundle: nil) }
}

/// Helper extension for initializing XIB-based view controllers safely.
extension UIViewController {
    static func instantiateFromNib<T: UIViewController>(_ type: T.Type = T.self) -> T {
        let nibName = String(describing: T.self)
        return T(nibName: nibName, bundle: nil)
    }
}
