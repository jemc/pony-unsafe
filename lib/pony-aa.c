
#include <stdint.h>

uint64_t pony_aa_obj_id(void *ptr) {
  return (uint64_t)ptr;
}

void *pony_aa_obj_from_id(uint64_t id) {
  return (void *)id;
}

static void *s_ptr = 0;

uint64_t pony_aa_get_main_id() {
  return (uint64_t)s_ptr;
}

void *pony_aa_get_main() {
  return s_ptr;
}

void pony_aa_set_main(void *ptr) {
  s_ptr = ptr;
}
