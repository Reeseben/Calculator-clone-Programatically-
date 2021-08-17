//
//  CalculatorViewController.swift
//  ProgramaticCalculator
//
//  Created by Ben Erekson on 8/17/21.
//

import UIKit

class CalculatorViewController: UIViewController {

    
    //MARK: - Properties
    var safeArea: UILayoutGuide {
        return self.view.safeAreaLayoutGuide
    }
    var currentTotal: Double?
    var currentOperator: String?
    var buttons: [UIButton] {[
        ACButton,
        negateButton,
        percentButton,
        devidebutton,
        sevenButton,
        eightButton,
        nineButton,
        multiplyButton,
        fourButton,
        fiveButton,
        sixButton,
        subtractButton,
        oneButton,
        twoButton,
        threeButton,
        addButton,
        zeroButton,
        decimalButton,
        equalsButton
        ]}
    
    //MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        addAllSubviews()
        addViewsToStackViews()
        addAllConstraints()
        activateButtons()
    }
    
    //MARK: - Actual Calculator Funcitonality
    @objc func calculatorButtonPressed(_ sender: UIButton){
        var text = displayTextField.text ?? ""
        guard var number = Double(text),
              let senderTitle = sender.currentTitle else { displayTextField.text = "0"; return }
        
        if text == "0" || text == "-nan" || text == "inf" {
            text = ""
        }
        
        switch senderTitle {
        case "AC":
            currentTotal = nil
            currentOperator = nil
            displayTextField.text = "0"
        case "+/-":
            number *= -1.0
            displayTextField.text = "\(number)"
        case "%":
            number /= 100
            displayTextField.text = "\(number)"
        case "÷":
            currentTotal = number
            currentOperator = "÷"
            displayTextField.text = "0"
        case "7":
            text.append("7")
            displayTextField.text = text
        case "8":
            text.append("8")
            displayTextField.text = text
        case "9":
            text.append("9")
            displayTextField.text = text
        case "x":
            currentTotal = number
            currentOperator = "x"
            displayTextField.text = "0"
        case "4":
            text.append("4")
            displayTextField.text = text
        case "5":
            text.append("5")
            displayTextField.text = text
        case "6":
            text.append("6")
            displayTextField.text = text
        case "-":
            currentTotal = number
            currentOperator = "-"
            displayTextField.text = "0"
        case "1":
            text.append("1")
            displayTextField.text = text
        case "2":
            text.append("2")
            displayTextField.text = text
        case "3":
            text.append("3")
            displayTextField.text = text
        case "+":
            currentTotal = number
            currentOperator = "+"
            displayTextField.text = "0"
        case "0":
            text.append("0")
            displayTextField.text = text
        case ".":
            if text.contains("."){
                
            } else {
                text.append(".")
                displayTextField.text = text
            }
            
        case "=":
            guard let currentOperator = currentOperator,
                  let currentTotal = currentTotal else { return }
            switch currentOperator {
            case "+":
                let result = currentTotal + number
                displayTextField.text = "\(result)"
            case "÷":
                let result = currentTotal / number
                displayTextField.text = "\(result)"
            case "x":
                let result = currentTotal * number
                displayTextField.text = "\(result)"
            case "-":
                let result = currentTotal - number
                displayTextField.text = "\(result)"
            default:
                print("You forgot an operator")
            }
        default:
            print("You did a button wrong.")
        }
    }
    
    //MARK: - UIElements
    let displayTextField: UITextField = {
        let textField = UITextField()
        textField.text = "0"
        textField.layer.cornerRadius = 10
        textField.layer.masksToBounds = true
        textField.backgroundColor = ButtonConstants.displayColor
        textField.textColor = ButtonConstants.textColor
        textField.inputView = UIView()
        textField.textAlignment = .right
        
        return textField
    }()
    
    let ACButton: UIButton = {
        let button = UIButton()
        button.setTitle("AC", for: .normal)
        button.layer.cornerRadius = ButtonConstants.cornerRadius
        button.layer.masksToBounds = true
        button.backgroundColor = ButtonConstants.topOpColor
        button.setTitleColor(ButtonConstants.textColor, for: .normal)
        
        return button
    }()
    
    let negateButton: UIButton = {
        let button = UIButton()
        button.setTitle("+/-", for: .normal)
        button.layer.cornerRadius = ButtonConstants.cornerRadius
        button.layer.masksToBounds = true
        button.backgroundColor = ButtonConstants.topOpColor
        button.setTitleColor(ButtonConstants.textColor, for: .normal)
        
        return button
    }()
    
    let percentButton: UIButton = {
        let button = UIButton()
        button.setTitle("%", for: .normal)
        button.layer.cornerRadius = ButtonConstants.cornerRadius
        button.layer.masksToBounds = true
        button.backgroundColor = ButtonConstants.topOpColor
        button.setTitleColor(ButtonConstants.textColor, for: .normal)
        
        return button
    }()
    
    let devidebutton: UIButton = {
        let button = UIButton()
        button.setTitle("÷", for: .normal)
        button.layer.cornerRadius = ButtonConstants.cornerRadius
        button.layer.masksToBounds = true
        button.backgroundColor = ButtonConstants.opColor
        button.setTitleColor(ButtonConstants.textColor, for: .normal)
        
        return button
    }()
    
    let sevenButton: UIButton = {
        let button = UIButton()
        button.setTitle("7", for: .normal)
        button.layer.cornerRadius = ButtonConstants.cornerRadius
        button.layer.masksToBounds = true
        button.backgroundColor = ButtonConstants.numColor
        button.setTitleColor(ButtonConstants.textColor, for: .normal)
        
        return button
    }()
    
    let eightButton: UIButton = {
        let button = UIButton()
        button.setTitle("8", for: .normal)
        button.layer.cornerRadius = ButtonConstants.cornerRadius
        button.layer.masksToBounds = true
        button.backgroundColor = ButtonConstants.numColor
        button.setTitleColor(ButtonConstants.textColor, for: .normal)
        
        return button
    }()
    
    let nineButton: UIButton = {
        let button = UIButton()
        button.setTitle("9", for: .normal)
        button.layer.cornerRadius = ButtonConstants.cornerRadius
        button.layer.masksToBounds = true
        button.backgroundColor = ButtonConstants.numColor
        button.setTitleColor(ButtonConstants.textColor, for: .normal)
        
        return button
    }()
    
    let multiplyButton: UIButton = {
        let button = UIButton()
        button.setTitle("x", for: .normal)
        button.layer.cornerRadius = ButtonConstants.cornerRadius
        button.layer.masksToBounds = true
        button.backgroundColor = ButtonConstants.opColor
        button.setTitleColor(ButtonConstants.textColor, for: .normal)
        
        return button
    }()
    
    let fourButton: UIButton = {
        let button = UIButton()
        button.setTitle("4", for: .normal)
        button.layer.cornerRadius = ButtonConstants.cornerRadius
        button.layer.masksToBounds = true
        button.backgroundColor = ButtonConstants.numColor
        button.setTitleColor(ButtonConstants.textColor, for: .normal)
        
        return button
    }()
    
    let fiveButton: UIButton = {
        let button = UIButton()
        button.setTitle("5", for: .normal)
        button.layer.cornerRadius = ButtonConstants.cornerRadius
        button.layer.masksToBounds = true
        button.backgroundColor = ButtonConstants.numColor
        button.setTitleColor(ButtonConstants.textColor, for: .normal)
        
        return button
    }()
    
    let sixButton: UIButton = {
        let button = UIButton()
        button.setTitle("6", for: .normal)
        button.layer.cornerRadius = ButtonConstants.cornerRadius
        button.layer.masksToBounds = true
        button.backgroundColor = ButtonConstants.numColor
        button.setTitleColor(ButtonConstants.textColor, for: .normal)
        
        return button
    }()
    
    let subtractButton: UIButton = {
        let button = UIButton()
        button.setTitle("-", for: .normal)
        button.layer.cornerRadius = ButtonConstants.cornerRadius
        button.layer.masksToBounds = true
        button.backgroundColor = ButtonConstants.opColor
        button.setTitleColor(ButtonConstants.textColor, for: .normal)
        
        return button
    }()
    
    let oneButton: UIButton = {
        let button = UIButton()
        button.setTitle("1", for: .normal)
        button.layer.cornerRadius = ButtonConstants.cornerRadius
        button.layer.masksToBounds = true
        button.backgroundColor = ButtonConstants.numColor
        button.setTitleColor(ButtonConstants.textColor, for: .normal)
        
        return button
    }()
    
    let twoButton: UIButton = {
        let button = UIButton()
        button.setTitle("2", for: .normal)
        button.layer.cornerRadius = ButtonConstants.cornerRadius
        button.layer.masksToBounds = true
        button.backgroundColor = ButtonConstants.numColor
        button.setTitleColor(ButtonConstants.textColor, for: .normal)
        
        return button
    }()
    
    let threeButton: UIButton = {
        let button = UIButton()
        button.setTitle("3", for: .normal)
        button.layer.cornerRadius = ButtonConstants.cornerRadius
        button.layer.masksToBounds = true
        button.backgroundColor = ButtonConstants.numColor
        button.setTitleColor(ButtonConstants.textColor, for: .normal)
        
        return button
    }()
    
    let addButton: UIButton = {
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.layer.cornerRadius = ButtonConstants.cornerRadius
        button.layer.masksToBounds = true
        button.backgroundColor = ButtonConstants.opColor
        button.setTitleColor(ButtonConstants.textColor, for: .normal)
        
        return button
    }()
    
    let zeroButton: UIButton = {
        let button = UIButton()
        button.setTitle("0", for: .normal)
        button.layer.cornerRadius = ButtonConstants.cornerRadius
        button.layer.masksToBounds = true
        button.backgroundColor = ButtonConstants.numColor
        button.setTitleColor(ButtonConstants.textColor, for: .normal)
        
        return button
    }()
    
    let decimalButton: UIButton = {
        let button = UIButton()
        button.setTitle(".", for: .normal)
        button.layer.cornerRadius = ButtonConstants.cornerRadius
        button.layer.masksToBounds = true
        button.backgroundColor = ButtonConstants.numColor
        button.setTitleColor(ButtonConstants.textColor, for: .normal)
        
        return button
    }()
    
    let equalsButton: UIButton = {
        let button = UIButton()
        button.setTitle("=", for: .normal)
        button.layer.cornerRadius = ButtonConstants.cornerRadius
        button.layer.masksToBounds = true
        button.backgroundColor = ButtonConstants.opColor
        button.setTitleColor(ButtonConstants.textColor, for: .normal)
        
        return button
    }()
    
    let firstRow: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    let secondRow: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    let thridRow: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
       
        return stackView
    }()
    
    let fourthRow: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    let fithRow: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    let kingOfAllStackViews: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    //MARK: - View funcitons
    
    func addAllSubviews() {
        //Elements
        self.view.addSubview(displayTextField)
//        self.view.addSubview(ACButton)
//        self.view.addSubview(negateButton)
//        self.view.addSubview(percentButton)
//        self.view.addSubview(devidebutton)
//        self.view.addSubview(sevenButton)
//        self.view.addSubview(eightButton)
//        self.view.addSubview(nineButton)
//        self.view.addSubview(multiplyButton)
//        self.view.addSubview(fourButton)
//        self.view.addSubview(fiveButton)
//        self.view.addSubview(sixButton)
//        self.view.addSubview(subtractButton)
//        self.view.addSubview(oneButton)
//        self.view.addSubview(twoButton)
//        self.view.addSubview(threeButton)
//        self.view.addSubview(addButton)
//        self.view.addSubview(zeroButton)
//        self.view.addSubview(decimalButton)
//        self.view.addSubview(equalsButton)
        
        //Stack Views
//        self.view.addSubview(firstRow)
//        self.view.addSubview(secondRow)
//        self.view.addSubview(thridRow)
//        self.view.addSubview(fourthRow)
//        self.view.addSubview(fithRow)
        self.view.addSubview(kingOfAllStackViews)
        
    }
    
    func addViewsToStackViews(){
        //First Stack View
        firstRow.addArrangedSubview(ACButton)
        firstRow.addArrangedSubview(negateButton)
        firstRow.addArrangedSubview(percentButton)
        firstRow.addArrangedSubview(devidebutton)
        
        //Second Stack View
        secondRow.addArrangedSubview(sevenButton)
        secondRow.addArrangedSubview(eightButton)
        secondRow.addArrangedSubview(nineButton)
        secondRow.addArrangedSubview(multiplyButton)
        
        //Third Stack View
        thridRow.addArrangedSubview(fourButton)
        thridRow.addArrangedSubview(fiveButton)
        thridRow.addArrangedSubview(sixButton)
        thridRow.addArrangedSubview(subtractButton)
        
        //Fourth Stack View
        fourthRow.addArrangedSubview(oneButton)
        fourthRow.addArrangedSubview(twoButton)
        fourthRow.addArrangedSubview(threeButton)
        fourthRow.addArrangedSubview(addButton)
        
        //Fith Stack View
        fithRow.addArrangedSubview(zeroButton)
        fithRow.addArrangedSubview(decimalButton)
        fithRow.addArrangedSubview(equalsButton)
        
        //King Of all Stack Views
        kingOfAllStackViews.addArrangedSubview(firstRow)
        kingOfAllStackViews.addArrangedSubview(secondRow)
        kingOfAllStackViews.addArrangedSubview(thridRow)
        kingOfAllStackViews.addArrangedSubview(fourthRow)
        kingOfAllStackViews.addArrangedSubview(fithRow)
        
    }
    
    func addAllConstraints() {
        displayTextField.anchor(top: self.view.topAnchor, bottom: nil, leading: self.safeArea.leadingAnchor, trailing: self.safeArea.trailingAnchor, paddingTop: 8, paddingBottom: 0, paddingLeft: 8, paddingRight: 8, width: nil, height: 50)
        
        kingOfAllStackViews.anchor(top: self.displayTextField.bottomAnchor, bottom: self.safeArea.bottomAnchor, leading: self.safeArea.leadingAnchor, trailing: self.safeArea.trailingAnchor, paddingTop: 8, paddingBottom: 0, paddingLeft: 0, paddingRight: 0)
    }
    
    func activateButtons() {
        buttons.forEach({ $0.addTarget(self, action: #selector(calculatorButtonPressed(_:)), for: .touchUpInside) })
    }
}
