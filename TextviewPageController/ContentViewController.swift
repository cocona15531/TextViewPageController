//
//  ContentViewController.swift
//  TextviewPageController
//
//  Created by Issei Ueda on 2024/11/05.
//

import UIKit

class ContentViewController: UIViewController {
    
    var contentText: String?
    var pageIndex: Int?
    
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        view.addSubview(label)
        
        label.text = contentText
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

