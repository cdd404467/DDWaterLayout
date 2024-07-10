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
        
        
        let tagView = WaterTagView()
//        tagView.frame = CGRectMake(0, 200, self.view.frame.size.width, 300)
        view.addSubview(tagView)
        tagView.snp.makeConstraints { make in
            make.left.equalTo(0)
            make.top.equalTo(200)
            make.right.equalTo(-50)
            make.height.equalTo(300)
        }
    }
    

    

}
