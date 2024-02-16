import UIKit

final class DictionaryView: UIView {
    //MARK: Views
    
    private let arrayLabel: UILabel = {
        let label = UILabel()
        label.attributedLabel()
        label.text = "Array"
        return label
    }()
    
    private let dictionaryLabel: UILabel = {
        let label = UILabel()
        label.attributedLabel()
        label.text = "Dictionary"
        return label
    }()
    
    lazy var dictionaryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 2
        layout.minimumInteritemSpacing = 2
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(CollectionCell.self, forCellWithReuseIdentifier: CollectionCell.reuseIdentifier)
        return collectionView
    }()
    
    
    lazy var viewActivityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.attributedIndicator()
        return activityIndicator
    }()
    
    //MARK: Init
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Setup UI
    private func setupViews() {
        backgroundColor = .white
        setupArrayLabel()
        setupDictionaryLabel()
        setupDictionaryCollectionView()
        setupViewActivityIndicator()
    }
    
    private func setupArrayLabel() {
        addSubview(arrayLabel)
        NSLayoutConstraint.activate([
            arrayLabel.widthAnchor.constraint(equalToConstant: 100),
            arrayLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 13),
            arrayLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50)
            
        ])
    }
    
    private func setupDictionaryLabel() {
        addSubview(dictionaryLabel)
        NSLayoutConstraint.activate([
            dictionaryLabel.widthAnchor.constraint(equalToConstant: 100),
            dictionaryLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 13),
            dictionaryLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50)
        ])
    }
    
    private func setupDictionaryCollectionView() {
        addSubview(dictionaryCollectionView)
        NSLayoutConstraint.activate([
            dictionaryCollectionView.topAnchor.constraint(equalTo: arrayLabel.bottomAnchor, constant: 20),
            dictionaryCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            dictionaryCollectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            dictionaryCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    private func setupViewActivityIndicator() {
        addSubview(viewActivityIndicator)
        NSLayoutConstraint.activate([
            viewActivityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            viewActivityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    //MARK: Methods
    func startIndicator() {
        arrayLabel.isHidden = true
        dictionaryLabel.isHidden = true
        dictionaryCollectionView.isHidden = true
        viewActivityIndicator.startAnimating()
    }
    
    func stopIndicator() {
        arrayLabel.isHidden = false
        dictionaryLabel.isHidden = false
        dictionaryCollectionView.isHidden = false
        viewActivityIndicator.stopAnimating()
    }
}
