//
//  AppCoordinator.swift
//  SekretulkaApp
//
//  Created by Yurii Derzhylo on 28.10.2025.
//

import UIKit

final class AppCoordinator: NSObject, CoordinatorProtocol {
    var window: UIWindow?
    private var currentVC: UIViewController?

    func start() {
        prepareLaunchScreen()
    }

    private func prepareLaunchScreen() {
        let model = LaunchModel(
            title: AppTexts.Launch.appNameTitle,
            logo: AppImages.Launch.appLogoImage
        )
        let viewModel = LaunchViewModel(model: model)
        let vc = LaunchViewController(viewModel: viewModel)

        viewModel.prepareIntroduction = { [weak self] in
            self?.prepareIntroductionScreen()
        }

        setRoot(vc)
    }
    
    private func prepareIntroductionScreen() {
        let viewModel = IntroductionViewModel()
        let vc = IntroductionViewController(viewModel: viewModel)
        vc.modalPresentationStyle = .fullScreen
        vc.transitioningDelegate = self
        
        viewModel.onFinish = { [weak self] in
            self?.prepareRegistrationScreen()
        }
        
        currentVC?.present(vc, animated: true)
        currentVC = vc
    }
    
    private func prepareRegistrationScreen() {
        let viewModel = RegistrationViewModel()
        let vc = RegistrationViewController(viewModel: viewModel)
        vc.modalPresentationStyle = .fullScreen
        vc.transitioningDelegate = self
        
        currentVC?.present(vc, animated: true)
        currentVC = vc
    }

    private func setRoot(_ vc: UIViewController) {
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        currentVC = vc
    }
}

// MARK: - UIViewControllerTransitioningDelegate
extension AppCoordinator: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController,
                             presenting: UIViewController,
                             source: UIViewController)
    -> UIViewControllerAnimatedTransitioning? {
        return CoordinatorAnimator(isPresenting: true)
    }

    func animationController(forDismissed dismissed: UIViewController)
    -> UIViewControllerAnimatedTransitioning? {
        return CoordinatorAnimator(isPresenting: false)
    }
}
