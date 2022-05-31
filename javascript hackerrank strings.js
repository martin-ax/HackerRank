//javascript hackerrank strings.js

'use strict';

function anagram(s) {
    // This would be O(n^2) probably because of the map.has() operation
    // Can do an array and have charCodeAt() to get the ASCII number value
    if (s.length % 2 != 0) return -1;
    
    let result = 0;
    let sLength = s.length;
    let part1 = s.substring(0, sLength / 2);
    let part2 = s.substring(sLength / 2, sLength);
    
    const letters = new Map();
    
    for (let i = 0, length1 = part1.length, current = ''; i < length1; i++){
        current = part1.charAt(i);
        if (!letters.has(current)) {
            letters.set(current, 1);
        } else {
            letters.set(current, letters.get(current) + 1);
        }
    }
    
    for (let i = 0, length2 = part2.length, current = ''; i < length2; i++) {
        current = part2.charAt(i);
        if (!letters.has(current)) {
            result++;
        } else {
            let counter = letters.get(current);
            if (counter - 1 === 0) {
                letters.delete(current);
            } else {
                letters.set(current, counter - 1);
            }
        }
    }
    
    return result;
}

var isValid = function(s) {
    // leetcode
    const stack = [];
    
    for (let i = 0, length = s.length; i < length; i++) {
        let current = s.charAt(i);
        if (current === '(' || current === '{' || current === '[') {
            stack.push(current);
        } else {
            switch (current) {
                case ')':
                    if (stack[stack.length - 1] === '(') {
                        stack.pop();
                    } else {
                        return false;
                    }
                    break;
                case '}':
                    if (stack[stack.length - 1] === '{') {
                        stack.pop();
                    } else {
                        return false;
                    }
                    break;
                case ']':
                    if (stack[stack.length - 1] === '[') {
                        stack.pop();
                    } else {
                        return false;
                    }
                    break;
                default:
                    return false;
            }
        }
    }
    
    if (stack.length > 0) return false;
    return true;
};

function gemstones(arr) {
    // This way doesn't use Sets or Maps
    // Probably better to use those two, .has is O(1)
    
    let gems = 0;
    let counter = 0;
    
    const dict = [];
    for (let i = 0, length = arr[0].length, s = arr[0]; i < length; i++) {
        dict[s.charCodeAt(i)] = 1;
    }
    counter++;

    for (let i = 1, length = arr.length; i < length; i++) {
        for (let j = 0, sLength = arr[i].length, s = arr[i]; j < sLength; j++) {
            if (dict[s.charCodeAt(j)] !== undefined && dict[s.charCodeAt(j)] == counter) { // wrong
                dict[s.charCodeAt(j)]++;
            }
        }
        counter++;
    }
    console.log(counter);
    console.log(dict);
    
    for (let i = 0, length = dict.length; i < length; i++) {
        if (dict[i] === counter) {
            gems++;
        }
    }
    
    return gems;
}

function main() {
    anagram('abccde');

    gemstones(['abcdde', 'baccd', 'eeabg']);
}

main();