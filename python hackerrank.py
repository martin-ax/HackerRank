#python hackerrank.py
#for HackerRank practice

def plusMinus(arr):
    # Given an array of integers, calculate the ratios of its elements that are positive, negative, and zero.
    # Print the decimal value of each fraction on a new line with  places after the decimal.
    length = len(arr)
    positives = 0
    negatives = 0
    zeroes = 0
    
    for n in arr:
        if n == 0:
            zeroes += 1
        elif n > 0:
            positives += 1
        else:
            negatives += 1
            
    positiveRatio = str(positives / length)
    negativeRatio = str(negatives / length)
    zeroesRatio = str(zeroes / length)

    while len(positiveRatio) < 7:
        positiveRatio += '0'
    print(positiveRatio[0:7])

    while len(negativeRatio) < 7:
        negativeRatio += '0'
    print(negativeRatio[0:7])

    while len(zeroesRatio) < 7:
        zeroesRatio += '0'
    print(zeroesRatio[0:7])
	

if __name__ == "__main__":
	arr = [-4, 3, -9, 0, 4, 1]
	plusMinus(arr)
	
	input('done')