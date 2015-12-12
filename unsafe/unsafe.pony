
use "path:/usr/local/lib"
use "lib:pony-unsafe"

primitive Unsafe
  fun null[A = Any tag](): A =>
    obj_from_id[A](0)
  
  fun obj_id(ptr: Any tag): USize =>
    @pony_unsafe_obj_id[USize](ptr)
  
  fun obj_from_id[A = Any tag](id: USize): A =>
    @pony_unsafe_obj_from_id[A](id)
  
  fun _get_main[A = Any tag](): A =>
    @pony_unsafe_get_main[A]()
  
  fun _set_main(ptr: Any tag) =>
    @pony_unsafe_set_main[None](ptr)
  
  fun _get_main_id(): USize =>
    @pony_unsafe_get_main_id[USize]()
  
  fun get_main[A = Any tag](): A? =>
    if _get_main_id() == 0 then error end
    _get_main[A]()
  
  fun set_main(ptr: Any tag)? =>
    if _get_main_id() != 0 then error end
    _set_main(ptr)
