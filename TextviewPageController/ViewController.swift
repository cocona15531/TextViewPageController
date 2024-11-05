//
//  ViewController.swift
//  TextviewPageController
//
//  Created by Issei Ueda on 2024/11/05.
//


import UIKit

class ViewController: UIViewController, UIPageViewControllerDataSource {

    // UITextView と UIPageViewController のインスタンスを作成
    private let textView: UITextView = {
        let textView = UITextView()
        textView.text = "これはUITextViewです。"
        textView.font = UIFont.systemFont(ofSize: 18)
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    private var pageViewController: UIPageViewController!
    private var pageContents: [String] = ["ページ 1", "ページ 2", "ページ 3"]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        // UITextViewを追加
        view.addSubview(textView)
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            textView.heightAnchor.constraint(equalToConstant: 100)
        ])

        // UIPageViewControllerを追加
        pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageViewController.dataSource = self
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)

        // ページビューの制約を設定
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pageViewController.view.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 20),
            pageViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pageViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pageViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        // 最初のページを表示
        if let firstVC = viewControllerAt(index: 0) {
            pageViewController.setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
    }

    // 指定されたインデックスのViewControllerを取得
    func viewControllerAt(index: Int) -> UIViewController? {
        if index < 0 || index >= pageContents.count {
            return nil
        }

        let contentVC = ContentViewController()
        contentVC.contentText = pageContents[index]
        contentVC.pageIndex = index
        return contentVC
    }

    // MARK: - UIPageViewControllerDataSource

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let contentVC = viewController as? ContentViewController,
              let index = contentVC.pageIndex else { return nil }
        return viewControllerAt(index: index - 1)
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let contentVC = viewController as? ContentViewController,
              let index = contentVC.pageIndex else { return nil }
        return viewControllerAt(index: index + 1)
    }
}

