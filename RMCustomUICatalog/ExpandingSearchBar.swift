//Copyright © 2019 Green Dragon Apps. All rights reserved.

import UIKit

@IBDesignable
class ExpandingSearchBar: UIView {

    @IBInspectable
    var placeholder: String? = "Type your search here..." {
        didSet {
            textField.placeholder = placeholder
        }
    }

    private var widthConstraint: NSLayoutConstraint!
    private var isExpanded: Bool = false
    private let collapsedWidth: CGFloat = 50
    private let textField = UITextField(frame: .zero)
    private let searchButton = UIButton(type: UIButton.ButtonType.custom)

    @IBInspectable var expandedWidth: CGFloat = 300

    @IBInspectable var borderColor: UIColor = .lightGray {
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

    @objc func expandOrCollapse() {
        defer {
            isExpanded.toggle()
        }
        let springDamping: CGFloat = 0.3
        if isExpanded {
            UIView.animate(withDuration: 0.3,
                           delay: 0.0,
                           options: .curveEaseInOut,
                           animations: {
                            self.widthConstraint.constant = self.collapsedWidth
                            self.setNeedsLayout()
                            self.layoutIfNeeded()
                            self.textField.layer.setAffineTransform(CGAffineTransform(translationX: 0, y: -20))
                            self.textField.alpha = 0
            })
            UIView.animate(withDuration: 0.2,
                           delay: 0.0,
                           usingSpringWithDamping: springDamping,
                           initialSpringVelocity: 0.5,
                           options: [],
                           animations: {
                            let transform = CGAffineTransform(translationX: -20, y: 0).concatenating(CGAffineTransform(scaleX: 0.6, y: 1.3))
                            self.searchButton.layer.setAffineTransform(transform)
            }) { finished in
                UIView.animate(withDuration: 0.3,
                               delay: 0.1,
                               usingSpringWithDamping: springDamping,
                               initialSpringVelocity: 0.5,
                               options: [],
                               animations: {
                                self.searchButton.layer.setAffineTransform(CGAffineTransform.identity)
                })
            }
        } else {
            textField.layer.setAffineTransform(CGAffineTransform(translationX: 0, y: -20))
            UIView.animate(withDuration: 0.3,
                           delay: 0.0,
                           options: .curveEaseInOut,
                           animations: {
                            self.widthConstraint.constant = self.expandedWidth
                            self.setNeedsLayout()
                            self.layoutIfNeeded()
                            self.textField.layer.setAffineTransform(CGAffineTransform.identity)
                            self.textField.alpha = 1
            })
            UIView.animate(withDuration: 0.2,
                           delay: 0.0,
                           usingSpringWithDamping: springDamping,
                           initialSpringVelocity: 0.5,
                           options: [],
                           animations: {
                            let transform = CGAffineTransform(translationX: 20, y: 0).concatenating(CGAffineTransform(scaleX: 0.6, y: 1.3))
                            self.searchButton.layer.setAffineTransform(transform)
            }) { finished in
                UIView.animate(withDuration: 0.3,
                               delay: 0.1,
                               usingSpringWithDamping: springDamping,
                               initialSpringVelocity: 0.5,
                               options: [],
                               animations: {
                                self.searchButton.layer.setAffineTransform(CGAffineTransform.identity)
                })
            }
        }
    }

    private func setupView() {
        widthConstraint = widthAnchor.constraint(equalToConstant: collapsedWidth)
        widthConstraint.isActive = true

        addSubview(textField)
        textField.textAlignment = .center
        textField.placeholder = placeholder
        textField.alpha = 0
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: topAnchor),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor),
            textField.centerXAnchor.constraint(equalTo: centerXAnchor),
            textField.widthAnchor.constraint(equalToConstant: expandedWidth)
            ])

        addSubview(searchButton)
        let image = UIImage(named: "magnify", in: Bundle.main, compatibleWith: traitCollection)
        searchButton.setImage(image, for: .normal)
        searchButton.backgroundColor = UIColor.lightGray
        searchButton.tintColor = .white
        searchButton.addTarget(self, action: #selector(expandOrCollapse), for: .touchUpInside)
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            trailingAnchor.constraint(equalTo: searchButton.trailingAnchor, constant: 5),
            searchButton.widthAnchor.constraint(equalToConstant: 40),
            searchButton.heightAnchor.constraint(equalToConstant: 40)
            ])
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.height / 2

        searchButton.layer.cornerRadius = searchButton.bounds.height / 2
    }

    override var intrinsicContentSize: CGSize {
        return CGSize(width: collapsedWidth, height: collapsedWidth)
    }
}
