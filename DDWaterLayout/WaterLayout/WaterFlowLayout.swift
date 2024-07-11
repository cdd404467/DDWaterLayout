//
//  WaterFlowLayout.swift
//  DDWaterLayout
//
//  Created by caidd on 2024/7/7.
//

import UIKit

class WaterFlowLayout: UICollectionViewFlowLayout {
    
    var maxLineNumber: Int = Int.max
    
    var contentHeight: CGFloat = 0
    
    private var delegate: UICollectionViewDelegateFlowLayout? {
        collectionView?.delegate as? UICollectionViewDelegateFlowLayout
    }
    
    override init() {
        super.init()
        scrollDirection = .vertical
        minimumInteritemSpacing = 5
        minimumLineSpacing = 5
        sectionInset = .zero
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var contentWidth: CGFloat {
        guard let collectionView = collectionView else { return 0 }
        let insets = collectionView.contentInset
        return collectionView.bounds.width - (insets.left + insets.right)
    }
    private var cacheAttributes: [UICollectionViewLayoutAttributes] = []

    override func prepare() {
        guard let collectionView = collectionView else { return }
        
        let itemSpacing: CGFloat = getInteritemSpacing(at: 0)
        let lineSpacing: CGFloat = getLineSpacing(at: 0)
        let sectionInset: UIEdgeInsets = getSectionInset(at: 0)
        let itemCount = collectionView.numberOfItems(inSection: 0)
        var xOffset: CGFloat = sectionInset.left
        var yOffset: CGFloat = sectionInset.top
        var lineNum: Int = 1    //行数
        
        for item in 0 ..< itemCount {
            let indexPath = IndexPath(item: item, section: 0)
            let itemSize = getItemSize(at: indexPath)
            //大于就要换行
            if xOffset + itemSize.width + sectionInset.right > contentWidth {
                xOffset = sectionInset.left
                yOffset += itemSize.height + lineSpacing
                lineNum += 1
                
                if lineNum > maxLineNumber { break }
            }
            
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attributes.frame = CGRectMake(xOffset, yOffset, itemSize.width, itemSize.height)
            cacheAttributes.append(attributes)
            
            contentHeight = max(contentHeight, attributes.frame.maxY)
            //下一个item的x
            xOffset += itemSize.width + itemSpacing
        }
        contentHeight += sectionInset.bottom
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cacheAttributes[indexPath.item]
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return cacheAttributes.filter {$0.frame.intersects(rect)}
    }
    
    override var collectionViewContentSize: CGSize {
        //重新计算布局
        prepare()
        
        return .init(width: contentWidth, height: contentHeight)
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        let oldBounds = self.collectionView?.bounds ?? CGRect.zero
        if !oldBounds.size.equalTo(newBounds.size) {
            return true
        }
        return false
    }
}

//MARK: 返回代理方法或属性设置的值
extension WaterFlowLayout {
    //minimumInteritemSpacing
    private func getInteritemSpacing(at section: Int) -> CGFloat {
        if let collectionView = collectionView, let delegate = delegate {
            return delegate.collectionView?(collectionView, layout: self, minimumInteritemSpacingForSectionAt: section) ?? minimumInteritemSpacing
        }
        return minimumInteritemSpacing
    }
    
    //minimumLineSpacing
    private func getLineSpacing(at section: Int) -> CGFloat {
        if let collectionView = collectionView, let delegate = delegate {
            return delegate.collectionView?(collectionView, layout: self, minimumLineSpacingForSectionAt: section) ?? minimumLineSpacing
        }
        return minimumLineSpacing
    }
    
    //section insets
    private func getSectionInset(at section: Int) -> UIEdgeInsets {
        if let collectionView = collectionView, let delegate = delegate {
            return delegate.collectionView?(collectionView, layout: self, insetForSectionAt: section) ?? sectionInset
        }
        return sectionInset
    }
    
    //itemSize
    private func getItemSize(at indexPath: IndexPath) -> CGSize {
        if let collectionView = collectionView, let delegate = delegate {
            return delegate.collectionView?(collectionView, layout: self, sizeForItemAt: indexPath) ?? itemSize
        }
        return itemSize
    }
}
