package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
)

func reqHandler(w http.ResponseWriter, req *http.Request) {
	svid := os.Getenv("SERVICE_ID")
	fmt.Fprintf(w, svid)
}

func main() {

	fmt.Println("Running server... \n")

	http.HandleFunc("/", reqHandler)

	log.Fatal(http.ListenAndServe(":8080", nil))
}
