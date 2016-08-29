//
//  ViewController.swift
//  StyleAdvisor
//
//  Created by Stephanie Lee on 12/1/15.
//  Copyright © 2015 Team4. All rights reserved.
//

import UIKit

class ViewController : UIViewController {
    
    var styleAdvisor = StyleAdvisor()
    var language = Language.None
    var gender = Gender.None
    let preferredLanguages: [String] = NSLocale.preferredLanguages() as [String]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let systemLanguage = preferredLanguages[0]
        var languageArrary = systemLanguage.componentsSeparatedByString("-")
        let languageCode = languageArrary[0]
        
        if (gender == Gender.Male) {
            if (languageCode == "es") {
                styleAdvisor.initializeChicoQuestions()
            }
            else {
                styleAdvisor.initializeMaleQuestions()
            }
        }
        else if (gender == Gender.Female) {
            if (languageCode == "es") {
                styleAdvisor.initializeChicaQuestions()
            }
            else {
                styleAdvisor.initializeFemaleQuestions()
            }
        }
        
        if (languageCode == "es") {
            resetButton.setTitle("Atrás", forState: UIControlState.Normal)
            backButton.setTitle("Reiniciar", forState: UIControlState.Normal)
        }
        
        loadQuestion(styleAdvisor.getCurrentQuestion())
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var questionNumber: UILabel!
    @IBOutlet weak var questionText: UILabel!
    
    @IBOutlet weak var nikeButton: UIButton!
    @IBOutlet weak var hmButton: UIButton!
    @IBOutlet weak var jcrewButton: UIButton!
    @IBOutlet weak var brooksButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    @IBAction func IncreaseNike(sender: UIButton) {
        styleAdvisor.increaseNike()
        if !checkFinished() {
            loadNextQuestion()
        }
    }
    
    @IBAction func IncreaseHM(sender: UIButton) {
        styleAdvisor.increaseHm()
        styleAdvisor.increaseNike()
        if !checkFinished() {
            loadNextQuestion()
        }
    }
    
    @IBAction func IncreaseJcrew(sender: UIButton) {
        styleAdvisor.increaseJcrew()
        styleAdvisor.increaseHm()
        styleAdvisor.increaseNike()
        if !checkFinished() {
            loadNextQuestion()
        }
    }
    
    @IBAction func IncreaseBrooksBrothers(sender: UIButton) {
        styleAdvisor.increaseBrooksBrothers()
        styleAdvisor.increaseJcrew()
        styleAdvisor.increaseHm()
        styleAdvisor.increaseNike()
        if !checkFinished() {
            loadNextQuestion()
        }
    }
    
    @IBAction func Reset(sender: UIButton) {
        styleAdvisor.reset()
        backButton.enabled = true;
    }
    
    @IBAction func LoadPreviousQuestion(sender: UIButton) {
        loadPreviousQuestion()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "Reset") {
            styleAdvisor.reset()
            backButton.enabled = true;
        }
    }
    
    private func loadPreviousQuestion () {
        styleAdvisor.previousQuestion()
        loadQuestion(styleAdvisor.getCurrentQuestion())
    }
    
    private func loadNextQuestion () {
        styleAdvisor.nextQuestion()
        loadQuestion(styleAdvisor.getCurrentQuestion())
    }
    
    private func loadQuestion (question : Question) {
        questionNumber.text = String(question.questionNumber)
        questionText.text = question.questionText
        
        nikeButton.setTitle(question.answers[0], forState: UIControlState.Normal)
        hmButton.setTitle(question.answers[1], forState: UIControlState.Normal)
        jcrewButton.setTitle(question.answers[2], forState: UIControlState.Normal)
        brooksButton.setTitle(question.answers[3], forState: UIControlState.Normal)
    }
    
    private func checkFinished () -> Bool {
        let finalStore : String = styleAdvisor.checkFinished()
        
        if finalStore != "No Store" {
            styleAdvisor.questions[7].questionText = finalStore
            loadQuestion(styleAdvisor.questions[7])
            backButton.enabled = false;
            return true;
        }
        return false;
    }
    
}

