//
//  TriviaViewController.swift
//  Trivia
//
//  Created by Tal Assaf on 3/13/25.
//

import UIKit

class TriviaViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        loadQuestion()

        @IBOutlet weak var questionLabel: UILabel!
           @IBOutlet weak var choice1Button: UIButton!
           @IBOutlet weak var choice2Button: UIButton!
           @IBOutlet weak var choice3Button: UIButton!
           @IBOutlet weak var choice4Button: UIButton!
           @IBOutlet weak var nextButton: UIButton!

        @IBAction func answerSelected(_ sender: UIButton) {
            let currentQuestion = questions[currentQuestionIndex]

            if sender.currentTitle == currentQuestion.correctAnswer {
                sender.backgroundColor = .green  // Correct answer
            } else {
                sender.backgroundColor = .red  // Incorrect answer
            }

            nextButton.isHidden = false  // Show "Next" button after selecting an answer
        }

        @IBAction func nextQuestion(_ sender: UIButton) {
            currentQuestionIndex += 1
            
            if currentQuestionIndex < questions.count {
                loadQuestion()
            } else {
                questionLabel.text = "Game Over!"
                choice1Button.isHidden = true
                choice2Button.isHidden = true
                choice3Button.isHidden = true
                choice4Button.isHidden = true
                nextButton


        // Do any additional setup after loading the view.
    }
    var questions: [Question] = [
        Question(text: "What is the capital of Japan?", choices: ["Seoul", "Tokyo", "Beijing", "Bangkok"], correctAnswer: "Tokyo"),
        Question(text: "Who wrote 'Romeo and Juliet'?", choices: ["Charles Dickens", "Mark Twain", "William Shakespeare", "Jane Austen"], correctAnswer: "William Shakespeare"),
        Question(text: "Which planet is known as the 'Giant Red Spot' planet?", choices: ["Mars", "Jupiter", "Saturn", "Neptune"], correctAnswer: "Jupiter")
    ]

    var currentQuestionIndex = 0
    
    func loadQuestion() {
        let currentQuestion = questions[currentQuestionIndex]
        questionLabel.text = currentQuestion.text
        choice1Button.setTitle(currentQuestion.choices[0], for: .normal)
        choice2Button.setTitle(currentQuestion.choices[1], for: .normal)
        choice3Button.setTitle(currentQuestion.choices[2], for: .normal)
        choice4Button.setTitle(currentQuestion.choices[3], for: .normal)
        
        nextButton.isHidden = true  // Hide "Next" button until user selects an answer
        
        // Reset button colors
        choice1Button.backgroundColor = .systemGray5
        choice2Button.backgroundColor = .systemGray5
        choice3Button.backgroundColor = .systemGray5
        choice4Button.backgroundColor = .systemGray5
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
