//swift hackerrank.swift

func findMedian(arr: [Int]) -> Int {
    // the given arr is non-mutable, so can't be changed/sorted
    var tempArray = arr
    tempArray.sort()
    
    return tempArray[tempArray.count / 2]
}

func flippingMatrix(matrix: [[Int]]) -> Int {
    // the question asks to find the greatest submatrix from the top left corner if you can only reverse each row/column
    // so i understood that as like the corner values could only ever be in the corner positions
    // so if you flip/reverse the rows/columns you'll always get a corner value in the top left corner
    // so if you compare the corners you can find the greatest value that could go there
    // the same is applicable for the second value in the row and separatley the column
    /*
    107 54 128 15
    12  75 110 138
    100 96 34  85
    75  15 28  112
    */

    let k1 = matrix.count / 2 - 1 // going down, was meant to be going diagonal but came out differently and worked
    let i1 = matrix.count / 2 - 1 // across the top
    //let j1 = matrix.count / 2 - 2 // not used
    let length = matrix.count - 1
    var max = 0

    for k in 0...k1 {
        for i in 0...i1 {
            // can probably reduce this by having some max operation, i couldn't get the max(value, value) to work
            var tempMatrix = [ matrix[0 + k][i], matrix[0 + k][length - i], matrix[length - k][i], matrix[length - k][length - i] ]
            print(tempMatrix)
            tempMatrix.sort()
            max += tempMatrix[3]
            print("diagonal \(k) tempMatrix \(i) biggest is \(tempMatrix[3])")
        }
    }

    print(max)
    return max

    /*
    // works for 2n = 2,4,6 and whatever else hackerrank tested with
    let matrix = [[107, 54, 128, 15],[12, 75, 110, 138],[100, 96, 34, 85],[75, 15, 28, 112]]

    Output:
    [107, 15, 75, 112]
    diagonal 0 tempMatrix 0 biggest is 112
    [54, 128, 15, 28]
    diagonal 0 tempMatrix 1 biggest is 128
    [12, 138, 100, 85]
    diagonal 1 tempMatrix 0 biggest is 138
    [75, 110, 96, 34]
    diagonal 1 tempMatrix 1 biggest is 110
    488
    */
}

func sockMerchant(n: Int, ar: [Int]) -> Int {
    // Find how many pairs of socks are in the array
    var newArray = ar
    var newN = n
    var start = 0
    var end = 1
    var pairs = 0
    
    if n == 1 {
        return 0
    }
    
    while start < newN {
        if end < newN {
            if newArray[start] == newArray[end] {
                pairs += 1
                newArray.remove(at: end)
                start += 1
                end = start + 1
                newN -= 1
                //print("Pairs \(pairs)")
            } else {
                end += 1
            }
        } else {
            start += 1
            end = start + 1
        }
        //print("Looped \(start) times")
    }

    return pairs
}

func sockMerchantWithDictionary(n: Int, ar: [Int]) -> Int {
    // Find how many pairs of socks are in the array
    // This solution uses a dictionary to keep track of how many socks of each kind there are
    var newDict = [Int: Int]()
    var pairs = 0
    
    if n == 1 {
        return 0
    }
    
    for i in 0...n - 1 {
        if let value = newDict[ar[i]] {
            newDict.updateValue(value + 1, forKey: ar[i])
        } else {
            newDict.updateValue(1, forKey: ar[i])
        }
    }
    //print(newDict)
    
    for element in newDict {
        pairs += element.value / 2
    }

    return pairs
}

func caesarCipher(s: String, k: Int) -> String {
    // Return an encrypted string where each alphabet character is moved k times over

    let length = s.count
    var k2 = k
    var result = ""
    
    if k > 26 {
        k2 = k % 26
    }
    
    for i in 0..<length {
        let ascii = s[s.index(s.startIndex, offsetBy: i)].asciiValue!
        var pos = 0
        
        switch ascii {
            case 65...90:
                pos = Int(ascii) + k2
                if pos > 90 {
                    pos = pos - 90 + 64
                }
            case 97...122:
                pos = Int(ascii) + k2
                if pos > 122 {
                    pos = pos - 122 + 96
                }
            default:
                pos = Int(ascii)
        }
        
        result += String(UnicodeScalar(UInt8(pos)))
    }

    return result
}

