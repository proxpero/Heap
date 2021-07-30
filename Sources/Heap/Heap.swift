public struct Heap<A> {
    private(set) var values: [A]
    let ordering: (A, A) -> Bool

    public init(
        values: [A] = [],
        ordering: @escaping (A, A) -> Bool
    ) {
        self.values = values
        self.ordering = ordering

        guard !values.isEmpty else { return }
        for index in stride(from: (values.count / 2) - 1, through: 0, by: -1) {
            sink(index: index)
        }
    }

    public static func minHeap(values: [A] = []) -> Self where A: Comparable {
        self.init(ordering: <)
    }

    public static func maxHeap(values: [A] = []) -> Self where A: Comparable {
        self.init(ordering: >)
    }

    public mutating func insert(_ value: A) {
        values.append(value)
        swim(index: values.count - 1)
    }

    @discardableResult
    public mutating func remove() -> A? {
        guard !values.isEmpty else { return nil }
        guard values.count > 1 else { return values.removeLast() }
        let result = values[0]
        values[0] = values.removeLast()
        return result
    }

    public func peek() -> A? {
        values.first
    }

    public var count: Int {
        values.count
    }

    @inline(__always) internal func parentIndex(ofIndex i: Int) -> Int {
        return (i - 1) / 2
    }

    @inline(__always) internal func leftChildIndex(ofIndex i: Int) -> Int {
        return (2 * i) + 1
    }

    @inline(__always) internal func rightChildIndex(ofIndex i: Int) -> Int {
        return (2 * i) + 2
    }

    internal mutating func sink(index: Int, last: Int) {
        let left = leftChildIndex(ofIndex: index)
        let right = left + 1
        var first = index
        if left < last, ordering(values[left], values[first]) {
            first = left
        }
        if right < last, ordering(values[right], values[first]) {
            first = right
        }
        if first == index { return }
        values.swapAt(index, first)
        sink(index: first, last: last)
    }

    internal mutating func sink(index: Int) {
        sink(index: index, last: values.count)
    }

    internal mutating func swim(index: Int) {
        var childIndex = index
        let child = values[childIndex]
        var pidx = parentIndex(ofIndex: childIndex)
        while childIndex > 0 && ordering(child, values[pidx]) {
            values[childIndex] = values[pidx]
            childIndex = pidx
            pidx = parentIndex(ofIndex: childIndex)
        }
        values[childIndex] = child
    }
}
