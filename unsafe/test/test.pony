
use "ponytest"
use ".."

actor Main is TestList
  new create(env: Env) =>
    let test = PonyTest(env, this)
  
  fun tag tests(test: PonyTest) =>
    test(_TestUnsafe)

class _TestUnsafe is UnitTest
  var _foo: String = "foo"
  
  fun name(): String => "unsafe/Unsafe"
  fun foo(): String => _foo
  
  fun apply(h: TestHelper): TestResult? =>
    h.expect_eq[USize](Unsafe.obj_id(this), Unsafe.obj_id(this))
    h.expect_eq[USize](Unsafe.obj_id(h), Unsafe.obj_id(h))
    h.expect_false(Unsafe.obj_id(this) == Unsafe.obj_id(h))
    
    let this_id = Unsafe.obj_id(this)
    h.expect_true(Unsafe.obj_from_id[Any](this_id) is this, "obj_from_id[Any]")
    h.expect_true(Unsafe.obj_from_id[this->_TestUnsafe](this_id) is this, "obj_from_id")
    
    h.expect_error(lambda()? => Unsafe.get_main[Any]() end, "get_main NULL")
    Unsafe.set_main(this)
    h.expect_true(Unsafe.get_main[Any]() is this, "get_main[Any]")
    h.expect_true(Unsafe.get_main[this->_TestUnsafe]() is this, "get_main")
    h.expect_error(lambda()? => Unsafe.set_main(this) end, "set_main again")
    
    true