func maxMin(k: Int, arr: [Int]) -> Int {
    // Find the smallest difference in a group of k elements
    // So you have to take any k elements from the arr and find the smallest difference
    //   where the biggest - smallest numbers in that subgroup is the least difference
    
    let length = arr.count
    var sortedArr = arr
    sortedArr.sort()
    var difference = sortedArr[length - 1]
    
    for i in 0...length - k {
        let cMin = sortedArr[i]
        let cMax = sortedArr[i + k - 1]
        let newDiff = cMax - cMin
        if newDiff < difference {
            difference = newDiff
        }
    }
    
    return difference
}

func dynamicArray(n: Int, queries: [[Int]]) -> [Int] {
    // Some strange question where they give you pretty much all the steps
    
    var lastAnswer = 0
    var arr: [[Int]] = []
    var answers: [Int] = []
    
    for _ in 0...n {
        arr.append([])
        //print(arr)
    }
    
    for i in 0..<queries.count {
        if queries[i][0] == 1 {
            let idx = ((queries[i][1] ^ lastAnswer) % n)
            arr[idx].append(queries[i][2])
        } else { //it's 2
            let idx = ((queries[i][1] ^ lastAnswer) % n)
            lastAnswer = arr[idx][queries[i][2] % arr[idx].count]
            answers.append(lastAnswer)
        }
    }
    
    return answers
}

func gridChallenge(grid: [String]) -> String {
    // Given a grid of Strings, sort each row (string in array) and check if each character per column is in abc order

    let n = grid.count
    let m = grid[0].count
    var newArr: [String] = []
    
    for i in 0..<n {
        var arr = Array(grid[i])
        arr.sort()
        newArr.append(String(arr))
    }
    
    for i in 0..<m {
        var pastAscii = 0
        for j in 0..<n {
            let tempString = newArr[j]
            let ascii = Int(tempString[tempString.index(tempString.startIndex, offsetBy: i)].asciiValue!)
            
            if ascii >= pastAscii {
                pastAscii = ascii
            } else {
                return "NO"
            }
        }
    }
    
    return "YES"
}

func balancedSums(arr: [Int]) -> String {
    // Given an array of Integers, return YES or NO if both sides of the array add up to the same value from an i'th position not including the i'th value
        
    let length = arr.count
    var leftSum = 0
    var rightSum = 0
    
    for i in 1..<length {
        rightSum += arr[i]
    }
    if leftSum == rightSum { return "YES" }
    
    for i in 1..<length {        
        leftSum += arr[i - 1]
        rightSum -= arr[i]
        
        if leftSum == rightSum { return "YES" }
    }
    
    return "NO"

}

func superDigit(n: String, k: Int) -> Int {
    // Someone else's recursive solution, I transformed to Swift
    // Still not fast enough for some of the questions

    if n.count == 1 && k == 1 { return Int(n)! }
    var value = 0
    for i in 0..<n.count {
        value += n[n.index(n.startIndex, offsetBy: i)].wholeNumberValue!
    }
    value *= k
    return superDigit(n: String(value), k: 1) 

    // My solution that didn't use recursion
    /*
    var p = n
        
    if p.count > 1  && k != 1{
        var value: Int = 0
        for i in 0..<p.count {
            value += p[p.index(p.startIndex, offsetBy: i)].wholeNumberValue!
        }
        value *= k
        p = String(value)
    }
    
    while p.count > 1 {
        var value: Int = 0
        for i in 0..<p.count {
            value += p[p.index(p.startIndex, offsetBy: i)].wholeNumberValue!
        }
        p = String(value)
    }
    
    return Int(p)!
    */
}

