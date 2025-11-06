//
//  LaunchViewController.swift
//  SekretulkaApp
//
//  Created by Yurii Derzhylo on 28.10.2025.
//

import UIKit

final class LaunchViewController: BaseViewController {
    
    @IBOutlet weak var launchLogoImageView: UIImageView!
    @IBOutlet weak var launchTitleLogoLabel: UILabel!
    
    private let viewModel: LaunchViewModel
    
    private var logoAnimator: LogoAnimator?
    
    init(viewModel: LaunchViewModel) {
        self.viewModel = viewModel
        super.init(nibName: type(of: self).nibName, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindTexts()
        bindImages()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        logoAnimator = LogoAnimator(logoImageView: launchLogoImageView,
                                    titleLabel: launchTitleLogoLabel
        )
        
        logoAnimator?.startAnimation(duration: 4.0) {
            self.viewModel.nextPressed()
        }
    }
    
    private func bindTexts() {
        launchTitleLogoLabel.text = viewModel.launchTitleText
    }
    
    private func bindImages() {
        launchLogoImageView.image = viewModel.launchLogoImage
        launchLogoImageView.layer.cornerRadius = 20
    }
}
