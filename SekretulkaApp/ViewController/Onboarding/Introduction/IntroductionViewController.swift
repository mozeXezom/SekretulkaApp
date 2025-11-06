//
//  IntroductionViewController.swift
//  SekretulkaApp
//
//  Created by Yurii Derzhylo on 28.10.2025.
//

import UIKit

class IntroductionViewController: BaseViewController {

    @IBOutlet weak var introductionSkipButton: UIButton!
    @IBOutlet weak var introductionImageView: UIImageView!
    @IBOutlet weak var introductionTitleLabel: UILabel!
    @IBOutlet weak var introductionDescriptionLabel: UILabel!
    @IBOutlet weak var introductionMoveNextButton: UIButton!
    
    private let viewModel: IntroductionViewModel
    
    private var stepIndex: Int = 0
    
    init(viewModel: IntroductionViewModel) {
        self.viewModel = viewModel
        super.init(nibName: type(of: self).nibName, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        observeIntroductionStepChanges()
        bindButtons()
    }
    
    private func observeIntroductionStepChanges() {
        switch stepIndex {
        case 0:
            introductionImageView.image = viewModel.introductionOneImage
            introductionTitleLabel.text = viewModel.introductionTitleOneText
            introductionDescriptionLabel.text = viewModel.introductionDescriptionOneText
        case 1:
            introductionImageView.image = viewModel.introductionTwoImage
            introductionTitleLabel.text = viewModel.introductionTitleTwoText
            introductionDescriptionLabel.text = viewModel.introductionDescriptionTwoText
        case 2:
            introductionImageView.image = viewModel.introductionThreeImage
            introductionTitleLabel.text = viewModel.introductionTitleThreeText
            introductionDescriptionLabel.text = viewModel.introductionDescriptionThreeText
            
            introductionMoveNextButton.setTitle(viewModel.introductionStartText, for: .normal)
        default:
            break
        }
    }
    
    private func bindButtons() {
        introductionSkipButton.setTitle(viewModel.introductionSkipText, for: .normal)
        introductionMoveNextButton.setTitle(viewModel.introductionMoveNextText, for: .normal)
        
    }
    
    @IBAction func skipPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func moveNextPressed(_ sender: UIButton) {
        stepIndex += 1
        UIView.transition(with: self.view, duration: 1.0, options: .transitionCrossDissolve, animations: { [weak self] in
            self?.observeIntroductionStepChanges()
        } , completion: nil)
    }
}
