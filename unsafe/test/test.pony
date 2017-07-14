
use "ponytest"
use ".."

actor Main is TestList
  new create(env: Env) =>
    let test = PonyTest(env, this)
  
  fun tag tests(test: PonyTest) =>
    test(_TestUnsafe)


class SomeClass

class _TestUnsafe is UnitTest
  var _foo: String = "foo"
  
  fun name(): String => "unsafe/Unsafe"
  fun foo(): String => _foo
  
  fun apply(h: TestHelper) ? =>
    h.assert_eq[USize](Unsafe.obj_id(this), Unsafe.obj_id(this))
    h.assert_eq[USize](Unsafe.obj_id(h), Unsafe.obj_id(h))
    h.assert_false(Unsafe.obj_id(this) == Unsafe.obj_id(h))
    
    let this_id = Unsafe.obj_id(this)
    h.assert_true(Unsafe.obj_from_id[Any](this_id) is this, "obj_from_id[Any]")
    h.assert_true(Unsafe.obj_from_id[this->_TestUnsafe](this_id) is this, "obj_from_id")
    
    let obj_iso: SomeClass iso = recover SomeClass end
    let obj_tag: SomeClass tag = obj_iso
    let obj_val: SomeClass val = consume obj_iso
    h.assert_true(obj_tag is Unsafe.cast_as[SomeClass iso, SomeClass val](obj_val), "cast_as[SomeClass iso]")
    
    h.assert_error({()? => Unsafe.get_main[Any]() }, "get_main NULL")
    Unsafe.set_main(this)
    h.assert_true(Unsafe.get_main[Any]() is this, "get_main[Any]")
    h.assert_true(Unsafe.get_main[this->_TestUnsafe]() is this, "get_main")
    h.assert_error({()? => Unsafe.set_main(this) }, "set_main again")
    
    true
