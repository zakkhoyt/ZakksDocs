You can inspect what has been packaged into your binary (release configuration too). Locate your binary then use the `nm` tool

```sh
# list all symbol names (raw)
nm ./echo_pretty 
nm ./echo_pretty | wc -l

# only global symbols, just names, Add path name. 
nm ./echo_pretty -gjA
```