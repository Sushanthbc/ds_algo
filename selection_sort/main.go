package main

import (
	"fmt"
)

func swap(a *int, b *int) {
	temp := *a
	*a = *b
	*b = temp
}

func main() {
	arr := []int{4, 10, 2, 5, 1}
	for i := 0; i < len(arr); i++ {
		tempIdx := i
		for j := i + 1; j < len(arr); j++ {
			if arr[j] < arr[tempIdx] {
				swap(&arr[j], &arr[tempIdx])
			}
		}
	}

	for i := 0; i < len(arr); i++ {
		fmt.Printf("%d\n", arr[i])
	}
}
