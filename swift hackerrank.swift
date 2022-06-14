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