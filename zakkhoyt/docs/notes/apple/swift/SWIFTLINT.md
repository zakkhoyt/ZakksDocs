

# Custom Rules

```sh
sourcekitten syntax --text "struct S {}"
sourcekitten syntax --text "/// A wrapper around a UserDefaults suite for the current user"



sourcekitten syntax --text "struct S {" \
"}"


sourcekitten syntax --text "fileprivate func remove(
    for macAddress: String,
    from defaults: AppStateAPI
) {
    defaults.removeObject(forKey: key(for: macAddress))
}"
```