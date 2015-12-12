
#include <stdint.h>

uintptr_t pony_unsafe_obj_id(void *ptr) {
  return (uintptr_t)ptr;
}

void *pony_unsafe_obj_from_id(uintptr_t id) {
  return (void *)id;
}

void *pony_unsafe_cast(void *ptr) {
  return ptr;
}

static void *s_ptr = 0;

uintptr_t pony_unsafe_get_main_id() {
  return (uintptr_t)s_ptr;
}

void *pony_unsafe_get_main() {
  return s_ptr;
}

void pony_unsafe_set_main(void *ptr) {
  s_ptr = ptr;
}
