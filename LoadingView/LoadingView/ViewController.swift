//
//  ViewController.swift
//  LoadingView
//
//  Created by 莫清霆 on 2016/12/8.
//  Copyright © 2016年 莫清霆. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var loadingConverView:UIView!
    var loadingAnimatedView:UIImageView!
    var chLoadingView:CHLoadingView!
    
    
    /******
     loadingView 的颜色配置
    ******/
    let loadingConverViewBGColor:UIColor = UIColor.black
    let loadingHudViewBGColor:UInt = 0x34465C
    var isLoading = false
    
    
    @IBAction func loadingDidTouch(_ sender: Any) {
        //开始加载
        self.showLoading()

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationBar()
        self.createLoadingView()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController{
    /**
     配置导航栏
     */
    func setupNavigationBar() {
        //配置返回按钮文字
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "返回", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        
        
    }
    /**
     创建loadingView
     */
    func createLoadingView(){
        self.loadingConverView = UIView(frame: self.view.bounds)
        self.loadingConverView.backgroundColor = loadingConverViewBGColor
        
        self.chLoadingView = CHLoadingView(frame: CGRect(x: 0, y: 0, width: 83, height: 83))
        self.chLoadingView.center = self.loadingConverView.center
        self.loadingConverView.addSubview(self.chLoadingView)
    }
    
    func showLoading(){
        self.view.addSubview(self.loadingConverView)
        var navbarHeight:CGFloat = 0
        
        if let navbar = self.navigationController?.navigationBar{
           navbarHeight = navbar.frame.height
        }
        
        
        self.chLoadingView.frame.size.height =  self.chLoadingView.frame.size.height - navbarHeight
        self.loadingConverView.alpha = 1
        self.chLoadingView.show()
        self.isLoading = true
        
    }
    
    func dismissLoading(){
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {()->Void in
            self.loadingConverView.alpha = 0
            self.chLoadingView.hide()
        }, completion: {
        (flag)->Void in
            self.isLoading = false
            self.loadingConverView.removeFromSuperview()
        
        })
    }

}
