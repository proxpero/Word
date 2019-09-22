public struct Syllable {
    public enum Stress {
        case primary
        case secondary
        case none

    }
    public let sound: Ipa
    public let stress: Stress
}
