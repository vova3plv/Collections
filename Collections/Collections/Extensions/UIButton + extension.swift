import UIKit

extension UIButton {
    func attributedButton(title: String) {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .clear
        titleLabel?.numberOfLines = 0
        titleLabel?.textAlignment = .center
        setTitle(title, for: .normal)
        setTitleColor(.systemBlue, for: .normal)
    }
}
