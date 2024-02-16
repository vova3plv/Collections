import UIKit

extension UIActivityIndicatorView {
    func attributedIndicator() {
        hidesWhenStopped = true
        translatesAutoresizingMaskIntoConstraints = false
        color = .gray
    }
}
