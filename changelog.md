
### initial commit: 20190426:0920

Create a new Elm App using [parcel](https://parceljs.org/).

Development environment:

```
$ nvm --version
0.34.0
$ nvm use
Found '/Users/stephen/dev/elm/sandbox/elm-app-built-with-parcel/.nvmrc' with version <10.15.3>
Now using node v10.15.3 (npm v6.4.1)
$ elm --version
0.19.0


Following: [Building an Elm project with Parcel](https://benpaulhanna.com/building-an-elm-project-with-parcel.html)

```
% mkdir elm-parcel-app1
% cd elm-parcel-app1
% npm init
% npm install --save parcel

+ parcel@1.12.3
added 794 packages from 544 contributors and audited 8160 packages in 22.912s
found 0 vulnerabilities

% mkdir src
```
Add files:

1. `src/index.html`
2. `src/Main.elm`
3. `src/main.js`
4. `.gitignore`

```
% npx parcel src/index.html
Server running at http://localhost:54592 - configured port 1234 could not be used.
✨  Built in 6ms.
```

Open localhost url in browser. Browser will hot-reload when changes are saved.
