//
//  Numeric.swift
//  Funky
//
//  Created by Richard Wei on 8/27/16.
//
//

public protocol Additive {

    static var additiveIdentity: Self { get }

    static func +(lhs: Self, rhs: Self) -> Self
    static func -(lhs: Self, rhs: Self) -> Self

}

public protocol Multiplicative {

    static var multiplicativeIdentity: Self { get }

    static func *(lhs: Self, rhs: Self) -> Self
    static func /(lhs: Self, rhs: Self) -> Self
    static func %(lhs: Self, rhs: Self) -> Self

}

public protocol Numeric : Additive, Multiplicative, ExpressibleByIntegerLiteral, Equatable {}

public extension Numeric {

    public static var additiveIdentity: Self {
        return 0
    }

    public static var multiplicativeIdentity: Self {
        return 1
    }

}

extension Double : Numeric {}
extension Float  : Numeric {}
extension Int    : Numeric {}
extension Int8   : Numeric {}
extension Int16  : Numeric {}
extension Int32  : Numeric {}
extension Int64  : Numeric {}
extension UInt   : Numeric {}
extension UInt8  : Numeric {}
extension UInt16 : Numeric {}
extension UInt32 : Numeric {}
extension UInt64 : Numeric {}
