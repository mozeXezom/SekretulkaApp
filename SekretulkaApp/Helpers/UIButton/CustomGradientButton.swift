//
//  CustomGradientButton.swift
//  SekretulkaApp
//
//  Created by Yurii Derzhylo on 06.11.2025.
//

import UIKit

@IBDesignable
final class CustomGradientButton: UIButton {

    private let gradientLayer = CAGradientLayer()

    @IBInspectable var cornerRadius: CGFloat = 14 {
        didSet { layer.cornerRadius = cornerRadius }
    }

    @IBInspectable var startColor: UIColor = UIColor(red: 0.47, green: 0.15, blue: 0.85, alpha: 1.0)
    @IBInspectable var middleColor: UIColor = UIColor(red: 0.65, green: 0.25, blue: 0.95, alpha: 1.0)
    @IBInspectable var endColor: UIColor = UIColor(red: 0.85, green: 0.35, blue: 1.0, alpha: 1.0)

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAppearance()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupAppearance()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
        gradientLayer.cornerRadius = cornerRadius
    }

    private func setupAppearance() {
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true

        gradientLayer.colors = [
            startColor.cgColor,
            middleColor.cgColor,
            endColor.cgColor
        ]
        gradientLayer.locations = [0.0, 0.5, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)

        layer.insertSublayer(gradientLayer, at: 0)

        // Title style
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)

        // Optional subtle shadow for depth
        layer.shadowColor = UIColor.black.withAlphaComponent(0.3).cgColor
        layer.shadowOpacity = 0.4
        layer.shadowOffset = CGSize(width: 0, height: 3)
        layer.shadowRadius = 4
    }

    override var isHighlighted: Bool {
        didSet {
            UIView.animate(withDuration: 0.15) {
                self.alpha = self.isHighlighted ? 0.8 : 1.0
                self.transform = self.isHighlighted
                    ? CGAffineTransform(scaleX: 0.97, y: 0.97)
                    : .identity
            }
        }
    }
}