func counterGame(n: Int) -> String {
    // Solution using bits, below is overcomplicated, don't know how to simplify
    
    if n == 1 { return "Richard" }
    if n == 2 { return "Louise" }
    
    var current = String(n, radix: 2)
    var num = n
    var turn = 0
    
    while num > 2 {
        if (num & (num - 1)) == 0 {
            num /= 2
            turn += 1
        } else {
            let mySubstring = current.suffix(current.count - 1)
            let pos = Array(String(mySubstring)).firstIndex(of: "1")!
            current = String(current.suffix(current.count - 1 - pos))
            
            num = Int(current, radix: 2)!
            turn += 1
        }
    }
    
    if num == 2 { turn += 1 }
    
    if turn % 2 == 0 {
        return "Richard"
    } else {
        return "Louise"
    }
    
}

func palindromeIndex(s: String) -> Int {
    // Check if String is a palindrome by removing one letter and return position
        // failed 2 test cases, needs work

    var low = 0
    var high = s.count - 1
    let arr = Array(s)
    
    while low < high {
        if arr[low] == arr[high] {
            low += 1
            high -= 1
        } else {
            if arr[low + 1] == arr[high] {
                let result = low
                low += 1
                while low < high {
                    if arr[low] == arr[high] {
                        low += 1
                        high -= 1
                    } else {
                        return -1
                    }
                }
                return result
            } else if arr[low] == arr[high - 1] {
                let result = high
                high -= 1
                while low < high {
                    if arr[low] == arr[high] {
                        low += 1
                        high -= 1
                    } else {
                        return -1
                    }
                }
                return result
            } else {
                return -1
            }
        }
    }
    
    return -1
}

func getTotalX(a: [Int], b: [Int]) -> Int {
    // Below has to be true to add as potential results
    // # / a == 0
    // b / # == 0
    
    var result = 0
    var num = a[a.count - 1]
    //var temp: [Int] = []
    
    var check = true
    while num <= b[0] {
        check = true
        for value in a {
            if num % value != 0 {
                num += a[a.count - 1]
                check = false
                break
            }
        }
        if check {
            for i in 0..<b.count {
                if b[i] % num != 0 {
                    break
                }
            
                if i + 1 == b.count {
                    result += 1
                    //temp.append(num)
                }
            }
        }
        num += a[a.count - 1]
    }
    
    //print(temp)
    return result
}

func anagram(s: String) -> Int {
    // How many changes until the first half and second half of String s are anagrams of each other

    if s.count % 2 != 0 { return -1 }
    
    var changes = 0
    var arr1 = Array(s.prefix(s.count / 2))
    var arr2 = Array(s.suffix(s.count / 2))
    arr1.sort()
    arr2.sort()
    
    for i in 0..<arr1.count {
        if arr2.contains(arr1[i]) {
            arr2.remove(at: arr2.firstIndex(of: arr1[i])!)
        } else {
            changes += 1
        }
    }
    
    return changes
    
}

func bomberMan(n: Int, grid: [String]) -> [String] {
    // Below is my solution, but very inefficent
    
    if n == 1 { return grid }
    
        var arrayGrid: [[Int]] = []
    
    for j in 0..<grid.count {
        let sequence = grid[j]
        arrayGrid.append([])
        for k in 0..<grid[0].count {
            let charAt = sequence[sequence.index(sequence.startIndex, offsetBy: k)]
            if charAt == "." {
                arrayGrid[j].append(-1)
            } else {
                arrayGrid[j].append(1)
            }
        }
    }
    
    //print(arrayGrid)
    
    for _ in 2...n {
        for j in 0..<arrayGrid.count {
            for k in 0..<arrayGrid[0].count {
                let value = arrayGrid[j][k] + 1
                if value < 3 {
                    arrayGrid[j][k] = value
                } else {
                    arrayGrid[j][k] = -1
                    let toLeft = k - 1
                    let toRight = k + 1
                    let toUp = j - 1
                    let toDown = j + 1
                    
                    if toLeft >= 0 {
                        arrayGrid[j][toLeft] = -1
                    }
                    if toUp >= 0 {
                        arrayGrid[toUp][k] = -1
                    }
                    
                    if toRight < arrayGrid[j].count {
                        if arrayGrid[j][toRight] != 2 {
                            arrayGrid[j][toRight] = -2
                        }
                    }
                    if toDown < arrayGrid.count {
                        if arrayGrid[toDown][k] != 2 {
                            arrayGrid[toDown][k] = -2
                        }
                    }
                }
            }
        }
    }
    
    print(arrayGrid)
    
    var result: [String] = []
    
    for j in 0..<arrayGrid.count {
        var resultString = ""
        for k in 0..<arrayGrid[j].count {
            if arrayGrid[j][k] == -1 {
                resultString += "."
            } else {
                resultString += "O"
            }
        }
        result.append(resultString)
    }
    
    print(result)
    return result
}

