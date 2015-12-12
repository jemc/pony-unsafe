
#include <stdint.h>

uintptr_t pony_aa_obj_id(void *ptr) {
  return (uintptr_t)ptr;
}

void *pony_aa_obj_from_id(uintptr_t id) {
  return (void *)id;
}

static void *s_ptr = 0;

uintptr_t pony_aa_get_main_id() {
  return (uintptr_t)s_ptr;
}

void *pony_aa_get_main() {
  return s_ptr;
}

void pony_aa_set_main(void *ptr) {
  s_ptr = ptr;
}
