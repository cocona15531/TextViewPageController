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
        textView.backgroundColor = .red
        
        // UITextViewをViewに追加
        view.addSubview(textView)

        // レイアウト設定
        NSLayoutConstraint.activate([
            textView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textView.topAnchor.constraint(equalTo: view.topAnchor),
            textView.heightAnchor.constraint(equalToConstant: 315),
            textView.widthAnchor.constraint(equalToConstant: 315),
        ])
    }
}

