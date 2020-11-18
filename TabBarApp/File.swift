//
//  File.swift
//  TabBarApp
//
//  Created by 柿沼儀揚 on 2020/11/18.
//

import Foundation

//
//  ViewController.swift
//  TabBarApp
//
//  Created by 柿沼儀揚 on 2020/11/18.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //viewが表示される直前に呼んでいる
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
        self.setTabBarItem(index: 0, titile: "ホーム", image: "movieBlack")
        self.setTabBarItem(index: 1, titile: "探索", image: "safariBlack")

        }
        /*
        index タブの数だけ存在　titile　必要に応じてつける　必要ない場合は""
        selectedImageName　選択された時に表示する画像　unselectedimageName　選択されてないときに表示される画像
        */
        func setTabBarItem(index: Int, titile: String, image: String) {
            let tabBarItem = self.tabBarController?.tabBar.items![index]
            tabBarItem!.title = titile
            
            tabBarItem!.image = UIImage(named: image)?.resize(size: .init(width: 25, height: 25))?.withRenderingMode(.alwaysOriginal)
            
        }

}

extension UIImage {
    /*サイズの修正
    呼び出し方　.resize(size: .init(width: 25, height: 25)
    */
    func resize(size _size: CGSize) -> UIImage? {
        let widthRatio = _size.width / size.width
        let heightRatio = _size.height / size.height
        let ratio = widthRatio < heightRatio ? widthRatio : heightRatio
        
        let resizeSize = CGSize(width: size.width * ratio, height: size.height * ratio)
        
        UIGraphicsBeginImageContextWithOptions(resizeSize, false, 0.0)
        draw(in: CGRect(origin: .zero, size: resizeSize))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return resizedImage
    }

}
