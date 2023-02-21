//
//  TableViewController.swift
//  AddNewBeneficiary
//
//  Created by Kamal Sahu on 14/02/23.
//

import Foundation
import UIKit

class PopOverTableViewController: UIViewController {
    
    var tableView = UITableView()
    
    var dataArray: [String]
    
    var label: UILabel
    
    init(dataArray: [String], label: UILabel ) {
        self.dataArray = dataArray
        self.label = label
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorInset = .zero
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        setConstraints()
    }
    
    // MARK: - setConstraints
    func setConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
}

extension PopOverTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = dataArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedText = dataArray[indexPath.row]
        label.text = selectedText
        
        self.dismiss(animated: true, completion: nil)
    }
    
}
