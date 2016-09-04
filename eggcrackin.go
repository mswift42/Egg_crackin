package eggcrackin

import (
	"fmt"
	"io/ioutil"
	"net/http"
	"strings"

	"google.golang.org/appengine"
	"google.golang.org/appengine/urlfetch"
)

func init() {
	http.HandleFunc("/searchrecipe", getRecipes)
}

const (
	apiKey  = "7987c43afcf8a03a964bbcb0c9152c84"
	baseURL = "http://food2fork.com/api/search?key="
)

func getRecipes(w http.ResponseWriter, r *http.Request) {
	w.Header().Add("Content-Type", "application/json")
	query := r.FormValue("query")
	page := r.FormValue("page")
	url := searchURL(query)
	if page != "" {
		url += "&page=" + page
	}
	ctx := appengine.NewContext(r)
	client := urlfetch.Client(ctx)
	recipes, err := client.Get(url)
	if err != nil {
		fmt.Fprintf(w, err.Error(), http.StatusInternalServerError)
	}
	body, err := ioutil.ReadAll(recipes.Body)
	if err != nil {
		http.Error(w, "couldn't read get request body", http.StatusInternalServerError)
	}
	fmt.Fprintf(w, string(body))
}

func searchURL(query string) string {
	return baseURL + apiKey + "&q=" + strings.Replace(query, " ", "+", -1)
}
