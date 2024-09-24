
# 1
`/usr/bin/time -h -p -l bundle exec fastlane lint_swiftlint`

```sh
real 11.30
user 4.02
sys 9.46
```


`$ /usr/bin/time -h -p -l ~/.mint/bin/swiftlint`
```sh
real 8.34
user 2.68
sys 8.68
```

# 2
`/usr/bin/time -h -p -l bundle exec fastlane lint_swiftlint`

```sh
real 3.23
user 1.59
sys 0.93
```

`$ /usr/bin/time -h -p -l ~/.mint/bin/swiftlint`
```sh
real 0.68
user 1.66
sys 0.39
```
