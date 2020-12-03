//
//  AppSettings.swift
//  RabbleWabble
//
//  Created by TAM NGUYEN DUC on 12/3/20.
//

import Foundation

public class AppSettings {
    
    // MARK: - Keys
    private struct Keys {
        static let questionStrategy = "questionStrategy"
    }
    // MARK: - Instance properties
    private let userDefaults = UserDefaults.standard
    public var questionStrategyType: QuestrionStrategyType {
        get {
            let rawValue = userDefaults.integer(forKey: Keys.questionStrategy)
            return QuestrionStrategyType(rawValue: rawValue)!
        } set {
            userDefaults.set(newValue.rawValue, forKey: Keys.questionStrategy)
        }
    }
    // MARK: - Instance Methods
    public func questionStrategy(for questionGroup: QuestionGroup) -> QuestionStrategy {
        return questionStrategyType.questionStrategy(for: questionGroup)
    }
    
    // MARK: - Static properties
    public static let shared = AppSettings()
    
    // MARK: - Object Lifecycle
    private init() {}
}

// MARK: - QuestionStrategyType
public enum QuestrionStrategyType: Int, CaseIterable {
    case random
    case sequential
    
    // MARK: - Instance methods
    public func title() -> String {
        switch self {
        case .random:
            return "Random"
        case .sequential:
            return "Sequential"
        }
    }
    
    public func questionStrategy(for questionGroup: QuestionGroup) -> QuestionStrategy {
        switch  self {
        case .random:
            return RandomQuestionStrategy(questionGroup: questionGroup)
        case .sequential:
            return SequentialQuestionStrategy(questionGroup: questionGroup)
        }
    }
}
