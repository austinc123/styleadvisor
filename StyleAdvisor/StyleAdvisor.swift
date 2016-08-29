//
//  StyleAdvisor.swift
//  StyleAdvisor
//
//  Created by Stephanie Lee on 12/1/15.
//  Copyright © 2015 Team4. All rights reserved.
//

import Foundation
import UIKit

class Question {
    var questionNumber : String = ""
    var questionText : String = ""
    var answers = [String]()
    
    func AddAnswers (answerText : String) {
        answers.append(answerText)
    }
}

enum Language {
    case English
    case Spanish
    case None
}

enum Gender {
    case Male
    case Female
    case None
}

class StyleAdvisor {
    
    var nikeScore = 0
    var hmScore = 0
    var jcrewScore = 0
    var brooksBrothersScore = 0
    var questions = [Question]()
    var currentQuestion = 0;
    var maxNumberQuestions = 7;
    var lastQuestion = "";
    
    func increaseNike () {
        if (currentQuestion == 0) {
            nikeScore += 10
        }
        else {
            nikeScore++
        }
        lastQuestion = "nike"
    }
    
    func increaseJcrew () {
        if(currentQuestion == 0) {
            jcrewScore += 10
        }
        jcrewScore++
        lastQuestion = "jcrew"
    }
    
    
    func increaseHm () {
        if(currentQuestion == 0) {
            hmScore += 10
        }
        hmScore++
        lastQuestion = "hm"
    }
    
    func increaseBrooksBrothers() {
        if(currentQuestion == 0) {
            brooksBrothersScore += 10
        }
        brooksBrothersScore++
        lastQuestion = "brooksBrothers"
    }
    
    func reset() {
        nikeScore = 0
        hmScore = 0
        jcrewScore = 0
        brooksBrothersScore = 0
        currentQuestion = 0
    }
    
    init () {
        reset()
    }
    
    func getCurrentQuestion() -> Question {
        print(currentQuestion)
        return questions[currentQuestion]
    }
    
    func nextQuestion() {
        currentQuestion++
    }
    
    func previousQuestion() {
        if (currentQuestion > 0) {
            currentQuestion--
            if(lastQuestion == "nike") {
                nikeScore--
            } else if(lastQuestion == "jcrew") {
                jcrewScore--
            } else if(lastQuestion == "hm") {
                hmScore--
            }
            else if(lastQuestion == "brooksBrothers") {
                brooksBrothersScore--
            }
        }
    }
    
    private func calculateAnswer() -> String {
        //TODO: Find max score and return Name
        let finalistOne = max(nikeScore, jcrewScore)
        let finalistTwo = max(hmScore, brooksBrothersScore)
        let currentMax = max(finalistOne, finalistTwo)
        var finalStore = ""
        
        //if hm is highest
        if hmScore == currentMax {
            finalStore = "H&M"
            currentQuestion++
        }
        //if jcrew is highest
        if jcrewScore == currentMax {
            finalStore = "JCrew"
            currentQuestion++
        }
        
        //if brooks is highest
        if brooksBrothersScore == currentMax {
            finalStore = "Brooks Brothers"
            currentQuestion++
        }
        
        //if nike is highest
        if nikeScore == currentMax {
            finalStore = "Nike"
            currentQuestion++
        }
        
        return finalStore
    }
    
    func checkFinished() -> String {
        if (currentQuestion + 1 >= maxNumberQuestions) {
            return calculateAnswer()
        }
        else {
            return "No Store"
        }
    }
    
    private func AddQuestion(question : Question) {
        questions.append(question)
    }
    
    func initializeChicaQuestions () {
        questions.removeAll()
        
        //Question 1
        let question1 = Question()
        
        question1.questionNumber = "01"
        question1.questionText = "Presupuesto"
        
        question1.AddAnswers("$10 - $49")
        question1.AddAnswers("$50 - $99")
        question1.AddAnswers("$100 - $199")
        question1.AddAnswers("$200 - $500")
        
        AddQuestion(question1)
        
        //Question 2
        let question2 = Question()
        
        question2.questionNumber = "02"
        question2.questionText = "Pantalones"
        
        question2.AddAnswers("Pantalones Deportivos")
        question2.AddAnswers("Jeans")
        question2.AddAnswers("Vestido")
        question2.AddAnswers("Pantalones de vestir")
        
        AddQuestion(question2)
        
        
        //Question 3
        let question3 = Question()
        
        question3.questionNumber = "03"
        question3.questionText = "Camisas"
        
        question3.AddAnswers("Camiseta")
        question3.AddAnswers("Camisetas de Manga Larga")
        question3.AddAnswers("Tubo")
        question3.AddAnswers("Camisa de Vestir")
        
        AddQuestion(question3)
        
        //Question 4
        let question4 = Question()
        
        question4.questionNumber = "04"
        question4.questionText = "Ropa de Calle"

        question4.AddAnswers("Capucha")
        question4.AddAnswers("Jerséis")
        question4.AddAnswers("Abrigos de Lana")
        question4.AddAnswers("Gabardinas")
        
        AddQuestion(question4)
        
        //Question 5
        let question5 = Question()
        
        question5.questionNumber = "05"
        question5.questionText = "Los Accesorios"
        
        question5.AddAnswers("Venda")
        question5.AddAnswers("Pequeño Collar")
        question5.AddAnswers("Pendiente / Pulseras")
        question5.AddAnswers("Collares Declaración")
        
        AddQuestion(question5)
        
        //Question 6
        let question6 = Question()
        
        question6.questionNumber = "06"
        question6.questionText = "Zapatos"
        
        question6.AddAnswers("Zapatos Para Correr")
        question6.AddAnswers("Zapatillas")
        question6.AddAnswers("Mocasines")
        question6.AddAnswers("Tacones Altos")
        
        AddQuestion(question6)
        
        //Question 7
        let question7 = Question()
        
        question7.questionNumber = "07"
        question7.questionText = "Pasatiempo"
        
        question7.AddAnswers("Deportes")
        question7.AddAnswers("Ir De Compras")
        question7.AddAnswers("Familia")
        question7.AddAnswers("Trabajar")
        
        AddQuestion(question7)
        
        //Question 8
        let question8 = Question()
        
        question8.questionNumber = "08"
        question8.questionText = ""
        
        question8.AddAnswers("")
        question8.AddAnswers("")
        question8.AddAnswers("")
        question8.AddAnswers("")
        
        AddQuestion(question8)
        
    }
    
