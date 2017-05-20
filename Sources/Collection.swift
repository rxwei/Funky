//
//  Collection.swift
//  Funky
//
//  Created by Richard Wei on 8/27/16.
//
//

public protocol SingletonCollection : Collection {
    init(singleton: Element)
}

public extension SingletonCollection where Self : ExpressibleByArrayLiteral, Self.ArrayLiteralElement == Element {

    public init(singleton: Element) {
        self = [singleton]
    }

}

extension CollectionOfOne : SingletonCollection {

    public init(singleton: Element) {
        self.init(singleton)
    }

}

extension String.CharacterView : SingletonCollection {

    public init(singleton: Character) {
        self.init()
        append(singleton)
    }

}
