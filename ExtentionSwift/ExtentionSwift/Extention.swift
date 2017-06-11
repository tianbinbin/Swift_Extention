//
//  Extention.swift
//  ExtentionSwift
//
//  Created by 田彬彬 on 2017/6/10.
//  Copyright © 2017年 田彬彬. All rights reserved.
//

import UIKit

extension NSString{

    func printSelf()  {
    
        print(self)
    }

}


extension UIView{

    func MoveToXwithDuration(toX:CGFloat,duration:Double) {
        
        UIView.animate(withDuration: duration) { 
            
            self.frame.origin.x = toX
        }
    }
    
    
    func MoveToYwithDuration(toY:CGFloat,duration:Double) {
        
        UIView.animate(withDuration: duration) {
            
            self.frame.origin.y = toY
        }
    }
    
    
    //MoveToPoint
    
    
    var height:CGFloat{return self.bounds.size.height}
    var width:CGFloat{return self.bounds.size.width}

}


extension Int{

    
    var FloatValue:CGFloat{return CGFloat(self)}
    var DoubleValue:Double{return Double(self)}
    
}


extension UIImage{


    var height:CGFloat{return self.size.height}
    var width:CGFloat{return self.size.width}
    
    /**
       压缩图片 并返回压缩后的图片 牛逼啊
     */
    
    func ImageCompress(targetWidth:CGFloat) -> UIImage {
        
        let targetheight = (targetWidth/width)*height
        
        UIGraphicsBeginImageContext(CGSize(width: targetWidth, height: targetheight))
        self.draw(in: CGRect(x: 0, y: 0, width: targetWidth, height: targetheight))
        let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    /**
        返回一张模糊图片
        parameter value: 模糊程度
        return: 返回处理后的图片
     
     */
    
    func BlurImage(value:NSNumber) -> UIImage {
        
        // 这里采用的是CPU 处理
        let context = CIContext(options: [kCIContextUseSoftwareRenderer:true])
        let CIImage = CoreImage.CIImage(image:self)
        let blurFilter = CIFilter(name: "CIGaussianBlur")
        blurFilter?.setValue(CIImage, forKey: kCIInputImageKey)
        blurFilter?.setValue(value, forKey: "inputRadius")
        let imageRef = context.createCGImage((blurFilter?.outputImage)!, from: (CIImage?.extent)!)
        
        let newImage = UIImage(cgImage:imageRef!)
        
        return newImage
        
    }
    
    
}


