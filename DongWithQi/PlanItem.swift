//
//  PlanItem.swift
//  DongWithQi
//
//  Created by 叶东强子 on 2017/10/25.
//  Copyright © 2017年 叶东强子. All rights reserved.
//

import Foundation

import UIKit

class PlanItem: NSObject {
    var title_: String
    var data_: String
    var id_: Int
    
    init(title: String, data: String, id: Int) {
        self.title_ = title
        self.data_ = data
        self.id_ = id
        super.init()
    }
}
