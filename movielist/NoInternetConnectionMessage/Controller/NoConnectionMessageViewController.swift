//
//  NoConnectionMessageViewController.swift
//  movielist
//
//  Created by Igor Pino de Souza on 04/01/23.
//

import UIKit

class NoConnectionMessageViewController: UIViewController {
    public let noConnectionMessageView = NoInternetConnectionMessageView(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.clipsToBounds = true
        noConnectionMessageView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)

        view.addSubview(noConnectionMessageView)

        noConnectionMessageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        noConnectionMessageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        noConnectionMessageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        noConnectionMessageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}
