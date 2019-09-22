import Foundation

public extension String {
    func convertAhd() throws -> Ipa {
        let ahds = [
            "ă": "æ",
            "ā": "eɪ",
            "âr": "ɛər",
            "ä": "ɑː",
            "ĕ": "ɛ",
            "ē": "iː",
            "ĭ": "ɪ",
            "ī": "aɪ",
            "îr": "ɪər",
            "ŏ": "ɒ",
            "ō": "oʊ",
            "ô": "ɔː",
            "ôr": "ɔːr",
            "oi": "ɔɪ",
            "o͝o": "ʊ",
            "o͞o": "uː",
            "yo͞o": "juː",
            "ou": "aʊ",
            "ŭ": "ʌ",
            "ûr": "ɜːr",
            "ə": "ə",
            "ər": "ər",
            "b": "b",
            "ch": "tʃ",
            "d": "d",
            "f": "f",
            "g": "ɡ",
            "h": "h",
            "hw": "hw",
            "j": "dʒ",
            "k": "k",
            "l": "l",
            "əl": "l",
            "m": "m",
            "n": "n",
            "ən": "n",
            "ng": "ŋ",
            "p": "p",
            "r": "r",
            "s": "s",
            "sh": "ʃ",
            "t": "t",
            "th": "θ",
            "ð": "ð",
            "v": "v",
            "w": "w",
            "y": "j",
            "z": "z",
            "zh": "ʒ",
            "əm": "əm",
            "": "",
            "′": "′",
            ".": ".",
            "-": "."
        ]

        func isRegularBreak(char: Character) -> Bool {
            return ".-".contains(char)
        }

        func isPrimaryStress(char: Character) -> Bool {
            return char == ""
        }

        func isSecondaryStress(char: Character) -> Bool {
            return char == "′"
        }

        func isBreak(char: Character) -> Bool {
            return isRegularBreak(char: char)
                || isPrimaryStress(char: char)
                || isSecondaryStress(char: char)
        }

        var substring = self[...]
        var result = ""
        let values = ahds.sorted(by: { $0.key.count > $1.key.count })
        while !substring.isEmpty {
            for (key, value) in values {
                if substring.hasPrefix(key) {

                    if let char = key.first, isBreak(char: char) {
                        if isPrimaryStress(char: char) || isSecondaryStress(char: char) {
                            if let idx = result.lastIndex(where: isRegularBreak) {
                                result.replaceSubrange(idx...idx, with: key)
                            } else {
                                result.insert(char, at: result.startIndex)
                            }
                        }
                        result.append(".")
                    } else {
                        result.append(contentsOf: value)
                    }
                    substring = substring.dropFirst(key.count)
                    break
                }
            } else {
                throw Error.init(text: self)
            }
        }
        if result.hasSuffix(".") {
            result.removeLast()
        }
        return result
            .replacingOccurrences(of: "", with: "'")
            .replacingOccurrences(of: "′", with: "ˌ")
    }
}
