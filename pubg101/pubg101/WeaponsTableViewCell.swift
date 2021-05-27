//
//  WeaponsTableViewCell.swift
//  pubg101
//
//  Created by Jervy Umandap on 5/27/21.
//

import UIKit
import SDWebImage

class WeaponsTableViewCell: UITableViewCell {
    static let identifier = "WeaponsTableViewCell"
    
    private let weaponImageContainer: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5.0
        view.backgroundColor = .secondarySystemBackground
        return view
    }()
    
    private let descriptionContainer: UIView = {
        let view = UIView()
        return view
    }()
    
    private let weaponImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 0
//        imageView.backgroundColor = .secondarySystemBackground
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 0
        label.layer.masksToBounds = true
        return label
    }()
    
    private let typeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.numberOfLines = 0
        label.layer.masksToBounds = true
        return label
    }()
    
    private let damagePerSecondlabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.numberOfLines = 0
        label.layer.masksToBounds = true
        return label
    }()
    
    private let rangeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.numberOfLines = 0
        label.layer.masksToBounds = true
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(weaponImageContainer)
        weaponImageContainer.addSubview(weaponImageView)
        
        contentView.addSubview(descriptionContainer)
        descriptionContainer.addSubview(nameLabel)
        descriptionContainer.addSubview(typeLabel)
        descriptionContainer.addSubview(damagePerSecondlabel)
        descriptionContainer.addSubview(rangeLabel)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        weaponImageContainer.frame = CGRect(
            x: 10,
            y: 10,
            width: (contentView.frame.size.width/3)-20,
            height: contentView.frame.size.height-20)
//        weaponImageContainer.backgroundColor = .systemBackground
        
        weaponImageView.frame = weaponImageContainer.bounds
        
        descriptionContainer.frame = CGRect(
            x: weaponImageContainer.right,
            y: 10,
            width: contentView.width-weaponImageContainer.width-10,
            height: contentView.height-20)
//        descriptionContainer.backgroundColor = .systemBlue
        
        nameLabel.frame = CGRect(
            x: 10,
            y: 0,
            width: descriptionContainer.width-20,
            height: descriptionContainer.height/4)
//        nameLabel.backgroundColor = .systemRed
        
        typeLabel.frame = CGRect(
            x: 10,
            y: nameLabel.frame.size.height,
            width: descriptionContainer.width-20,
            height: descriptionContainer.frame.size.height/4)
        
        damagePerSecondlabel.frame = CGRect(
            x: 10,
            y: nameLabel.height+typeLabel.height,
            width: descriptionContainer.width-20,
            height: descriptionContainer.height/4)
        
        rangeLabel.frame = CGRect(
            x: 10,
            y: nameLabel.height+typeLabel.height+damagePerSecondlabel.height,
            width: descriptionContainer.width-20,
            height: descriptionContainer.height/4)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
    func configure(withViewModel model: WeaponsTableViewCellViewModel) {
        nameLabel.text = model.name
        typeLabel.text = model.type
        damagePerSecondlabel.text = "\(model.dps)"
        rangeLabel.text = "\(model.range)"
        
        weaponImageView.sd_setImage(with: model.imageURL, completed: nil)
        
    }
    
    
    
}
