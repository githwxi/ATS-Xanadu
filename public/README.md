# ATS-Xanadu presentation website

A standalone, responsive website built with HTML, CSS, and JavaScript. No build step or dependencies are required. Content is based on the repository's root and `srcgen2` READMEs.

Open `index.html` directly, or serve from the repository root:

```sh
python3 -m http.server 8000 --directory public
```

Visit http://localhost:8000. Deploy the contents of `public` to any static host. Google Fonts is optional; local font fallbacks work offline. The clipboard button works on localhost and HTTPS, with manual selection as a fallback.
