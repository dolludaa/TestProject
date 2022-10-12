import UIKit

class ViewController: UIViewController {
    
    private var sectionList: SectionList?
    
    private let tableView = UITableView()
    
    private let sectionService = SectionService()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        setupStyle()
        setupLayout()
    }
    
    private func loadData() {
         sectionList = sectionService.getSectionList(filename: "SectionData")
    }
    
    private func setupStyle() {
        tableView.backgroundColor = .lightGray
        tableView.register(TableCell.self, forCellReuseIdentifier: TableCell.reuseIdentifier)
        tableView.dataSource = self
        tableView.rowHeight = 300
    }
    
    private func setupLayout() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionList?.sections.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableCell.reuseIdentifier) as! TableCell
        let section = (sectionList?.sections[indexPath.row])!
        cell.configure(section: section)
        return cell
    }
}

