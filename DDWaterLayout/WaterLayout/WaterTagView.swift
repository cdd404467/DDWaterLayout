//
//  WaterTagView.swift
//  DDWaterLayout
//
//  Created by caidd on 2024/7/9.
//

import UIKit

class WaterTagView: UIView , UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private let kWaterTagCellId = "WaterTagCell"
    
    var flowLayout: WaterFlowLayout!
    
    lazy var collectionView: UICollectionView = {
        flowLayout = WaterFlowLayout()
        flowLayout.delegate = self
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
        generalInit()
    }
    
    private
    func generalInit() {
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        // Create views dictionary
        let views: [String: Any] = ["collectionView": collectionView]

        // Create horizontal constraints
        let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|[collectionView]|",
                                                                   options: [.alignAllTop],
                                                                   metrics: nil,
                                                                   views: views)

        // Create vertical constraints
        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|[collectionView]|",
                                                                 options: [],
                                                                 metrics: nil,
                                                                 views: views)

        // Add both horizontal and vertical constraints
        NSLayoutConstraint.activate(horizontalConstraints + verticalConstraints)
    }
}

extension WaterTagView {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let str = "红包任务"
        let height: Double = 28
        let maxSize: CGSize = .init(width: .infinity, height: height)
        let size = str.boundingRect(with: maxSize, options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)], context: nil)
        var offset: Double = 16
        if indexPath.row == 0 {
            offset += 14 + 4
        }
        return .init(width: ceil(size.width + offset), height: 28)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: WaterTagCell = collectionView.dequeueReusableCell(withReuseIdentifier: kWaterTagCellId, for: indexPath) as! WaterTagCell
        
        return cell
    }
}
