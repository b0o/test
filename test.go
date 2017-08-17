package main

import "fmt"

func f(n int, l int) []int {
	var result []int
	for i := 0; i <= n; i++ {
		for j := 0; j < l; j++ {
			result = append(result, i)
		}
	}
	return result
}

func main() {
	x := f(10000, 10000)
	fmt.Println(len(x))
}
