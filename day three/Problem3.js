const regex = /mul\((\d{1,3}),(\d{1,3})\)/g
const readline = require('node:readline')

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout,
});
function partOne() {

    rl.question("part one: ", input => console.log(input.match(regex).map(x => x.split(",").map(y => y.replaceAll(/[^\d]/gi, ""))).map(y => +y[0] * +y[1]).reduce((x, y) => x + y, 0)))
};
function partTwo() {
    rl.question("part two: ", input =>
        console.log(input.replaceAll(/don\'t\(\).*?(do\(\)|$)/gi, "").match(regex).map(x => x.split(",").map(y => y.replaceAll(/[^\d]/gi, ""))).map(y => +y[0] * +y[1]).reduce((x, y) => x + y, 0)))
}
partTwo()