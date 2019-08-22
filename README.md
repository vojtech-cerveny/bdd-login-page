# BDD testing of Login page Seznam
Functional tests for check login page. Written in BDD + python

## Intro
* Test scenarios are written in BDD language. 
    * Non-functional tests are described here too, for greater clarity
    * Page Object Pattern is used - so far only for locators.
* Tests for login are implemented (`login.feature`)
* Tests for localization are described, not implemented yet

## Requirements
* `python3`, `pip`, `Chrome`

## Installation 
`virtualenv -p python3 venv && source venv/bin/activate && pip install -r requirements.txt`

## Usage
execute `behave --tags=-skip` to execute tests (excluded all tests with tag `@skip`)
