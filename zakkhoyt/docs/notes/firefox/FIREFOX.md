
# Custom Search Engine
* In extensions toolbar button click only `Add custom search engine`
  * Fill out the form using `%s` for the search term
  * Click `Add`
  * Right click on the address bar to add the engine 
  * validate


# Developer Tools
* [Documentation](https://firefox-source-docs.mozilla.org/devtools-user/)
* [Firefox-dev](https://firefox-dev.tools/)


## Keyboard Shortcuts / Hotkeys 
* [Documentation / All Keyboard Shortcuts](https://firefox-source-docs.mozilla.org/devtools-user/keyboard_shortcuts/index.html)
* Element Picker: <kbd>cmd</kbd> + <kbd>shift</kbd> + <kbd>c</kbd>
* Responsive Design Mode: <kbd>cmd</kbd> + <kbd>opt</kbd> + <kbd>m</kbd>
* Open Debugger: <kbd>ctrl</kbd> + <kbd>shift</kbd> + <kbd>z</kbd>
* Open Profiler: Shift + F5
* Open Style Editor: Shift + F7
* Open Storage: Shift + F9
* Parent process Browser Console: cmd shift j


# Extensions / AddOns

## Sidebury

## Treestyle Tabs

## Ublock

---

# Hide the top tabs and stoplight buttons

## Find your profile folder: 
* Help -> More Troubleshooting Information
* Find `Profile Folder` then copy the path
* It should look something like this: `$HOME/Library/Application Support/Firefox/Profiles/abcd1234.default-release`

## chrome/userChrome.css

* In your profile folder, create a directory named `chrome`
* In the `chrome` dir, create a file named `userChrome.css`
* Fill the file with this content:
```css
/* Must set toolkit.legacyUserProfileCustomizations.stylesheets= true in about:config */

/* Does not hide the stoplight buttons */
/* #tabbrowser-tabs { visibility: collapse !important; } */

/* Hides the stoplight buttons */
#TabsToolbar { visibility: collapse !important; }

/* Hides the label above the side tabs */
#sidebar-header {
  display: none;
}
```

## about:config

* Open a new Firefox tab
* In the nav bar type: `about:config`
* Change the value under `toolkit.legacyUserProfileCustomizations.stylesheets` to `true`

## Restart Firefox
* Kill Firefox then restart. 
* You should no longer see the tabs at the top


