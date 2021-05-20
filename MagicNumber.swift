/* This program prints out
   the Magic Sqaures.

   Sean McLeod
   2021/05/12
*/

func GenSquare(square: [Int], currentSquare: [Int], index: Int) {
    // generate the magic sqaure
    var square = square
    var currentSquare = currentSquare
    for counter in 0..<9 {
        if (currentSquare[counter] == 0) {
            square[index] = counter + 1
            currentSquare[counter] = 1
            if (index < square.count - 1) {
                GenSquare(square: square, currentSquare: currentSquare, index: index + 1);
            } else if (IsMagic(preSquare: square)) {
                /* when ready, check if the sqaures is
                a magic sqaure, and print the sqaure */
                PrintMagicSquare(outputSquare: square)
            }
            currentSquare[counter] = 0;
        }
    }
}

func IsMagic(preSquare:[Int]) -> Bool {
    let MAGICNUM = 15

    let row1 = preSquare[0] + preSquare[1] + preSquare[2]
    let row2 = preSquare[3] + preSquare[4] + preSquare[5]
    let row3 = preSquare[6] + preSquare[7] + preSquare[8]
    let col1 = preSquare[0] + preSquare[3] + preSquare[6]
    let col2 = preSquare[1] + preSquare[4] + preSquare[7]
    let col3 = preSquare[2] + preSquare[5] + preSquare[8]
    let diag1 = preSquare[0] + preSquare[4] + preSquare[8]
    let diag2 = preSquare[2] + preSquare[4] + preSquare[6]

    return row1 == MAGICNUM && row2 == MAGICNUM && row3 == MAGICNUM
           && col1 == MAGICNUM && col2 == MAGICNUM && col3 == MAGICNUM
           && diag1 == MAGICNUM && diag2 == MAGICNUM
}

func PrintMagicSquare(outputSquare: [Int]) {
    // prints inputted array in a magic square format
    print("\n*****")
    for item in 0..<outputSquare.count {
        if (item == 3 || item == 6) {
            print("")
            print(outputSquare[item], terminator:" ")
        } else {
            print(outputSquare[item], terminator:" ")
        }
    }
    print("\n*****")
}

// main stub, get user input here
print("All Possible Magic Squares (3x3):\n")
var magicSquare = Array(1...9)
var extraArray = [Int](repeating: 0, count: 9)
GenSquare(square: magicSquare, currentSquare: extraArray, index: 0)
