//
//  ViewController.swift
//  Triviam
//
//  Created by Murat Baturay on 2018-06-04.
//  Copyright © 2018 Murat Baturay. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

/*
 Uses Open Trivia (https://opentdb.com) api for questions
*/

class ViewController: UIViewController {
    
    let URL         = "https://goo.gl/ntSciT"
    //let URL       = "https://opentdb.com/api.php?amount=10&category=9&type=boolean"
    var items       : [DataModel] = []
    var counter     : Int = 0
    var score       : Int = 0
    let localData   = Data()
    var networkFlag : Bool = false
    
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var constScoreLabel: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        roundButtons()
        
        if Reachability.isConnectedToNetwork() {
            networkFlag = true
            getQuestions(url: URL)
            questionLabel.text = "Fetching questions, please wait."
        } else {
            questionLabel.text = localData.questions[counter].question
        }
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
    }
    
    func roundButtons() {
        
        trueButton.layer.cornerRadius = 10
        trueButton.clipsToBounds = true
        falseButton.layer.cornerRadius = 10
        falseButton.clipsToBounds = true
        
    }

    func getQuestions(url: String) {
        
        Alamofire.request(url).responseJSON {
            response in
            if response.result.isSuccess {
                let json : JSON = JSON(response.result.value!)
                self.populateMyQuestionsArray(json: json)
            }
            else {
                print("Fail getting the JSON response (49)!")
            }
        }
        
    }
    
    func populateMyQuestionsArray (json : JSON) {
        
        for index in 0...9 {
            items.append(DataModel(
                question:       json["results"][index]["question"].stringValue,
                correct_answer: json["results"][index]["correct_answer"].stringValue))
        }
        setNextQuestion()
        
    }
    
    @IBAction func answerButton(_ sender: UIButton) {
    
        var answer : String
        sender.tag == 1 ? (answer = "True") : (answer = "False")
        checkAnswer(answer: answer)
        
    }
    
    func checkAnswer(answer: String) {
        
        let correct_answer : String
        
        networkFlag ? (correct_answer = items[counter].correct_answer) : (correct_answer = localData.questions[counter].correct_answer)
        
        if answer == correct_answer {
            score += 10
        }
        counter += 1
        setNextQuestion()
        
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        
        setNextQuestion()
        
    }
    
    func setNextQuestion() {
        
        if counter <= 9 {
            networkFlag ?
                (questionLabel.text = items[counter].question.htmlToString) : (questionLabel.text = localData.questions[counter].question)
        } else {
            let alert = UIAlertController(title: "Your score is \(score)", message: "Would you like to play again?", preferredStyle: .alert)
            let restart = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
                self.startOver()
            }
            alert.addAction(restart)
            present(alert, animated: true, completion: nil)
        }
        
    }
    
    func startOver() {
        
        counter = 0
        score   = 0
        setNextQuestion()
        viewDidLoad()
        
    }

}
/* End of Main */




/* E X T E N S I O N  to fix HTML formatted json */

extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data, options: [NSAttributedString.DocumentReadingOptionKey.documentType:  NSAttributedString.DocumentType.html], documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}
