import UIKit
class RadioButtonCell: UITableViewCell {
    
    let radioButton = UIButton(type: .system)
    let label = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setCons()
        
        radioButton.setImage(UIImage(systemName: "circle"), for: .normal)
        radioButton.setImage(UIImage(systemName: "record.circle"), for: .selected)
        radioButton.translatesAutoresizingMaskIntoConstraints = false
        radioButton.frame = CGRect(x: 0, y: 0, width: 50 , height: 50)
       // radioButton.imageEdgeInsets = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
        radioButton.tintColor = .gray
        radioButton.addTarget(self, action: #selector(radioButtonTapped), for: .touchUpInside)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = .systemFont(ofSize: 20)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var stackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [radioButton, label])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
       
        return view
    }()
    

    
    func setCons() {
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 100),
            radioButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -50)
        ])
    }
    
    @objc func radioButtonTapped() {
        radioButton.isSelected = !radioButton.isSelected
    }
    
    
}
