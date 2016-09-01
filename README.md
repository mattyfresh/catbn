# CATBN
This is a static site (currently) for Carter and the Bad News

```
install Elm
run elm-make
have your mind blown
```

This command is nifty for recompiling your Elm code on save:
`fswatch Main.elm | xargs -n1 -I{} elm-make --output main.js {}`

It takes in an elm file using `fswatch`, which you can find via your preferred package manager
(I used `homebrew`), and then compiles a JS file for you to include on your page 
