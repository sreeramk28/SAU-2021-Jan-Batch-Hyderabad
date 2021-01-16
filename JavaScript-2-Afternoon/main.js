// custom reduce function
const reduce = function(arr, fn, accumulator) {
    for (let i = 0; i < arr.length; i++) {
        accumulator = fn(accumulator, arr[i]);
    }
    return accumulator;
}

let a = [4, 6, 9, 0, -1];

// sum of elements of list
let sum = reduce(a, (x, y) => x + y, 0);
console.log(sum);

// max of list elements
let max = reduce(a, (x, y) => Math.min(x, y), a[0]);
console.log(max);