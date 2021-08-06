import XCTest
@testable import Heap

final class HeapTests: XCTestCase {

    func testEmptyInit() {
        var heap = Heap<Int>.minPQ()
        heap.insert(5)
        heap.insert(4)
        heap.insert(3)
        heap.insert(2)
        heap.insert(1)
        XCTAssertEqual(heap.remove(), 1)
        XCTAssertEqual(heap.remove(), 2)
        XCTAssertEqual(heap.remove(), 3)
        XCTAssertEqual(heap.remove(), 4)
        XCTAssertEqual(heap.remove(), 5)
    }

    func testInitWithValues() {
        var heap = Heap<Int>.minPQ(values: [5, 4, 3, 2, 1])
        XCTAssertEqual(heap.remove(), 1)
        XCTAssertEqual(heap.remove(), 2)
        XCTAssertEqual(heap.remove(), 3)
        XCTAssertEqual(heap.remove(), 4)
        XCTAssertEqual(heap.remove(), 5)
    }

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
