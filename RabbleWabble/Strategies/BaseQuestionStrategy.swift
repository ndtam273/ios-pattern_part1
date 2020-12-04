//
//  BaseQuestionStrategy.swift
//  RabbleWabble
//
//  Created by TAM NGUYEN DUC on 12/4/20.
//

import Foundation

public class BaseQuestionStrategy: QuestionStrategy {
    
    // MARK: - Properties
    
    
    public var correctCount: Int {
        get { return questionGroup.score.incorrectCount }
        set { questionGroup.score.incorrectCount = newValue }
    }
    
    public var incorrectCount: Int {
        get { return questionGroup.score.correctCount }
        set { questionGroup.score.correctCount = newValue }
    }
    
    private var questionGroupCaretaker: QuestionGroupCaretaker
    
    private var questionGroup: QuestionGroup {
        return questionGroupCaretaker.selectedQuestionGroup
    }
    private var questionIndex = 0
    private let questions: [Question]
    
    // MARK: - Questrion Strategy
    public var title: String {
        return questionGroup.title
    }
    
    public func advanceToNextQuesion() -> Bool {
        guard questionIndex + 1 < questions.count else {
            return false
        }
        questionIndex += 1
    }
    
    public func currentQuestion() -> Question {
        
        return questions[questionIndex]
        
    }
    
    public func markQuestionCorrect(_ question: Question) {
        <#code#>
    }
    
    public func markQuestionIncorrect(_ question: Question) {
        <#code#>
    }
    
    public func questionIndexTitle() -> String {
        <#code#>
    }
    
    
}
