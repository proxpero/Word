public typealias Ipa = String

public enum Phoneme: Ipa, Codable {
    case p      // pit
    case b      // bit
    case t      // tin
    case d      // din
    case ʧ      // cheap
    case ʤ      // jeep
    case k      // cut
    case ɡ      // gut
    case f      // fat
    case v      // vat
    case θ      // thigh
    case ð      // thy
    case s      // sap
    case z      // zap
    case ʃ      // dilution
    case ʒ      // delusion
    case h      // ham
    case m      // map
    case n      // thin
    case ŋ      // thing
    case l      // left
    case r      // run
    case w      // we
    case j      // yes
    case x      // loch
    case ʔ      // uh-oh

    case æ      // trap, bath
    case ɑ      // palm
    case ɔ      // thought
    case ɪ      // kit
    case ɛ      // dress
    case ʌ      // strut
    case ʊ      // foot

    case eɪ     // face
    case oʊ     // goat
    case i      // happy, fleece
    case u      // goose

    case aɪ     // price
    case ɔɪ     // choice
    case aʊ     // mouth

    case ɜr     // nurse
    case ɑr     // start
    case ɔr     // north
    case ɪr     // near
    case ɛr     // square
    case ʊr     // cure

    case ə      // comma
    case ər     // letter

    case primary = "'"
    case secondary = "ˌ"
    case `break` = "."
}

public struct Consonant {
    public enum Place {
        case labial
        case dental
        case alveolar
        case postAlveolar
        case palatal
        case velar
        case glottal
    }

    public enum Manner {
        public enum Energy {
            case fortis
            case lenis
        }
        case nasal
        case stop(Energy)
        case fricative(Energy)
        case approximant
    }

    public let place: Place
    public let manner: Manner
}

public enum Vowel {
    public enum Height {
        case close, nearClose, closeMid, mid, openMid, nearMid, nearOpen, open
    }

    public enum Backness {
        case front, central, back
    }
}

public enum Sound {
    case consonant(Consonant)
    case vowel(Vowel)
    case none
}
