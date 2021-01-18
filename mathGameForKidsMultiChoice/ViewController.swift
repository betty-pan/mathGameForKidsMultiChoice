//
//  ViewController.swift
//  mathGameForKidsMultiChoice
//
//  Created by Betty Pan on 2021/1/18.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var num1Label: UILabel!
    @IBOutlet weak var num2Label: UILabel!
    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var numOfQuestionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var multiChoiceBtns: [UIButton]!
    
    @IBOutlet weak var multiChoiceView: UIView!
    @IBOutlet weak var resultView: UIView!
    @IBOutlet weak var resultScoreLabel: UILabel!
    @IBOutlet weak var resultDescriptionLabel: UILabel!
    
    
    var num1 = 0
    var num2 = 0
    var doubleNum = 0
    var symbolsArray = ["➕", "➖", "✖️", "➗"]
    var options:[Int] = []
    var option1 = 0
    var option2 = 0
    var ans = 0
    var index = 1
    var score = 0
    var highestScore = 0
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        randomQuestion()
        numOfQuestionLabel.text = "Question \(index)"
        resultView.isHidden = true
    }
    
    func randomQuestion() {
        symbolsArray.shuffle()
        option1 = Int.random(in: 1...99)
        option2 = Int.random(in: 1...99)
        options = [option1,option2]
        
        if symbolsArray[0] == "➕" {
            symbolLabel.text = symbolsArray[0]
            num1 = Int.random(in: 1...9)
            num2 = Int.random(in: 1...90)
            ans = num1 + num2
        }else if symbolsArray[1] == "➖" {
            symbolLabel.text = symbolsArray[1]
            num1 = Int.random(in: 10...99)
            num2 = Int.random(in: 1...9)
            ans = num1 - num2
        }else if symbolsArray[2] == "✖️" {
            symbolLabel.text = symbolsArray[2]
            num1 = Int.random(in: 1...9)
            num2 = Int.random(in: 1...9)
            ans = num1 * num2
        }else if symbolsArray[3] == "➗" {
            symbolLabel.text = symbolsArray[3]
            num2 = Int.random(in: 1...9)
            //避免有餘數
            doubleNum = Int.random(in: 1...9)
            num1 = num2 * doubleNum
            ans = num1 / num2
        }
        
        options.append(ans)
        
        options.shuffle()
        //顯示選擇題選項
        for i in 0...2 {
            multiChoiceBtns[i].setTitle(String(options[i]), for: .normal)
        }
        num1Label.text = "\(num1)"
        num2Label.text = "\(num2)"
    }
    
    @IBAction func selectAnswer(_ sender: UIButton) {
        index = index + 1
        numOfQuestionLabel.text = "Question \(index)"
        
        if sender.currentTitle == String(ans) {
            score = score + 10
        }
        
        if index == 11 {
            index = 10
            multiChoiceView.isHidden = true
            resultView.isHidden = false
            resultScoreLabel.text = "\(score)"
            numOfQuestionLabel.text = ""
            if score <= 50 {
                resultDescriptionLabel.text = "GOOD!"
            }else if score <= 70 {
                resultDescriptionLabel.text = "WELDONE!!"
            }else if score <= 90 {
                resultDescriptionLabel.text = "AWESOME!!!"
            }else{
                resultDescriptionLabel.text = "YOU ROCK!!!!"
            }
        }
        
        randomQuestion()
        print(ans)
        scoreLabel.text = "\(score)"
    }
    
    @IBAction func playAgain(_ sender: Any) {
        index = 1
        score = 0
        randomQuestion()
        resultView.isHidden = true
        multiChoiceView.isHidden = false
        numOfQuestionLabel.text = "Question \(index)"
        scoreLabel.text = "Score"
        
    }
    
    

}

