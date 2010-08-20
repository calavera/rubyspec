#ifndef RUBYSPEC_CAPI_MRI_H
#define RUBYSPEC_CAPI_MRI_H

/* #undef any HAVE_ defines that MRI does not have. */
#undef HAVE_RB_HASH_LOOKUP
#undef HAVE_RB_HASH_SIZE

#undef HAVE_RB_OBJ_FROZEN_P

#undef HAVE_RB_STR_PTR
#undef HAVE_RB_STR_PTR_READONLY

#undef HAVE_THREAD_BLOCKING_REGION

#ifdef RUBY_VERSION_IS_1_9
#undef HAVE_RB_CVAR_SET
#undef HAVE_RB_SET_KCODE
#endif

/* Macros that may not be defined in old versions */
#ifndef RARRAY_PTR
#define RARRAY_PTR(s) (*(VALUE *const *)&RARRAY(s)->ptr)
#endif

#ifndef RARRAY_LEN
#define RARRAY_LEN(s) (*(const long *)&RARRAY(s)->len)
#endif

#ifndef RFLOAT_VALUE
#define RFLOAT_VALUE(v) (RFLOAT(v)->value)
#endif

#endif
