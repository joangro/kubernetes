package main

import (
	"fmt"
	"net/http"
	"os"
	"log"
)

func reqHandler(w http.ResponseWriter, req *http.Request) {
		fmt.Fprintf(w, "Hello world!")
}

func main(){

	svid := os.Getenv("SERVICE_ID")

	fmt.Println("Running server... \n" + svid)


	http.HandleFunc("/", reqHandler)

	log.Fatal(http.ListenAndServe(":8080", nil))
}
