import UIKit

final class CollectionCell: UICollectionViewCell {
    //MARK: Views
    lazy var nameItemLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .systemBlue
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16)
        label.accessibilityIdentifier = "CellLabelID"
        return label
    }()
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.attributedIndicator()
        return activityIndicator
    }()
    
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupCells()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Setup UI
    private func setupCells() {
        backgroundColor = .systemGray3
        setupNameCellLabel()
        setupActivityIndicator()
    }
    
    private func setupNameCellLabel() {
        addSubview(nameItemLabel)
        NSLayoutConstraint.activate([
            nameItemLabel.topAnchor.constraint(equalTo: topAnchor),
            nameItemLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            nameItemLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            nameItemLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
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
    func bind(to name: String) {
        nameItemLabel.text = name
    }
    
    //for array view controller
    func bind(to name: TypeOperation, runtime: String) {
        switch name {
        case .insertAtTheBeginningOneByOne, .insertAtTheBeginningAtOnce, .insertInTheMiddleOneByOne, .insertInTheMiddleAtOnce, .appendAtTheEndOneByOne, .appendAtTheEndAtOnce:
            
            nameItemLabel.text = "Insertion time: " + runtime + " ms."
            customizedResultLabel()
            
        case .removeAtTheBeginningOneByOnce, .removeAtTheBeginningAtOnce, .removeInTheMiddleOneByOnce, .removeInTheMiddleAtOnce, .removeAtTheEndOneByOnce, .removeAtTheEndAtOnce:
            
            nameItemLabel.text = "Removal time: " + runtime + " ms."
            customizedResultLabel()
        }
    }
    
    func bind(to name: FindingType, runtime: String, for phoneNumber: String) {
        switch name {
        case .findFirstElement:
            nameItemLabel.text = "First element search time: " + runtime + " ms. Result number: " + phoneNumber
            customizedResultLabel()
            
        case .findLastElement:
            nameItemLabel.text = "Last element search time: " + runtime + " ms. Result number: " + phoneNumber
            customizedResultLabel()
            
        case .searchForNonExistingElement:
            nameItemLabel.text = "Non-existing element search time: " + runtime + " ms. Result number: " + phoneNumber
            customizedResultLabel()
        }
    }
    
    private func customizedResultLabel() {
        nameItemLabel.textColor = .black
        nameItemLabel.backgroundColor = .white
    }
    
    func startIndicator() {
        nameItemLabel.isHidden = true
        activityIndicator.startAnimating()
    }
    
    func stopIndicator() {
        nameItemLabel.isHidden = false
        activityIndicator.stopAnimating()
    }
    
}
