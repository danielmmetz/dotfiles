// Random-choice randomly selects one filename within the current working directory.
package main

import (
    "fmt"
    "io/ioutil"
    "math/rand"
    "os"
    "time"

    "github.com/pkg/errors"
)

func main() {
    dir, err := os.Getwd()
    if err != nil {
        fmt.Fprintln(os.Stderr, errors.Wrap(err, "unable to retreive working directory"))
        os.Exit(1)
    }
    dirContents, err := ioutil.ReadDir(dir)
    if err != nil {
        fmt.Fprintln(os.Stderr, errors.Wrap(err, "unable to read directory"))
    }

    var files []os.FileInfo
    for _, f := range dirContents {
        if !f.IsDir() {
            files = append(files, f)
        }
    }

    rand.Seed(time.Now().UnixNano())
    choiceIdx := rand.Intn(len(files))
    choice := files[choiceIdx]
    fmt.Println(choice.Name())
}
