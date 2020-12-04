//
//  QuestionGroup.swift
//  RabbleWabble
//
//  Created by TAM NGUYEN DUC on 12/1/20.
//

import Foundation

public class QuestionGroup: Codable {
    public class Score: Codable {
        public var correctCount: Int = 0
        public var incorrectCount: Int = 0
        public init() {}
    }
    public var score: Score
    public let questions: [Question]
    public let title: String
    
    public init(questions: [Question], score: Score = Score(), title: String)
    {
        self.questions = questions
        self.score = score
        self.title = title
    }
}


