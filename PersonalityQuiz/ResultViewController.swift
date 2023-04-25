//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by H.Namikawa on 2023/04/24.
//

import UIKit

class ResultViewController: UIViewController {
  
  var responses: [Answer]
  
  
  @IBOutlet var resultAnswerLabel: UILabel!
  @IBOutlet var resultDefinitionLabel: UILabel!
  
  init?(coder:NSCoder, responses: [Answer]){
    self.responses = responses
    super.init(coder: coder)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.hidesBackButton = true
    calculatePersonalityResult()
  }
  
  func calculatePersonalityResult(){
    let frequencyOfAnswers = responses.reduce(into: [AnimalType:Int]()) {(counts, answer) in

      if let existingCount = counts[answer.type] {
        counts[answer.type] = existingCount + 1
      } else {
        counts[answer.type] = 1
      }
    }
    
    let frequentAnswersSorted = frequencyOfAnswers.sorted(by:
    { (pair1, pair2) in
        return pair1.value > pair2.value
    })
    let mostCommonAnswer = frequencyOfAnswers.sorted { $0.1 >
       $1.1 }.first!.key
    
    resultAnswerLabel.text = "You are a \(mostCommonAnswer.rawValue)!"
    resultDefinitionLabel.text = mostCommonAnswer.definition
  }
  
}
