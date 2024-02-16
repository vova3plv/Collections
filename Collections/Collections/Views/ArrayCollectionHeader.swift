import UIKit

final class ArrayCollectionHeader: UICollectionReusableView {
    
    weak var delegate: HeaderViewDelegate?
    
    //MARK: Views
    private lazy var nameHeaderLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Greate Int array with 10_000_000 elements"
        label.textColor = .systemBlue
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.hidesWhenStopped = true
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.color = .gray
        return activityIndicator
    }()
    
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupHeader()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Setup UI
    private func setupHeader() {
        self.backgroundColor = .systemGray3
        setupNameHeaderLabel()
        setupActivityIndicator()
        tapGestureReccognizerForHeader()
    }
    
    private func setupNameHeaderLabel() {
        addSubview(nameHeaderLabel)
        NSLayoutConstraint.activate([
            nameHeaderLabel.topAnchor.constraint(equalTo: topAnchor),
            nameHeaderLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            nameHeaderLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            nameHeaderLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    private func setupActivityIndicator() {
        addSubview(activityIndicator)
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    //MARK: Methods
    //create a tapGesture for header view
    private func tapGestureReccognizerForHeader() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(headerTapped))
        addGestureRecognizer(tapGesture)
    }
    
    // selector method for the tap gesture
    @objc private func headerTapped() {
        delegate?.performCreateArray(completion: completion)
    }
    
    private func completion(_ runtime: String?) {
        if let text = runtime {
            nameHeaderLabel.text = "Array creation time: " + text + " ms"
            nameHeaderLabel.backgroundColor = .white
            nameHeaderLabel.textColor = .black
        } else {
            print("Header runtime is nil")
        }
    }
    
    func startIndicator() {
        nameHeaderLabel.isHidden = true
        activityIndicator.startAnimating()
    }
    
    func stopIndicator() {
        nameHeaderLabel.isHidden = false
        activityIndicator.stopAnimating()
    }
}
