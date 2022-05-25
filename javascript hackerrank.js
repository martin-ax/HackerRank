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

}

main()