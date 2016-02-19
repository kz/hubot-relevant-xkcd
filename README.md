# hubot-relevant-xkcd

Find a relevant XKCD for a phrase

Based on: https://github.com/github/hubot-scripts/blob/master/src/scripts/xkcd.coffee

See [`src/relevant-xkcd.coffee`](src/relevant-xkcd.coffee) for full documentation.

## Installation

In hubot project repo, run:

`npm install hubot-relevant-xkcd --save`

Then add **hubot-relevant-xkcd** to your `external-scripts.json`:

```json
[
  "hubot-relevant-xkcd"
]
```

## Sample Interaction

```
user>> hubot relevant xkcd compiling
hubot>> Compiling
http://imgs.xkcd.com/comics/compiling.png
'Are you stealing those LCDs?' 'Yeah, but I'm doing it while my code compiles.'
```
