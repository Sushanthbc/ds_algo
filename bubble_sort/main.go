package main

import (
	"fmt"
)

func swapElements(element1 *int, element2 *int) {
	temp := *element1
	*element1 = *element2
	*element2 = temp
}

func main() {

	unsortedElement := []int{5, 1, 4, 2, 8}

	for i := 0; i < len(unsortedElement); i++ {
		for j := 0; j < (len(unsortedElement) - i - 1); j++ {
			if unsortedElement[j] > unsortedElement[j+1] {
				swapElements(&unsortedElement[j], &unsortedElement[j+1])
			}

		}
	}
	for i := 0; i < len(unsortedElement); i++ {
		fmt.Printf("%d\n", unsortedElement[i])
	}

}
