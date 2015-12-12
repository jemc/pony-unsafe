# pony-unsafe

Pony utility library for completely wrecking the memory safety of the Pony language.

As much as we love the memory safety guarantees of the Pony language, it can sometimes save valuable development time to temporarily bend the rules a bit inside an otherwise strict system. This library is designed to be useful for bootstrapping various forms of introspection and prototyping in order to speed up development and debugging. It is *not* intended for use in production applications or libraries, and such use should be regarded as an "anti-pattern".
