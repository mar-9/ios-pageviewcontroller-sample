# ios-pageviewcontroller-sample

## Overview
This is a sample of PageViewController navigated by swipe gesture and button action.
<img src="/ScreenShot1.png" width="240px">


### history

* Added delay processing to suppress flicker.
* Prevent repeated button presses to avoid the following errors.
```
'NSInternalInconsistencyException', reason: 'Unexpected view controller: ...'
```