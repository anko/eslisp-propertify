# eslisp-propertify

An [eslisp][1] macro that rewrites atoms containing dots to property accesses.
This means you can write `x.y` instead of `(. x y)`.

Probably reasonable to wrap your whole program with it, but you choose.

## Example

    (macro propertify (require "/path/to/elisp-propertify/index.js"))
    (propertify (a.b 42))

↓

    a.b(42);

See [the tests][2] for fuller usage.

## License

[ISC][3].

[1]: https://www.npmjs.com/package/eslisp
[2]: test.esl
[3]: http://opensource.org/licenses/ISC
