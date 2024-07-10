//
//  WaterTagCell.swift
//  DDWaterLayout
//
//  Created by caidd on 2024/7/9.
//

import UIKit
import SnapKit

class WaterTagCell: UICollectionViewCell {
    
    var text: String? {
        didSet {
            guard let str = text else {return}
            textLab.text = str
        }
    }
    
    private var textLab: UILabel!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    private
    func setupUI() {
        backgroundColor = .red
        textLab = UILabel()
        textLab.font = .systemFont(ofSize: 12)
        textLab.textColor = .black
        textLab.textAlignment = .center
        addSubview(textLab)
        textLab.snp.makeConstraints { make in
            make.edges.equalTo(0)
        }
    }
}
