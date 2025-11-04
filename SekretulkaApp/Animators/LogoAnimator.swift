//
//  JumperAnimator.swift
//  SekretulkaApp
//
//  Created by Yurii Derzhylo on 04.11.2025.
//

import UIKit

final class LogoAnimator {
    
    private weak var logoImageView: UIImageView?
    private weak var titleLabel: UILabel?
    
    init(logoImageView: UIImageView, titleLabel: UILabel) {
        self.logoImageView = logoImageView
        self.titleLabel = titleLabel
    }

    func startAnimation(duration: TimeInterval = 3.0, completion: @escaping () -> Void) {
        guard let logoImageView = logoImageView, let titleLabel = titleLabel else {
            completion()
            return
        }
        
        let singleBounce: TimeInterval = 0.75
        var bounceCount = 0
        
        func animateNext() {
            guard bounceCount < Int(duration / singleBounce) else {
                completion()
                return
            }
            
            let tiltAngle: CGFloat = bounceCount % 2 == 0 ? .pi / 12 : -(.pi / 12)
            let jumpHeight: CGFloat = 25
            
            UIView.animate(withDuration: singleBounce / 2,
                           delay: 0,
                           usingSpringWithDamping: 0.55,
                           initialSpringVelocity: 0.5,
                           options: [.curveEaseInOut]) {

                logoImageView.transform = CGAffineTransform(translationX: 0, y: -jumpHeight)
                    .rotated(by: tiltAngle)
                    .scaledBy(x: 1.05, y: 1.05)
                
                titleLabel.alpha = 0.7
                titleLabel.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
                
            } completion: { _ in
                UIView.animate(withDuration: singleBounce / 2,
                               delay: 0,
                               options: [.curveEaseInOut]) {

                    logoImageView.transform = .identity
                    titleLabel.alpha = 1.0
                    titleLabel.transform = .identity
                } completion: { _ in
                    bounceCount += 1
                    animateNext()
                }
            }
        }
        
        animateNext()
    }
}
