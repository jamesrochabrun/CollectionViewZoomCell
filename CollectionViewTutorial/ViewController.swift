//
//  ViewController.swift
//  CollectionViewTutorial
//
//  Created by James Rochabrun on 12/13/16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - UI
    lazy var gridCollectionView: UICollectionView = {
        let cV = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: GridLayout())
        cV.backgroundColor = UIColor.orange
        cV.showsVerticalScrollIndicator = false
        cV.showsHorizontalScrollIndicator = false
        cV.translatesAutoresizingMaskIntoConstraints = false
        cV.dataSource = self
        cV.delegate = self
        cV.register(ImageCell.self, forCellWithReuseIdentifier: ImageCell.Id)
        return cV
    }()
    
    lazy var fullImageView: UIImageView = {
        let iV = UIImageView()
        iV.contentMode = .scaleAspectFit
        iV.backgroundColor = UIColor.lightGray
        iV.isUserInteractionEnabled = true
        iV.alpha = 0
        iV.contentMode = .scaleAspectFit
        iV.translatesAutoresizingMaskIntoConstraints = false
        let dismissWihtTap = UITapGestureRecognizer(target: self, action: #selector(hideFullImage))
        iV.addGestureRecognizer(dismissWihtTap)
        return iV
    }()
    
    // MARK: - App Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.addSubview(gridCollectionView)
        self.view.addSubview(fullImageView)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        NSLayoutConstraint.activate([
            gridCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            gridCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            gridCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            gridCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            fullImageView.topAnchor.constraint(equalTo: view.topAnchor),
            fullImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            fullImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            fullImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])
    }
    
    // MARK:- Animation
    func showFullImage(of image: UIImage) {
        
        fullImageView.transform = CGAffineTransform(scaleX: 0, y: 0)
        UIView.animate(withDuration: 0.5, delay: 0, options: [], animations:{
            self.fullImageView.image = image
            self.fullImageView.alpha = 1
            self.fullImageView.transform = CGAffineTransform(scaleX: 1, y: 1)
        }, completion: nil)
    }
    
    func hideFullImage() {
        UIView.animate(withDuration: 0.5, delay: 0, options: [], animations:{
            self.fullImageView.alpha = 0
        }, completion: nil)
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCell.Id, for: indexPath) as? ImageCell else {
            return UICollectionViewCell()
        }
        cell.configure(UIImage.init(named: "zizou"))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let cell = collectionView.cellForItem(at: indexPath) as? ImageCell,
        let image = cell.photoImageView.image else { return }
        self.showFullImage(of: image)
    }
}








