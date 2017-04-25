//
//  Strict.swift
//  Funky
//
//  Created by Richard Wei on 4/25/17.
//
//

/// This file implements a strict version of lazy operators

infix operator &&! : LogicalConjunctionPrecedence
infix operator ||! : LogicalConjunctionPrecedence

public func &&! (lhs: Bool, rhs: Bool) -> Bool {
    return lhs && rhs
}

public func ||! (lhs: Bool, rhs: Bool) -> Bool {
    return lhs || rhs
}
