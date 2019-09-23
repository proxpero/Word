public struct Syllable: Equatable, Codable {
    public enum Stress: Int, Equatable, Codable {
        case primary = 1
        case secondary = 2
        case none = 0

    }
    public let sound: Ipa
    public let stress: Stress
}

public extension String {
    func syllabize() -> [Syllable] {
        var substring = self[...]
        var result: [Syllable] = []
        func isBreak(char: Character) -> Bool { "'ˌ.".contains(char) }
        while
            let idx = substring.lastIndex(where: isBreak),
            let stress = Syllable.Stress(ipa: substring[idx])
        {
            let sound = substring[idx...].dropFirst()
            let syllable = Syllable(sound: String(sound), stress: stress)
            result.append(syllable)
            substring = self[startIndex..<idx]
        }
        if !substring.isEmpty {
            result.append(.init(
                sound: String(substring),
                stress: .none)
            )
        }
        return result.reversed()
    }
}

extension Syllable.Stress {
    init?(ipa: Character) {
        switch ipa {
        case "'":
            self = .primary
        case "ˌ":
            self = .secondary
        case ".":
            self = .none
        default:
            return nil
        }
    }
}
