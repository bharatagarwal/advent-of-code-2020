package main

import (
	"fmt"
	"io/ioutil"
	// "sort"
	"strings"
)
// read the input from the given file

func main() {
	input, _ := ioutil.ReadFile("input.txt")
	fmt.Println(string(input)) // gives byte slices
	stringArray := strings.Split(string(input), "\n")
	fmt.Println(stringArray)

	integerArray := make([]int, len(stringArray))
	fmt.Println(integerArray)

	for i := 0; i < len(stringArray); i++ {
		integerArray[i] = int(stringArray[i])
	}

}