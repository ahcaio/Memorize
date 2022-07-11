//
//  Array+Identifiable.swift
//  Memorize
//
//  Created by Caio Cesar Alves de Limeira on 10/07/22.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return nil
    }
}
