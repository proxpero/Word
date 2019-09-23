import XCTest
@testable import Word

final class WordTests: XCTestCase {
    func testAhdConversion() throws {

        typealias Case = (String, String)
        let cases = [
//            ("ârō-spās′", "'ɛər.oʊˌspeɪs"),
//            ("sər-mīz′", "sərˌmaɪz"),
//            ("strông", "strɔːŋ"),
//            ("âre-ə", "'ɛər.iː.ə"),
            ("ĭk-sītmənt", "ɪk'saɪt.mənt")
        ]

        for test in cases {
            XCTAssertEqual(test.1, try test.0.convertAhd())
        }

        let errors = [
            "sər,-sār"
        ]

        for test in errors {
            XCTAssertThrowsError(try test.convertAhd())
        }
    }

    func testSyllabize() {
        let input = "'ɛər.oʊˌspeɪs"
        let expectation: [Syllable] = [
            .init(sound: "ɛər", stress: .primary),
            .init(sound: "oʊ", stress: .none),
            .init(sound: "speɪs", stress: .secondary)
        ]
        XCTAssertEqual(expectation, input.syllabize())
    }

    static var allTests = [
        ("testAhdConversion", testAhdConversion),
    ]
}
