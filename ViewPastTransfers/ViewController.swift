import UIKit

class ViewController: UIViewController {
    
    var accountDetailsView = AccountDetailsView()
    
    var transactionCell = TransactionCell()
    
    lazy var stackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [accountDetailsView])
        view.axis = .vertical
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    lazy private var searchView: UISearchBar = {
        let view = UISearchBar()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
    
    private let tableView = UITableView(frame: CGRect(), style: .plain)
    
    var data = FetchApi().loadJson()
    
    //    private var filteredArray = [Beneficiary]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
        changeStatusBarColor()
        style()
        layout()
        
        view.backgroundColor = UIColor(red: 234/255, green: 235/255, blue: 237/255, alpha: 1)
        
        searchView.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TransactionCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor(red: 234/255, green: 235/255, blue: 237/255, alpha: 1)

        
        NSLayoutConstraint.activate([
            searchView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 20),
            searchView.leadingAnchor.constraint(equalTo:view.leadingAnchor, constant: 10),
            view.trailingAnchor.constraint(equalTo:searchView.trailingAnchor, constant: 10),
            tableView.topAnchor.constraint(equalToSystemSpacingBelow: searchView.bottomAnchor, multiplier: 2),
            tableView.leftAnchor.constraint(equalTo:view.leftAnchor, constant: 10),
            tableView.rightAnchor.constraint(equalTo:view.rightAnchor, constant: -10),
            tableView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension ViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TransactionCell
        cell.transactionDate.text = data?[indexPath.row].transactionDate
        cell.recipientName.text = data?[indexPath.row].reciepientName
        if data?[indexPath.row].type == "Credit" {
            cell.transactionType.text = data?[indexPath.row].type
            cell.amountLabel.text = "₹\(data![indexPath.row].amount)"
            cell.amountLabel.textColor = .blue
        }
        else {
            cell.transactionType.text = data?[indexPath.row].type
            cell.amountLabel.text = "-₹\(data![indexPath.row].amount)"
            cell.amountLabel.textColor = .red
        }
        cell.selectionStyle = .none
        cell.repeatBtn.addTarget(self, action: #selector(repeatBtnTapped(_:)), for: .touchUpInside)
        cell.repeatBtn.tag = indexPath.row
        cell.backgroundColor = UIColor(red: 234/255, green: 235/255, blue: 237/255, alpha: 1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}


extension ViewController {
    
    @objc func repeatBtnTapped(_ sender: UIButton) {
//        //sender.isSelected.toggle()
//        let vc = RepeatTappedViewController()
//        navigationController?.pushViewController(vc, animated: true)
//        navigationItem.backButtonTitle = ""
//        navigationController?.navigationBar.tintColor = .white
        print("Button tapped \(sender.tag)")
    }
    
    
    func style()
    {
        view.translatesAutoresizingMaskIntoConstraints = false
        accountDetailsView.translatesAutoresizingMaskIntoConstraints = false
        accountDetailsView.typeBtn.addTarget(self, action: #selector(typeBtnTapped(_:)), for: .touchUpInside)
        
        accountDetailsView.periodBtn.addTarget(self, action: #selector(periodBtnTapped(_ :)), for: .touchUpInside)
        accountDetailsView.bankSltBtn.addTarget(self, action: #selector(bankSltBtnTapped(_:)), for: .touchUpInside)
    }
    func layout()
    {
        view.addSubview(stackView)
        view.addSubview(searchView)
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 92),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -530)
        ])
    }
    
    
    // MARK: - Set NavigationBar
    func setNavigationBar() {
        let startingYPos = UIApplication.shared.statusBarFrame.size.height;
        let navigationbar = UINavigationBar(frame: CGRect(x: 0, y: startingYPos, width: self.view.bounds.width, height: 100));
        let navItem = UINavigationItem(title: "View Past Transfer")
        
        
        let leftbackButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: nil, action: nil)
        
        navigationbar.tintColor = .white
        navItem.leftBarButtonItem = leftbackButton
        
        UINavigationBar.appearance().barTintColor = .init(red: 1, green: 0.1, blue: 0.1, alpha: 1)
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UINavigationBar.appearance().isTranslucent = false
        navigationbar.setItems([navItem], animated: false)
        view.addSubview(navigationbar)
    }
    
    // MARK: - changeStatusBarColor
    func changeStatusBarColor() {
        if #available(iOS 13.0, *) {
            let app = UIApplication.shared
            let statusBarHeight: CGFloat = app.statusBarFrame.size.height
            
            let statusbarView = UIView()
            statusbarView.backgroundColor = .init(red: 1, green: 0.1, blue: 0.1, alpha: 1)
            view.addSubview(statusbarView)
            
            statusbarView.translatesAutoresizingMaskIntoConstraints = false
            statusbarView.heightAnchor
                .constraint(equalToConstant: statusBarHeight).isActive = true
            statusbarView.widthAnchor
                .constraint(equalTo: view.widthAnchor, multiplier: 1.0).isActive = true
            statusbarView.topAnchor
                .constraint(equalTo: view.topAnchor).isActive = true
            statusbarView.centerXAnchor
                .constraint(equalTo: view.centerXAnchor).isActive = true
            
        } else {
            let statusBar = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView
            statusBar?.backgroundColor = .init(red: 1, green: 0.1, blue: 0.1, alpha: 1)
        }
    }
    
    
}

// MARK: - Extension ViewController for PopOver View Controller
extension ViewController: UIPopoverPresentationControllerDelegate {
    
    func showPopover(_ sender: UIButton, dataArray: [String], label: UILabel) {
        
        // Create a view controller to display in the popover
        let contentViewController = PopOverTableViewController(dataArray: dataArray, label: label)
        contentViewController.preferredContentSize = CGSize(width: UIScreen.main.bounds.size.width , height: UIScreen.main.bounds.size.height / 6.2)
        
        // Create the popover presentation controller
        contentViewController.modalPresentationStyle = .popover
        if let popoverController = contentViewController.popoverPresentationController {
            popoverController.delegate = self
            popoverController.sourceView = sender
            popoverController.sourceRect =  CGRect(x:CGRectGetMidX(sender.bounds), y: CGRectGetMidY(sender.bounds),width: UIScreen.main.bounds.size.width,height:UIScreen.main.bounds.size.height/4.5 )
            popoverController.permittedArrowDirections = []
        }
        
        // Present the popover
        present(contentViewController, animated: true, completion: nil)
        
        
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        // Ensure that the popover is displayed on iPhones as well
        return .none
    }
    
    
    @objc func bankSltBtnTapped(_ sender: UIButton) {
        showPopover(sender, dataArray: accountDetailsView.selectAccArr, label: accountDetailsView.sltAccTextLabel)
    }
    
    @objc func typeBtnTapped(_ sender: UIButton) {
        showPopover(sender, dataArray: accountDetailsView.typeTextArr, label: accountDetailsView.typeTextLabel)
    }
    
    @objc func periodBtnTapped(_ sender: UIButton){
        showPopover(sender, dataArray: accountDetailsView.periodTextArr, label: accountDetailsView.periodTextLabel)
    }
}
