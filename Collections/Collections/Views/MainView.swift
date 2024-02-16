import UIKit

final class MainView: UIView {
    
    //MARK: Views
    lazy var collectionsTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(TableCell.self, forCellReuseIdentifier: TableCell.reuseIdentifier)
        tableView.accessibilityIdentifier = "CollectionTableViewID"
        return tableView
    }()
    
    //MARK: Init
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: SetupUI
    private func setupViews() {
        backgroundColor = .white
        setupCollectionsTableView()
    }
    
    private func setupCollectionsTableView() {
        addSubview(collectionsTableView)
        NSLayoutConstraint.activate([
            collectionsTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 1),
            collectionsTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),
            collectionsTableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            collectionsTableView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
}
