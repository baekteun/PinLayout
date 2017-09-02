//
//  MethodCell.swift
//  PinLayoutSample
//
//  Created by DION, Luc (MTL) on 2017-06-13.
//  Copyright © 2017 Mirego. All rights reserved.
//

import UIKit
import PinLayout

class MethodCell: UITableViewCell {
    static let reuseIdentifier = "MethodCell"
    
    fileprivate let iconImageView = UIImageView(image: UIImage(named: "method"))
    fileprivate let nameLabel = UILabel()
    fileprivate let descriptionLabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        separatorInset = .zero
        
        contentView.addSubview(iconImageView)
        
        nameLabel.font = UIFont.boldSystemFont(ofSize: 14)
        nameLabel.lineBreakMode = .byTruncatingTail
        contentView.addSubview(nameLabel)
        
        descriptionLabel.font = UIFont.systemFont(ofSize: 12)
        descriptionLabel.numberOfLines = 0
        contentView.addSubview(descriptionLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layout()
    }
    
    @discardableResult
    fileprivate func layout() -> CGSize {
        let margin: CGFloat = 10
        
        iconImageView.pin.topLeft().size(30).margin(margin)
        nameLabel.pin.right(of: iconImageView, aligned: .center).right().marginHorizontal(margin).fitSize()
        descriptionLabel.pin.below(of: [iconImageView, nameLabel]).left().right().margin(margin).fitSize()
        
        return CGSize(width: frame.width, height: descriptionLabel.frame.maxY + margin)
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        frame = CGRect(origin: .zero, size: size)
        return layout()
    }
    
    func configure(method: Method) {
        nameLabel.text = method.name
        descriptionLabel.text = method.description
    }
}
