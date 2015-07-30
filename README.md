# pony-aa

Pony utility library for providing ways to opt-in to forms of ambient authority otherwise disallowed for the Pony runtime.

As much as [we desire to avoid ambient authority](http://tutorial.ponylang.org/capabilities/object-capabilities/#what-about-global-variables), it can sometimes save valuable development time to temporarily bend the rules a bit inside an otherwise strict system. This library is designed to be useful for bootstrapping various forms of introspection and prototyping in order to speed up development and debugging. It is *not* intended for use in production applications or libraries, and such use should be regarded as an "anti-pattern".
