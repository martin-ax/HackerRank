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

function main() {

    const arr = [1, 2, 3, 4, 5];
    miniMaxSum(arr);

}

main()