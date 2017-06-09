//
//  ViewController.swift
//  my little 101
//
//  Created by Carsten Sandtner on 07.06.17.
//  Copyright © 2017 Appsbude. All rights reserved.
//

import UIKit
import GameKit

class ViewController: UIViewController {
    
    var challenge: Exercise!
    var resultButtons: [UIButton]!
    var actualScore: Int = 0
    var timer: Int = 0
    let timeoutForNewChallenge: Double = 1.0
    let exercisesBase: Int32 = 5
    
    @IBOutlet weak var challengeText: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var timerValue: UILabel!
    @IBOutlet weak var resultCandidate1: UIButton!
    @IBOutlet weak var resultCandidate2: UIButton!
    @IBOutlet weak var resultCandidate3: UIButton!
    @IBOutlet weak var resultCandidate4: UIButton!
    
    @IBAction func resultCandidateOneSelected(_ sender: Any) {
        checkResult(selectedButton: self.resultCandidate1)
    }

    @IBAction func resultCandidateTwoSelected(_ sender: Any) {
        checkResult(selectedButton: self.resultCandidate2)
    }
    
    @IBAction func resultCandidateThreeSelected(_ sender: Any) {
        checkResult(selectedButton: self.resultCandidate3)
    }
    
    @IBAction func resultCandidateFourSelected(_ sender: Any) {
        checkResult(selectedButton: self.resultCandidate4)
    }
    
    private func checkResult(selectedButton: UIButton) {
        if (self.challenge.checkSolution(candidate: Int32(selectedButton.currentTitle!)!)) {
            selectedButton.backgroundColor = UIColor.green
            self.actualScore += 10
        }
        else {
            selectedButton.backgroundColor = UIColor.red
        }
        
        // Defer creation of new Exercise
        DispatchQueue.main.asyncAfter(deadline: .now() + timeoutForNewChallenge) {
            self.updateScore()
            self.resetButtons()
            self.setExercise(base: self.exercisesBase)
        }
    }
    
    private func updateScore() {
            self.score.text = "\(self.actualScore)"
    }
    
    private func resetButtons() {
        for resultButton in resultButtons {
            resultButton.backgroundColor = UIColor.white
        }
    }
    
    private func setExercise(base: Int32) {
        self.challenge = Exercise(base: self.exercisesBase)
        challengeText.text = self.challenge.getNewChallenge()
        let solutions = self.challenge.getSolutionCandidates()
        let shuffled = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: solutions)
        
        for (index, resultButton) in resultButtons.enumerated() {
            resultButton.setTitle("\(shuffled[index])", for: .normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.resultButtons = [self.resultCandidate1,
                              self.resultCandidate2,
                              self.resultCandidate3,
                              self.resultCandidate4]
    
        self.setExercise(base: self.exercisesBase)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

