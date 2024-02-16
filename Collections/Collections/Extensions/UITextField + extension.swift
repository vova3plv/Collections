import UIKit

extension UITextField {
    func attributedTextField() {
        translatesAutoresizingMaskIntoConstraints = false
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 8))
        leftViewMode = .always
        layer.cornerRadius = 10
        layer.borderWidth = 2
    }
}
