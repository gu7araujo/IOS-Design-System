//
//  Colors.swift
//  
//
//  Created by Gustavo Araujo Santos on 03/03/23.
//

import UIKit

public enum Colors: RawRepresentable, CaseIterable {

    public typealias RawValue = UIColor?

    case black
    case white
    case happiness
    case cloud

    public init?(rawValue: RawValue) {
        switch rawValue {
        case UIColor(hex: "#000000"): self = .black
        case UIColor(hex: "#FFFFFF"): self = .white
        case UIColor(hex: "#2E2EFF"): self = .happiness
        case UIColor(hex: "#F5F5F5"): self = .cloud
        default: return nil
        }
    }

    public var rawValue: RawValue {
        switch self {
        case .black: return UIColor(hex: "#000000")
        case .white: return UIColor(hex: "#FFFFFF")
        case .happiness: return UIColor(hex: "#2E2EFF")
        case .cloud: return UIColor(hex: "#F5F5F5")
        }
    }

}
