//
//  ViewController.swift
//  ViewPastTransfers
//
//  Created by Chandan on 13/02/23.
//

import UIKit

class ViewController: UIViewController {

    lazy private var searchView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        return view
    }()
    
    lazy private var searchImageView:UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit // image will never be strecthed vertially or horizontally
        img.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
        img.image = UIImage(systemName: "magnifyingglass")
        img.tintColor = .black
        
        return img
    }()
    
    lazy private var searchInputTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Search transfers"
        return textField
    }()
    
    private let tableView = UITableView(frame: CGRect(), style: .plain)
    
//    private var filteredArray = [Beneficiary]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = UIColor(red: 234/255, green: 235/255, blue: 237/255, alpha: 1)
        
        searchInputTextField.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TransactionCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor(red: 234/255, green: 235/255, blue: 237/255, alpha: 1)
       

        view.addSubview(searchView)
        view.addSubview(searchImageView)
        view.addSubview(searchInputTextField)
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            searchView.topAnchor.constraint(equalTo:view.topAnchor, constant: 160),
            searchView.leadingAnchor.constraint(equalTo:view.leadingAnchor, constant: 10),
            view.trailingAnchor.constraint(equalTo:searchView.trailingAnchor, constant: 10),
            searchInputTextField.centerYAnchor.constraint(equalTo: searchView.centerYAnchor),
            searchInputTextField.leadingAnchor.constraint(equalTo: searchView.leadingAnchor, constant: 10),
            searchView.trailingAnchor.constraint(equalTo: searchImageView.trailingAnchor, constant: 10),
            searchImageView.centerYAnchor.constraint(equalTo: searchView.centerYAnchor),
            tableView.topAnchor.constraint(equalToSystemSpacingBelow: searchView.bottomAnchor, multiplier: 2),
            tableView.leftAnchor.constraint(equalTo:view.leftAnchor, constant: 10),
            tableView.rightAnchor.constraint(equalTo:view.rightAnchor, constant: -10),
            tableView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }

    

}

extension ViewController: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        print(searchInputTextField.text)
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TransactionCell
        cell.transactionDate.text = "06 FEB 23"
        cell.amountLabel.text = "-₹ 30, 000.00"
        cell.recipientName.text = "Rahul Sharma"
        cell.backgroundColor = UIColor(red: 234/255, green: 235/255, blue: 237/255, alpha: 1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}
