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

    func testMinPQ() {
        var minPQ = Heap<Int>.minPQ()
        minPQ.insert(10)
        minPQ.insert(20)
        minPQ.insert(15)
        XCTAssertEqual(minPQ.remove(), 10)
        XCTAssertEqual(minPQ.remove(), 15)
        minPQ.insert(10)
        minPQ.insert(5)
        minPQ.insert(20)
        XCTAssertEqual(minPQ.remove(), 5)
        XCTAssertEqual(minPQ.count, 3)
    }

    func testMinPQWithValues() {
        var minPQ = Heap<Int>.minPQ(values: [10, 20, 15])
        XCTAssertEqual(minPQ.remove(), 10)
        XCTAssertEqual(minPQ.remove(), 15)
        minPQ.insert(10)
        minPQ.insert(5)
        minPQ.insert(20)
        XCTAssertEqual(minPQ.remove(), 5)
        XCTAssertEqual(minPQ.count, 3)
    }
}
