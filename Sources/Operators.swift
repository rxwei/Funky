//
//  Operator.swift
//  Funky
//
//  Created by Richard Wei on 8/27/16.
//
//

precedencegroup FunctionCompositionPrecedence {
    associativity: left
    higherThan:    RangeFormationPrecedence
    lowerThan:     AdditionPrecedence
}

infix operator • : FunctionCompositionPrecedence

prefix operator +
prefix operator -
prefix operator *
prefix operator /
prefix operator %
prefix operator ==
prefix operator !=
postfix operator +
postfix operator -
postfix operator *
postfix operator /
postfix operator %

public extension Numeric {
    
    @inline(__always)
    public static prefix func +(rhs: Self) -> (Self) -> Self {
        return { $0 + rhs }
    }
    
    @inline(__always)
    public static prefix func -(rhs: Self) -> (Self) -> Self {
        return { $0 - rhs }
    }
    
    @inline(__always)
    public static prefix func *(rhs: Self) -> (Self) -> Self {
        return { $0 * rhs }
    }
    
    @inline(__always)
    public static prefix func /(rhs: Self) -> (Self) -> Self {
        return { $0 / rhs }
    }
    
    @inline(__always)
    public static prefix func %(rhs: Self) -> (Self) -> Self {
        return { $0 % rhs }
    }
    
    @inline(__always)
    public static postfix func +(lhs: Self) -> (Self) -> Self {
        return { lhs + $0 }
    }
    
    @inline(__always)
    public static postfix func -(lhs: Self) -> (Self) -> Self {
        return { lhs - $0 }
    }
    
    @inline(__always)
    public static postfix func *(lhs: Self) -> (Self) -> Self {
        return { lhs * $0  }
    }
    
    @inline(__always)
    public static postfix func /(lhs: Self) -> (Self) -> Self {
        return { lhs / $0 }
    }
    
    @inline(__always)
    public static postfix func %(lhs: Self) -> (Self) -> Self {
        return { lhs % $0 }
    }
    
}

public extension Comparable {
    
    @inline(__always)
    public static prefix func ==(rhs: Self) -> (Self) -> Bool {
        return { $0 == rhs }
    }
    
    @inline(__always)
    public static prefix func !=(rhs: Self) -> (Self) -> Bool {
        return { $0 != rhs }
    }

}
