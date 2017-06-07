//
//  Exercise.swift
//  my little 101
//
//  Created by Carsten Sandtner on 07.06.17.
//  Copyright © 2017 Appsbude. All rights reserved.
//

import Foundation

class Exercise {
    
    private var base: Int32
    var actualSolution: Int32?
    
    init(base: Int32) {
        self.base = base
    }
    
    private func newEquation() -> String {
        let randomNumber = self.randRange(lower: 1, upper: 10)
        self.actualSolution = randomNumber * self.base
        
        return "\(randomNumber) * \(self.base)"
    }
    
    private func randRange (lower: Int32, upper: Int32) -> Int32 {
        return lower + Int32(arc4random_uniform(UInt32(upper - lower + 1)))
    }
    
    func setBase(base: Int32) {
        self.base = base
    }
    
    func getNewChallenge() -> String {
        return self.newEquation()
    }
    
    func checkSolution(candidate: Int32) -> Bool {
        return (candidate == self.actualSolution)
    }
    
    func getSolutionCandidates() -> [Int32] {
        return [
            self.actualSolution!,
            self.actualSolution! + self.base,
            self.actualSolution! + self.randRange(lower: 1, upper: 10),
            self.actualSolution! - self.randRange(lower: 1, upper: 10)
        ]
    }
}
