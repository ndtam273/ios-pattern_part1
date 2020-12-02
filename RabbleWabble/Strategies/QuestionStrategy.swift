//
//  QuestionStrategy.swift
//  RabbleWabble
//
//  Created by TAM NGUYEN DUC on 12/2/20.
//

import Foundation

public protocol QuestionStrategy: class {
    // group name
    var title: String { get }
    
    // count
    var correctCount: Int { get }
    var incorrectCount: Int { get }
    
    // is next question available ?
    func advanceToNextQuesion() -> Bool
    
    // get current question
    func currentQuestion() -> Question
    
    // mark question correct, incorrect
    func markQuestionCorrect(_ question: Question)
    func markQuestionIncorrect(_ question: Question)
    
    // get question title (order)
    func questionIndexTitle() -> String
}
