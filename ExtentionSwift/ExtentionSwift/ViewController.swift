//
//  ViewController.swift
//  ExtentionSwift
//
//  Created by 田彬彬 on 2017/6/10.
//  Copyright © 2017年 田彬彬. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var testImageV: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 类的扩展
        "tianbin".printSelf()
        
        
        let Values:Int = 10
        let floatValue  =  Values.FloatValue
        let doubleValue  =  Values.DoubleValue
        
        // 压缩图片
//        testImageV.image = UIImage(named: "1492263285555.jpg")?.ImageCompress(targetWidth: 100)
        
        // 这个模糊 倒是 模糊了。不过有点耗时
        testImageV.image = UIImage(named: "1492263285555.jpg")?.BlurImage(value: 6.0)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        self.testImageV.MoveToXwithDuration(toX: 0, duration: 0.5)
        
    }
}

