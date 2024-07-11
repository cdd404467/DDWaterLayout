//
//  MainVC.swift
//  DDWaterLayout
//
//  Created by caidd on 2024/7/4.
//

import UIKit

class MainVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        title = "首页"
        
        let dataArr: Array<String> = ["但是姐姐佛罗伦萨","是否收到","kdpkd收到","收费的世界顶级的时代","舒服","3223舒服舒服","沙发上","是否收到","是法国大是大非","sjsjs开发商宽松短款开衫宽松款式","但是扣扣上岛咖啡开始看三款福克斯的看看"]
        
        let tagView = WaterTagView()
        tagView.itemSpacing = 30
        tagView.tagsList = dataArr
        view.addSubview(tagView)
        tagView.snp.makeConstraints { make in
            make.left.equalTo(0)
            make.top.equalTo(200)
            make.right.equalTo(-50)
            make.height.equalTo(300)
        }
    }
    

    

}
