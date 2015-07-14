coffeelint-ensure-named-args
==============================

A CoffeeLint rule that prohibits calling a function without first naming each argument.

Description
-----------

This [CoffeeLint](http://www.coffeelint.org/) rule forbids calling a function without first naming each argument.

For example, `myFunc(name = 'Bob')` is OK, but `myFunc('Bob')` forbidden.

Installation
------------

```sh
npm install coffeelint-ensure-named-args
```

Usage
-----

Add the following configuration to `coffeelint.json`:

```json
"ensure-named-args": {
  "module": "coffeelint-ensure-named-args"
}
```
