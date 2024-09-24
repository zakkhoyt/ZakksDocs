

## Export dependencies as a .dot file
```sh
swift package show-dependencies \
  --package-path HatchSleep \
  --format dot \
  --output-path .gitignored/HatchSleep.dot 
```

## Convert a `swift package show-dependencies` to something we can plot
```sh
cat .gitignored/HatchSleep.dot \
| sed -E "s/\/Users\/zakkhoyt\/code\/repositories\/hatch\/hatch-sleep\/[0-9]\///g" \
| sed -E "s/(ThirdParty[a-zA-Z0-9\/\.\-_]*)(\/)([a-zA-Z0-9\/\.\-_]*)(\"|\\\\n)/\3\4/g" \
| sed -E "s/((https:\/\/|git@)[a-zA-Z0-9:\/\.\-]*\/)([a-zA-Z0-9_\.\-]+)(\"|\\\\n)/\3\4/g" \
| sed -E "s/(label=\")([a-zA-Z0-9_.-]*\\\\n)/\1/g" \
| sed -E "s/\.git//g" \
| sed -E "s/\\\\nunspecified//g" \
> .gitignored/HatchSleep_first_party.dot 
```



