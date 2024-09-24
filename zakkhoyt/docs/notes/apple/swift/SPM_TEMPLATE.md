```sh
MY_PROJECT="SomeProject:

mkdir "$MY_PROJECT"
cd "$MY_PROJECT"

swift package init

# TODO: zakkhoyt - template Package.swift
# TODO: zakkhoyt - template UnifiedLogger.swift
# TODO: zakkhoyt - SwiftFormat, SwiftLint (plugins?)



# TODO: zakkhoyt - README.md
# TODO: zakkhoyt - LICENSE
# TODO: zakkhoyt - .gitignore


cat > test << EOL
line 1, ${kernel}
line 2,
line 3, ${distro}
line 4
line ...
EOL
```


```sh
# Create local git repo
git init
git add .
git commit -m "Initial commit"
# Create a remote repository using name of PWD
gh repo create "$(basename "$PWD")" --source="." --public --push # --team="hatch-mobile"
```

