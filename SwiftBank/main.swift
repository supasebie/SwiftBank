//
//  main.swift
//  SwiftBank
//
//  Created by Sebastian on 5/18/24.
//

import Foundation

struct SwiftBank {
    private let password: String
    private var balance: Double = 0 {
        didSet {
            if(self.balance < 100) {
                displayLowBalanceMessage()
            }
        }
    }
    
    static let depositBonusRate: Double = 0.01
    
    init(password: String, initialDeposit: Double = 0) {
        self.password = password
        makeDeposit(initialDeposit)
    }
    
    private func isValid(_ enteredPassword: String) -> Bool {
        return (enteredPassword == password ? true : false)
    }
    
    private func finalDepositWithBonus(_ deposit: Double) -> Double {
        return deposit + (deposit * SwiftBank.depositBonusRate)
    }
    
    public mutating func makeDeposit(_ depositAmount: Double) -> Void {
        let depositWithBonus = finalDepositWithBonus(depositAmount)
        print("Making a deposit of \(depositAmount) with a bonus rate. The final amount deposited is \(depositWithBonus).")
        balance += depositWithBonus
    }
    
    public func displayBalance(_ password: String) -> Void {
        if isValid(password) {
            print("Your current balance is \(self.balance)")
            return
        }
        print("Unauthorized!")
    }
    
    public mutating func makeWithdrawal(_ amount: Double, _ password: String) -> Void {
        if isValid(password) {
            self.balance -= amount
            print("Making a $\(amount) withdrawal")
            print("Your remaining balance is $\(self.balance)")
            
            return
        }
        print("Unauthorized!")
    }
    
    private func displayLowBalanceMessage() -> Void {
        print("Alert: Your balance is under $100")
    }
    
}

print("Welcome to SWIFT BANK")
print("You make the money, we simply take it")
print("--------------------------------------")
var myBank = SwiftBank(password: "laaem", initialDeposit:200)
myBank.displayBalance("laaem")
myBank.makeWithdrawal(120, "laaem")
