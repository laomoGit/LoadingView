//
//  CHLoadingView.swift
//  LoadingView
//
//  Created by 莫清霆 on 2016/12/8.
//  Copyright © 2016年 莫清霆. All rights reserved.
//

import UIKit

class CHLoadingView: UIView {

    var imageViewLoading:UIImageView!
    var imageViewLogo:UIImageView!
    
    let imageLogo = UIImage(named: "loading_logo1")!
    let imageLoading = UIImage(named: "loading_logo2")!
    
    
    /************
     配置UI
    *************/
    fileprivate func setupUI(){
        self.imageViewLogo = UIImageView(image: imageLogo)
        self.imageViewLogo.frame = CGRect(x: 0, y: 0, width: Int(self.imageLogo.size.width * 0.8), height: Int(self.imageLogo.size.height * 0.8))
        
        self.imageViewLoading = UIImageView(image: imageLoading)
        self.imageViewLoading.frame = CGRect(x: 0, y: 0, width: Int(self.imageLoading.size.width), height: Int(self.imageLoading.size.height))
        
        //居中
        self.imageViewLogo.center = self.center
        self.imageViewLoading.center = self.center
        
        //添加
        self.addSubview(self.imageViewLogo)
        self.addSubview(self.imageViewLoading)
    }

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    ///显示
    func show(){
        //显示
        self.imageViewLoading.rotate360Degress(duration: 1, completionDelegate: nil)
    }
    ///隐藏
    func hide(){
        self.imageViewLoading.stopRotate360Degress()
    }
    
}

//MARK:扩展UIView
extension UIView{
    //动画，360旋转
    func rotate360Degress(duration:CFTimeInterval = 5,completionDelegate:AnyObject? = nil){
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotateAnimation.toValue = CGFloat(M_PI * 2.0)
        rotateAnimation.duration = duration
        rotateAnimation.isCumulative = true
        rotateAnimation.repeatCount = Float(CGFloat.greatestFiniteMagnitude)
        //添加
        self.layer.add(rotateAnimation, forKey: "rotationAnimation")
    }
    
    ///停止旋转
    func stopRotate360Degress(){
        self.layer.removeAnimation(forKey: "rotationAnimation")
    }
}
