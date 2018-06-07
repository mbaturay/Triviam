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
                question: "E.T. (Extraterrestrial) was the highest grossing film of the decade?",
                correct_answer: "True"))
        
        questions.append(
            DataModel(
                question: "Die Hard was Alan Rickman’s first feature film role?",
                correct_answer: "True"))
        
        questions.append(
            DataModel(
                question: "Hello, my name is Inigo Montoya. You killed my father. Prepare to die! --Sleeping Beauty",
                correct_answer: "False"))
        
        questions.append(
            DataModel(
                question: "Die Hard was Alan Rickman’s first feature film role?",
                correct_answer: "True"))
        
        questions.append(
            DataModel(
                question: "Die Hard was Alan Rickman’s first feature film role?",
                correct_answer: "True"))
        
        questions.append(
            DataModel(
                question: "Die Hard was Alan Rickman’s first feature film role?",
                correct_answer: "True"))
        
        questions.append(
            DataModel(
                question: "Die Hard was Alan Rickman’s first feature film role?",
                correct_answer: "True"))
        
        questions.append(
            DataModel(
                question: "Die Hard was Alan Rickman’s first feature film role?",
                correct_answer: "True"))
    }
}
