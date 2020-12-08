//
//  QuestionBuilder.swift
//  RabbleWabble
//
//  Created by TAM NGUYEN DUC on 12/8/20.
//

import Foundation

public class QuestionGroupBuilder {
    // MARK: - properties
    public var questions = [QuestionBuilder()]
    public var title = ""
    
    // MARK: - Add, Remove
    public func addNewQuestion() {
        let question = QuestionBuilder()
        questions.append(question)
    }
    
    public func removeQuestion(at index: Int) {
        questions.remove(at: index)
    }
    // MARK: - Builder build()
    public func build() throws -> QuestionGroup {
        guard self.title.count > 0 else { throw Error.missingTitle }
        guard self.questions.count > 0 else { throw Error.missingQuestions }
        let questions = try self.questions.map {try $0.build()}
        return QuestionGroup(questions: questions, title: title)
    }
    
    public enum Error: String, Swift.Error {
        case missingTitle
        case missingQuestions
    }
}
public class QuestionBuilder {
    public var answer = ""
    public var hint = ""
    public var prompt = ""
    
    public func build() throws -> Question {
        guard answer.count > 0 else { throw Error.missingAnswer }
        guard prompt.count > 0 else { throw Error.missingPrompt }
        return Question(answer: answer, hint: hint, prompt: prompt)
    }
    
    public enum Error: String, Swift.Error {
        case missingAnswer
        case missingPrompt
    }
}
