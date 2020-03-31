//
//  ViewController.swift
//  UIPageControlSample
//
//  Created by satoshi.marumoto on 2020/03/31.
//  Copyright © 2020 satoshi.marumoto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var scrollView: UIScrollView!
    private var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // scrollViewの画面表示サイズを指定
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 200, width: view.frame.size.width, height: 200))
        // scrollViewのサイズを指定（幅は1メニューに表示するViewの幅×ページ数）
        scrollView.contentSize = CGSize(width: view.frame.size.width*3, height: 200)
        // scrollViewのデリゲートになる
        scrollView.delegate = self
        // メニュー単位のスクロールを可能にする
        scrollView.isPagingEnabled = true
        // 水平方向のスクロールインジケータを非表示にする
        scrollView.showsHorizontalScrollIndicator = false
        view.addSubview(scrollView)
        
        // scrollView上にUIImageViewをページ分追加する(今回は3ページ分)
        let park = createImageView(x: 0, y: 0, width: view.frame.size.width, height: 200, image: "park")
        scrollView.addSubview(park)
        
        let sun = createImageView(x: view.frame.size.width, y: 0, width: view.frame.size.width, height: 200, image: "sun")
        scrollView.addSubview(sun)
        
        let wave = createImageView(x: view.frame.size.width*2, y: 0, width: view.frame.size.width, height: 200, image: "wave")
        scrollView.addSubview(wave)
        
        // pageControlの表示位置とサイズの設定
        pageControl = UIPageControl(frame: CGRect(x: 0, y: 370, width: view.frame.size.width, height: 30))
        // pageControlのページ数を設定
        pageControl.numberOfPages = 3
        // pageControlのドットの色
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        // pageControlの現在のページのドットの色
        pageControl.currentPageIndicatorTintColor = UIColor.black
        view.addSubview(pageControl)
    }
    
    // UIImageViewを生成
    func createImageView(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, image: String) -> UIImageView {
        let imageView = UIImageView(frame: CGRect(x: x, y: y, width: width, height: height))
        let image = UIImage(named:  image)
        imageView.image = image
        return imageView
    }
}

// scrollViewのページ移動に合わせてpageControlの表示も移動させる
extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
    }
}

