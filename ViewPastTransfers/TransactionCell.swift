//
//  TransactionCell.swift
//  ViewPastTransfers
//
//  Created by Chandan on 13/02/23.
//

import Foundation

import UIKit

class TransactionCell: UITableViewCell
{
    var transactionDate = UILabel()
    var stackView1 = UIStackView()
    var repeatImage = UIImageView()
    var repeatImageLabel = UILabel()
    var stackView2 = UIStackView()
    var amountLabel = UILabel()
    var recipientName = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        transactionDate.textColor = .lightGray
        transactionDate.translatesAutoresizingMaskIntoConstraints = false
        transactionDate.font = UIFont.systemFont(ofSize: 10)
        
        stackView1.translatesAutoresizingMaskIntoConstraints = false
        stackView1.axis = .vertical
        stackView1.spacing = 5
        
        repeatImage.image = UIImage(systemName: "repeat")
        repeatImage.tintColor = .red
        repeatImage.contentMode = .scaleAspectFit
        
        repeatImageLabel.textColor = .red
        repeatImageLabel.text = "Repeat"
        repeatImageLabel.font = UIFont.systemFont(ofSize: 10)
        
        stackView2.translatesAutoresizingMaskIntoConstraints = false
        stackView2.axis = .vertical
        stackView2.spacing = 5
        
        amountLabel.textColor = .red
        amountLabel.translatesAutoresizingMaskIntoConstraints = false
        amountLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        recipientName.textColor = .gray
        recipientName.translatesAutoresizingMaskIntoConstraints = false
        recipientName.font = UIFont.systemFont(ofSize: 14)
        
        contentView.addSubview(transactionDate)
        stackView1.addArrangedSubview(repeatImage)
        stackView1.addArrangedSubview(repeatImageLabel)
        contentView.addSubview(stackView1)
        stackView2.addArrangedSubview(amountLabel)
        stackView2.addArrangedSubview(recipientName)
        contentView.addSubview(stackView2)
        
        NSLayoutConstraint.activate([
            transactionDate.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            transactionDate.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            contentView.trailingAnchor.constraint(equalTo: stackView1.trailingAnchor, constant: 10),
            stackView1.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            stackView2.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            stackView2.leadingAnchor.constraint(equalToSystemSpacingAfter: transactionDate.trailingAnchor, multiplier: 4)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 200)
    }
}

