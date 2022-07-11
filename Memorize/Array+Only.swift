//
//  Array+Only.swift
//  Memorize
//
//  Created by Caio Cesar Alves de Limeira on 11/07/22.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first: nil
    }
}
