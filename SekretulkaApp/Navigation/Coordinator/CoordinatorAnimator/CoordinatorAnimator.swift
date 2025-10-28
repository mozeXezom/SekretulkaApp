//
//  CoordinatorAnimator.swift
//  SekretulkaApp
//
//  Created by Yurii Derzhylo on 28.10.2025.
//

import UIKit

final class CoordinatorAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    private let duration: TimeInterval = 0.35
    private let isPresenting: Bool

    init(isPresenting: Bool) {
        self.isPresenting = isPresenting
    }

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let container = transitionContext.containerView

        if isPresenting {
            guard let toView = transitionContext.view(forKey: .to) else { return }

            toView.alpha = 0.0
            toView.frame = container.bounds
            container.addSubview(toView)

            UIView.animate(withDuration: duration,
                           delay: 0,
                           options: [.curveEaseInOut],
                           animations: {
                toView.alpha = 1.0
            }, completion: { finished in
                transitionContext.completeTransition(finished)
            })

        } else {
            guard let fromView = transitionContext.view(forKey: .from) else { return }

            UIView.animate(withDuration: duration,
                           delay: 0,
                           options: [.curveEaseInOut],
                           animations: {
                fromView.alpha = 0.0
            }, completion: { finished in
                fromView.removeFromSuperview()
                transitionContext.completeTransition(finished)
            })
        }
    }
}
