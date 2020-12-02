//
//  RandomQuestionStrategy.swift
//  RabbleWabble
//
//  Created by TAM NGUYEN DUC on 12/2/20.
//

import Foundation
import GameplayKit.GKRandomSource

public class RandomQuestionStrategy: QuestionStrategy {
    // MARK: - Properties
    public var correctCount: Int = 0
    public var incorrectCount: Int = 0
    private var questionIndex = 0
    private let questionGroup: QuestionGroup
    private let questions : [Question]
    
    
    
    
    // MARK: - Object Life cycle
    public init(questionGroup: QuestionGroup) {
        self.questionGroup = questionGroup
        // get random questions
        let randomSource = GKRandomSource.sharedRandom()
        self.questions = randomSource.arrayByShufflingObjects(in: questionGroup.questions) as! [Question]
    }
    
    // MARK: - QuestionStrategy
    
    public var title: String {
        return questionGroup.title
    }
    
    
    public func advanceToNextQuesion() -> Bool {
        guard questionIndex + 1 < questionGroup.questions.count else { return false }
        questionIndex += 1
        return true
    }
    
    public func currentQuestion() -> Question {
        return questionGroup.questions[questionIndex]
    }
    
    public func markQuestionCorrect(_ question: Question) {
        correctCount += 1
    }
    
    public func markQuestionIncorrect(_ question: Question) {
        incorrectCount += 1
    }
    
    public func questionIndexTitle() -> String {
        return "\(questionIndex + 1)/" +
            "\(questionGroup.questions.count)"
    }
    
    
}
