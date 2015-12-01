Vimux plugin for running nose test. Similar to [vimux-ruby-test](https://github.com/pgr0ss/vimux-ruby-test)

## Requirements

- vim
- [vimux](https://github.com/benmills/vimux) (0.3.0 or greater)

## Installation

It's pathogen compliant, so just drop in your bundle directory

## Commands

- RunNoseTest - runs all the nose tests
- RunNoseTestBuffer - runs all the nose tests in the current file
- RunNoseTestFocused - runs the current test under the cursor (requires nose-run-line-number)

## Configuration

- NoseVirtualenv - the path to your virtualenv activate file e.g. ```.env/bin/actviate```
