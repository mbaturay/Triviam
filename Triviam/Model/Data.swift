//
//  Data.swift
//  Triviam
//
//  Created by Murat Baturay on 2018-06-05.
//  Copyright © 2018 Murat Baturay. All rights reserved.
//

import Foundation

class Data {
    
    var questions = [DataModel]()
    
    init() {
        questions.append(
            DataModel(
                question: "There is 4 members of The Beatles",
                correct_answer: "True"))
        
        questions.append(
            DataModel(
                question: "Ringo Starr's real name is Richard Stuart",
                correct_answer: "False"))
        
        questions.append(
            DataModel(
                question: "Paul's middle name is Paul",
                correct_answer: "True"))
        
        questions.append(
            DataModel(
                question: "John was married twice",
                correct_answer: "True"))
        
        questions.append(
            DataModel(
                question: "Paul is a vegetarian",
                correct_answer: "True"))
        
        questions.append(
            DataModel(
                question: "Paul had a sheepdog",
                correct_answer: "True"))
        
        questions.append(
            DataModel(
                question: "Brain Epstein was John's best man",
                correct_answer: "True"))
        
        questions.append(
            DataModel(
                question: "George was never married",
                correct_answer: "False"))
        
        questions.append(
            DataModel(
                question: "John has 5 children",
                correct_answer: "False"))
        
        questions.append(
            DataModel(
                question: "Paul's first name is James",
                correct_answer: "True"))
    }
}