func reverse(llist: SinglyLinkedListNode?) -> SinglyLinkedListNode? {
    // Reverse the LinkedList
    // This method creates a new List and copies the data across
    /*
    * For your reference:
    *
    * Is a Class
    * SinglyLinkedListNode {
    *     data: Int
    *     next: SinglyLinkedListNode?
    * }
    *
    */
    
    if llist == nil {
        return llist
    }
    
    var newList = SinglyLinkedListNode(nodeData: 0)
    var pointer = llist
    var arrayValues: [Int] = []
    
    while pointer != nil {
        arrayValues.append(pointer!.data)
        pointer = pointer?.next
    }
    
    let length = arrayValues.count
    pointer = newList
    pointer?.data = arrayValues[length - 1]
    pointer?.next = nil
    for i in 2...length {
        pointer?.next = SinglyLinkedListNode(nodeData: 0)
        pointer = pointer?.next
        pointer?.data = arrayValues[length - i]
        pointer?.next = nil
    }
    
    return newList

}

func reverse(llist: DoublyLinkedListNode?) -> DoublyLinkedListNode? {
    // Reverse the DoublyLinkedList
    // It said to do it in place, but I couldn't get the reference to stop setting itself to nil
    // Pretty much followed same approach as the SinglyLinkedList but this one failed one test
    /*
    * For your reference:
    *
    * DoublyLinkedListNode {
    *     data: Int
    *     next: DoublyLinkedListNode?
    *     prev: DoublyLinkedListNode?
    * }
    *
    */
    
    if llist == nil || llist?.next == nil { return llist }
    
    var newList = DoublyLinkedListNode(nodeData: 0)
    var pointer = llist
    var arrayValues: [Int] = []
    
    while pointer != nil {
        arrayValues.append(pointer!.data)
        pointer = pointer?.next
    }
    
    let length = arrayValues.count
    pointer = newList
    pointer?.data = arrayValues[length - 1]
    pointer?.next = nil
    pointer?.prev = nil
    for i in 2...length {
        let temp = pointer
        pointer?.next = DoublyLinkedListNode(nodeData: 0)
        pointer = pointer?.next
        pointer?.data = arrayValues[length - i]
        pointer?.next = nil
        pointer?.prev = temp
    }
    
    return newList
    
    /*
    // Couldn't get this one to work
    if llist == nil { return llist }
    
    var listHeader = llist
    var pointer = llist
    
    while pointer != nil {
        let tempP = pointer?.prev
        let tempN = pointer?.next
        pointer?.prev = tempN // these two lines cause issue
        pointer?.next = tempP //
        pointer = pointer?.prev
        
        // maybe below was issue
        //print(pointer)
        if let temp = pointer?.next {
            if temp.next == nil {
                listHeader = pointer?.next
                print("end")
            } else {
                print(pointer?.data)
            }
            
        }
    }
    
    return listHeader
    */
}

func insertNodeAtPosition(llist: SinglyLinkedListNode?, data: Int, position: Int) -> SinglyLinkedListNode? {
    // Insert Node at given Position

    var newNode = SinglyLinkedListNode(nodeData: data)
    
    if position == 0 {
        newNode.next = llist
        return newNode
    }
    
    var pointer = llist
    
    for i in 1...position {
        if i == position {
            var temp = pointer?.next
            pointer?.next = newNode
            newNode.next = temp
        } else {
            pointer = pointer?.next
        }
    }
    
    return llist
}

