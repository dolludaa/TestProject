//
//  MyCollectionCell.swift
//  TestProject
//
//  Created by Людмила Долонтаева on 11.10.2022.
//


import UIKit
import Foundation

class CollectionCell: UICollectionViewCell {
    
    static let reuseIdentifier = "MyCollectionCell"
    
    private let titleLabel = UILabel()
    private let imageView = UIImageView()

    override var isSelected: Bool {
      didSet {
        contentView.layer.borderWidth = isSelected ? 3 : 0
          
      }
    }
    
    override func prepareForReuse() {
        imageView.image = nil
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        setupStyle()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupStyle() {
        titleLabel.numberOfLines = 0
        titleLabel.backgroundColor = .white
        contentView.layer.borderColor = UIColor.black.cgColor
        contentView.layer.cornerRadius = 30
        imageView.contentMode = .scaleAspectFit
        titleLabel.font = UIFont(name: titleLabel.font.fontName, size: 15)
        
    }
    
    
    
    private func setupLayout() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 30).isActive = true
        imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -30).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: imageView.leftAnchor).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: imageView.rightAnchor).isActive = true
    }
    
    func configure(item: SectionItem) {
        titleLabel.text = item.title
        let url = URL(string: item.image.x3)!
        imageView.load(url: url)
    }
}

