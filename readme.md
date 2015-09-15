# eslisp-propertify

An [eslisp][1] macro that rewrites its input forms' atoms that contain dots
into property accesses.  This means you can write `x.y.1` instead of `(. x y
1)`.

Ignores trailing and leading dots, and atoms that consist of dots.

## Example

    (macro propertify (require "/path/to/elisp-propertify/index.js"))
    (propertify (a.b 42))

↓

    a.b(42);

See [the tests][2] for fuller usage.

## Full wrap

It's totally reasonable to wrap your whole program in this.  You might want to
do this by e.g. adding a `make` build step that concatenates the appropriate
incantations to the beginning and end of the file whenever compiling an eslisp
code file:

    %.js: %.esl
        @cat $< \
        | sed '1i \
          (macro __propertify (require "eslisp-propertify")) \
          (__propertify' \
        | sed '$$a \
          )' \
        | eslc \
        > $@

## Limitations

If you need a computed member expression, you'll still need the `.` macro: For
example, to get `a.b[b.length]`, you'll need to write `(.  a.b b.length)`.

## License

[ISC][3].

[1]: https://www.npmjs.com/package/eslisp
[2]: test.esl
[3]: http://opensource.org/licenses/ISC