func icecreamParlor(m: Int, arr: [Int]) -> [Int] {
    // Find two values in the array that add up to m

    // O(n)? second attempt
    var values: [Int: Int] = [:]
    let length = arr.count
    
    for i in 0..<length {
        var diff = m - arr[i]
        if let value = values[diff] {
            return [value, i + 1]
        } else {
            values[arr[i]] = i + 1
        }
    }
    
    return [0,0]
    
    // O(n^2) first attempt
    var result = [0, 0]
    var flavor1 = 0
    var flavor2 = 0
    let length = arr.count
    
    for i in 0..<length {
        flavor1 = arr[i]
        for j in i + 1..<length {
            flavor2 = arr[j]
            if flavor1 + flavor2 == m {
                result[0] = i + 1
                result[1] = j + 1
            }
        }
        if result[0] != 0 { break }
    }
    
    return result

}

struct Queue {
    // Problem asked to make a queue from two stacks
    // I just made a queue struct/data type

    var value: [Int] = []
    
    mutating func enqueue(n: Int) {
        value.append(n)
    }
    
    mutating func dequeue() {
        if value.count != 0 {
            value.remove(at: 0)
        }
    }
    
    func peak() -> Int{
        if value.count != 0 {
            print(value[0])
            return value[0]
        }
        return 0
    }
}

func isBalanced(s: String) -> String {
    // Check if the string is balanced
    
    var stack: [Character] = []
    
    for char in s {
        if char == "(" || char == "[" || char == "{" {
            stack.append(char)
        } else {
            if char == ")" {
                if stack.last == "(" {
                    stack.removeLast()
                } else {
                    return "NO"
                }
            } else if char == "]" {
                if stack.last == "[" {
                    stack.removeLast()
                } else {
                    return "NO"
                }
            } else {
                if stack.last == "{" {
                    stack.removeLast()
                } else {
                    return "NO"
                }
            }
        }
    }
    
    if stack.count == 0 {
        return "YES"
    } else {
        return "NO"
    }
    
}

func waiter(number: [Int], q: Int) -> [Int] {
    // Hard to explain, check hackerrank for description
    // Uses below function nthPrimeNumber(n: Int)
    
    var answers: [Int] = []
    var A = number
    let primes: [Int] = nthPrimeNumber(n: q)
    
    for i in 1...q {
        var A2: [Int] = []
        var B: [Int] = []
        
        for _ in 0..<A.count {
            if let currentNum = A.last {
                if currentNum % primes[i - 1] == 0 {
                    B.append(A.removeLast())
                } else {
                    A2.append(A.removeLast())
                }
            }
        }
        
        // for _ in 0..<B.count {
        //     answers.append(B.removeLast())
        // }
        B.reverse()
        answers.append(contentsOf: B)
        
        A = A2
        
    }
    
    // for _ in 0..<A.count {
    //     answers.append(A.removeLast())
    // }
    A.reverse()
    answers.append(contentsOf: A)
    
    return answers

}

func nthPrimeNumber(n: Int) -> [Int] {
    // Found this online, edited to return list of prime numbers
    var prime: Int = 2
    var divisor: Int
    var isPrime: Bool
    var counter = 0
    var results: [Int] = []
    while counter < n
    {
        isPrime = true;
        divisor = 2
        while divisor < prime
        {
            if ((prime % divisor) == 0 )
            {
                isPrime = false
            }
            
            divisor += 1
        }
        if (isPrime)
        {
            counter += 1
            results.append(prime)
        }
        
        prime += 1
    }

    return results
}

func equalStacks(h1: [Int], h2: [Int], h3: [Int]) -> Int {
    // Each array/stack has a cylindar of some height, make the three stacks have equal height
    
    var height1 = 0
    var height2 = 0
    var height3 = 0
    
    for value in h1 {
        height1 += value
    }
    for value in h2 {
        height2 += value
    }
    for value in h3 {
        height3 += value
    }
    
    if height1 == height2 && height2 == height3 {
        return height1
    }
    
    var s1 = h1
    var s2 = h2
    var s3 = h3
    
    while height1 != height2 || height2 != height3 {
        if height1 >= height2 && height1 >= height3 {
            height1 -= s1.removeFirst()
        } else if height2 >= height1 && height2 >= height3 {
            height2 -= s2.removeFirst()
        } else {
            height3 -= s3.removeFirst()
        }
    }

    return height1
}