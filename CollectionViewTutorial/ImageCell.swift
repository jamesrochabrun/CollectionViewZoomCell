//
//  ImageCell.swift
//  PetMessageApp
//
//  Created by James Rochabrun on 12/12/16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

import UIKit

class ImageCell: UICollectionViewCell {
    
    static let Id = "cell"
    let photoImageView: UIImageView = {
        let iv =  UIImageView(frame: CGRect.zero)
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.isUserInteractionEnabled = false
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 0.1098039216, green: 0.6392156863, blue: 0.7843137255, alpha: 1)
        contentView.addSubview(photoImageView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()        
        NSLayoutConstraint.activate([
            photoImageView.widthAnchor.constraint(equalTo: widthAnchor),
            photoImageView.heightAnchor.constraint(equalTo: heightAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: trailingAnchor)
            ])
    }
    
    func configure(_ model: UIImage?) {
        photoImageView.image = model
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
