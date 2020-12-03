//
//  ViewController.swift
//  RabbleWabble
//
//  Created by TAM NGUYEN DUC on 12/1/20.
//

import UIKit

// MARK: - QuestionViewControllerDelegate
public protocol QuestionViewControllerDelegate: class {
    // didCancel
    func questionViewController(_ viewController: QuestionViewController, didCancel questionGroup: QuestionStrategy, at questionIndex: Int)
    
    // didComplete
    func questionViewController(_ viewController: QuestionViewController, didComplete questionGroup: QuestionStrategy)
}

public class QuestionViewController: UIViewController {
    // MARK: - Instance Properties
    
    public weak var delegate: QuestionViewControllerDelegate?
    
    public var questionStrategy: QuestionStrategy! {
        didSet {
            navigationItem.title = questionStrategy.title
        }
    }
    
    private lazy var questionIndexItem: UIBarButtonItem = {
        let item = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        item.tintColor = .black
        navigationItem.rightBarButtonItem = item
        return item
    }()
    public var questionIndex = 0
    public var correctCount = 0
    public var incorrectCount = 0
    
    // controller owns View
    public var questionView: QuestionView! {
        guard isViewLoaded else { return nil }
        return (view as! QuestionView)
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupCancelButton()
        showQuestion()
    }
    
    private func setupCancelButton() {
        let action = #selector(handleCancelPressed(sender:))
        let image = UIImage(named: "ic_menu")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: action)
    }
    
    @objc private func handleCancelPressed(sender: UIBarButtonItem) {
        delegate?.questionViewController(self, didCancel: questionStrategy, at: questionIndex)
    }
    private func showQuestion() {
        let question = questionStrategy.currentQuestion()
        print(questionStrategy!)
        print(question)
        
        questionView.answerLabel.text = question.answer
        questionView.promptLabel.text = question.prompt
        questionView.hintLabel.text = question.hint
        
        questionView.answerLabel.isHidden = true
        questionView.hintLabel.isHidden = true
        questionIndexItem.title = questionStrategy.questionIndexTitle()
    }
    
    // MARK: - Actions
    @IBAction func toggleAnswerLabels(_ sender: Any) { questionView.answerLabel.isHidden = !questionView.answerLabel.isHidden
        questionView.hintLabel.isHidden = !questionView.hintLabel.isHidden
        
    }
    
    // 1
    @IBAction func handleCorrect(_ sender: Any) {
        let question = questionStrategy.currentQuestion()
        questionStrategy.markQuestionCorrect(question)
        
        questionView.correctCountLabel.text = String(questionStrategy.correctCount)
        showNextQuestion()
    }
    // 2
    @IBAction func handleIncorrect(_ sender: Any) {
        let question = questionStrategy.currentQuestion()
        questionStrategy.markQuestionIncorrect(question)
        
        questionView.incorrectCountLabel.text = String(questionStrategy.incorrectCount)
        showNextQuestion()
    }
    // 3
    private func showNextQuestion() {
        questionIndex += 1
        guard questionStrategy.advanceToNextQuesion() else {
            // TODO: - Handle this...!
            delegate?.questionViewController(self, didComplete: questionStrategy)
            return
        }
        showQuestion()
    }
    
}

