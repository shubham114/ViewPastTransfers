//
//  MainViewController.swift
//  AddNewBeneficiary
//
//  Created by Kamal Sahu on 15/02/23.
//

import UIKit

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    
    func style()
    {
        launchBtn.translatesAutoresizingMaskIntoConstraints = false
        launchBtn.setTitle("Launch AddNewBeneficiary", for: .normal)
        launchBtn.configuration = .filled()
        launchBtn.tintColor = .init(red: 1, green: 0.1, blue: 0.1, alpha: 1)
        launchBtn.addTarget(self, action: #selector(launchbuttonTapped(_:)), for: .touchUpInside)
    }
    
    func layout()
    {
        view.addSubview(launchBtn)
        
        NSLayoutConstraint.activate([
            launchBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            launchBtn.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc func launchbuttonTapped(_ sender: UIButton) {
        let vc = ViewController()
        navigationController?.pushViewController(vc, animated: true)
        navigationItem.backButtonTitle = ""
        navigationController?.navigationBar.tintColor = .white
    }
}
