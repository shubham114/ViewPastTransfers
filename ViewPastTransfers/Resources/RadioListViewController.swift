import UIKit
class RadioListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    let dataArray: [String]
    var label: UILabel
    var selectedOption: Int?
    
    let filterLabel = UILabel()
    
    var tableView = UITableView()
    
    var closeButton = UIButton()
    
    var divider = UIView()
    
    
    init(dataArray: [String],label: UILabel) {
        self.dataArray = dataArray
        self.label = label
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var stack: UIStackView = {
        let view = UIStackView(arrangedSubviews: [filterLabel, closeButton])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filterLabel.translatesAutoresizingMaskIntoConstraints = false
        filterLabel.text = "Filter Period"
        filterLabel.font = .systemFont(ofSize: 25)
        filterLabel.textColor = .systemBlue
        
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        closeButton.tintColor = .red
        
        divider.translatesAutoresizingMaskIntoConstraints = false
        divider.backgroundColor = .black
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(RadioButtonCell.self, forCellReuseIdentifier: "RadioButtonCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorInset = .zero
        
        
        setConstraints()
       
    }
    // MARK: - setConstraints
    func setConstraints() {
        view.addSubview(stack)
        view.addSubview(divider)
        view.addSubview(tableView)
       
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            stack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            stack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10)
        ])
        divider.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalToSystemSpacingBelow: stack.bottomAnchor, multiplier: 2),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RadioButtonCell", for: indexPath) as! RadioButtonCell
        
     
        cell.radioButton.isSelected = (indexPath.row == selectedOption)
        cell.label.text = dataArray[indexPath.row]
        //cell.selectionStyle = .none
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let selectedText = dataArray[indexPath.row]
        label.text = selectedText
        
        self.dismiss(animated: true, completion: nil)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
