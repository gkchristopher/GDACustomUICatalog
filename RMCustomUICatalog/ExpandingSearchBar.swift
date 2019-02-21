//Copyright © 2019 Green Dragon Apps. All rights reserved.

import UIKit

@IBDesignable
class ExpandingSearchBar: UIView {

    private var widthConstraint: NSLayoutConstraint!
    private var isExpanded: Bool = false
    private let collapsedWidth: CGFloat = 50

    @IBInspectable var expandedWidth: CGFloat = 200

    @IBInspectable var borderColor: UIColor = .black {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }

    @IBInspectable var borderWidth: CGFloat = 1.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    func expandOrCollapse() {
        defer {
            isExpanded.toggle()
        }
        if isExpanded {
            UIView.animate(withDuration: 0.3) {
                self.widthConstraint.constant = self.collapsedWidth
                self.setNeedsLayout()
            }
        } else {
            UIView.animate(withDuration: 0.3) {
                self.widthConstraint.constant = self.expandedWidth
                self.setNeedsLayout()
            }
        }
    }

    private func setupView() {
        widthConstraint = widthAnchor.constraint(equalToConstant: collapsedWidth)
        widthConstraint.isActive = true
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.height / 2
    }

    override var intrinsicContentSize: CGSize {
        return CGSize(width: collapsedWidth, height: collapsedWidth)
    }
}
