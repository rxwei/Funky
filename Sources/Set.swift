//
//  Set.swift
//  Funky
//
//  Created by Richard Wei on 8/27/16.
//
//

extension Set : Mappable {

    public typealias MapSource = Element
    public typealias MapTarget = Element
    public typealias MapResult = Set<MapTarget>

    public func map<MapTarget>(_ transform: @escaping (MapSource) -> MapTarget) -> Set<MapTarget> {
        return reduce([]) { acc, x in acc.union([transform(x)]) }
    }

}

extension Set : ApplicativeMappable {

    public typealias ApplicativeTransform = [(MapSource) -> MapTarget]

    public func apply<MapTarget>(_ transforms: [(MapSource) -> MapTarget]) -> Set<MapTarget> {
        return transforms.reduce([]) { acc, f in acc.union(self.map(f)) }
    }

    public static func singleton(_ element: Element) -> Set<Element> {
        return [element]
    }

}

extension Set : FlatMappable {

    public typealias MMapTarget = Set<MapTarget>

    public func flatMap<MapTarget>(_ transform: @escaping (MapSource) -> Set<MapTarget>) -> Set<MapTarget> {
        return reduce([]) { acc, x in acc.union(transform(x)) }
    }
    
}

extension Set : Reducible {

    @inline(__always)
    public func reduce<Result>(_ initial: Result, _ nextPartialResult: @escaping (Result, MapSource) -> Result) -> Result {
        return try! reduce(initial, (nextPartialResult as (Result, MapSource) throws -> Result))
    }
    
}
