//
//  ViewController.swift
//  Anzan
//
//  Created by NorihiroSunada on 2019/11/25.
//  Copyright © 2019 NorihiroSunada. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
	@IBOutlet weak var rightNumberLabel: UILabel!
	@IBOutlet weak var leftNumberLabel: UILabel!
	@IBOutlet weak var operatorLabel: UILabel!
	@IBOutlet weak var answerTextField: UITextField!
	
	var leftNumber: Int = 0
	var rightNumber: Int = 0
	var operatorIndex: Int = 0
	var correctNumber: Int = 0
	
	override func viewDidLoad() {
		super.viewDidLoad()
		answerTextField.delegate = self
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		initNumber()
	}
	
	@IBAction func checkAnswerButtonPressed(){
		performSegue(withIdentifier: "toResult", sender: nil)
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		let resultViewController = segue.destination as! ResultViewController
		resultViewController.userNumber = Int(answerTextField.text!)
		resultViewController.correctNumber = correctNumber
		
	}

	func initNumber(){
		answerTextField.text = ""
		leftNumber = Int.random(in: 1...999)
		leftNumberLabel.text = String(leftNumber)
		rightNumber = Int.random(in: 1...999)
		rightNumberLabel.text = String(rightNumber)
		operatorIndex = Int.random(in: 0...3)
		if operatorIndex == 0 {
			operatorLabel.text = "+"
			correctNumber = leftNumber + rightNumber
		}else if operatorIndex == 1 {
			operatorLabel.text = "-"
			correctNumber = leftNumber - rightNumber
		}else if operatorIndex == 1 {
			operatorLabel.text = "×"
			correctNumber = leftNumber * rightNumber
		}else if operatorIndex == 1 {
			operatorLabel.text = "÷"
			correctNumber = leftNumber / rightNumber
		}
	}
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		answerTextField.resignFirstResponder()
		return true
	}
}