    //initialize quiz questions
    func initializeChicoQuestions () {
        questions.removeAll()
        
        //Question 1
        let question1 = Question()
        
        question1.questionNumber = "01"
        question1.questionText = "Presupuesto"
        
        question1.AddAnswers("$10 - $49")
        question1.AddAnswers("$50 - $99")
        question1.AddAnswers("$100 - $199")
        question1.AddAnswers("$200 - $500")
        
        AddQuestion(question1)
        
        //Question 2
        let question2 = Question()
        
        question2.questionNumber = "02"
        question2.questionText = "Pantalones"
        
        question2.AddAnswers("Pantalones Deportivos")
        question2.AddAnswers("Jeans")
        question2.AddAnswers("Pantalón")
        question2.AddAnswers("Pantalones de Vestir")
        
        AddQuestion(question2)
        
        
        //Question 3
        let question3 = Question()
        
        question3.questionNumber = "03"
        question3.questionText = "Camisas"
        
        question3.AddAnswers("Camiseta")
        question3.AddAnswers("Sudadera")
        question3.AddAnswers("Polos")
        question3.AddAnswers("Camisa de Vestir")
        
        AddQuestion(question3)
        
        //Question 4
        let question4 = Question()
        
        question4.questionNumber = "04"
        question4.questionText = "Chaqueta"
        
        question4.AddAnswers("Sudadera con Capucha")
        question4.AddAnswers("Anorak")
        question4.AddAnswers("Abrigo")
        question4.AddAnswers("Chaquetón")
        
        AddQuestion(question4)
        
        //Question 5
        let question5 = Question()
        
        question5.questionNumber = "05"
        question5.questionText = "Accessorios"
        
        question5.AddAnswers("Gora de Béisbol")
        question5.AddAnswers("Pulsera")
        question5.AddAnswers("Reloj")
        question5.AddAnswers("Pañuelo de Bolsillo")
        
        AddQuestion(question5)
        
        //Question 6
        let question6 = Question()
        
        question6.questionNumber = "06"
        question6.questionText = "Zapatos"
        
        question6.AddAnswers("Zapatos para Correr")
        question6.AddAnswers("Zapatillas")
        question6.AddAnswers("Botas")
        question6.AddAnswers("Oxfords")
        
        AddQuestion(question6)
        
        //Question 7
        let question7 = Question()
        
        question7.questionNumber = "07"
        question7.questionText = "Pasatiempo"
        
        question7.AddAnswers("Deportes")
        question7.AddAnswers("Pasar el Rato con Amigos")
        question7.AddAnswers("Familia")
        question7.AddAnswers("Trabajar")
        
        AddQuestion(question7)
        
        //Question 8
        let question8 = Question()
        
        question8.questionNumber = "08"
        question8.questionText = ""
        
        question8.AddAnswers("")
        question8.AddAnswers("")
        question8.AddAnswers("")
        question8.AddAnswers("")
        
        AddQuestion(question8)
        
    }

func initializeFemaleQuestions () {
    questions.removeAll()
    
    //Question 1
    let question1 = Question()
    
    question1.questionNumber = "01"
    question1.questionText = "Budget"
    
    question1.AddAnswers("$10 - $49")
    question1.AddAnswers("$50 - $99")
    question1.AddAnswers("$100 - $199")
    question1.AddAnswers("$200 - $500")
    
    AddQuestion(question1)
    
    //Question 2
    let question2 = Question()
    
    question2.questionNumber = "02"
    question2.questionText = "Bottoms"
    
    question2.AddAnswers("Sweatpants")
    question2.AddAnswers("Jeans")
    question2.AddAnswers("Dress")
    question2.AddAnswers("Dress Pants")
    
    AddQuestion(question2)
    
    
    //Question 3
    let question3 = Question()
    
    question3.questionNumber = "03"
    question3.questionText = "Tops"
    
    question3.AddAnswers("Tank Tops")
    question3.AddAnswers("Long-sleeve Tee")
    question3.AddAnswers("Sleeveless Top")
    question3.AddAnswers("Dress Shirt")
    
    AddQuestion(question3)
    
    //Question 4
    let question4 = Question()
    
    question4.questionNumber = "04"
    question4.questionText = "Outer Wear"
    
    question4.AddAnswers("Hoodie")
    question4.AddAnswers("Sweaters")
    question4.AddAnswers("Blouse+ Jacket")
    question4.AddAnswers("Trenchcoats")
    
    AddQuestion(question4)
    
    //Question 5
    let question5 = Question()
    
    question5.questionNumber = "05"
    question5.questionText = "Accessories"
    
    question5.AddAnswers("Beanie")
    question5.AddAnswers("Small necklace")
    question5.AddAnswers("Earring/Bracelets")
    question5.AddAnswers("Statement Necklaces")
    
    AddQuestion(question5)
    
    //Question 6
    let question6 = Question()
    
    question6.questionNumber = "06"
    question6.questionText = "Shoes"
    
    question6.AddAnswers("Running Shoes")
    question6.AddAnswers("Sneakers")
    question6.AddAnswers("Boots")
    question6.AddAnswers("High Heels")
    
    AddQuestion(question6)
    
    //Question 7
    let question7 = Question()
    
    question7.questionNumber = "07"
    question7.questionText = "Hobby"
    
    question7.AddAnswers("Sports")
    question7.AddAnswers("Hangout/Shop")
    question7.AddAnswers("Family")
    question7.AddAnswers("Business/Corporation")
    
    AddQuestion(question7)
    
    //Question 8
    let question8 = Question()
    
    question8.questionNumber = "08"
    question8.questionText = ""
    
    question8.AddAnswers("")
    question8.AddAnswers("")
    question8.AddAnswers("")
    question8.AddAnswers("")
    
    AddQuestion(question8)
    
}

//initialize quiz questions
func initializeMaleQuestions () {
    questions.removeAll()
    
    //Question 1
    let question1 = Question()
    
    question1.questionNumber = "01"
    question1.questionText = "Budget"
    
    question1.AddAnswers("$10 - $49")
    question1.AddAnswers("$50 - $99")
    question1.AddAnswers("$100 - $199")
    question1.AddAnswers("$200 - $500")
    
    AddQuestion(question1)
    
    //Question 2
    let question2 = Question()
    
    question2.questionNumber = "02"
    question2.questionText = "Bottoms"
    
    question2.AddAnswers("Sweatpants")
    question2.AddAnswers("Jeans")
    question2.AddAnswers("Khakis")
    question2.AddAnswers("Dress Pants")
    
    AddQuestion(question2)
    
    
    //Question 3
    let question3 = Question()
    
    question3.questionNumber = "03"
    question3.questionText = "Tops"
    
    question3.AddAnswers("Graphic Tee")
    question3.AddAnswers("Cotton Tee")
    question3.AddAnswers("Polo Shirt")
    question3.AddAnswers("Dress Shirt")
    
    AddQuestion(question3)
    
    //Question 4
    let question4 = Question()
    
    question4.questionNumber = "04"
    question4.questionText = "Outer Wear"
    
    question4.AddAnswers("Hoodie")
    question4.AddAnswers("Sweaters")
    question4.AddAnswers("Peacoat")
    question4.AddAnswers("Blazer")
    
    AddQuestion(question4)
    
    //Question 5
    let question5 = Question()
    
    question5.questionNumber = "05"
    question5.questionText = "Accessories"
    
    question5.AddAnswers("Baseball Cap")
    question5.AddAnswers("Bracelet")
    question5.AddAnswers("Watches")
    question5.AddAnswers("Pocket Square")
    
    AddQuestion(question5)
    
    //Question 6
    let question6 = Question()
    
    question6.questionNumber = "06"
    question6.questionText = "Shoes"
    
    question6.AddAnswers("Running Shoes")
    question6.AddAnswers("Sneakers")
    question6.AddAnswers("Chukkas/Desert Boots")
    question6.AddAnswers("Oxfords")
    
    AddQuestion(question6)
    
    //Question 7
    let question7 = Question()
    
    question7.questionNumber = "07"
    question7.questionText = "Hobby"
    
    question7.AddAnswers("Sports")
    question7.AddAnswers("Hangout/Chill")
    question7.AddAnswers("Family")
    question7.AddAnswers("Business/Corporation")
    
    AddQuestion(question7)
    
    //Question 8
    let question8 = Question()
    
    question8.questionNumber = "08"
    question8.questionText = ""
    
    question8.AddAnswers("")
    question8.AddAnswers("")
    question8.AddAnswers("")
    question8.AddAnswers("")
    
    AddQuestion(question8)
    
}
}

