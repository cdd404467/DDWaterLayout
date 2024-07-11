//
//  WaterTagView.swift
//  DDWaterLayout
//
//  Created by caidd on 2024/7/9.
//

import UIKit

class WaterTagView: UIView , UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //MARK: - 属性
    var tagsList: Array<String>? {
        didSet {
            guard let _ = tagsList else {return}
            collectionView.reloadData()
        }
    }
    
    var itemSpacing: CGFloat = 5
    
    
    private let kWaterTagCellId = "WaterTagCell"
    
    private var flowLayout: WaterFlowLayout!
    
    lazy var collectionView: UICollectionView = {
        flowLayout = WaterFlowLayout()
        let cv = UICollectionView.init(frame: .zero, collectionViewLayout: flowLayout)
        cv.backgroundColor = .clear
        cv.showsVerticalScrollIndicator = false
        cv.dataSource = self
        cv.delegate = self
        cv.register(WaterTagCell.self, forCellWithReuseIdentifier: kWaterTagCellId)
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        generalInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func generalInit() {
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .blue
        // 添加约束
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
}

extension WaterTagView {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        tagsList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        itemSpacing
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        10
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let str = tagsList?[indexPath.item]
        let height: Double = 28
        let maxSize: CGSize = .init(width: .infinity, height: height)
        let size = str?.boundingRect(with: maxSize, options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)], context: nil)
        return .init(width: ceil(size?.width ?? 30), height: 28)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: WaterTagCell = collectionView.dequeueReusableCell(withReuseIdentifier: kWaterTagCellId, for: indexPath) as! WaterTagCell
        cell.text = tagsList?[indexPath.item]
        return cell
    }
}

