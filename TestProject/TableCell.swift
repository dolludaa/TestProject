import Foundation
import UIKit

class TableCell: UITableViewCell {
    
    static let reuseIdentifier = "TableCell"
    
    private let flowLayout = UICollectionViewFlowLayout()
    
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    private let headerLabel = UILabel()

    private var section: Section?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupStyle()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupStyle() {
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = .init(width: 180, height: 200)
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = 15
        
        collectionView.dataSource = self
        collectionView.register(CollectionCell.self, forCellWithReuseIdentifier: CollectionCell.reuseIdentifier)
        collectionView.allowsMultipleSelection = true
        collectionView.allowsSelection = true
        collectionView.delegate = self
    }
    
    private func setupLayout() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(collectionView)
        contentView.addSubview(headerLabel)
        
        collectionView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        
        headerLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor,constant: 15).isActive = true
        headerLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
    }
    
    func configure(section: Section) {
        self.section = section
        headerLabel.text = section.header
        headerLabel.font = UIFont.boldSystemFont(ofSize: 30)
    }
}

extension TableCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.section?.items.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionCell.reuseIdentifier, for: indexPath) as! CollectionCell
        let item = (section?.items[indexPath.row])!
        cell.configure(item: item)
        return cell
    }
}

extension TableCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        if selectedCount == 6 {
            return false
        } else {
            return true
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedCount += 1
    }

    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        selectedCount -= 1
    }
}


