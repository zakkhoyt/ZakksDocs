# 

* [Setup Article](https://dev.to/ar2pi/publish-your-markdown-docs-on-github-pages-6pe)
* [mkdocs docs](https://www.mkdocs.org/user-guide/configuration/)
```sh
mkdocs serve &
sleep 2
open http://127.0.0.1:8000
```
## Pages

* [Markdown landing page](https://zakkhoyt.github.io/ZakksDocs/zakkhoyt/site/index.html)
* [Notes](https://zakkhoyt.github.io/ZakksDocs/zakkhoyt/site/notes/)


```sh
# cat /Users/zakkhoyt/code/repositories/z2k/github/kk_notes/zakkhoyt/docs/notes/index.md | sed -E 's|[^/]||g' | xargs -I {} echo {} | awk '{ print length }'
# cat /Users/zakkhoyt/code/repositories/z2k/github/kk_notes/zakkhoyt/docs/notes/index.md | sed -E 's|[^/]||g' | awk '{ print (length-1)/2}'

# eza -Td .
# find . -type d -exec printf "# %s\n" {} \;
# eza -TD . | sed -E 's/[ ├─└│]/ /g'
# ls -D1 **/* | grep -E ":$" | sort -d | sed -E 's/:$//g' | xargs -I {} printf "# %s\n" "{}" > zakkhoyt/docs/notes/index.html

pushd zakkhoyt/docs/notes
ls -D1 **/* | grep -E ":$" | sort -d | sed -E 's/:$//g' | xargs -I {} printf "# %s\n" "{}" > index.html
popd
```

```sh
find . -type f -name "*.md" -exec printf " - [%s](%s)\n" {} {} \;
```
