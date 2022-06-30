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
	
def findZigZagSequence(a, n):
    # Solution provided by hackerrank, just needed to update in 3 locations
    # first half of the array should be in increasing order and the remaining half in decreasing order
    a.sort()
    mid = int((n + 1)/2) - 1
    a[mid], a[n-1] = a[n-1], a[mid]

    st = mid + 1
    ed = n - 2
    while(st <= ed):
        a[st], a[ed] = a[ed], a[st]
        st = st + 1
        ed = ed - 1

    for i in range (n):
        if i == n-1:
            print(a[i])
        else:
            print(a[i], end = ' ')
    return

def mergeLists(head1, head2):
    # Merge two sorted LinkedLists into another sorted LinkedList
    newList = SinglyLinkedListNode(0)
    if head1.data <= head2.data:
        newList = SinglyLinkedListNode(head1.data)
        head1 = head1.next
    else:
        newList = SinglyLinkedListNode(head2.data)
        head2 = head2.next
        
    pointer = newList
    while head1 is not None or head2 is not None:
        if head1 is not None and head2 is not None:
            if head1.data <= head2.data:
                pointer.next = SinglyLinkedListNode(head1.data)
                pointer = pointer.next
                head1 = head1.next
            else:
                pointer.next = SinglyLinkedListNode(head2.data)
                pointer = pointer.next
                head2 = head2.next
        elif head1 is not None:
            pointer.next = SinglyLinkedListNode(head1.data)
            pointer = pointer.next
            head1 = head1.next
        else:
            pointer.next = SinglyLinkedListNode(head2.data)
            pointer = pointer.next
            head2 = head2.next
                
    return newList

if __name__ == "__main__":
	arr = [-4, 3, -9, 0, 4, 1]
	plusMinus(arr)
	
	input('done')