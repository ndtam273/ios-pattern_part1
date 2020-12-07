//
//  SequentialQuestionStrategy.swift
//  RabbleWabble
//
//  Created by TAM NGUYEN DUC on 12/2/20.
//

import Foundation

public class SequentialQuestionStrategy: BaseQuestionStrategy {
    
    public convenience init(questionGroupCaretaker: QuestionGroupCaretaker) {
        let questionGroup = questionGroupCaretaker.selectedQuestionGroup!
        let questions = questionGroup.questions
        self.init(questionGroupCaretaker: questionGroupCaretaker, questions: questions)
    }
    
    
}
