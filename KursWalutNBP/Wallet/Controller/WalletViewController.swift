//
//  WalletViewController.swift
//  KursWalutNBP
//
//  Created by Natalia Hetmańska on 19/09/2018.
//  Copyright © 2018 npisze. All rights reserved.
//

import UIKit

class WalletViewController: UIViewController {

    lazy var contentView: WalletView = {
        return WalletView(frame: .zero)
    }()
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}
