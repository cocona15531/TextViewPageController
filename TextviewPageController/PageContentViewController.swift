//
//  PageContentViewController.swift
//  TextviewPageController
//
//  Created by Issei Ueda on 2024/11/07.
//

import UIKit

class PageContentViewController: UIViewController {

    var textView: UITextView!
    var text: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        // UITextViewの設定
        textView = UITextView()
        textView.text = text
        textView.isEditable = true
        textView.font = UIFont.systemFont(ofSize: 18)
        textView.textAlignment = .center
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        // UITextViewをViewに追加
        view.addSubview(textView)

        // レイアウト設定
        NSLayoutConstraint.activate([
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            textView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            textView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
        ])
    }
}

