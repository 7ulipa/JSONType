//
//  JSONType.swift
//  Pods
//
//  Created by DirGoTii on 03/01/2017.
//
//

import Foundation

public protocol JSONType {
    init?(rawValue: Any?)
}

public extension JSONType {
    public init?(rawValue: Any?) {
        if let value = rawValue as? Self {
            self = value
        } else {
            return nil
        }
    }
    
    public static func pick(from rawValue: Any?, with key: String? = nil) -> Self? {
        if let key = key {
            return Self(rawValue: (rawValue as? Dictionary)?[key])
        } else {
            return Self(rawValue: rawValue)
        }
    }
}

public extension Array where Element: JSONType {
    init?(rawValue: Any?) {
        if let result = (rawValue as? Array<Any>)?.flatMap(Element.init(rawValue:)) {
            self = result
        } else {
            return nil
        }
    }
}

extension Int: JSONType {
    
}

extension String: JSONType {
    
}

extension Array: JSONType {
    
}

extension Double: JSONType {
    
}

extension Float: JSONType {
    
}
