//
//  CurrencyTableViewCell.swift
//  KursWalutNBP
//
//  Created by Natalia Hetmańska on 02/09/2018.
//  Copyright © 2018 npisze. All rights reserved.
//

import UIKit
import SnapKit

class CurrencyTableViewCell: UITableViewCell {
    
    private var currencyCodeLabel = UILabel()
    private var bidLabel = UILabel()
    private var askLabel = UILabel()
    
    var currencyCode: String? {
        didSet {
            currencyCodeLabel.text = currencyCode
        }
    }
    
    var bidValue: Double? {
        didSet {
            bidLabel.text = bidValue?.inCash
        }
    }
    
    var askValue: Double? {
        didSet {
            askLabel.text = askValue?.inCash
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpCellView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpCellView() {
        currencyCodeLabel.textAlignment = .center
        bidLabel.textAlignment = .center
        askLabel.textAlignment = .center
        
        let labelsStack = UIStackView()
        labelsStack.axis = .horizontal
        labelsStack.distribution = .fillEqually
        
        [currencyCodeLabel, bidLabel, askLabel].forEach {
            labelsStack.addArrangedSubview($0)
        }
        
        contentView.addSubview(labelsStack)
        labelsStack.snp.makeConstraints { (make) in
            make.edges.equalTo(self.contentView)
        }
    }

    class func cellHeight() -> CGFloat {
        return 50
    }

}
