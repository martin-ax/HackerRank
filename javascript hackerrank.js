//javascript hackerrank.js

'use strict';

/*
    Return the smallest and biggest sum with 4 out of 5 numbers from the array input.
*/
function miniMaxSum(arr) {
    // Write your code here
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
    // Write your code here
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

function main() {

    const arr = [1, 2, 3, 4, 5];
    miniMaxSum(arr);

    let s = '07:05:45PM';
    timeConversion(s);
    timeConversion('12:01:00AM');
    timeConversion('12:15:00PM');

}

main()