import UIKit

final class MainViewController: UIViewController {

    //MARK: Views
    private lazy var mainView = MainView()
    
    //MARK: Lifecycle
    var pushVC: ((UIViewController) -> Void)?
    
    private func configure() {
        pushVC = { [weak self] viewController in
            self?.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configure()
        setupTableViewHelper()
    }
    
    //MARK: Setup UI
    private func setupUI() {
        self.navigationItem.title = "Collections"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.largeTitleDisplayMode = .always
    }

    //MARK: Setup Delegate & DataSource
    
    private func setupTableViewHelper() {
        mainView.collectionsTableView.delegate = self
        mainView.collectionsTableView.dataSource = self
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    //MARK: DataSource
    //количество строк в секции
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CollectionType.allCases.count
    }
    
    //настройка ячеек
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TableCell = tableView.dequeueReusableCell(for: indexPath)
        let collectionType = CollectionType.allCases[indexPath.row]
        cell.bind(to: collectionType.rawValue)
        cell.accessibilityIdentifier = "TableCell\(indexPath.row)ID"
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    //MARK: Delegate
    //нажатие на ячейку
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let collectionType = CollectionType.allCases[indexPath.row]
        switch collectionType {
        case .array:
            let arrayVC = ArrayViewController()
            pushVC?(arrayVC)
        case .set:
            let setVC = SetViewController()
            pushVC?(setVC)
        case.dictionary:
            let dictionaryVC = DictionaryViewController()
            pushVC?(dictionaryVC)
        }
    }
}
