//
//  Question.swift
//  PersonalityQuiz
//
//  Created by H.Namikawa on 2023/04/25.
//

import Foundation

struct Question {
  var text: String
  var type: ResponseType
  var answers: [Answer]
  
  
}

enum ResponseType {
  case single, multiple, ranged
}
