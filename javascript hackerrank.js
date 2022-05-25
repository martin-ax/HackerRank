//javascript hackerrank.js

'use strict';

/*
    Return the smallest and biggest sum with 4 out of 5 numbers from the array input.
*/
function miniMaxSum(arr) {
    let minSum = 0;
    let maxSum = 0;
    let currentSum = arr[0] + arr[1] + arr[2] + arr[3];
    
    minSum = currentSum;
    maxSum = currentSum;
    
    currentSum = arr[0] + arr[1] + arr[2] + arr[4];
    minSum = currentSum < minSum ? currentSum : minSum;
    maxSum = currentSum > maxSum ? currentSum : maxSum;
    
    currentSum = arr[0] + arr[1] + arr[3] + arr[4];
    minSum = currentSum < minSum ? currentSum : minSum;
    maxSum = currentSum > maxSum ? currentSum : maxSum;
    
    currentSum = arr[0] + arr[2] + arr[3] + arr[4];
    minSum = currentSum < minSum ? currentSum : minSum;
    maxSum = currentSum > maxSum ? currentSum : maxSum;
    
    currentSum = arr[1] + arr[2] + arr[3] + arr[4];
    minSum = currentSum < minSum ? currentSum : minSum;
    maxSum = currentSum > maxSum ? currentSum : maxSum;
    
    console.log(minSum + ' ' + maxSum)
    //print(minSum + ' ' + maxSum);
}

function timeConversion(s) {
    let result = '';
    let pastNoon = s.substring(8,10) == 'AM'  ? false: true;

    if (pastNoon) {
        if (s.substring(0,2) === '12') {
            result += s.substring(0,8);
        } else {
            result += String(Number(s.substring(0,2)) + 12) + s.substring(2,8);
        }
    } else {
        if (s.substring(0,2) === '12') {
            result += '00' + s.substring(2,8);
        } else {
            result += s.substring(0,8);
        }
    }
    
    console.log(s + ' is ' + result);
}

function matchingStrings(strings, queries) {
    // forEach is a bit slower than map because
    // This function has a callback function to mutate the current array, that's why it is usually a little bit slow depending on the array size.
    const result = [];
    let currentCount = 0;
    
    queries.forEach((value) => {
        strings.forEach((value2) => {
           if (value === value2) {
               currentCount++;
           } 
        });
        result.push(currentCount);
        currentCount = 0;
    });
    
    console.log(result);
    return result;
}

function matchingStringsWithMap(strings, queries) {
    // If you want to create a new array with new values given an existing array you should use map function instead,
    // because map allocates memory and stores the return value in the "callback" function.

    const result = queries.map((q) => {
        // The filter() method creates a new array with array elements that passes a test.
        // Not sure if this filter option here is the best option.
        return strings.filter((s) => s === q).length;
    });

    console.log(result);
    return result;
}

function lonelyinteger(a) {
    //
    if (a.length === 1) return a[0];

    while (a.length > 0) {
        let value = a[0];
        let pos = a.indexOf(value, 1);
        //console.log('pos: ' + pos);
        if (pos === -1) {
            console.log(value);
            return value;
        } else {
            a.shift();
            a.splice(pos - 1, 1);
        }
    }
    
    return -1;
}

function flippingBits(n) {
    let binary = n.toString(2);
    //console.log(binary);
    let result = '';

    while (binary.length != 32) {
        binary = '0' + binary;
    }

    for (let i = 0; i < 32; i++) {
        if (binary.charAt(i) === '0') {
            result += '1';
        } else {
            result += '0';
        }
        // Could have done below instead
        // result += binary.charAt(i) === '0' ? '1' : '0';
    }

    console.log(parseInt(result, 2));
    return parseInt(result, 2);
}

function diagonalDifference(arr) {
    let size = arr[0].length;
    let result = 0;
    let diag1 = 0;
    let diag2 = 0;
    
    for (let i = 0; i < size; i++) {
        diag1 += arr[i][i];
        diag2 += arr[size - i - 1][i];
    }
    
    result = Math.abs(diag1 - diag2);
    console.log(result);
    return result;
}

function countingSort(arr) {
    // Write your code here
    const result = [];
    let length = arr.length;
    
    for (let i = 0; i < 100; i++) {
        result[i] = 0;
    }
    
    for (let j = 0; j < length; j++) {
        result[arr[j]]++;
    }

    console.log(result);
    return result;
}

function main() {

    const arr = [1, 2, 3, 4, 5];
    miniMaxSum(arr);

    let s = '07:05:45PM';
    timeConversion(s);
    timeConversion('12:01:00AM');
    timeConversion('12:15:00PM');

    let strings = ['aba', 'baba', 'aba', 'xzxb'];
    let queries = ['aba', 'xzxb', 'ab'];
    matchingStrings(strings, queries);
    matchingStringsWithMap(strings, queries);

    const a = [1, 1, 2];
    lonelyinteger(a);
    lonelyinteger([0, 0, 1, 3, 1]);

    flippingBits(5);

    const arr2 = [[11, 2, 4], [4, 5, 6], [10, 8, -12]];
    diagonalDifference(arr2);

    const arr3 = [63, 25, 73, 1, 98, 73, 56, 84, 86, 57, 16, 83, 8, 25, 81, 56, 9, 53, 98, 67, 99, 12, 83, 89, 80, 91, 39, 86, 76, 85, 74, 39, 25, 90, 59, 10, 94, 32, 44, 3, 89, 30, 27, 79, 46, 96, 27, 32, 18, 21, 92, 69, 81, 40, 40, 34, 68, 78, 24, 87, 42, 69, 23, 41, 78, 22, 6, 90, 99, 89, 50, 30, 20, 1, 43, 3, 70, 95, 33, 46, 44, 9, 69, 48, 33, 60, 65, 16, 82, 67, 61, 32, 21, 79, 75, 75, 13, 87, 70, 33];
    countingSort(arr3);

}

main()