//
//  RandomAccessCollection+isLastElement.swift
//  HW2
//
//  Created by Никита Вотяков on 26.09.2023.
//

extension RandomAccessCollection where Self.Element: Identifiable {

    func isLastElement<Item: Identifiable>(_ item: Item) -> Bool {
        guard !isEmpty else { return false }
        guard let itemIndex = firstIndex(
            where: { AnyHashable($0.id) == AnyHashable(item.id) }
        ) else { return false }
        let distance = distance(from: itemIndex, to: endIndex)
        return distance == 1
    }

}
