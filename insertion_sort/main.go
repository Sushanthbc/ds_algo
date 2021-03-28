package main

import (
	"fmt"
)

func main() {
	arr := []int{5, 7, 1, 2, 3}

	for i := 1; i < len(arr); i++ {
		key := arr[i]
		j := i - 1

		for j >= 0 && arr[j] > key {
			arr[j+1] = arr[j]
			j--
		}
		arr[j+1] = key
	}

	for i := 0; i < len(arr); i++ {
		fmt.Printf("%d\n", arr[i])
	}

}
