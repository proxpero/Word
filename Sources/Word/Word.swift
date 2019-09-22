public struct Word: Codable {
    public let text: String
    public let frequency: Double?
    public let syllables: [Syllable]
    public let pronunciations: [Ipa]
    public let definitions: [Definition]
}

public extension Word {
    init(text: String, syllables: [Syllable], pronunciations: [Ipa]) {
        self.text = text
        self.frequency = nil
        self.syllables = syllables
        self.pronunciations = pronunciations
        self.definitions = []
    }
}

public struct Definition: Codable {
    public let definition: String
    public let partOfSpeech: PartOfSpeech
    public let synonyms: [Word]?
    public let antonyms: [Word]?
    public let examples: [String]?
    public let typeOf: [Word]?
    public let hasType: [Word]?
    public let partOf: [Word]?
    public let hasParts: [Word]?
    public let instanceOf: [Word]?
    public let hasInstances: [Word]?
    public let similarTo: [Word]?
    public let also: [Word]?
    public let entails: [Word]?
    public let memberOf: [Word]?
    public let hasMembers: [Word]?
    public let substanceOf: [Word]?
    public let hasSubstances: [Word]?
    public let inCategory: [Word]?
    public let hasCategories: [Word]?
    public let usageOf: [Word]?
    public let hasUsages: [Word]?
    public let inRegion: [Word]?
    public let regionOf: [String]?
    public let pertainsTo: [Word]?
    public let derivation: [Word]?
}
