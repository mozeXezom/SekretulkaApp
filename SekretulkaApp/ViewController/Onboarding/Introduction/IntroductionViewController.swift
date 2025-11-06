//
//  IntroductionViewController.swift
//  SekretulkaApp
//
//  Created by Yurii Derzhylo on 28.10.2025.
//

import UIKit

final class IntroductionViewController: BaseViewController {

    @IBOutlet private weak var introductionSkipButton: UIButton!
    @IBOutlet private weak var introductionImageView: UIImageView!
    @IBOutlet private weak var introductionTitleLabel: UILabel!
    @IBOutlet private weak var introductionDescriptionLabel: UILabel!
    @IBOutlet private weak var introductionMoveNextButton: UIButton!

    private let viewModel: IntroductionViewModel

    private var dotViews: [UIView] = []
    private var progressStackView: UIStackView!

    init(viewModel: IntroductionViewModel) {
        self.viewModel = viewModel
        super.init(nibName: type(of: self).nibName, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        bindButtons()
        prepareProgressIndicator()
        bindViewModel()
        viewModel.start()
    }

    private func bindButtons() {
        introductionSkipButton.setTitle(AppTexts.Launch.skipInfo, for: .normal)
        introductionMoveNextButton.setTitle(AppTexts.Launch.moveNextStep, for: .normal)
    }

    private func bindViewModel() {
        viewModel.prepareIntroductionStep = { [weak self] step, index in
            guard let self = self else { return }
            UIView.transition(with: self.view, duration: 0.6, options: .transitionCrossDissolve) {
                self.introductionImageView.image = step.image
                self.introductionTitleLabel.text = step.title
                self.introductionDescriptionLabel.text = step.description
                self.introductionMoveNextButton.setTitle(step.buttonTitle, for: .normal)
                self.updateProgressStepDots(selected: index)
            }
        }
    }

    @IBAction private func skipPressed(_ sender: UIButton) {
        viewModel.prepareSkip()
    }

    @IBAction private func moveNextPressed(_ sender: UIButton) {
        viewModel.moveNext()
    }

    private func prepareProgressIndicator() {
        progressStackView = UIStackView()
        progressStackView.axis = .horizontal
        progressStackView.spacing = 10
        progressStackView.alignment = .center
        progressStackView.distribution = .equalCentering
        view.addSubview(progressStackView)

        progressStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            progressStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            progressStackView.bottomAnchor.constraint(equalTo: introductionMoveNextButton.topAnchor, constant: -25)
        ])

        for _ in viewModel.introductionSteps {
            let dot = UIView()
            dot.backgroundColor = .systemGray4
            dot.layer.cornerRadius = 5
            dot.translatesAutoresizingMaskIntoConstraints = false
            dot.widthAnchor.constraint(equalToConstant: 10).isActive = true
            dot.heightAnchor.constraint(equalToConstant: 10).isActive = true
            progressStackView.addArrangedSubview(dot)
            dotViews.append(dot)
        }
        updateProgressStepDots(selected: 0)
    }

    private func updateProgressStepDots(selected index: Int) {
        for (i, dot) in dotViews.enumerated() {
            UIView.animate(withDuration: 0.3) {
                dot.backgroundColor = (i == index) ? .systemPurple : .systemGray4
                dot.transform = (i == index)
                    ? CGAffineTransform(scaleX: 1.3, y: 1.3)
                    : .identity
            }
        }
    }
}

