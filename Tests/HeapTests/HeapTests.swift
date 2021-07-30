import XCTest
@testable import Heap

final class HeapTests: XCTestCase {

    func testHeap() {
        var heap = Heap<Int>(ordering: <) // minPq
        heap.insert(10)
        heap.insert(20)
        heap.insert(15)
        XCTAssertEqual(heap.remove(), 10)
        XCTAssertEqual(heap.remove(), 15)
        heap.insert(10)
        heap.insert(5)
        heap.insert(20)
        XCTAssertEqual(heap.remove(), 5)
        XCTAssertEqual(heap.count, 3)
    }
}
