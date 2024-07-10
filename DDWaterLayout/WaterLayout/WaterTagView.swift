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
    
    var dataArr: Array<String> = ["但是姐姐佛罗伦萨","是否收到","kdpkd收到","收费的世界顶级的时代","舒服","3223舒服舒服","沙发上","是否收到","是法国大是大非","sjsjs开发商宽松短款开衫宽松款式","但是扣扣上岛咖啡开始看三款福克斯的看看"]
    
    lazy var collectionView: UICollectionView = {
        flowLayout = WaterFlowLayout()
//        flowLayout.sectionInset = .init(top: 0, left: 0, bottom: 5, right: 5)
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
        collectionView.backgroundColor = .blue
        // 添加约束
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
        
//        collectionView.snp.makeConstraints { make in
//            make.edges.equalTo(0)
//        }
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//
//        // Create views dictionary
//        let views: [String: Any] = ["collectionView": collectionView]
//
//        // Create horizontal constraints
//        let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|[collectionView]|",
//                                                                   options: [.alignAllTop],
//                                                                   metrics: nil,
//                                                                   views: views)
//
//        // Create vertical constraints
//        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|[collectionView]|",
//                                                                 options: [],
//                                                                 metrics: nil,
//                                                                 views: views)
//
//        // Add both horizontal and vertical constraints
//        NSLayoutConstraint.activate(horizontalConstraints + verticalConstraints)
    }
}

extension WaterTagView {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataArr.count
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        20
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        10
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let str = dataArr[indexPath.item]
        let height: Double = 28
        let maxSize: CGSize = .init(width: .infinity, height: height)
        let size = str.boundingRect(with: maxSize, options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)], context: nil)
        return .init(width: ceil(size.width), height: 28)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: WaterTagCell = collectionView.dequeueReusableCell(withReuseIdentifier: kWaterTagCellId, for: indexPath) as! WaterTagCell
        cell.text = dataArr[indexPath.item]
        return cell
    }
}
