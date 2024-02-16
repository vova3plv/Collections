import UIKit

final class ArrayView: UIView {
    
    //MARK: Views
    lazy var arrayCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(CollectionCell.self, forCellWithReuseIdentifier: CollectionCell.reuseIdentifier)
        collectionView.register(ArrayCollectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ArrayCollectionHeader.reuseIdentifier)
        return collectionView
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
        setupArrayCollectionView()
    }
    
    private func setupArrayCollectionView() {
        addSubview(arrayCollectionView)
        NSLayoutConstraint.activate([
            arrayCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            arrayCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            arrayCollectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            arrayCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
