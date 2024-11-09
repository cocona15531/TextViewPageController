//
//  ViewController.swift
//  TextviewPageController
//
//  Created by Issei Ueda on 2024/11/05.
//


import UIKit

class ViewController: UIViewController, UIPageViewControllerDataSource {

    var pageViewController: UIPageViewController!
    var pages: [PageContentViewController] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // ページコンテンツの作成
        let texts = [
            "これは最初のページです。",
            "これは2ページ目です。",
            "これは3ページ目です。"
        ]
        
        for text in texts {
            let contentVC = PageContentViewController()
            contentVC.text = text
            contentVC.view.backgroundColor = .blue
            pages.append(contentVC)
        }

        // UIPageViewControllerのセットアップ
        pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageViewController.dataSource = self
        pageViewController.setViewControllers([pages[0]], direction: .forward, animated: true, completion: nil)
        
        // UIPageViewControllerをViewControllerの子として追加
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)
        
        // UIPageViewControllerのレイアウト設定
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pageViewController.view.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageViewController.view.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            pageViewController.view.heightAnchor.constraint(equalToConstant: 315),
            pageViewController.view.widthAnchor.constraint(equalToConstant: 315),
        ])
    }

    // MARK: - UIPageViewControllerDataSource

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController as! PageContentViewController), currentIndex > 0 else {
            return nil
        }
        return pages[currentIndex - 1]
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController as! PageContentViewController), currentIndex < pages.count - 1 else {
            return nil
        }
        return pages[currentIndex + 1]
    }
}
