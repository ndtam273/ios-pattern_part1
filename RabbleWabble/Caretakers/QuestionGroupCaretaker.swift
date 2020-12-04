//
//  QuestionGroupCaretaker.swift
//  RabbleWabble
//
//  Created by TAM NGUYEN DUC on 12/4/20.
//

import Foundation

public final class QuestionGroupCaretaker {
    // MARK: - Properties
    private let fileName = "QuestionGroupData"
    public var questionGroups : [QuestionGroup] = []
    public var selectedQuestionGroup: QuestionGroup!
    
    // MARK: - Object Lifecycle
    public init() {
        loadQuestionGroups()
    }
    
    private func loadQuestionGroups() {
        if let questionGroups = try? DiskCareTaker.retrieve([QuestionGroup].self, from: fileName) {
            self.questionGroups = questionGroups
        } else {
            let bundle = Bundle.main
            let url = bundle.url(forResource: fileName, withExtension: "json")!
            self.questionGroups = try! DiskCareTaker.retrieve([QuestionGroup].self, from: url)
            // save to document directory
            try! save()
        }
    }
    
    // MARK: - Instance method
    public func save() throws  {
        try DiskCareTaker.save(questionGroups, to: fileName)
    }
}
