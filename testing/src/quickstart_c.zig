pub const __builtin_bswap16 = @import("std").zig.c_builtins.__builtin_bswap16;
pub const __builtin_bswap32 = @import("std").zig.c_builtins.__builtin_bswap32;
pub const __builtin_bswap64 = @import("std").zig.c_builtins.__builtin_bswap64;
pub const __builtin_signbit = @import("std").zig.c_builtins.__builtin_signbit;
pub const __builtin_signbitf = @import("std").zig.c_builtins.__builtin_signbitf;
pub const __builtin_popcount = @import("std").zig.c_builtins.__builtin_popcount;
pub const __builtin_ctz = @import("std").zig.c_builtins.__builtin_ctz;
pub const __builtin_clz = @import("std").zig.c_builtins.__builtin_clz;
pub const __builtin_sqrt = @import("std").zig.c_builtins.__builtin_sqrt;
pub const __builtin_sqrtf = @import("std").zig.c_builtins.__builtin_sqrtf;
pub const __builtin_sin = @import("std").zig.c_builtins.__builtin_sin;
pub const __builtin_sinf = @import("std").zig.c_builtins.__builtin_sinf;
pub const __builtin_cos = @import("std").zig.c_builtins.__builtin_cos;
pub const __builtin_cosf = @import("std").zig.c_builtins.__builtin_cosf;
pub const __builtin_exp = @import("std").zig.c_builtins.__builtin_exp;
pub const __builtin_expf = @import("std").zig.c_builtins.__builtin_expf;
pub const __builtin_exp2 = @import("std").zig.c_builtins.__builtin_exp2;
pub const __builtin_exp2f = @import("std").zig.c_builtins.__builtin_exp2f;
pub const __builtin_log = @import("std").zig.c_builtins.__builtin_log;
pub const __builtin_logf = @import("std").zig.c_builtins.__builtin_logf;
pub const __builtin_log2 = @import("std").zig.c_builtins.__builtin_log2;
pub const __builtin_log2f = @import("std").zig.c_builtins.__builtin_log2f;
pub const __builtin_log10 = @import("std").zig.c_builtins.__builtin_log10;
pub const __builtin_log10f = @import("std").zig.c_builtins.__builtin_log10f;
pub const __builtin_abs = @import("std").zig.c_builtins.__builtin_abs;
pub const __builtin_fabs = @import("std").zig.c_builtins.__builtin_fabs;
pub const __builtin_fabsf = @import("std").zig.c_builtins.__builtin_fabsf;
pub const __builtin_floor = @import("std").zig.c_builtins.__builtin_floor;
pub const __builtin_floorf = @import("std").zig.c_builtins.__builtin_floorf;
pub const __builtin_ceil = @import("std").zig.c_builtins.__builtin_ceil;
pub const __builtin_ceilf = @import("std").zig.c_builtins.__builtin_ceilf;
pub const __builtin_trunc = @import("std").zig.c_builtins.__builtin_trunc;
pub const __builtin_truncf = @import("std").zig.c_builtins.__builtin_truncf;
pub const __builtin_round = @import("std").zig.c_builtins.__builtin_round;
pub const __builtin_roundf = @import("std").zig.c_builtins.__builtin_roundf;
pub const __builtin_strlen = @import("std").zig.c_builtins.__builtin_strlen;
pub const __builtin_strcmp = @import("std").zig.c_builtins.__builtin_strcmp;
pub const __builtin_object_size = @import("std").zig.c_builtins.__builtin_object_size;
pub const __builtin___memset_chk = @import("std").zig.c_builtins.__builtin___memset_chk;
pub const __builtin_memset = @import("std").zig.c_builtins.__builtin_memset;
pub const __builtin___memcpy_chk = @import("std").zig.c_builtins.__builtin___memcpy_chk;
pub const __builtin_memcpy = @import("std").zig.c_builtins.__builtin_memcpy;
pub const __builtin_expect = @import("std").zig.c_builtins.__builtin_expect;
pub const __builtin_nanf = @import("std").zig.c_builtins.__builtin_nanf;
pub const __builtin_huge_valf = @import("std").zig.c_builtins.__builtin_huge_valf;
pub const __builtin_inff = @import("std").zig.c_builtins.__builtin_inff;
pub const __builtin_isnan = @import("std").zig.c_builtins.__builtin_isnan;
pub const __builtin_isinf = @import("std").zig.c_builtins.__builtin_isinf;
pub const __builtin_isinf_sign = @import("std").zig.c_builtins.__builtin_isinf_sign;
pub const __has_builtin = @import("std").zig.c_builtins.__has_builtin;
pub const __builtin_assume = @import("std").zig.c_builtins.__builtin_assume;
pub const __builtin_unreachable = @import("std").zig.c_builtins.__builtin_unreachable;
pub const __builtin_constant_p = @import("std").zig.c_builtins.__builtin_constant_p;
pub const __builtin_mul_overflow = @import("std").zig.c_builtins.__builtin_mul_overflow;
pub const wchar_t = c_int;
pub const _Float32 = f32;
pub const _Float64 = f64;
pub const _Float32x = f64;
pub const _Float64x = c_longdouble;
pub const div_t = extern struct {
    quot: c_int,
    rem: c_int,
};
pub const ldiv_t = extern struct {
    quot: c_long,
    rem: c_long,
};
pub const lldiv_t = extern struct {
    quot: c_longlong,
    rem: c_longlong,
};
pub extern fn __ctype_get_mb_cur_max() usize;
pub extern fn atof(__nptr: [*c]const u8) f64;
pub extern fn atoi(__nptr: [*c]const u8) c_int;
pub extern fn atol(__nptr: [*c]const u8) c_long;
pub extern fn atoll(__nptr: [*c]const u8) c_longlong;
pub extern fn strtod(__nptr: [*c]const u8, __endptr: [*c][*c]u8) f64;
pub extern fn strtof(__nptr: [*c]const u8, __endptr: [*c][*c]u8) f32;
pub extern fn strtold(__nptr: [*c]const u8, __endptr: [*c][*c]u8) c_longdouble;
pub extern fn strtol(__nptr: [*c]const u8, __endptr: [*c][*c]u8, __base: c_int) c_long;
pub extern fn strtoul(__nptr: [*c]const u8, __endptr: [*c][*c]u8, __base: c_int) c_ulong;
pub extern fn strtoq(noalias __nptr: [*c]const u8, noalias __endptr: [*c][*c]u8, __base: c_int) c_longlong;
pub extern fn strtouq(noalias __nptr: [*c]const u8, noalias __endptr: [*c][*c]u8, __base: c_int) c_ulonglong;
pub extern fn strtoll(__nptr: [*c]const u8, __endptr: [*c][*c]u8, __base: c_int) c_longlong;
pub extern fn strtoull(__nptr: [*c]const u8, __endptr: [*c][*c]u8, __base: c_int) c_ulonglong;
pub extern fn l64a(__n: c_long) [*c]u8;
pub extern fn a64l(__s: [*c]const u8) c_long;
pub const __u_char = u8;
pub const __u_short = c_ushort;
pub const __u_int = c_uint;
pub const __u_long = c_ulong;
pub const __int8_t = i8;
pub const __uint8_t = u8;
pub const __int16_t = c_short;
pub const __uint16_t = c_ushort;
pub const __int32_t = c_int;
pub const __uint32_t = c_uint;
pub const __int64_t = c_long;
pub const __uint64_t = c_ulong;
pub const __int_least8_t = __int8_t;
pub const __uint_least8_t = __uint8_t;
pub const __int_least16_t = __int16_t;
pub const __uint_least16_t = __uint16_t;
pub const __int_least32_t = __int32_t;
pub const __uint_least32_t = __uint32_t;
pub const __int_least64_t = __int64_t;
pub const __uint_least64_t = __uint64_t;
pub const __quad_t = c_long;
pub const __u_quad_t = c_ulong;
pub const __intmax_t = c_long;
pub const __uintmax_t = c_ulong;
pub const __dev_t = c_ulong;
pub const __uid_t = c_uint;
pub const __gid_t = c_uint;
pub const __ino_t = c_ulong;
pub const __ino64_t = c_ulong;
pub const __mode_t = c_uint;
pub const __nlink_t = c_ulong;
pub const __off_t = c_long;
pub const __off64_t = c_long;
pub const __pid_t = c_int;
pub const __fsid_t = extern struct {
    __val: [2]c_int,
};
pub const __clock_t = c_long;
pub const __rlim_t = c_ulong;
pub const __rlim64_t = c_ulong;
pub const __id_t = c_uint;
pub const __time_t = c_long;
pub const __useconds_t = c_uint;
pub const __suseconds_t = c_long;
pub const __suseconds64_t = c_long;
pub const __daddr_t = c_int;
pub const __key_t = c_int;
pub const __clockid_t = c_int;
pub const __timer_t = ?*anyopaque;
pub const __blksize_t = c_long;
pub const __blkcnt_t = c_long;
pub const __blkcnt64_t = c_long;
pub const __fsblkcnt_t = c_ulong;
pub const __fsblkcnt64_t = c_ulong;
pub const __fsfilcnt_t = c_ulong;
pub const __fsfilcnt64_t = c_ulong;
pub const __fsword_t = c_long;
pub const __ssize_t = c_long;
pub const __syscall_slong_t = c_long;
pub const __syscall_ulong_t = c_ulong;
pub const __loff_t = __off64_t;
pub const __caddr_t = [*c]u8;
pub const __intptr_t = c_long;
pub const __socklen_t = c_uint;
pub const __sig_atomic_t = c_int;
pub const u_char = __u_char;
pub const u_short = __u_short;
pub const u_int = __u_int;
pub const u_long = __u_long;
pub const quad_t = __quad_t;
pub const u_quad_t = __u_quad_t;
pub const fsid_t = __fsid_t;
pub const loff_t = __loff_t;
pub const ino_t = __ino_t;
pub const dev_t = __dev_t;
pub const gid_t = __gid_t;
pub const mode_t = __mode_t;
pub const nlink_t = __nlink_t;
pub const uid_t = __uid_t;
pub const off_t = __off_t;
pub const pid_t = __pid_t;
pub const id_t = __id_t;
pub const daddr_t = __daddr_t;
pub const caddr_t = __caddr_t;
pub const key_t = __key_t;
pub const clock_t = __clock_t;
pub const clockid_t = __clockid_t;
pub const time_t = __time_t;
pub const timer_t = __timer_t;
pub const ulong = c_ulong;
pub const ushort = c_ushort;
pub const uint = c_uint;
pub const u_int8_t = __uint8_t;
pub const u_int16_t = __uint16_t;
pub const u_int32_t = __uint32_t;
pub const u_int64_t = __uint64_t;
pub const register_t = c_long;
pub fn __bswap_16(arg___bsx: __uint16_t) callconv(.C) __uint16_t {
    var __bsx = arg___bsx;
    return @bitCast(__uint16_t, @truncate(c_short, ((@bitCast(c_int, @as(c_uint, __bsx)) >> @intCast(@import("std").math.Log2Int(c_int), 8)) & @as(c_int, 255)) | ((@bitCast(c_int, @as(c_uint, __bsx)) & @as(c_int, 255)) << @intCast(@import("std").math.Log2Int(c_int), 8))));
}
pub fn __bswap_32(arg___bsx: __uint32_t) callconv(.C) __uint32_t {
    var __bsx = arg___bsx;
    return ((((__bsx & @as(c_uint, 4278190080)) >> @intCast(@import("std").math.Log2Int(c_uint), 24)) | ((__bsx & @as(c_uint, 16711680)) >> @intCast(@import("std").math.Log2Int(c_uint), 8))) | ((__bsx & @as(c_uint, 65280)) << @intCast(@import("std").math.Log2Int(c_uint), 8))) | ((__bsx & @as(c_uint, 255)) << @intCast(@import("std").math.Log2Int(c_uint), 24));
}
pub fn __bswap_64(arg___bsx: __uint64_t) callconv(.C) __uint64_t {
    var __bsx = arg___bsx;
    return @bitCast(__uint64_t, @truncate(c_ulong, ((((((((@bitCast(c_ulonglong, @as(c_ulonglong, __bsx)) & @as(c_ulonglong, 18374686479671623680)) >> @intCast(@import("std").math.Log2Int(c_ulonglong), 56)) | ((@bitCast(c_ulonglong, @as(c_ulonglong, __bsx)) & @as(c_ulonglong, 71776119061217280)) >> @intCast(@import("std").math.Log2Int(c_ulonglong), 40))) | ((@bitCast(c_ulonglong, @as(c_ulonglong, __bsx)) & @as(c_ulonglong, 280375465082880)) >> @intCast(@import("std").math.Log2Int(c_ulonglong), 24))) | ((@bitCast(c_ulonglong, @as(c_ulonglong, __bsx)) & @as(c_ulonglong, 1095216660480)) >> @intCast(@import("std").math.Log2Int(c_ulonglong), 8))) | ((@bitCast(c_ulonglong, @as(c_ulonglong, __bsx)) & @as(c_ulonglong, 4278190080)) << @intCast(@import("std").math.Log2Int(c_ulonglong), 8))) | ((@bitCast(c_ulonglong, @as(c_ulonglong, __bsx)) & @as(c_ulonglong, 16711680)) << @intCast(@import("std").math.Log2Int(c_ulonglong), 24))) | ((@bitCast(c_ulonglong, @as(c_ulonglong, __bsx)) & @as(c_ulonglong, 65280)) << @intCast(@import("std").math.Log2Int(c_ulonglong), 40))) | ((@bitCast(c_ulonglong, @as(c_ulonglong, __bsx)) & @as(c_ulonglong, 255)) << @intCast(@import("std").math.Log2Int(c_ulonglong), 56))));
}
pub fn __uint16_identity(arg___x: __uint16_t) callconv(.C) __uint16_t {
    var __x = arg___x;
    return __x;
}
pub fn __uint32_identity(arg___x: __uint32_t) callconv(.C) __uint32_t {
    var __x = arg___x;
    return __x;
}
pub fn __uint64_identity(arg___x: __uint64_t) callconv(.C) __uint64_t {
    var __x = arg___x;
    return __x;
}
pub const __sigset_t = extern struct {
    __val: [16]c_ulong,
};
pub const sigset_t = __sigset_t;
pub const struct_timeval = extern struct {
    tv_sec: __time_t,
    tv_usec: __suseconds_t,
};
pub const struct_timespec = extern struct {
    tv_sec: __time_t,
    tv_nsec: __syscall_slong_t,
};
pub const suseconds_t = __suseconds_t;
pub const __fd_mask = c_long;
pub const fd_set = extern struct {
    __fds_bits: [16]__fd_mask,
};
pub const fd_mask = __fd_mask;
pub extern fn select(__nfds: c_int, noalias __readfds: [*c]fd_set, noalias __writefds: [*c]fd_set, noalias __exceptfds: [*c]fd_set, noalias __timeout: [*c]struct_timeval) c_int;
pub extern fn pselect(__nfds: c_int, noalias __readfds: [*c]fd_set, noalias __writefds: [*c]fd_set, noalias __exceptfds: [*c]fd_set, noalias __timeout: [*c]const struct_timespec, noalias __sigmask: [*c]const __sigset_t) c_int;
pub const blksize_t = __blksize_t;
pub const blkcnt_t = __blkcnt_t;
pub const fsblkcnt_t = __fsblkcnt_t;
pub const fsfilcnt_t = __fsfilcnt_t;
const struct_unnamed_1 = extern struct {
    __low: c_uint,
    __high: c_uint,
};
pub const __atomic_wide_counter = extern union {
    __value64: c_ulonglong,
    __value32: struct_unnamed_1,
};
pub const struct___pthread_internal_list = extern struct {
    __prev: [*c]struct___pthread_internal_list,
    __next: [*c]struct___pthread_internal_list,
};
pub const __pthread_list_t = struct___pthread_internal_list;
pub const struct___pthread_internal_slist = extern struct {
    __next: [*c]struct___pthread_internal_slist,
};
pub const __pthread_slist_t = struct___pthread_internal_slist;
pub const struct___pthread_mutex_s = extern struct {
    __lock: c_int,
    __count: c_uint,
    __owner: c_int,
    __nusers: c_uint,
    __kind: c_int,
    __spins: c_short,
    __elision: c_short,
    __list: __pthread_list_t,
};
pub const struct___pthread_rwlock_arch_t = extern struct {
    __readers: c_uint,
    __writers: c_uint,
    __wrphase_futex: c_uint,
    __writers_futex: c_uint,
    __pad3: c_uint,
    __pad4: c_uint,
    __cur_writer: c_int,
    __shared: c_int,
    __rwelision: i8,
    __pad1: [7]u8,
    __pad2: c_ulong,
    __flags: c_uint,
};
pub const struct___pthread_cond_s = extern struct {
    __wseq: __atomic_wide_counter,
    __g1_start: __atomic_wide_counter,
    __g_refs: [2]c_uint,
    __g_size: [2]c_uint,
    __g1_orig_size: c_uint,
    __wrefs: c_uint,
    __g_signals: [2]c_uint,
};
pub const __tss_t = c_uint;
pub const __thrd_t = c_ulong;
pub const __once_flag = extern struct {
    __data: c_int,
};
pub const pthread_t = c_ulong;
pub const pthread_mutexattr_t = extern union {
    __size: [4]u8,
    __align: c_int,
};
pub const pthread_condattr_t = extern union {
    __size: [4]u8,
    __align: c_int,
};
pub const pthread_key_t = c_uint;
pub const pthread_once_t = c_int;
pub const union_pthread_attr_t = extern union {
    __size: [56]u8,
    __align: c_long,
};
pub const pthread_attr_t = union_pthread_attr_t;
pub const pthread_mutex_t = extern union {
    __data: struct___pthread_mutex_s,
    __size: [40]u8,
    __align: c_long,
};
pub const pthread_cond_t = extern union {
    __data: struct___pthread_cond_s,
    __size: [48]u8,
    __align: c_longlong,
};
pub const pthread_rwlock_t = extern union {
    __data: struct___pthread_rwlock_arch_t,
    __size: [56]u8,
    __align: c_long,
};
pub const pthread_rwlockattr_t = extern union {
    __size: [8]u8,
    __align: c_long,
};
pub const pthread_spinlock_t = c_int;
pub const pthread_barrier_t = extern union {
    __size: [32]u8,
    __align: c_long,
};
pub const pthread_barrierattr_t = extern union {
    __size: [4]u8,
    __align: c_int,
};
pub extern fn random() c_long;
pub extern fn srandom(__seed: c_uint) void;
pub extern fn initstate(__seed: c_uint, __statebuf: [*c]u8, __statelen: usize) [*c]u8;
pub extern fn setstate(__statebuf: [*c]u8) [*c]u8;
pub const struct_random_data = extern struct {
    fptr: [*c]i32,
    rptr: [*c]i32,
    state: [*c]i32,
    rand_type: c_int,
    rand_deg: c_int,
    rand_sep: c_int,
    end_ptr: [*c]i32,
};
pub extern fn random_r(noalias __buf: [*c]struct_random_data, noalias __result: [*c]i32) c_int;
pub extern fn srandom_r(__seed: c_uint, __buf: [*c]struct_random_data) c_int;
pub extern fn initstate_r(__seed: c_uint, noalias __statebuf: [*c]u8, __statelen: usize, noalias __buf: [*c]struct_random_data) c_int;
pub extern fn setstate_r(noalias __statebuf: [*c]u8, noalias __buf: [*c]struct_random_data) c_int;
pub extern fn rand() c_int;
pub extern fn srand(__seed: c_uint) void;
pub extern fn rand_r(__seed: [*c]c_uint) c_int;
pub extern fn drand48() f64;
pub extern fn erand48(__xsubi: [*c]c_ushort) f64;
pub extern fn lrand48() c_long;
pub extern fn nrand48(__xsubi: [*c]c_ushort) c_long;
pub extern fn mrand48() c_long;
pub extern fn jrand48(__xsubi: [*c]c_ushort) c_long;
pub extern fn srand48(__seedval: c_long) void;
pub extern fn seed48(__seed16v: [*c]c_ushort) [*c]c_ushort;
pub extern fn lcong48(__param: [*c]c_ushort) void;
pub const struct_drand48_data = extern struct {
    __x: [3]c_ushort,
    __old_x: [3]c_ushort,
    __c: c_ushort,
    __init: c_ushort,
    __a: c_ulonglong,
};
pub extern fn drand48_r(noalias __buffer: [*c]struct_drand48_data, noalias __result: [*c]f64) c_int;
pub extern fn erand48_r(__xsubi: [*c]c_ushort, noalias __buffer: [*c]struct_drand48_data, noalias __result: [*c]f64) c_int;
pub extern fn lrand48_r(noalias __buffer: [*c]struct_drand48_data, noalias __result: [*c]c_long) c_int;
pub extern fn nrand48_r(__xsubi: [*c]c_ushort, noalias __buffer: [*c]struct_drand48_data, noalias __result: [*c]c_long) c_int;
pub extern fn mrand48_r(noalias __buffer: [*c]struct_drand48_data, noalias __result: [*c]c_long) c_int;
pub extern fn jrand48_r(__xsubi: [*c]c_ushort, noalias __buffer: [*c]struct_drand48_data, noalias __result: [*c]c_long) c_int;
pub extern fn srand48_r(__seedval: c_long, __buffer: [*c]struct_drand48_data) c_int;
pub extern fn seed48_r(__seed16v: [*c]c_ushort, __buffer: [*c]struct_drand48_data) c_int;
pub extern fn lcong48_r(__param: [*c]c_ushort, __buffer: [*c]struct_drand48_data) c_int;
pub extern fn malloc(__size: c_ulong) ?*anyopaque;
pub extern fn calloc(__nmemb: c_ulong, __size: c_ulong) ?*anyopaque;
pub extern fn realloc(__ptr: ?*anyopaque, __size: c_ulong) ?*anyopaque;
pub extern fn free(__ptr: ?*anyopaque) void;
pub extern fn reallocarray(__ptr: ?*anyopaque, __nmemb: usize, __size: usize) ?*anyopaque;
pub extern fn alloca(__size: c_ulong) ?*anyopaque;
pub extern fn valloc(__size: usize) ?*anyopaque;
pub extern fn posix_memalign(__memptr: [*c]?*anyopaque, __alignment: usize, __size: usize) c_int;
pub extern fn aligned_alloc(__alignment: c_ulong, __size: c_ulong) ?*anyopaque;
pub extern fn abort() noreturn;
pub extern fn atexit(__func: ?*const fn () callconv(.C) void) c_int;
pub extern fn at_quick_exit(__func: ?*const fn () callconv(.C) void) c_int;
pub extern fn on_exit(__func: ?*const fn (c_int, ?*anyopaque) callconv(.C) void, __arg: ?*anyopaque) c_int;
pub extern fn exit(__status: c_int) noreturn;
pub extern fn quick_exit(__status: c_int) noreturn;
pub extern fn _Exit(__status: c_int) noreturn;
pub extern fn getenv(__name: [*c]const u8) [*c]u8;
pub extern fn putenv(__string: [*c]u8) c_int;
pub extern fn setenv(__name: [*c]const u8, __value: [*c]const u8, __replace: c_int) c_int;
pub extern fn unsetenv(__name: [*c]const u8) c_int;
pub extern fn clearenv() c_int;
pub extern fn mktemp(__template: [*c]u8) [*c]u8;
pub extern fn mkstemp(__template: [*c]u8) c_int;
pub extern fn mkstemps(__template: [*c]u8, __suffixlen: c_int) c_int;
pub extern fn mkdtemp(__template: [*c]u8) [*c]u8;
pub extern fn system(__command: [*c]const u8) c_int;
pub extern fn realpath(noalias __name: [*c]const u8, noalias __resolved: [*c]u8) [*c]u8;
pub const __compar_fn_t = ?*const fn (?*const anyopaque, ?*const anyopaque) callconv(.C) c_int;
pub extern fn bsearch(__key: ?*const anyopaque, __base: ?*const anyopaque, __nmemb: usize, __size: usize, __compar: __compar_fn_t) ?*anyopaque;
pub extern fn qsort(__base: ?*anyopaque, __nmemb: usize, __size: usize, __compar: __compar_fn_t) void;
pub extern fn abs(__x: c_int) c_int;
pub extern fn labs(__x: c_long) c_long;
pub extern fn llabs(__x: c_longlong) c_longlong;
pub extern fn div(__numer: c_int, __denom: c_int) div_t;
pub extern fn ldiv(__numer: c_long, __denom: c_long) ldiv_t;
pub extern fn lldiv(__numer: c_longlong, __denom: c_longlong) lldiv_t;
pub extern fn ecvt(__value: f64, __ndigit: c_int, noalias __decpt: [*c]c_int, noalias __sign: [*c]c_int) [*c]u8;
pub extern fn fcvt(__value: f64, __ndigit: c_int, noalias __decpt: [*c]c_int, noalias __sign: [*c]c_int) [*c]u8;
pub extern fn gcvt(__value: f64, __ndigit: c_int, __buf: [*c]u8) [*c]u8;
pub extern fn qecvt(__value: c_longdouble, __ndigit: c_int, noalias __decpt: [*c]c_int, noalias __sign: [*c]c_int) [*c]u8;
pub extern fn qfcvt(__value: c_longdouble, __ndigit: c_int, noalias __decpt: [*c]c_int, noalias __sign: [*c]c_int) [*c]u8;
pub extern fn qgcvt(__value: c_longdouble, __ndigit: c_int, __buf: [*c]u8) [*c]u8;
pub extern fn ecvt_r(__value: f64, __ndigit: c_int, noalias __decpt: [*c]c_int, noalias __sign: [*c]c_int, noalias __buf: [*c]u8, __len: usize) c_int;
pub extern fn fcvt_r(__value: f64, __ndigit: c_int, noalias __decpt: [*c]c_int, noalias __sign: [*c]c_int, noalias __buf: [*c]u8, __len: usize) c_int;
pub extern fn qecvt_r(__value: c_longdouble, __ndigit: c_int, noalias __decpt: [*c]c_int, noalias __sign: [*c]c_int, noalias __buf: [*c]u8, __len: usize) c_int;
pub extern fn qfcvt_r(__value: c_longdouble, __ndigit: c_int, noalias __decpt: [*c]c_int, noalias __sign: [*c]c_int, noalias __buf: [*c]u8, __len: usize) c_int;
pub extern fn mblen(__s: [*c]const u8, __n: usize) c_int;
pub extern fn mbtowc(noalias __pwc: [*c]wchar_t, noalias __s: [*c]const u8, __n: usize) c_int;
pub extern fn wctomb(__s: [*c]u8, __wchar: wchar_t) c_int;
pub extern fn mbstowcs(noalias __pwcs: [*c]wchar_t, noalias __s: [*c]const u8, __n: usize) usize;
pub extern fn wcstombs(noalias __s: [*c]u8, noalias __pwcs: [*c]const wchar_t, __n: usize) usize;
pub extern fn rpmatch(__response: [*c]const u8) c_int;
pub extern fn getsubopt(noalias __optionp: [*c][*c]u8, noalias __tokens: [*c]const [*c]u8, noalias __valuep: [*c][*c]u8) c_int;
pub extern fn getloadavg(__loadavg: [*c]f64, __nelem: c_int) c_int;
pub const int_least8_t = __int_least8_t;
pub const int_least16_t = __int_least16_t;
pub const int_least32_t = __int_least32_t;
pub const int_least64_t = __int_least64_t;
pub const uint_least8_t = __uint_least8_t;
pub const uint_least16_t = __uint_least16_t;
pub const uint_least32_t = __uint_least32_t;
pub const uint_least64_t = __uint_least64_t;
pub const int_fast8_t = i8;
pub const int_fast16_t = c_long;
pub const int_fast32_t = c_long;
pub const int_fast64_t = c_long;
pub const uint_fast8_t = u8;
pub const uint_fast16_t = c_ulong;
pub const uint_fast32_t = c_ulong;
pub const uint_fast64_t = c_ulong;
pub const intmax_t = __intmax_t;
pub const uintmax_t = __uintmax_t;
pub const struct___va_list_tag = extern struct {
    gp_offset: c_uint,
    fp_offset: c_uint,
    overflow_arg_area: ?*anyopaque,
    reg_save_area: ?*anyopaque,
};
pub const __builtin_va_list = [1]struct___va_list_tag;
pub const __gnuc_va_list = __builtin_va_list;
pub const va_list = __builtin_va_list;
pub const struct__HPy_s = extern struct {
    _i: isize,
};
pub const HPy = struct__HPy_s;
pub const HPyField = extern struct {
    _i: isize,
};
pub const HPyGlobal = extern struct {
    _i: isize,
};
pub const HPyListBuilder = extern struct {
    _lst: isize,
};
pub const HPyTupleBuilder = extern struct {
    _tup: isize,
};
pub const HPyTracker = extern struct {
    _i: isize,
};
pub const HPyThreadState = extern struct {
    _i: isize,
};
pub fn HPy_FromVoidP(arg_p: ?*anyopaque) callconv(.C) HPy {
    var p = arg_p;
    return HPy{
        ._i = @intCast(isize, @ptrToInt(p)),
    };
}
pub fn HPy_AsVoidP(arg_h: HPy) callconv(.C) ?*anyopaque {
    var h = arg_h;
    return @intToPtr(?*anyopaque, h._i);
}
pub const HPyContext = struct__HPyContext_s;
pub const HPy_ssize_t = isize;
pub const HPy_hash_t = isize;
pub const HPy_UCS4 = u32;
pub const struct_FORBIDDEN_cpy_PyObject = opaque {};
pub const cpy_PyObject = struct_FORBIDDEN_cpy_PyObject;
pub const HPyCFunction = ?*const fn (...) callconv(.C) ?*anyopaque;
pub const struct__HPyContext_s = extern struct {
    name: [*c]const u8,
    _private: ?*anyopaque,
    abi_version: c_int,
    h_None: HPy,
    h_True: HPy,
    h_False: HPy,
    h_NotImplemented: HPy,
    h_Ellipsis: HPy,
    h_BaseException: HPy,
    h_Exception: HPy,
    h_StopAsyncIteration: HPy,
    h_StopIteration: HPy,
    h_GeneratorExit: HPy,
    h_ArithmeticError: HPy,
    h_LookupError: HPy,
    h_AssertionError: HPy,
    h_AttributeError: HPy,
    h_BufferError: HPy,
    h_EOFError: HPy,
    h_FloatingPointError: HPy,
    h_OSError: HPy,
    h_ImportError: HPy,
    h_ModuleNotFoundError: HPy,
    h_IndexError: HPy,
    h_KeyError: HPy,
    h_KeyboardInterrupt: HPy,
    h_MemoryError: HPy,
    h_NameError: HPy,
    h_OverflowError: HPy,
    h_RuntimeError: HPy,
    h_RecursionError: HPy,
    h_NotImplementedError: HPy,
    h_SyntaxError: HPy,
    h_IndentationError: HPy,
    h_TabError: HPy,
    h_ReferenceError: HPy,
    h_SystemError: HPy,
    h_SystemExit: HPy,
    h_TypeError: HPy,
    h_UnboundLocalError: HPy,
    h_UnicodeError: HPy,
    h_UnicodeEncodeError: HPy,
    h_UnicodeDecodeError: HPy,
    h_UnicodeTranslateError: HPy,
    h_ValueError: HPy,
    h_ZeroDivisionError: HPy,
    h_BlockingIOError: HPy,
    h_BrokenPipeError: HPy,
    h_ChildProcessError: HPy,
    h_ConnectionError: HPy,
    h_ConnectionAbortedError: HPy,
    h_ConnectionRefusedError: HPy,
    h_ConnectionResetError: HPy,
    h_FileExistsError: HPy,
    h_FileNotFoundError: HPy,
    h_InterruptedError: HPy,
    h_IsADirectoryError: HPy,
    h_NotADirectoryError: HPy,
    h_PermissionError: HPy,
    h_ProcessLookupError: HPy,
    h_TimeoutError: HPy,
    h_Warning: HPy,
    h_UserWarning: HPy,
    h_DeprecationWarning: HPy,
    h_PendingDeprecationWarning: HPy,
    h_SyntaxWarning: HPy,
    h_RuntimeWarning: HPy,
    h_FutureWarning: HPy,
    h_ImportWarning: HPy,
    h_UnicodeWarning: HPy,
    h_BytesWarning: HPy,
    h_ResourceWarning: HPy,
    h_BaseObjectType: HPy,
    h_TypeType: HPy,
    h_BoolType: HPy,
    h_LongType: HPy,
    h_FloatType: HPy,
    h_UnicodeType: HPy,
    h_TupleType: HPy,
    h_ListType: HPy,
    ctx_Dup: ?*const fn ([*c]HPyContext, HPy) callconv(.C) HPy,
    ctx_Close: ?*const fn ([*c]HPyContext, HPy) callconv(.C) void,
    ctx_Long_FromInt32_t: ?*const fn ([*c]HPyContext, i32) callconv(.C) HPy,
    ctx_Long_FromUInt32_t: ?*const fn ([*c]HPyContext, u32) callconv(.C) HPy,
    ctx_Long_FromInt64_t: ?*const fn ([*c]HPyContext, i64) callconv(.C) HPy,
    ctx_Long_FromUInt64_t: ?*const fn ([*c]HPyContext, u64) callconv(.C) HPy,
    ctx_Long_FromSize_t: ?*const fn ([*c]HPyContext, usize) callconv(.C) HPy,
    ctx_Long_FromSsize_t: ?*const fn ([*c]HPyContext, HPy_ssize_t) callconv(.C) HPy,
    ctx_Long_AsInt32_t: ?*const fn ([*c]HPyContext, HPy) callconv(.C) i32,
    ctx_Long_AsUInt32_t: ?*const fn ([*c]HPyContext, HPy) callconv(.C) u32,
    ctx_Long_AsUInt32_tMask: ?*const fn ([*c]HPyContext, HPy) callconv(.C) u32,
    ctx_Long_AsInt64_t: ?*const fn ([*c]HPyContext, HPy) callconv(.C) i64,
    ctx_Long_AsUInt64_t: ?*const fn ([*c]HPyContext, HPy) callconv(.C) u64,
    ctx_Long_AsUInt64_tMask: ?*const fn ([*c]HPyContext, HPy) callconv(.C) u64,
    ctx_Long_AsSize_t: ?*const fn ([*c]HPyContext, HPy) callconv(.C) usize,
    ctx_Long_AsSsize_t: ?*const fn ([*c]HPyContext, HPy) callconv(.C) HPy_ssize_t,
    ctx_Long_AsVoidPtr: ?*const fn ([*c]HPyContext, HPy) callconv(.C) ?*anyopaque,
    ctx_Long_AsDouble: ?*const fn ([*c]HPyContext, HPy) callconv(.C) f64,
    ctx_Float_FromDouble: ?*const fn ([*c]HPyContext, f64) callconv(.C) HPy,
    ctx_Float_AsDouble: ?*const fn ([*c]HPyContext, HPy) callconv(.C) f64,
    ctx_Bool_FromBool: ?*const fn ([*c]HPyContext, bool) callconv(.C) HPy,
    ctx_Length: ?*const fn ([*c]HPyContext, HPy) callconv(.C) HPy_ssize_t,
    ctx_Number_Check: ?*const fn ([*c]HPyContext, HPy) callconv(.C) c_int,
    ctx_Add: ?*const fn ([*c]HPyContext, HPy, HPy) callconv(.C) HPy,
    ctx_Subtract: ?*const fn ([*c]HPyContext, HPy, HPy) callconv(.C) HPy,
    ctx_Multiply: ?*const fn ([*c]HPyContext, HPy, HPy) callconv(.C) HPy,
    ctx_MatrixMultiply: ?*const fn ([*c]HPyContext, HPy, HPy) callconv(.C) HPy,
    ctx_FloorDivide: ?*const fn ([*c]HPyContext, HPy, HPy) callconv(.C) HPy,
    ctx_TrueDivide: ?*const fn ([*c]HPyContext, HPy, HPy) callconv(.C) HPy,
    ctx_Remainder: ?*const fn ([*c]HPyContext, HPy, HPy) callconv(.C) HPy,
    ctx_Divmod: ?*const fn ([*c]HPyContext, HPy, HPy) callconv(.C) HPy,
    ctx_Power: ?*const fn ([*c]HPyContext, HPy, HPy, HPy) callconv(.C) HPy,
    ctx_Negative: ?*const fn ([*c]HPyContext, HPy) callconv(.C) HPy,
    ctx_Positive: ?*const fn ([*c]HPyContext, HPy) callconv(.C) HPy,
    ctx_Absolute: ?*const fn ([*c]HPyContext, HPy) callconv(.C) HPy,
    ctx_Invert: ?*const fn ([*c]HPyContext, HPy) callconv(.C) HPy,
    ctx_Lshift: ?*const fn ([*c]HPyContext, HPy, HPy) callconv(.C) HPy,
    ctx_Rshift: ?*const fn ([*c]HPyContext, HPy, HPy) callconv(.C) HPy,
    ctx_And: ?*const fn ([*c]HPyContext, HPy, HPy) callconv(.C) HPy,
    ctx_Xor: ?*const fn ([*c]HPyContext, HPy, HPy) callconv(.C) HPy,
    ctx_Or: ?*const fn ([*c]HPyContext, HPy, HPy) callconv(.C) HPy,
    ctx_Index: ?*const fn ([*c]HPyContext, HPy) callconv(.C) HPy,
    ctx_Long: ?*const fn ([*c]HPyContext, HPy) callconv(.C) HPy,
    ctx_Float: ?*const fn ([*c]HPyContext, HPy) callconv(.C) HPy,
    ctx_InPlaceAdd: ?*const fn ([*c]HPyContext, HPy, HPy) callconv(.C) HPy,
    ctx_InPlaceSubtract: ?*const fn ([*c]HPyContext, HPy, HPy) callconv(.C) HPy,
    ctx_InPlaceMultiply: ?*const fn ([*c]HPyContext, HPy, HPy) callconv(.C) HPy,
    ctx_InPlaceMatrixMultiply: ?*const fn ([*c]HPyContext, HPy, HPy) callconv(.C) HPy,
    ctx_InPlaceFloorDivide: ?*const fn ([*c]HPyContext, HPy, HPy) callconv(.C) HPy,
    ctx_InPlaceTrueDivide: ?*const fn ([*c]HPyContext, HPy, HPy) callconv(.C) HPy,
    ctx_InPlaceRemainder: ?*const fn ([*c]HPyContext, HPy, HPy) callconv(.C) HPy,
    ctx_InPlacePower: ?*const fn ([*c]HPyContext, HPy, HPy, HPy) callconv(.C) HPy,
    ctx_InPlaceLshift: ?*const fn ([*c]HPyContext, HPy, HPy) callconv(.C) HPy,
    ctx_InPlaceRshift: ?*const fn ([*c]HPyContext, HPy, HPy) callconv(.C) HPy,
    ctx_InPlaceAnd: ?*const fn ([*c]HPyContext, HPy, HPy) callconv(.C) HPy,
    ctx_InPlaceXor: ?*const fn ([*c]HPyContext, HPy, HPy) callconv(.C) HPy,
    ctx_InPlaceOr: ?*const fn ([*c]HPyContext, HPy, HPy) callconv(.C) HPy,
    ctx_Callable_Check: ?*const fn ([*c]HPyContext, HPy) callconv(.C) c_int,
    ctx_CallTupleDict: ?*const fn ([*c]HPyContext, HPy, HPy, HPy) callconv(.C) HPy,
    ctx_FatalError: ?*const fn ([*c]HPyContext, [*c]const u8) callconv(.C) void,
    ctx_Err_SetString: ?*const fn ([*c]HPyContext, HPy, [*c]const u8) callconv(.C) void,
    ctx_Err_SetObject: ?*const fn ([*c]HPyContext, HPy, HPy) callconv(.C) void,
    ctx_Err_SetFromErrnoWithFilename: ?*const fn ([*c]HPyContext, HPy, [*c]const u8) callconv(.C) HPy,
    ctx_Err_SetFromErrnoWithFilenameObjects: ?*const fn ([*c]HPyContext, HPy, HPy, HPy) callconv(.C) void,
    ctx_Err_Occurred: ?*const fn ([*c]HPyContext) callconv(.C) c_int,
    ctx_Err_ExceptionMatches: ?*const fn ([*c]HPyContext, HPy) callconv(.C) c_int,
    ctx_Err_NoMemory: ?*const fn ([*c]HPyContext) callconv(.C) void,
    ctx_Err_Clear: ?*const fn ([*c]HPyContext) callconv(.C) void,
    ctx_Err_NewException: ?*const fn ([*c]HPyContext, [*c]const u8, HPy, HPy) callconv(.C) HPy,
    ctx_Err_NewExceptionWithDoc: ?*const fn ([*c]HPyContext, [*c]const u8, [*c]const u8, HPy, HPy) callconv(.C) HPy,
    ctx_Err_WarnEx: ?*const fn ([*c]HPyContext, HPy, [*c]const u8, HPy_ssize_t) callconv(.C) c_int,
    ctx_Err_WriteUnraisable: ?*const fn ([*c]HPyContext, HPy) callconv(.C) void,
    ctx_IsTrue: ?*const fn ([*c]HPyContext, HPy) callconv(.C) c_int,
    ctx_Type_FromSpec: ?*const fn ([*c]HPyContext, [*c]HPyType_Spec, [*c]HPyType_SpecParam) callconv(.C) HPy,
    ctx_Type_GenericNew: ?*const fn ([*c]HPyContext, HPy, [*c]const HPy, HPy_ssize_t, HPy) callconv(.C) HPy,
    ctx_GetAttr: ?*const fn ([*c]HPyContext, HPy, HPy) callconv(.C) HPy,
    ctx_GetAttr_s: ?*const fn ([*c]HPyContext, HPy, [*c]const u8) callconv(.C) HPy,
    ctx_HasAttr: ?*const fn ([*c]HPyContext, HPy, HPy) callconv(.C) c_int,
    ctx_HasAttr_s: ?*const fn ([*c]HPyContext, HPy, [*c]const u8) callconv(.C) c_int,
    ctx_SetAttr: ?*const fn ([*c]HPyContext, HPy, HPy, HPy) callconv(.C) c_int,
    ctx_SetAttr_s: ?*const fn ([*c]HPyContext, HPy, [*c]const u8, HPy) callconv(.C) c_int,
    ctx_GetItem: ?*const fn ([*c]HPyContext, HPy, HPy) callconv(.C) HPy,
    ctx_GetItem_i: ?*const fn ([*c]HPyContext, HPy, HPy_ssize_t) callconv(.C) HPy,
    ctx_GetItem_s: ?*const fn ([*c]HPyContext, HPy, [*c]const u8) callconv(.C) HPy,
    ctx_Contains: ?*const fn ([*c]HPyContext, HPy, HPy) callconv(.C) c_int,
    ctx_SetItem: ?*const fn ([*c]HPyContext, HPy, HPy, HPy) callconv(.C) c_int,
    ctx_SetItem_i: ?*const fn ([*c]HPyContext, HPy, HPy_ssize_t, HPy) callconv(.C) c_int,
    ctx_SetItem_s: ?*const fn ([*c]HPyContext, HPy, [*c]const u8, HPy) callconv(.C) c_int,
    ctx_Type: ?*const fn ([*c]HPyContext, HPy) callconv(.C) HPy,
    ctx_TypeCheck: ?*const fn ([*c]HPyContext, HPy, HPy) callconv(.C) c_int,
    ctx_Is: ?*const fn ([*c]HPyContext, HPy, HPy) callconv(.C) c_int,
    ctx_AsStruct_Object: ?*const fn ([*c]HPyContext, HPy) callconv(.C) ?*anyopaque,
    ctx_AsStruct_Legacy: ?*const fn ([*c]HPyContext, HPy) callconv(.C) ?*anyopaque,
    ctx_New: ?*const fn ([*c]HPyContext, HPy, [*c]?*anyopaque) callconv(.C) HPy,
    ctx_Repr: ?*const fn ([*c]HPyContext, HPy) callconv(.C) HPy,
    ctx_Str: ?*const fn ([*c]HPyContext, HPy) callconv(.C) HPy,
    ctx_ASCII: ?*const fn ([*c]HPyContext, HPy) callconv(.C) HPy,
    ctx_Bytes: ?*const fn ([*c]HPyContext, HPy) callconv(.C) HPy,
    ctx_RichCompare: ?*const fn ([*c]HPyContext, HPy, HPy, c_int) callconv(.C) HPy,
    ctx_RichCompareBool: ?*const fn ([*c]HPyContext, HPy, HPy, c_int) callconv(.C) c_int,
    ctx_Hash: ?*const fn ([*c]HPyContext, HPy) callconv(.C) HPy_hash_t,
    ctx_Bytes_Check: ?*const fn ([*c]HPyContext, HPy) callconv(.C) c_int,
    ctx_Bytes_Size: ?*const fn ([*c]HPyContext, HPy) callconv(.C) HPy_ssize_t,
    ctx_Bytes_GET_SIZE: ?*const fn ([*c]HPyContext, HPy) callconv(.C) HPy_ssize_t,
    ctx_Bytes_AsString: ?*const fn ([*c]HPyContext, HPy) callconv(.C) [*c]const u8,
    ctx_Bytes_AS_STRING: ?*const fn ([*c]HPyContext, HPy) callconv(.C) [*c]const u8,
    ctx_Bytes_FromString: ?*const fn ([*c]HPyContext, [*c]const u8) callconv(.C) HPy,
    ctx_Bytes_FromStringAndSize: ?*const fn ([*c]HPyContext, [*c]const u8, HPy_ssize_t) callconv(.C) HPy,
    ctx_Unicode_FromString: ?*const fn ([*c]HPyContext, [*c]const u8) callconv(.C) HPy,
    ctx_Unicode_Check: ?*const fn ([*c]HPyContext, HPy) callconv(.C) c_int,
    ctx_Unicode_AsASCIIString: ?*const fn ([*c]HPyContext, HPy) callconv(.C) HPy,
    ctx_Unicode_AsLatin1String: ?*const fn ([*c]HPyContext, HPy) callconv(.C) HPy,
    ctx_Unicode_AsUTF8String: ?*const fn ([*c]HPyContext, HPy) callconv(.C) HPy,
    ctx_Unicode_AsUTF8AndSize: ?*const fn ([*c]HPyContext, HPy, [*c]HPy_ssize_t) callconv(.C) [*c]const u8,
    ctx_Unicode_FromWideChar: ?*const fn ([*c]HPyContext, [*c]const wchar_t, HPy_ssize_t) callconv(.C) HPy,
    ctx_Unicode_DecodeFSDefault: ?*const fn ([*c]HPyContext, [*c]const u8) callconv(.C) HPy,
    ctx_Unicode_DecodeFSDefaultAndSize: ?*const fn ([*c]HPyContext, [*c]const u8, HPy_ssize_t) callconv(.C) HPy,
    ctx_Unicode_EncodeFSDefault: ?*const fn ([*c]HPyContext, HPy) callconv(.C) HPy,
    ctx_Unicode_ReadChar: ?*const fn ([*c]HPyContext, HPy, HPy_ssize_t) callconv(.C) HPy_UCS4,
    ctx_Unicode_DecodeASCII: ?*const fn ([*c]HPyContext, [*c]const u8, HPy_ssize_t, [*c]const u8) callconv(.C) HPy,
    ctx_Unicode_DecodeLatin1: ?*const fn ([*c]HPyContext, [*c]const u8, HPy_ssize_t, [*c]const u8) callconv(.C) HPy,
    ctx_List_Check: ?*const fn ([*c]HPyContext, HPy) callconv(.C) c_int,
    ctx_List_New: ?*const fn ([*c]HPyContext, HPy_ssize_t) callconv(.C) HPy,
    ctx_List_Append: ?*const fn ([*c]HPyContext, HPy, HPy) callconv(.C) c_int,
    ctx_Dict_Check: ?*const fn ([*c]HPyContext, HPy) callconv(.C) c_int,
    ctx_Dict_New: ?*const fn ([*c]HPyContext) callconv(.C) HPy,
    ctx_Tuple_Check: ?*const fn ([*c]HPyContext, HPy) callconv(.C) c_int,
    ctx_Tuple_FromArray: ?*const fn ([*c]HPyContext, [*c]HPy, HPy_ssize_t) callconv(.C) HPy,
    ctx_Import_ImportModule: ?*const fn ([*c]HPyContext, [*c]const u8) callconv(.C) HPy,
    ctx_FromPyObject: ?*const fn ([*c]HPyContext, ?*cpy_PyObject) callconv(.C) HPy,
    ctx_AsPyObject: ?*const fn ([*c]HPyContext, HPy) callconv(.C) ?*cpy_PyObject,
    ctx_CallRealFunctionFromTrampoline: ?*const fn ([*c]HPyContext, HPyFunc_Signature, HPyCFunction, ?*anyopaque) callconv(.C) void,
    ctx_ListBuilder_New: ?*const fn ([*c]HPyContext, HPy_ssize_t) callconv(.C) HPyListBuilder,
    ctx_ListBuilder_Set: ?*const fn ([*c]HPyContext, HPyListBuilder, HPy_ssize_t, HPy) callconv(.C) void,
    ctx_ListBuilder_Build: ?*const fn ([*c]HPyContext, HPyListBuilder) callconv(.C) HPy,
    ctx_ListBuilder_Cancel: ?*const fn ([*c]HPyContext, HPyListBuilder) callconv(.C) void,
    ctx_TupleBuilder_New: ?*const fn ([*c]HPyContext, HPy_ssize_t) callconv(.C) HPyTupleBuilder,
    ctx_TupleBuilder_Set: ?*const fn ([*c]HPyContext, HPyTupleBuilder, HPy_ssize_t, HPy) callconv(.C) void,
    ctx_TupleBuilder_Build: ?*const fn ([*c]HPyContext, HPyTupleBuilder) callconv(.C) HPy,
    ctx_TupleBuilder_Cancel: ?*const fn ([*c]HPyContext, HPyTupleBuilder) callconv(.C) void,
    ctx_Tracker_New: ?*const fn ([*c]HPyContext, HPy_ssize_t) callconv(.C) HPyTracker,
    ctx_Tracker_Add: ?*const fn ([*c]HPyContext, HPyTracker, HPy) callconv(.C) c_int,
    ctx_Tracker_ForgetAll: ?*const fn ([*c]HPyContext, HPyTracker) callconv(.C) void,
    ctx_Tracker_Close: ?*const fn ([*c]HPyContext, HPyTracker) callconv(.C) void,
    ctx_Field_Store: ?*const fn ([*c]HPyContext, HPy, [*c]HPyField, HPy) callconv(.C) void,
    ctx_Field_Load: ?*const fn ([*c]HPyContext, HPy, HPyField) callconv(.C) HPy,
    ctx_ReenterPythonExecution: ?*const fn ([*c]HPyContext, HPyThreadState) callconv(.C) void,
    ctx_LeavePythonExecution: ?*const fn ([*c]HPyContext) callconv(.C) HPyThreadState,
    ctx_Global_Store: ?*const fn ([*c]HPyContext, [*c]HPyGlobal, HPy) callconv(.C) void,
    ctx_Global_Load: ?*const fn ([*c]HPyContext, HPyGlobal) callconv(.C) HPy,
    ctx_Dump: ?*const fn ([*c]HPyContext, HPy) callconv(.C) void,
    ctx_AsStruct_Type: ?*const fn ([*c]HPyContext, HPy) callconv(.C) ?*anyopaque,
    ctx_AsStruct_Long: ?*const fn ([*c]HPyContext, HPy) callconv(.C) ?*anyopaque,
    ctx_AsStruct_Float: ?*const fn ([*c]HPyContext, HPy) callconv(.C) ?*anyopaque,
    ctx_AsStruct_Unicode: ?*const fn ([*c]HPyContext, HPy) callconv(.C) ?*anyopaque,
    ctx_AsStruct_Tuple: ?*const fn ([*c]HPyContext, HPy) callconv(.C) ?*anyopaque,
    ctx_AsStruct_List: ?*const fn ([*c]HPyContext, HPy) callconv(.C) ?*anyopaque,
    ctx_Type_GetBuiltinShape: ?*const fn ([*c]HPyContext, HPy) callconv(.C) HPyType_BuiltinShape,
    ctx_DelItem: ?*const fn ([*c]HPyContext, HPy, HPy) callconv(.C) c_int,
    ctx_DelItem_i: ?*const fn ([*c]HPyContext, HPy, HPy_ssize_t) callconv(.C) c_int,
    ctx_DelItem_s: ?*const fn ([*c]HPyContext, HPy, [*c]const u8) callconv(.C) c_int,
    h_ComplexType: HPy,
    h_BytesType: HPy,
    h_MemoryViewType: HPy,
    h_CapsuleType: HPy,
    h_SliceType: HPy,
    h_Builtins: HPy,
    ctx_Capsule_New: ?*const fn ([*c]HPyContext, ?*anyopaque, [*c]const u8, [*c]HPyCapsule_Destructor) callconv(.C) HPy,
    ctx_Capsule_Get: ?*const fn ([*c]HPyContext, HPy, _HPyCapsule_key, [*c]const u8) callconv(.C) ?*anyopaque,
    ctx_Capsule_IsValid: ?*const fn ([*c]HPyContext, HPy, [*c]const u8) callconv(.C) c_int,
    ctx_Capsule_Set: ?*const fn ([*c]HPyContext, HPy, _HPyCapsule_key, ?*anyopaque) callconv(.C) c_int,
    ctx_Compile_s: ?*const fn ([*c]HPyContext, [*c]const u8, [*c]const u8, HPy_SourceKind) callconv(.C) HPy,
    ctx_EvalCode: ?*const fn ([*c]HPyContext, HPy, HPy, HPy) callconv(.C) HPy,
    ctx_ContextVar_New: ?*const fn ([*c]HPyContext, [*c]const u8, HPy) callconv(.C) HPy,
    ctx_ContextVar_Get: ?*const fn ([*c]HPyContext, HPy, HPy, [*c]HPy) callconv(.C) i32,
    ctx_ContextVar_Set: ?*const fn ([*c]HPyContext, HPy, HPy) callconv(.C) HPy,
    ctx_Type_GetName: ?*const fn ([*c]HPyContext, HPy) callconv(.C) [*c]const u8,
    ctx_Type_IsSubtype: ?*const fn ([*c]HPyContext, HPy, HPy) callconv(.C) c_int,
    ctx_Unicode_FromEncodedObject: ?*const fn ([*c]HPyContext, HPy, [*c]const u8, [*c]const u8) callconv(.C) HPy,
    ctx_Unicode_Substring: ?*const fn ([*c]HPyContext, HPy, HPy_ssize_t, HPy_ssize_t) callconv(.C) HPy,
    ctx_Dict_Keys: ?*const fn ([*c]HPyContext, HPy) callconv(.C) HPy,
    ctx_Dict_Copy: ?*const fn ([*c]HPyContext, HPy) callconv(.C) HPy,
    ctx_Slice_Unpack: ?*const fn ([*c]HPyContext, HPy, [*c]HPy_ssize_t, [*c]HPy_ssize_t, [*c]HPy_ssize_t) callconv(.C) c_int,
    ctx_SetCallFunction: ?*const fn ([*c]HPyContext, HPy, [*c]HPyCallFunction) callconv(.C) c_int,
    ctx_Call: ?*const fn ([*c]HPyContext, HPy, [*c]const HPy, usize, HPy) callconv(.C) HPy,
    ctx_CallMethod: ?*const fn ([*c]HPyContext, HPy, [*c]const HPy, usize, HPy) callconv(.C) HPy,
};
pub const HPy_SourceKind_Expr: c_int = 0;
pub const HPy_SourceKind_File: c_int = 1;
pub const HPy_SourceKind_Single: c_int = 2;
pub const HPy_SourceKind = c_uint;
pub const HPyCapsule_key_Pointer: c_int = 0;
pub const HPyCapsule_key_Name: c_int = 1;
pub const HPyCapsule_key_Context: c_int = 2;
pub const HPyCapsule_key_Destructor: c_int = 3;
pub const _HPyCapsule_key = c_uint;
pub const struct_FORBIDDEN_PyMethodDef = opaque {};
pub const cpy_PyMethodDef = struct_FORBIDDEN_PyMethodDef;
pub const struct_FORBIDDEN_PyModuleDef = opaque {};
pub const cpy_PyModuleDef = struct_FORBIDDEN_PyModuleDef;
pub const struct_FORBIDDEN_bufferinfo = opaque {};
pub const cpy_Py_buffer = struct_FORBIDDEN_bufferinfo;
pub fn HPy_AsPyObject(arg_ctx: [*c]HPyContext, arg_h: HPy) callconv(.C) ?*cpy_PyObject {
    var ctx = arg_ctx;
    var h = arg_h;
    return ctx.*.ctx_AsPyObject.?(ctx, h);
}
pub fn HPy_FromPyObject(arg_ctx: [*c]HPyContext, arg_obj: ?*cpy_PyObject) callconv(.C) HPy {
    var ctx = arg_ctx;
    var obj = arg_obj;
    return ctx.*.ctx_FromPyObject.?(ctx, obj);
}
pub const cpy_PyCFunction = ?*const fn (?*cpy_PyObject, [*c]const ?*cpy_PyObject, HPy_ssize_t) callconv(.C) ?*cpy_PyObject;
pub const cpy_visitproc = ?*const fn (?*cpy_PyObject, ?*anyopaque) callconv(.C) c_int;
pub const cpy_getter = ?*const fn (?*cpy_PyObject, ?*anyopaque) callconv(.C) ?*cpy_PyObject;
pub const cpy_setter = ?*const fn (?*cpy_PyObject, ?*cpy_PyObject, ?*anyopaque) callconv(.C) c_int;
pub const cpy_PyCapsule_Destructor = ?*const fn (?*cpy_PyObject) callconv(.C) void;
pub const cpy_vectorcallfunc = ?*const fn (?*cpy_PyObject, [*c]const ?*cpy_PyObject, usize, ?*cpy_PyObject) callconv(.C) ?*cpy_PyObject;
pub const HPy_LT: c_int = 0;
pub const HPy_LE: c_int = 1;
pub const HPy_EQ: c_int = 2;
pub const HPy_NE: c_int = 3;
pub const HPy_GT: c_int = 4;
pub const HPy_GE: c_int = 5;
pub const HPy_RichCmpOp = c_uint;
pub const HPyFunc_VARARGS: c_int = 1;
pub const HPyFunc_KEYWORDS: c_int = 2;
pub const HPyFunc_NOARGS: c_int = 3;
pub const HPyFunc_O: c_int = 4;
pub const HPyFunc_DESTROYFUNC: c_int = 5;
pub const HPyFunc_GETBUFFERPROC: c_int = 6;
pub const HPyFunc_RELEASEBUFFERPROC: c_int = 7;
pub const HPyFunc_UNARYFUNC: c_int = 8;
pub const HPyFunc_BINARYFUNC: c_int = 9;
pub const HPyFunc_TERNARYFUNC: c_int = 10;
pub const HPyFunc_INQUIRY: c_int = 11;
pub const HPyFunc_LENFUNC: c_int = 12;
pub const HPyFunc_SSIZEARGFUNC: c_int = 13;
pub const HPyFunc_SSIZESSIZEARGFUNC: c_int = 14;
pub const HPyFunc_SSIZEOBJARGPROC: c_int = 15;
pub const HPyFunc_SSIZESSIZEOBJARGPROC: c_int = 16;
pub const HPyFunc_OBJOBJARGPROC: c_int = 17;
pub const HPyFunc_FREEFUNC: c_int = 18;
pub const HPyFunc_GETATTRFUNC: c_int = 19;
pub const HPyFunc_GETATTROFUNC: c_int = 20;
pub const HPyFunc_SETATTRFUNC: c_int = 21;
pub const HPyFunc_SETATTROFUNC: c_int = 22;
pub const HPyFunc_REPRFUNC: c_int = 23;
pub const HPyFunc_HASHFUNC: c_int = 24;
pub const HPyFunc_RICHCMPFUNC: c_int = 25;
pub const HPyFunc_GETITERFUNC: c_int = 26;
pub const HPyFunc_ITERNEXTFUNC: c_int = 27;
pub const HPyFunc_DESCRGETFUNC: c_int = 28;
pub const HPyFunc_DESCRSETFUNC: c_int = 29;
pub const HPyFunc_INITPROC: c_int = 30;
pub const HPyFunc_NEWFUNC: c_int = 31;
pub const HPyFunc_GETTER: c_int = 32;
pub const HPyFunc_SETTER: c_int = 33;
pub const HPyFunc_OBJOBJPROC: c_int = 34;
pub const HPyFunc_TRAVERSEPROC: c_int = 35;
pub const HPyFunc_DESTRUCTOR: c_int = 36;
pub const HPyFunc_CAPSULE_DESTRUCTOR: c_int = 37;
pub const HPyFunc_VECTORCALLFUNC: c_int = 38;
pub const HPyFunc_MOD_CREATE: c_int = 39;
pub const HPyFunc_Signature = c_uint;
pub const HPy_buffer = extern struct {
    buf: ?*anyopaque,
    obj: HPy,
    len: HPy_ssize_t,
    itemsize: HPy_ssize_t,
    readonly: c_int,
    ndim: c_int,
    format: [*c]u8,
    shape: [*c]HPy_ssize_t,
    strides: [*c]HPy_ssize_t,
    suboffsets: [*c]HPy_ssize_t,
    internal: ?*anyopaque,
};
pub const HPyFunc_visitproc = ?*const fn ([*c]HPyField, ?*anyopaque) callconv(.C) c_int;
pub const HPyFunc_noargs = ?*const fn ([*c]HPyContext, HPy) callconv(.C) HPy;
pub const HPyFunc_o = ?*const fn ([*c]HPyContext, HPy, HPy) callconv(.C) HPy;
pub const HPyFunc_varargs = ?*const fn ([*c]HPyContext, HPy, [*c]const HPy, usize) callconv(.C) HPy;
pub const HPyFunc_keywords = ?*const fn ([*c]HPyContext, HPy, [*c]const HPy, usize, HPy) callconv(.C) HPy;
pub const HPyFunc_unaryfunc = ?*const fn ([*c]HPyContext, HPy) callconv(.C) HPy;
pub const HPyFunc_binaryfunc = ?*const fn ([*c]HPyContext, HPy, HPy) callconv(.C) HPy;
pub const HPyFunc_ternaryfunc = ?*const fn ([*c]HPyContext, HPy, HPy, HPy) callconv(.C) HPy;
pub const HPyFunc_inquiry = ?*const fn ([*c]HPyContext, HPy) callconv(.C) c_int;
pub const HPyFunc_lenfunc = ?*const fn ([*c]HPyContext, HPy) callconv(.C) HPy_ssize_t;
pub const HPyFunc_ssizeargfunc = ?*const fn ([*c]HPyContext, HPy, HPy_ssize_t) callconv(.C) HPy;
pub const HPyFunc_ssizessizeargfunc = ?*const fn ([*c]HPyContext, HPy, HPy_ssize_t, HPy_ssize_t) callconv(.C) HPy;
pub const HPyFunc_ssizeobjargproc = ?*const fn ([*c]HPyContext, HPy, HPy_ssize_t, HPy) callconv(.C) c_int;
pub const HPyFunc_ssizessizeobjargproc = ?*const fn ([*c]HPyContext, HPy, HPy_ssize_t, HPy_ssize_t, HPy) callconv(.C) c_int;
pub const HPyFunc_objobjargproc = ?*const fn ([*c]HPyContext, HPy, HPy, HPy) callconv(.C) c_int;
pub const HPyFunc_freefunc = ?*const fn ([*c]HPyContext, ?*anyopaque) callconv(.C) void;
pub const HPyFunc_getattrfunc = ?*const fn ([*c]HPyContext, HPy, [*c]u8) callconv(.C) HPy;
pub const HPyFunc_getattrofunc = ?*const fn ([*c]HPyContext, HPy, HPy) callconv(.C) HPy;
pub const HPyFunc_setattrfunc = ?*const fn ([*c]HPyContext, HPy, [*c]u8, HPy) callconv(.C) c_int;
pub const HPyFunc_setattrofunc = ?*const fn ([*c]HPyContext, HPy, HPy, HPy) callconv(.C) c_int;
pub const HPyFunc_reprfunc = ?*const fn ([*c]HPyContext, HPy) callconv(.C) HPy;
pub const HPyFunc_hashfunc = ?*const fn ([*c]HPyContext, HPy) callconv(.C) HPy_hash_t;
pub const HPyFunc_richcmpfunc = ?*const fn ([*c]HPyContext, HPy, HPy, HPy_RichCmpOp) callconv(.C) HPy;
pub const HPyFunc_getiterfunc = ?*const fn ([*c]HPyContext, HPy) callconv(.C) HPy;
pub const HPyFunc_iternextfunc = ?*const fn ([*c]HPyContext, HPy) callconv(.C) HPy;
pub const HPyFunc_descrgetfunc = ?*const fn ([*c]HPyContext, HPy, HPy, HPy) callconv(.C) HPy;
pub const HPyFunc_descrsetfunc = ?*const fn ([*c]HPyContext, HPy, HPy, HPy) callconv(.C) c_int;
pub const HPyFunc_initproc = ?*const fn ([*c]HPyContext, HPy, [*c]const HPy, HPy_ssize_t, HPy) callconv(.C) c_int;
pub const HPyFunc_newfunc = ?*const fn ([*c]HPyContext, HPy, [*c]const HPy, HPy_ssize_t, HPy) callconv(.C) HPy;
pub const HPyFunc_getter = ?*const fn ([*c]HPyContext, HPy, ?*anyopaque) callconv(.C) HPy;
pub const HPyFunc_setter = ?*const fn ([*c]HPyContext, HPy, HPy, ?*anyopaque) callconv(.C) c_int;
pub const HPyFunc_objobjproc = ?*const fn ([*c]HPyContext, HPy, HPy) callconv(.C) c_int;
pub const HPyFunc_getbufferproc = ?*const fn ([*c]HPyContext, HPy, [*c]HPy_buffer, c_int) callconv(.C) c_int;
pub const HPyFunc_releasebufferproc = ?*const fn ([*c]HPyContext, HPy, [*c]HPy_buffer) callconv(.C) void;
pub const HPyFunc_traverseproc = ?*const fn (?*anyopaque, HPyFunc_visitproc, ?*anyopaque) callconv(.C) c_int;
pub const HPyFunc_destructor = ?*const fn ([*c]HPyContext, HPy) callconv(.C) void;
pub const HPyFunc_destroyfunc = ?*const fn (?*anyopaque) callconv(.C) void;
pub const HPyFunc_mod_create = ?*const fn ([*c]HPyContext, HPy) callconv(.C) HPy;
pub const _HPyFunc_args_VARARGS = extern struct {
    self: ?*cpy_PyObject,
    args: [*c]const ?*cpy_PyObject,
    nargs: HPy_ssize_t,
    result: ?*cpy_PyObject,
};
pub const _HPyFunc_args_KEYWORDS = extern struct {
    self: ?*cpy_PyObject,
    args: [*c]const ?*cpy_PyObject,
    nargsf: usize,
    kwnames: ?*cpy_PyObject,
    result: ?*cpy_PyObject,
};
pub const _HPyFunc_args_INITPROC = extern struct {
    self: ?*cpy_PyObject,
    args: ?*cpy_PyObject,
    kw: ?*cpy_PyObject,
    result: c_int,
};
pub const _HPyFunc_args_NEWFUNC = extern struct {
    self: ?*cpy_PyObject,
    args: ?*cpy_PyObject,
    kw: ?*cpy_PyObject,
    result: ?*cpy_PyObject,
};
pub const _HPyFunc_args_RICHCMPFUNC = extern struct {
    arg0: ?*cpy_PyObject,
    arg1: ?*cpy_PyObject,
    arg2: HPy_RichCmpOp,
    result: ?*cpy_PyObject,
};
pub const _HPyFunc_args_GETBUFFERPROC = extern struct {
    self: ?*cpy_PyObject,
    view: ?*cpy_Py_buffer,
    flags: c_int,
    result: c_int,
};
pub const _HPyFunc_args_RELEASEBUFFERPROC = extern struct {
    self: ?*cpy_PyObject,
    view: ?*cpy_Py_buffer,
};
pub const _HPyFunc_args_TRAVERSEPROC = extern struct {
    self: ?*cpy_PyObject,
    visit: cpy_visitproc,
    arg: ?*anyopaque,
    result: c_int,
};
pub const _HPyFunc_args_MOD_CREATE = extern struct {
    spec: ?*cpy_PyObject,
    result: ?*cpy_PyObject,
};
pub const _HPyFunc_args_NOARGS = extern struct {
    self: ?*cpy_PyObject,
    result: ?*cpy_PyObject,
};
pub const _HPyFunc_args_O = extern struct {
    self: ?*cpy_PyObject,
    arg: ?*cpy_PyObject,
    result: ?*cpy_PyObject,
};
pub const _HPyFunc_args_UNARYFUNC = extern struct {
    arg0: ?*cpy_PyObject,
    result: ?*cpy_PyObject,
};
pub const _HPyFunc_args_BINARYFUNC = extern struct {
    arg0: ?*cpy_PyObject,
    arg1: ?*cpy_PyObject,
    result: ?*cpy_PyObject,
};
pub const _HPyFunc_args_TERNARYFUNC = extern struct {
    arg0: ?*cpy_PyObject,
    arg1: ?*cpy_PyObject,
    arg2: ?*cpy_PyObject,
    result: ?*cpy_PyObject,
};
pub const _HPyFunc_args_INQUIRY = extern struct {
    arg0: ?*cpy_PyObject,
    result: c_int,
};
pub const _HPyFunc_args_LENFUNC = extern struct {
    arg0: ?*cpy_PyObject,
    result: HPy_ssize_t,
};
pub const _HPyFunc_args_SSIZEARGFUNC = extern struct {
    arg0: ?*cpy_PyObject,
    arg1: HPy_ssize_t,
    result: ?*cpy_PyObject,
};
pub const _HPyFunc_args_SSIZESSIZEARGFUNC = extern struct {
    arg0: ?*cpy_PyObject,
    arg1: HPy_ssize_t,
    arg2: HPy_ssize_t,
    result: ?*cpy_PyObject,
};
pub const _HPyFunc_args_SSIZEOBJARGPROC = extern struct {
    arg0: ?*cpy_PyObject,
    arg1: HPy_ssize_t,
    arg2: ?*cpy_PyObject,
    result: c_int,
};
pub const _HPyFunc_args_SSIZESSIZEOBJARGPROC = extern struct {
    arg0: ?*cpy_PyObject,
    arg1: HPy_ssize_t,
    arg2: HPy_ssize_t,
    arg3: ?*cpy_PyObject,
    result: c_int,
};
pub const _HPyFunc_args_OBJOBJARGPROC = extern struct {
    arg0: ?*cpy_PyObject,
    arg1: ?*cpy_PyObject,
    arg2: ?*cpy_PyObject,
    result: c_int,
};
pub const _HPyFunc_args_FREEFUNC = extern struct {
    arg0: ?*anyopaque,
};
pub const _HPyFunc_args_GETATTRFUNC = extern struct {
    arg0: ?*cpy_PyObject,
    arg1: [*c]u8,
    result: ?*cpy_PyObject,
};
pub const _HPyFunc_args_GETATTROFUNC = extern struct {
    arg0: ?*cpy_PyObject,
    arg1: ?*cpy_PyObject,
    result: ?*cpy_PyObject,
};
pub const _HPyFunc_args_SETATTRFUNC = extern struct {
    arg0: ?*cpy_PyObject,
    arg1: [*c]u8,
    arg2: ?*cpy_PyObject,
    result: c_int,
};
pub const _HPyFunc_args_SETATTROFUNC = extern struct {
    arg0: ?*cpy_PyObject,
    arg1: ?*cpy_PyObject,
    arg2: ?*cpy_PyObject,
    result: c_int,
};
pub const _HPyFunc_args_REPRFUNC = extern struct {
    arg0: ?*cpy_PyObject,
    result: ?*cpy_PyObject,
};
pub const _HPyFunc_args_HASHFUNC = extern struct {
    arg0: ?*cpy_PyObject,
    result: HPy_hash_t,
};
pub const _HPyFunc_args_GETITERFUNC = extern struct {
    arg0: ?*cpy_PyObject,
    result: ?*cpy_PyObject,
};
pub const _HPyFunc_args_ITERNEXTFUNC = extern struct {
    arg0: ?*cpy_PyObject,
    result: ?*cpy_PyObject,
};
pub const _HPyFunc_args_DESCRGETFUNC = extern struct {
    arg0: ?*cpy_PyObject,
    arg1: ?*cpy_PyObject,
    arg2: ?*cpy_PyObject,
    result: ?*cpy_PyObject,
};
pub const _HPyFunc_args_DESCRSETFUNC = extern struct {
    arg0: ?*cpy_PyObject,
    arg1: ?*cpy_PyObject,
    arg2: ?*cpy_PyObject,
    result: c_int,
};
pub const _HPyFunc_args_GETTER = extern struct {
    arg0: ?*cpy_PyObject,
    arg1: ?*anyopaque,
    result: ?*cpy_PyObject,
};
pub const _HPyFunc_args_SETTER = extern struct {
    arg0: ?*cpy_PyObject,
    arg1: ?*cpy_PyObject,
    arg2: ?*anyopaque,
    result: c_int,
};
pub const _HPyFunc_args_OBJOBJPROC = extern struct {
    arg0: ?*cpy_PyObject,
    arg1: ?*cpy_PyObject,
    result: c_int,
};
pub const _HPyFunc_args_DESTRUCTOR = extern struct {
    arg0: ?*cpy_PyObject,
};
pub const ptrdiff_t = c_long;
pub const max_align_t = extern struct {
    __clang_max_align_nonce1: c_longlong align(8),
    __clang_max_align_nonce2: c_longdouble align(16),
};
pub const HPy_bf_getbuffer: c_int = 1;
pub const HPy_bf_releasebuffer: c_int = 2;
pub const HPy_mp_ass_subscript: c_int = 3;
pub const HPy_mp_length: c_int = 4;
pub const HPy_mp_subscript: c_int = 5;
pub const HPy_nb_absolute: c_int = 6;
pub const HPy_nb_add: c_int = 7;
pub const HPy_nb_and: c_int = 8;
pub const HPy_nb_bool: c_int = 9;
pub const HPy_nb_divmod: c_int = 10;
pub const HPy_nb_float: c_int = 11;
pub const HPy_nb_floor_divide: c_int = 12;
pub const HPy_nb_index: c_int = 13;
pub const HPy_nb_inplace_add: c_int = 14;
pub const HPy_nb_inplace_and: c_int = 15;
pub const HPy_nb_inplace_floor_divide: c_int = 16;
pub const HPy_nb_inplace_lshift: c_int = 17;
pub const HPy_nb_inplace_multiply: c_int = 18;
pub const HPy_nb_inplace_or: c_int = 19;
pub const HPy_nb_inplace_power: c_int = 20;
pub const HPy_nb_inplace_remainder: c_int = 21;
pub const HPy_nb_inplace_rshift: c_int = 22;
pub const HPy_nb_inplace_subtract: c_int = 23;
pub const HPy_nb_inplace_true_divide: c_int = 24;
pub const HPy_nb_inplace_xor: c_int = 25;
pub const HPy_nb_int: c_int = 26;
pub const HPy_nb_invert: c_int = 27;
pub const HPy_nb_lshift: c_int = 28;
pub const HPy_nb_multiply: c_int = 29;
pub const HPy_nb_negative: c_int = 30;
pub const HPy_nb_or: c_int = 31;
pub const HPy_nb_positive: c_int = 32;
pub const HPy_nb_power: c_int = 33;
pub const HPy_nb_remainder: c_int = 34;
pub const HPy_nb_rshift: c_int = 35;
pub const HPy_nb_subtract: c_int = 36;
pub const HPy_nb_true_divide: c_int = 37;
pub const HPy_nb_xor: c_int = 38;
pub const HPy_sq_ass_item: c_int = 39;
pub const HPy_sq_concat: c_int = 40;
pub const HPy_sq_contains: c_int = 41;
pub const HPy_sq_inplace_concat: c_int = 42;
pub const HPy_sq_inplace_repeat: c_int = 43;
pub const HPy_sq_item: c_int = 44;
pub const HPy_sq_length: c_int = 45;
pub const HPy_sq_repeat: c_int = 46;
pub const HPy_tp_call: c_int = 50;
pub const HPy_tp_hash: c_int = 59;
pub const HPy_tp_init: c_int = 60;
pub const HPy_tp_new: c_int = 65;
pub const HPy_tp_repr: c_int = 66;
pub const HPy_tp_richcompare: c_int = 67;
pub const HPy_tp_str: c_int = 70;
pub const HPy_tp_traverse: c_int = 71;
pub const HPy_nb_matrix_multiply: c_int = 75;
pub const HPy_nb_inplace_matrix_multiply: c_int = 76;
pub const HPy_tp_finalize: c_int = 80;
pub const HPy_tp_destroy: c_int = 1000;
pub const HPy_mod_create: c_int = 2000;
pub const HPy_mod_exec: c_int = 2001;
pub const HPySlot_Slot = c_uint;
pub const HPyFunc_Capsule_Destructor = ?*const fn ([*c]const u8, ?*anyopaque, ?*anyopaque) callconv(.C) void;
pub const HPySlot = extern struct {
    slot: HPySlot_Slot,
    impl: HPyCFunction,
    cpy_trampoline: cpy_PyCFunction,
};
pub const HPyMeth = extern struct {
    name: [*c]const u8,
    impl: HPyCFunction,
    cpy_trampoline: cpy_PyCFunction,
    signature: HPyFunc_Signature,
    doc: [*c]const u8,
};
pub const HPyMember_SHORT: c_int = 0;
pub const HPyMember_INT: c_int = 1;
pub const HPyMember_LONG: c_int = 2;
pub const HPyMember_FLOAT: c_int = 3;
pub const HPyMember_DOUBLE: c_int = 4;
pub const HPyMember_STRING: c_int = 5;
pub const HPyMember_OBJECT: c_int = 6;
pub const HPyMember_CHAR: c_int = 7;
pub const HPyMember_BYTE: c_int = 8;
pub const HPyMember_UBYTE: c_int = 9;
pub const HPyMember_USHORT: c_int = 10;
pub const HPyMember_UINT: c_int = 11;
pub const HPyMember_ULONG: c_int = 12;
pub const HPyMember_STRING_INPLACE: c_int = 13;
pub const HPyMember_BOOL: c_int = 14;
pub const HPyMember_OBJECT_EX: c_int = 16;
pub const HPyMember_LONGLONG: c_int = 17;
pub const HPyMember_ULONGLONG: c_int = 18;
pub const HPyMember_HPYSSIZET: c_int = 19;
pub const HPyMember_NONE: c_int = 20;
pub const HPyMember_FieldType = c_uint;
pub const HPyMember = extern struct {
    name: [*c]const u8,
    type: HPyMember_FieldType,
    offset: HPy_ssize_t,
    readonly: c_int,
    doc: [*c]const u8,
};
pub const HPyGetSet = extern struct {
    name: [*c]const u8,
    getter_impl: HPyCFunction,
    setter_impl: HPyCFunction,
    getter_cpy_trampoline: cpy_getter,
    setter_cpy_trampoline: cpy_setter,
    doc: [*c]const u8,
    closure: ?*anyopaque,
};
pub const HPyDef_Kind_Slot: c_int = 1;
pub const HPyDef_Kind_Meth: c_int = 2;
pub const HPyDef_Kind_Member: c_int = 3;
pub const HPyDef_Kind_GetSet: c_int = 4;
pub const HPyDef_Kind = c_uint;
const union_unnamed_2 = extern union {
    slot: HPySlot,
    meth: HPyMeth,
    member: HPyMember,
    getset: HPyGetSet,
};
pub const HPyDef = extern struct {
    kind: HPyDef_Kind,
    unnamed_0: union_unnamed_2,
};
pub const HPyCapsule_Destructor = extern struct {
    cpy_trampoline: cpy_PyCapsule_Destructor,
    impl: HPyFunc_Capsule_Destructor,
};
pub const HPyCallFunction = extern struct {
    cpy_trampoline: cpy_vectorcallfunc,
    impl: HPyFunc_keywords,
};
pub const HPyType_BuiltinShape_Legacy: c_int = -1;
pub const HPyType_BuiltinShape_Object: c_int = 0;
pub const HPyType_BuiltinShape_Type: c_int = 1;
pub const HPyType_BuiltinShape_Long: c_int = 2;
pub const HPyType_BuiltinShape_Float: c_int = 3;
pub const HPyType_BuiltinShape_Unicode: c_int = 4;
pub const HPyType_BuiltinShape_Tuple: c_int = 5;
pub const HPyType_BuiltinShape_List: c_int = 6;
pub const HPyType_BuiltinShape = c_int;
pub const HPyType_Vectorcall = extern struct {
    cpy_trampoline: cpy_vectorcallfunc,
    impl: HPyCallFunction,
};
pub const HPyType_Spec = extern struct {
    name: [*c]const u8,
    basicsize: c_int,
    itemsize: c_int,
    flags: c_ulong,
    builtin_shape: HPyType_BuiltinShape,
    legacy_slots: ?*anyopaque,
    defines: [*c][*c]HPyDef,
    doc: [*c]const u8,
};
pub const HPyType_SpecParam_Base: c_int = 1;
pub const HPyType_SpecParam_BasesTuple: c_int = 2;
pub const HPyType_SpecParam_Metaclass: c_int = 3;
pub const HPyType_SpecParam_Kind = c_uint;
pub const HPyType_SpecParam = extern struct {
    kind: HPyType_SpecParam_Kind,
    object: HPy,
};
pub extern var _ctx_for_trampolines: [*c]HPyContext;
pub const HPyModuleDef = extern struct {
    doc: [*c]const u8,
    size: HPy_ssize_t,
    legacy_methods: ?*cpy_PyMethodDef,
    defines: [*c][*c]HPyDef,
    globals: [*c][*c]HPyGlobal,
};
pub extern fn HPyArg_Parse(ctx: [*c]HPyContext, ht: [*c]HPyTracker, args: [*c]const HPy, nargs: usize, fmt: [*c]const u8, ...) c_int;
pub extern fn HPyArg_ParseKeywords(ctx: [*c]HPyContext, ht: [*c]HPyTracker, args: [*c]const HPy, nargs: usize, kwnames: HPy, fmt: [*c]const u8, keywords: [*c][*c]const u8, ...) c_int;
pub extern fn HPyArg_ParseKeywordsDict(ctx: [*c]HPyContext, ht: [*c]HPyTracker, args: [*c]const HPy, nargs: HPy_ssize_t, kw: HPy, fmt: [*c]const u8, keywords: [*c][*c]const u8, ...) c_int;
pub extern fn HPy_BuildValue(ctx: [*c]HPyContext, fmt: [*c]const u8, ...) HPy;
pub extern fn HPyUnicode_FromFormat(ctx: [*c]HPyContext, fmt: [*c]const u8, ...) HPy;
pub extern fn HPyUnicode_FromFormatV(ctx: [*c]HPyContext, format: [*c]const u8, vargs: [*c]struct___va_list_tag) HPy;
pub extern fn HPyErr_Format(ctx: [*c]HPyContext, h_type: HPy, fmt: [*c]const u8, ...) HPy;
pub extern fn HPyHelpers_AddType(ctx: [*c]HPyContext, obj: HPy, name: [*c]const u8, hpyspec: [*c]HPyType_Spec, params: [*c]HPyType_SpecParam) c_int;
pub extern fn HPyHelpers_PackArgsAndKeywords(ctx: [*c]HPyContext, args: [*c]const HPy, nargs: usize, kwnames: HPy, out_args_tuple: [*c]HPy, out_kwd: [*c]HPy) c_int;
pub const HPyStructSequence_Field = extern struct {
    name: [*c]const u8,
    doc: [*c]const u8,
};
pub const HPyStructSequence_Desc = extern struct {
    name: [*c]const u8,
    doc: [*c]const u8,
    fields: [*c]HPyStructSequence_Field,
};
pub extern const HPyStructSequence_UnnamedField: [*c]const u8;
pub extern fn HPyStructSequence_NewType(ctx: [*c]HPyContext, desc: [*c]HPyStructSequence_Desc) HPy;
pub extern fn HPyStructSequence_New(ctx: [*c]HPyContext, @"type": HPy, nargs: HPy_ssize_t, args: [*c]HPy) HPy;
pub fn HPy_Dup(arg_ctx: [*c]HPyContext, arg_h: HPy) callconv(.C) HPy {
    var ctx = arg_ctx;
    var h = arg_h;
    return ctx.*.ctx_Dup.?(ctx, h);
}
pub fn HPy_Close(arg_ctx: [*c]HPyContext, arg_h: HPy) callconv(.C) void {
    var ctx = arg_ctx;
    var h = arg_h;
    ctx.*.ctx_Close.?(ctx, h);
}
pub fn HPyLong_FromInt32_t(arg_ctx: [*c]HPyContext, arg_value: i32) callconv(.C) HPy {
    var ctx = arg_ctx;
    var value = arg_value;
    return ctx.*.ctx_Long_FromInt32_t.?(ctx, value);
}
pub fn HPyLong_FromUInt32_t(arg_ctx: [*c]HPyContext, arg_value: u32) callconv(.C) HPy {
    var ctx = arg_ctx;
    var value = arg_value;
    return ctx.*.ctx_Long_FromUInt32_t.?(ctx, value);
}
pub fn HPyLong_FromInt64_t(arg_ctx: [*c]HPyContext, arg_v: i64) callconv(.C) HPy {
    var ctx = arg_ctx;
    var v = arg_v;
    return ctx.*.ctx_Long_FromInt64_t.?(ctx, v);
}
pub fn HPyLong_FromUInt64_t(arg_ctx: [*c]HPyContext, arg_v: u64) callconv(.C) HPy {
    var ctx = arg_ctx;
    var v = arg_v;
    return ctx.*.ctx_Long_FromUInt64_t.?(ctx, v);
}
pub fn HPyLong_FromSize_t(arg_ctx: [*c]HPyContext, arg_value: usize) callconv(.C) HPy {
    var ctx = arg_ctx;
    var value = arg_value;
    return ctx.*.ctx_Long_FromSize_t.?(ctx, value);
}
pub fn HPyLong_FromSsize_t(arg_ctx: [*c]HPyContext, arg_value: HPy_ssize_t) callconv(.C) HPy {
    var ctx = arg_ctx;
    var value = arg_value;
    return ctx.*.ctx_Long_FromSsize_t.?(ctx, value);
}
pub fn HPyLong_AsInt32_t(arg_ctx: [*c]HPyContext, arg_h: HPy) callconv(.C) i32 {
    var ctx = arg_ctx;
    var h = arg_h;
    return ctx.*.ctx_Long_AsInt32_t.?(ctx, h);
}
pub fn HPyLong_AsUInt32_t(arg_ctx: [*c]HPyContext, arg_h: HPy) callconv(.C) u32 {
    var ctx = arg_ctx;
    var h = arg_h;
    return ctx.*.ctx_Long_AsUInt32_t.?(ctx, h);
}
pub fn HPyLong_AsUInt32_tMask(arg_ctx: [*c]HPyContext, arg_h: HPy) callconv(.C) u32 {
    var ctx = arg_ctx;
    var h = arg_h;
    return ctx.*.ctx_Long_AsUInt32_tMask.?(ctx, h);
}
pub fn HPyLong_AsInt64_t(arg_ctx: [*c]HPyContext, arg_h: HPy) callconv(.C) i64 {
    var ctx = arg_ctx;
    var h = arg_h;
    return ctx.*.ctx_Long_AsInt64_t.?(ctx, h);
}
pub fn HPyLong_AsUInt64_t(arg_ctx: [*c]HPyContext, arg_h: HPy) callconv(.C) u64 {
    var ctx = arg_ctx;
    var h = arg_h;
    return ctx.*.ctx_Long_AsUInt64_t.?(ctx, h);
}
pub fn HPyLong_AsUInt64_tMask(arg_ctx: [*c]HPyContext, arg_h: HPy) callconv(.C) u64 {
    var ctx = arg_ctx;
    var h = arg_h;
    return ctx.*.ctx_Long_AsUInt64_tMask.?(ctx, h);
}
pub fn HPyLong_AsSize_t(arg_ctx: [*c]HPyContext, arg_h: HPy) callconv(.C) usize {
    var ctx = arg_ctx;
    var h = arg_h;
    return ctx.*.ctx_Long_AsSize_t.?(ctx, h);
}
pub fn HPyLong_AsSsize_t(arg_ctx: [*c]HPyContext, arg_h: HPy) callconv(.C) HPy_ssize_t {
    var ctx = arg_ctx;
    var h = arg_h;
    return ctx.*.ctx_Long_AsSsize_t.?(ctx, h);
}
pub fn HPyLong_AsVoidPtr(arg_ctx: [*c]HPyContext, arg_h: HPy) callconv(.C) ?*anyopaque {
    var ctx = arg_ctx;
    var h = arg_h;
    return ctx.*.ctx_Long_AsVoidPtr.?(ctx, h);
}
pub fn HPyLong_AsDouble(arg_ctx: [*c]HPyContext, arg_h: HPy) callconv(.C) f64 {
    var ctx = arg_ctx;
    var h = arg_h;
    return ctx.*.ctx_Long_AsDouble.?(ctx, h);
}
pub fn HPyFloat_FromDouble(arg_ctx: [*c]HPyContext, arg_v: f64) callconv(.C) HPy {
    var ctx = arg_ctx;
    var v = arg_v;
    return ctx.*.ctx_Float_FromDouble.?(ctx, v);
}
pub fn HPyFloat_AsDouble(arg_ctx: [*c]HPyContext, arg_h: HPy) callconv(.C) f64 {
    var ctx = arg_ctx;
    var h = arg_h;
    return ctx.*.ctx_Float_AsDouble.?(ctx, h);
}
pub fn HPyBool_FromBool(arg_ctx: [*c]HPyContext, arg_v: bool) callconv(.C) HPy {
    var ctx = arg_ctx;
    var v = arg_v;
    return ctx.*.ctx_Bool_FromBool.?(ctx, v);
}
pub fn HPy_Length(arg_ctx: [*c]HPyContext, arg_h: HPy) callconv(.C) HPy_ssize_t {
    var ctx = arg_ctx;
    var h = arg_h;
    return ctx.*.ctx_Length.?(ctx, h);
}
pub fn HPyNumber_Check(arg_ctx: [*c]HPyContext, arg_h: HPy) callconv(.C) c_int {
    var ctx = arg_ctx;
    var h = arg_h;
    return ctx.*.ctx_Number_Check.?(ctx, h);
}
pub fn HPy_Add(arg_ctx: [*c]HPyContext, arg_h1: HPy, arg_h2: HPy) callconv(.C) HPy {
    var ctx = arg_ctx;
    var h1 = arg_h1;
    var h2 = arg_h2;
    return ctx.*.ctx_Add.?(ctx, h1, h2);
}
pub fn HPy_Subtract(arg_ctx: [*c]HPyContext, arg_h1: HPy, arg_h2: HPy) callconv(.C) HPy {
    var ctx = arg_ctx;
    var h1 = arg_h1;
    var h2 = arg_h2;
    return ctx.*.ctx_Subtract.?(ctx, h1, h2);
}
pub fn HPy_Multiply(arg_ctx: [*c]HPyContext, arg_h1: HPy, arg_h2: HPy) callconv(.C) HPy {
    var ctx = arg_ctx;
    var h1 = arg_h1;
    var h2 = arg_h2;
    return ctx.*.ctx_Multiply.?(ctx, h1, h2);
}
pub fn HPy_MatrixMultiply(arg_ctx: [*c]HPyContext, arg_h1: HPy, arg_h2: HPy) callconv(.C) HPy {
    var ctx = arg_ctx;
    var h1 = arg_h1;
    var h2 = arg_h2;
    return ctx.*.ctx_MatrixMultiply.?(ctx, h1, h2);
}
pub fn HPy_FloorDivide(arg_ctx: [*c]HPyContext, arg_h1: HPy, arg_h2: HPy) callconv(.C) HPy {
    var ctx = arg_ctx;
    var h1 = arg_h1;
    var h2 = arg_h2;
    return ctx.*.ctx_FloorDivide.?(ctx, h1, h2);
}
pub fn HPy_TrueDivide(arg_ctx: [*c]HPyContext, arg_h1: HPy, arg_h2: HPy) callconv(.C) HPy {
    var ctx = arg_ctx;
    var h1 = arg_h1;
    var h2 = arg_h2;
    return ctx.*.ctx_TrueDivide.?(ctx, h1, h2);
}
pub fn HPy_Remainder(arg_ctx: [*c]HPyContext, arg_h1: HPy, arg_h2: HPy) callconv(.C) HPy {
    var ctx = arg_ctx;
    var h1 = arg_h1;
    var h2 = arg_h2;
    return ctx.*.ctx_Remainder.?(ctx, h1, h2);
}
pub fn HPy_Divmod(arg_ctx: [*c]HPyContext, arg_h1: HPy, arg_h2: HPy) callconv(.C) HPy {
    var ctx = arg_ctx;
    var h1 = arg_h1;
    var h2 = arg_h2;
    return ctx.*.ctx_Divmod.?(ctx, h1, h2);
}
pub fn HPy_Power(arg_ctx: [*c]HPyContext, arg_h1: HPy, arg_h2: HPy, arg_h3: HPy) callconv(.C) HPy {
    var ctx = arg_ctx;
    var h1 = arg_h1;
    var h2 = arg_h2;
    var h3 = arg_h3;
    return ctx.*.ctx_Power.?(ctx, h1, h2, h3);
}
pub fn HPy_Negative(arg_ctx: [*c]HPyContext, arg_h1: HPy) callconv(.C) HPy {
    var ctx = arg_ctx;
    var h1 = arg_h1;
    return ctx.*.ctx_Negative.?(ctx, h1);
}
pub fn HPy_Positive(arg_ctx: [*c]HPyContext, arg_h1: HPy) callconv(.C) HPy {
    var ctx = arg_ctx;
    var h1 = arg_h1;
    return ctx.*.ctx_Positive.?(ctx, h1);
}
pub fn HPy_Absolute(arg_ctx: [*c]HPyContext, arg_h1: HPy) callconv(.C) HPy {
    var ctx = arg_ctx;
    var h1 = arg_h1;
    return ctx.*.ctx_Absolute.?(ctx, h1);
}
pub fn HPy_Invert(arg_ctx: [*c]HPyContext, arg_h1: HPy) callconv(.C) HPy {
    var ctx = arg_ctx;
    var h1 = arg_h1;
    return ctx.*.ctx_Invert.?(ctx, h1);
}
pub fn HPy_Lshift(arg_ctx: [*c]HPyContext, arg_h1: HPy, arg_h2: HPy) callconv(.C) HPy {
    var ctx = arg_ctx;
    var h1 = arg_h1;
    var h2 = arg_h2;
    return ctx.*.ctx_Lshift.?(ctx, h1, h2);
}
pub fn HPy_Rshift(arg_ctx: [*c]HPyContext, arg_h1: HPy, arg_h2: HPy) callconv(.C) HPy {
    var ctx = arg_ctx;
    var h1 = arg_h1;
    var h2 = arg_h2;
    return ctx.*.ctx_Rshift.?(ctx, h1, h2);
}
pub fn HPy_And(arg_ctx: [*c]HPyContext, arg_h1: HPy, arg_h2: HPy) callconv(.C) HPy {
    var ctx = arg_ctx;
    var h1 = arg_h1;
    var h2 = arg_h2;
    return ctx.*.ctx_And.?(ctx, h1, h2);
}
pub fn HPy_Xor(arg_ctx: [*c]HPyContext, arg_h1: HPy, arg_h2: HPy) callconv(.C) HPy {
    var ctx = arg_ctx;
    var h1 = arg_h1;
    var h2 = arg_h2;
    return ctx.*.ctx_Xor.?(ctx, h1, h2);
}
pub fn HPy_Or(arg_ctx: [*c]HPyContext, arg_h1: HPy, arg_h2: HPy) callconv(.C) HPy {
    var ctx = arg_ctx;
    var h1 = arg_h1;
    var h2 = arg_h2;
    return ctx.*.ctx_Or.?(ctx, h1, h2);
}
pub fn HPy_Index(arg_ctx: [*c]HPyContext, arg_h1: HPy) callconv(.C) HPy {
    var ctx = arg_ctx;
    var h1 = arg_h1;
    return ctx.*.ctx_Index.?(ctx, h1);
}
pub fn HPy_Long(arg_ctx: [*c]HPyContext, arg_h1: HPy) callconv(.C) HPy {
    var ctx = arg_ctx;
    var h1 = arg_h1;
    return ctx.*.ctx_Long.?(ctx, h1);
}
pub fn HPy_Float(arg_ctx: [*c]HPyContext, arg_h1: HPy) callconv(.C) HPy {
    var ctx = arg_ctx;
    var h1 = arg_h1;
    return ctx.*.ctx_Float.?(ctx, h1);
}
pub fn HPy_InPlaceAdd(arg_ctx: [*c]HPyContext, arg_h1: HPy, arg_h2: HPy) callconv(.C) HPy {
    var ctx = arg_ctx;
    var h1 = arg_h1;
    var h2 = arg_h2;
    return ctx.*.ctx_InPlaceAdd.?(ctx, h1, h2);
}
pub fn HPy_InPlaceSubtract(arg_ctx: [*c]HPyContext, arg_h1: HPy, arg_h2: HPy) callconv(.C) HPy {
    var ctx = arg_ctx;
    var h1 = arg_h1;
    var h2 = arg_h2;
    return ctx.*.ctx_InPlaceSubtract.?(ctx, h1, h2);
}
pub fn HPy_InPlaceMultiply(arg_ctx: [*c]HPyContext, arg_h1: HPy, arg_h2: HPy) callconv(.C) HPy {
    var ctx = arg_ctx;
    var h1 = arg_h1;
    var h2 = arg_h2;
    return ctx.*.ctx_InPlaceMultiply.?(ctx, h1, h2);
}
pub fn HPy_InPlaceMatrixMultiply(arg_ctx: [*c]HPyContext, arg_h1: HPy, arg_h2: HPy) callconv(.C) HPy {
    var ctx = arg_ctx;
    var h1 = arg_h1;
    var h2 = arg_h2;
    return ctx.*.ctx_InPlaceMatrixMultiply.?(ctx, h1, h2);
}
pub fn HPy_InPlaceFloorDivide(arg_ctx: [*c]HPyContext, arg_h1: HPy, arg_h2: HPy) callconv(.C) HPy {
    var ctx = arg_ctx;
    var h1 = arg_h1;
    var h2 = arg_h2;
    return ctx.*.ctx_InPlaceFloorDivide.?(ctx, h1, h2);
}
pub fn HPy_InPlaceTrueDivide(arg_ctx: [*c]HPyContext, arg_h1: HPy, arg_h2: HPy) callconv(.C) HPy {
    var ctx = arg_ctx;
    var h1 = arg_h1;
    var h2 = arg_h2;
    return ctx.*.ctx_InPlaceTrueDivide.?(ctx, h1, h2);
}
pub fn HPy_InPlaceRemainder(arg_ctx: [*c]HPyContext, arg_h1: HPy, arg_h2: HPy) callconv(.C) HPy {
    var ctx = arg_ctx;
    var h1 = arg_h1;
    var h2 = arg_h2;
    return ctx.*.ctx_InPlaceRemainder.?(ctx, h1, h2);
}
pub fn HPy_InPlacePower(arg_ctx: [*c]HPyContext, arg_h1: HPy, arg_h2: HPy, arg_h3: HPy) callconv(.C) HPy {
    var ctx = arg_ctx;
    var h1 = arg_h1;
    var h2 = arg_h2;
    var h3 = arg_h3;
    return ctx.*.ctx_InPlacePower.?(ctx, h1, h2, h3);
}
pub fn HPy_InPlaceLshift(arg_ctx: [*c]HPyContext, arg_h1: HPy, arg_h2: HPy) callconv(.C) HPy {
    var ctx = arg_ctx;
    var h1 = arg_h1;
    var h2 = arg_h2;
    return ctx.*.ctx_InPlaceLshift.?(ctx, h1, h2);
}
pub fn HPy_InPlaceRshift(arg_ctx: [*c]HPyContext, arg_h1: HPy, arg_h2: HPy) callconv(.C) HPy {
    var ctx = arg_ctx;
    var h1 = arg_h1;
    var h2 = arg_h2;
    return ctx.*.ctx_InPlaceRshift.?(ctx, h1, h2);
}
pub fn HPy_InPlaceAnd(arg_ctx: [*c]HPyContext, arg_h1: HPy, arg_h2: HPy) callconv(.C) HPy {
    var ctx = arg_ctx;
    var h1 = arg_h1;
    var h2 = arg_h2;
    return ctx.*.ctx_InPlaceAnd.?(ctx, h1, h2);
}
pub fn HPy_InPlaceXor(arg_ctx: [*c]HPyContext, arg_h1: HPy, arg_h2: HPy) callconv(.C) HPy {
    var ctx = arg_ctx;
    var h1 = arg_h1;
    var h2 = arg_h2;
    return ctx.*.ctx_InPlaceXor.?(ctx, h1, h2);
}
pub fn HPy_InPlaceOr(arg_ctx: [*c]HPyContext, arg_h1: HPy, arg_h2: HPy) callconv(.C) HPy {
    var ctx = arg_ctx;
    var h1 = arg_h1;
    var h2 = arg_h2;
    return ctx.*.ctx_InPlaceOr.?(ctx, h1, h2);
}
pub fn HPyCallable_Check(arg_ctx: [*c]HPyContext, arg_h: HPy) callconv(.C) c_int {
    var ctx = arg_ctx;
    var h = arg_h;
    return ctx.*.ctx_Callable_Check.?(ctx, h);
}
pub fn HPy_CallTupleDict(arg_ctx: [*c]HPyContext, arg_callable: HPy, arg_args: HPy, arg_kw: HPy) callconv(.C) HPy {
    var ctx = arg_ctx;
    var callable = arg_callable;
    var args = arg_args;
    var kw = arg_kw;
    return ctx.*.ctx_CallTupleDict.?(ctx, callable, args, kw);
}
pub fn HPy_Call(arg_ctx: [*c]HPyContext, arg_callable: HPy, arg_args: [*c]const HPy, arg_nargs: usize, arg_kwnames: HPy) callconv(.C) HPy {
    var ctx = arg_ctx;
    var callable = arg_callable;
    var args = arg_args;
    var nargs = arg_nargs;
    var kwnames = arg_kwnames;
    return ctx.*.ctx_Call.?(ctx, callable, args, nargs, kwnames);
}
pub fn HPy_CallMethod(arg_ctx: [*c]HPyContext, arg_name: HPy, arg_args: [*c]const HPy, arg_nargs: usize, arg_kwnames: HPy) callconv(.C) HPy {
    var ctx = arg_ctx;
    var name = arg_name;
    var args = arg_args;
    var nargs = arg_nargs;
    var kwnames = arg_kwnames;
    return ctx.*.ctx_CallMethod.?(ctx, name, args, nargs, kwnames);
}
pub fn HPyErr_SetString(arg_ctx: [*c]HPyContext, arg_h_type: HPy, arg_utf8_message: [*c]const u8) callconv(.C) HPy {
    var ctx = arg_ctx;
    var h_type = arg_h_type;
    var utf8_message = arg_utf8_message;
    ctx.*.ctx_Err_SetString.?(ctx, h_type, utf8_message);
    return HPy{
        ._i = @bitCast(isize, @as(c_long, @as(c_int, 0))),
    };
}
pub fn HPyErr_SetObject(arg_ctx: [*c]HPyContext, arg_h_type: HPy, arg_h_value: HPy) callconv(.C) HPy {
    var ctx = arg_ctx;
    var h_type = arg_h_type;
    var h_value = arg_h_value;
    ctx.*.ctx_Err_SetObject.?(ctx, h_type, h_value);
    return HPy{
        ._i = @bitCast(isize, @as(c_long, @as(c_int, 0))),
    };
}
pub fn HPyErr_SetFromErrnoWithFilename(arg_ctx: [*c]HPyContext, arg_h_type: HPy, arg_filename_fsencoded: [*c]const u8) callconv(.C) HPy {
    var ctx = arg_ctx;
    var h_type = arg_h_type;
    var filename_fsencoded = arg_filename_fsencoded;
    return ctx.*.ctx_Err_SetFromErrnoWithFilename.?(ctx, h_type, filename_fsencoded);
}
pub fn HPyErr_SetFromErrnoWithFilenameObjects(arg_ctx: [*c]HPyContext, arg_h_type: HPy, arg_filename1: HPy, arg_filename2: HPy) callconv(.C) HPy {
    var ctx = arg_ctx;
    var h_type = arg_h_type;
    var filename1 = arg_filename1;
    var filename2 = arg_filename2;
    ctx.*.ctx_Err_SetFromErrnoWithFilenameObjects.?(ctx, h_type, filename1, filename2);
    return HPy{
        ._i = @bitCast(isize, @as(c_long, @as(c_int, 0))),
    };
}
pub fn HPyErr_Occurred(arg_ctx: [*c]HPyContext) callconv(.C) c_int {
    var ctx = arg_ctx;
    return ctx.*.ctx_Err_Occurred.?(ctx);
}
pub fn HPyErr_ExceptionMatches(arg_ctx: [*c]HPyContext, arg_exc: HPy) callconv(.C) c_int {
    var ctx = arg_ctx;
    var exc = arg_exc;
    return ctx.*.ctx_Err_ExceptionMatches.?(ctx, exc);
}
pub fn HPyErr_NoMemory(arg_ctx: [*c]HPyContext) callconv(.C) HPy {
    var ctx = arg_ctx;
    ctx.*.ctx_Err_NoMemory.?(ctx);
    return HPy{
        ._i = @bitCast(isize, @as(c_long, @as(c_int, 0))),
    };
}
pub fn HPyErr_Clear(arg_ctx: [*c]HPyContext) callconv(.C) void {
    var ctx = arg_ctx;
    ctx.*.ctx_Err_Clear.?(ctx);
}
pub fn HPyErr_NewException(arg_ctx: [*c]HPyContext, arg_utf8_name: [*c]const u8, arg_base: HPy, arg_dict: HPy) callconv(.C) HPy {
    var ctx = arg_ctx;
    var utf8_name = arg_utf8_name;
    var base = arg_base;
    var dict = arg_dict;
    return ctx.*.ctx_Err_NewException.?(ctx, utf8_name, base, dict);
}
pub fn HPyErr_NewExceptionWithDoc(arg_ctx: [*c]HPyContext, arg_utf8_name: [*c]const u8, arg_utf8_doc: [*c]const u8, arg_base: HPy, arg_dict: HPy) callconv(.C) HPy {
    var ctx = arg_ctx;
    var utf8_name = arg_utf8_name;
    var utf8_doc = arg_utf8_doc;
    var base = arg_base;
    var dict = arg_dict;
    return ctx.*.ctx_Err_NewExceptionWithDoc.?(ctx, utf8_name, utf8_doc, base, dict);
}
pub fn HPyErr_WarnEx(arg_ctx: [*c]HPyContext, arg_category: HPy, arg_utf8_message: [*c]const u8, arg_stack_level: HPy_ssize_t) callconv(.C) c_int {
    var ctx = arg_ctx;
    var category = arg_category;
    var utf8_message = arg_utf8_message;
    var stack_level = arg_stack_level;
    return ctx.*.ctx_Err_WarnEx.?(ctx, category, utf8_message, stack_level);
}
pub fn HPyErr_WriteUnraisable(arg_ctx: [*c]HPyContext, arg_obj: HPy) callconv(.C) void {
    var ctx = arg_ctx;
    var obj = arg_obj;
    ctx.*.ctx_Err_WriteUnraisable.?(ctx, obj);
}
pub fn HPy_IsTrue(arg_ctx: [*c]HPyContext, arg_h: HPy) callconv(.C) c_int {
    var ctx = arg_ctx;
    var h = arg_h;
    return ctx.*.ctx_IsTrue.?(ctx, h);
}
pub fn HPyType_FromSpec(arg_ctx: [*c]HPyContext, arg_spec: [*c]HPyType_Spec, arg_params: [*c]HPyType_SpecParam) callconv(.C) HPy {
    var ctx = arg_ctx;
    var spec = arg_spec;
    var params = arg_params;
    return ctx.*.ctx_Type_FromSpec.?(ctx, spec, params);
}
pub fn HPyType_GenericNew(arg_ctx: [*c]HPyContext, arg_type: HPy, arg_args: [*c]const HPy, arg_nargs: HPy_ssize_t, arg_kw: HPy) callconv(.C) HPy {
    var ctx = arg_ctx;
    var @"type" = arg_type;
    var args = arg_args;
    var nargs = arg_nargs;
    var kw = arg_kw;
    return ctx.*.ctx_Type_GenericNew.?(ctx, @"type", args, nargs, kw);
}
pub fn HPy_GetAttr(arg_ctx: [*c]HPyContext, arg_obj: HPy, arg_name: HPy) callconv(.C) HPy {
    var ctx = arg_ctx;
    var obj = arg_obj;
    var name = arg_name;
    return ctx.*.ctx_GetAttr.?(ctx, obj, name);
}
pub fn HPy_GetAttr_s(arg_ctx: [*c]HPyContext, arg_obj: HPy, arg_utf8_name: [*c]const u8) callconv(.C) HPy {
    var ctx = arg_ctx;
    var obj = arg_obj;
    var utf8_name = arg_utf8_name;
    return ctx.*.ctx_GetAttr_s.?(ctx, obj, utf8_name);
}
pub fn HPy_HasAttr(arg_ctx: [*c]HPyContext, arg_obj: HPy, arg_name: HPy) callconv(.C) c_int {
    var ctx = arg_ctx;
    var obj = arg_obj;
    var name = arg_name;
    return ctx.*.ctx_HasAttr.?(ctx, obj, name);
}
pub fn HPy_HasAttr_s(arg_ctx: [*c]HPyContext, arg_obj: HPy, arg_utf8_name: [*c]const u8) callconv(.C) c_int {
    var ctx = arg_ctx;
    var obj = arg_obj;
    var utf8_name = arg_utf8_name;
    return ctx.*.ctx_HasAttr_s.?(ctx, obj, utf8_name);
}
pub fn HPy_SetAttr(arg_ctx: [*c]HPyContext, arg_obj: HPy, arg_name: HPy, arg_value: HPy) callconv(.C) c_int {
    var ctx = arg_ctx;
    var obj = arg_obj;
    var name = arg_name;
    var value = arg_value;
    return ctx.*.ctx_SetAttr.?(ctx, obj, name, value);
}
pub fn HPy_SetAttr_s(arg_ctx: [*c]HPyContext, arg_obj: HPy, arg_utf8_name: [*c]const u8, arg_value: HPy) callconv(.C) c_int {
    var ctx = arg_ctx;
    var obj = arg_obj;
    var utf8_name = arg_utf8_name;
    var value = arg_value;
    return ctx.*.ctx_SetAttr_s.?(ctx, obj, utf8_name, value);
}
pub fn HPy_GetItem(arg_ctx: [*c]HPyContext, arg_obj: HPy, arg_key: HPy) callconv(.C) HPy {
    var ctx = arg_ctx;
    var obj = arg_obj;
    var key = arg_key;
    return ctx.*.ctx_GetItem.?(ctx, obj, key);
}
pub fn HPy_GetItem_i(arg_ctx: [*c]HPyContext, arg_obj: HPy, arg_idx: HPy_ssize_t) callconv(.C) HPy {
    var ctx = arg_ctx;
    var obj = arg_obj;
    var idx = arg_idx;
    return ctx.*.ctx_GetItem_i.?(ctx, obj, idx);
}
pub fn HPy_GetItem_s(arg_ctx: [*c]HPyContext, arg_obj: HPy, arg_utf8_key: [*c]const u8) callconv(.C) HPy {
    var ctx = arg_ctx;
    var obj = arg_obj;
    var utf8_key = arg_utf8_key;
    return ctx.*.ctx_GetItem_s.?(ctx, obj, utf8_key);
}
pub fn HPy_Contains(arg_ctx: [*c]HPyContext, arg_container: HPy, arg_key: HPy) callconv(.C) c_int {
    var ctx = arg_ctx;
    var container = arg_container;
    var key = arg_key;
    return ctx.*.ctx_Contains.?(ctx, container, key);
}
pub fn HPy_SetItem(arg_ctx: [*c]HPyContext, arg_obj: HPy, arg_key: HPy, arg_value: HPy) callconv(.C) c_int {
    var ctx = arg_ctx;
    var obj = arg_obj;
    var key = arg_key;
    var value = arg_value;
    return ctx.*.ctx_SetItem.?(ctx, obj, key, value);
}
pub fn HPy_SetItem_i(arg_ctx: [*c]HPyContext, arg_obj: HPy, arg_idx: HPy_ssize_t, arg_value: HPy) callconv(.C) c_int {
    var ctx = arg_ctx;
    var obj = arg_obj;
    var idx = arg_idx;
    var value = arg_value;
    return ctx.*.ctx_SetItem_i.?(ctx, obj, idx, value);
}
pub fn HPy_SetItem_s(arg_ctx: [*c]HPyContext, arg_obj: HPy, arg_utf8_key: [*c]const u8, arg_value: HPy) callconv(.C) c_int {
    var ctx = arg_ctx;
    var obj = arg_obj;
    var utf8_key = arg_utf8_key;
    var value = arg_value;
    return ctx.*.ctx_SetItem_s.?(ctx, obj, utf8_key, value);
}
pub fn HPy_DelItem(arg_ctx: [*c]HPyContext, arg_obj: HPy, arg_key: HPy) callconv(.C) c_int {
    var ctx = arg_ctx;
    var obj = arg_obj;
    var key = arg_key;
    return ctx.*.ctx_DelItem.?(ctx, obj, key);
}
pub fn HPy_DelItem_i(arg_ctx: [*c]HPyContext, arg_obj: HPy, arg_idx: HPy_ssize_t) callconv(.C) c_int {
    var ctx = arg_ctx;
    var obj = arg_obj;
    var idx = arg_idx;
    return ctx.*.ctx_DelItem_i.?(ctx, obj, idx);
}
pub fn HPy_DelItem_s(arg_ctx: [*c]HPyContext, arg_obj: HPy, arg_utf8_key: [*c]const u8) callconv(.C) c_int {
    var ctx = arg_ctx;
    var obj = arg_obj;
    var utf8_key = arg_utf8_key;
    return ctx.*.ctx_DelItem_s.?(ctx, obj, utf8_key);
}
pub fn HPy_Type(arg_ctx: [*c]HPyContext, arg_obj: HPy) callconv(.C) HPy {
    var ctx = arg_ctx;
    var obj = arg_obj;
    return ctx.*.ctx_Type.?(ctx, obj);
}
pub fn HPy_TypeCheck(arg_ctx: [*c]HPyContext, arg_obj: HPy, arg_type: HPy) callconv(.C) c_int {
    var ctx = arg_ctx;
    var obj = arg_obj;
    var @"type" = arg_type;
    return ctx.*.ctx_TypeCheck.?(ctx, obj, @"type");
}
pub fn HPyType_GetName(arg_ctx: [*c]HPyContext, arg_type: HPy) callconv(.C) [*c]const u8 {
    var ctx = arg_ctx;
    var @"type" = arg_type;
    return ctx.*.ctx_Type_GetName.?(ctx, @"type");
}
pub fn HPyType_IsSubtype(arg_ctx: [*c]HPyContext, arg_sub: HPy, arg_type: HPy) callconv(.C) c_int {
    var ctx = arg_ctx;
    var sub = arg_sub;
    var @"type" = arg_type;
    return ctx.*.ctx_Type_IsSubtype.?(ctx, sub, @"type");
}
pub fn HPy_Is(arg_ctx: [*c]HPyContext, arg_obj: HPy, arg_other: HPy) callconv(.C) c_int {
    var ctx = arg_ctx;
    var obj = arg_obj;
    var other = arg_other;
    return ctx.*.ctx_Is.?(ctx, obj, other);
}
pub fn _HPy_AsStruct_Object(arg_ctx: [*c]HPyContext, arg_h: HPy) callconv(.C) ?*anyopaque {
    var ctx = arg_ctx;
    var h = arg_h;
    return ctx.*.ctx_AsStruct_Object.?(ctx, h);
}
pub fn _HPy_AsStruct_Legacy(arg_ctx: [*c]HPyContext, arg_h: HPy) callconv(.C) ?*anyopaque {
    var ctx = arg_ctx;
    var h = arg_h;
    return ctx.*.ctx_AsStruct_Legacy.?(ctx, h);
}
pub fn _HPy_AsStruct_Type(arg_ctx: [*c]HPyContext, arg_h: HPy) callconv(.C) ?*anyopaque {
    var ctx = arg_ctx;
    var h = arg_h;
    return ctx.*.ctx_AsStruct_Type.?(ctx, h);
}
pub fn _HPy_AsStruct_Long(arg_ctx: [*c]HPyContext, arg_h: HPy) callconv(.C) ?*anyopaque {
    var ctx = arg_ctx;
    var h = arg_h;
    return ctx.*.ctx_AsStruct_Long.?(ctx, h);
}
pub fn _HPy_AsStruct_Float(arg_ctx: [*c]HPyContext, arg_h: HPy) callconv(.C) ?*anyopaque {
    var ctx = arg_ctx;
    var h = arg_h;
    return ctx.*.ctx_AsStruct_Float.?(ctx, h);
}
pub fn _HPy_AsStruct_Unicode(arg_ctx: [*c]HPyContext, arg_h: HPy) callconv(.C) ?*anyopaque {
    var ctx = arg_ctx;
    var h = arg_h;
    return ctx.*.ctx_AsStruct_Unicode.?(ctx, h);
}
pub fn _HPy_AsStruct_Tuple(arg_ctx: [*c]HPyContext, arg_h: HPy) callconv(.C) ?*anyopaque {
    var ctx = arg_ctx;
    var h = arg_h;
    return ctx.*.ctx_AsStruct_Tuple.?(ctx, h);
}
pub fn _HPy_AsStruct_List(arg_ctx: [*c]HPyContext, arg_h: HPy) callconv(.C) ?*anyopaque {
    var ctx = arg_ctx;
    var h = arg_h;
    return ctx.*.ctx_AsStruct_List.?(ctx, h);
}
pub fn _HPyType_GetBuiltinShape(arg_ctx: [*c]HPyContext, arg_h_type: HPy) callconv(.C) HPyType_BuiltinShape {
    var ctx = arg_ctx;
    var h_type = arg_h_type;
    return ctx.*.ctx_Type_GetBuiltinShape.?(ctx, h_type);
}
pub fn HPy_Repr(arg_ctx: [*c]HPyContext, arg_obj: HPy) callconv(.C) HPy {
    var ctx = arg_ctx;
    var obj = arg_obj;
    return ctx.*.ctx_Repr.?(ctx, obj);
}
pub fn HPy_Str(arg_ctx: [*c]HPyContext, arg_obj: HPy) callconv(.C) HPy {
    var ctx = arg_ctx;
    var obj = arg_obj;
    return ctx.*.ctx_Str.?(ctx, obj);
}
pub fn HPy_ASCII(arg_ctx: [*c]HPyContext, arg_obj: HPy) callconv(.C) HPy {
    var ctx = arg_ctx;
    var obj = arg_obj;
    return ctx.*.ctx_ASCII.?(ctx, obj);
}
pub fn HPy_Bytes(arg_ctx: [*c]HPyContext, arg_obj: HPy) callconv(.C) HPy {
    var ctx = arg_ctx;
    var obj = arg_obj;
    return ctx.*.ctx_Bytes.?(ctx, obj);
}
pub fn HPy_RichCompare(arg_ctx: [*c]HPyContext, arg_v: HPy, arg_w: HPy, arg_op: c_int) callconv(.C) HPy {
    var ctx = arg_ctx;
    var v = arg_v;
    var w = arg_w;
    var op = arg_op;
    return ctx.*.ctx_RichCompare.?(ctx, v, w, op);
}
pub fn HPy_RichCompareBool(arg_ctx: [*c]HPyContext, arg_v: HPy, arg_w: HPy, arg_op: c_int) callconv(.C) c_int {
    var ctx = arg_ctx;
    var v = arg_v;
    var w = arg_w;
    var op = arg_op;
    return ctx.*.ctx_RichCompareBool.?(ctx, v, w, op);
}
pub fn HPy_Hash(arg_ctx: [*c]HPyContext, arg_obj: HPy) callconv(.C) HPy_hash_t {
    var ctx = arg_ctx;
    var obj = arg_obj;
    return ctx.*.ctx_Hash.?(ctx, obj);
}
pub fn HPyBytes_Check(arg_ctx: [*c]HPyContext, arg_h: HPy) callconv(.C) c_int {
    var ctx = arg_ctx;
    var h = arg_h;
    return ctx.*.ctx_Bytes_Check.?(ctx, h);
}
pub fn HPyBytes_Size(arg_ctx: [*c]HPyContext, arg_h: HPy) callconv(.C) HPy_ssize_t {
    var ctx = arg_ctx;
    var h = arg_h;
    return ctx.*.ctx_Bytes_Size.?(ctx, h);
}
pub fn HPyBytes_GET_SIZE(arg_ctx: [*c]HPyContext, arg_h: HPy) callconv(.C) HPy_ssize_t {
    var ctx = arg_ctx;
    var h = arg_h;
    return ctx.*.ctx_Bytes_GET_SIZE.?(ctx, h);
}
pub fn HPyBytes_AsString(arg_ctx: [*c]HPyContext, arg_h: HPy) callconv(.C) [*c]const u8 {
    var ctx = arg_ctx;
    var h = arg_h;
    return ctx.*.ctx_Bytes_AsString.?(ctx, h);
}
pub fn HPyBytes_AS_STRING(arg_ctx: [*c]HPyContext, arg_h: HPy) callconv(.C) [*c]const u8 {
    var ctx = arg_ctx;
    var h = arg_h;
    return ctx.*.ctx_Bytes_AS_STRING.?(ctx, h);
}
pub fn HPyBytes_FromString(arg_ctx: [*c]HPyContext, arg_bytes: [*c]const u8) callconv(.C) HPy {
    var ctx = arg_ctx;
    var bytes = arg_bytes;
    return ctx.*.ctx_Bytes_FromString.?(ctx, bytes);
}
pub fn HPyBytes_FromStringAndSize(arg_ctx: [*c]HPyContext, arg_bytes: [*c]const u8, arg_len: HPy_ssize_t) callconv(.C) HPy {
    var ctx = arg_ctx;
    var bytes = arg_bytes;
    var len = arg_len;
    return ctx.*.ctx_Bytes_FromStringAndSize.?(ctx, bytes, len);
}
pub fn HPyUnicode_FromString(arg_ctx: [*c]HPyContext, arg_utf8: [*c]const u8) callconv(.C) HPy {
    var ctx = arg_ctx;
    var utf8 = arg_utf8;
    return ctx.*.ctx_Unicode_FromString.?(ctx, utf8);
}
pub fn HPyUnicode_Check(arg_ctx: [*c]HPyContext, arg_h: HPy) callconv(.C) c_int {
    var ctx = arg_ctx;
    var h = arg_h;
    return ctx.*.ctx_Unicode_Check.?(ctx, h);
}
pub fn HPyUnicode_AsASCIIString(arg_ctx: [*c]HPyContext, arg_h: HPy) callconv(.C) HPy {
    var ctx = arg_ctx;
    var h = arg_h;
    return ctx.*.ctx_Unicode_AsASCIIString.?(ctx, h);
}
pub fn HPyUnicode_AsLatin1String(arg_ctx: [*c]HPyContext, arg_h: HPy) callconv(.C) HPy {
    var ctx = arg_ctx;
    var h = arg_h;
    return ctx.*.ctx_Unicode_AsLatin1String.?(ctx, h);
}
pub fn HPyUnicode_AsUTF8String(arg_ctx: [*c]HPyContext, arg_h: HPy) callconv(.C) HPy {
    var ctx = arg_ctx;
    var h = arg_h;
    return ctx.*.ctx_Unicode_AsUTF8String.?(ctx, h);
}
pub fn HPyUnicode_AsUTF8AndSize(arg_ctx: [*c]HPyContext, arg_h: HPy, arg_size: [*c]HPy_ssize_t) callconv(.C) [*c]const u8 {
    var ctx = arg_ctx;
    var h = arg_h;
    var size = arg_size;
    return ctx.*.ctx_Unicode_AsUTF8AndSize.?(ctx, h, size);
}
pub fn HPyUnicode_FromWideChar(arg_ctx: [*c]HPyContext, arg_w: [*c]const wchar_t, arg_size: HPy_ssize_t) callconv(.C) HPy {
    var ctx = arg_ctx;
    var w = arg_w;
    var size = arg_size;
    return ctx.*.ctx_Unicode_FromWideChar.?(ctx, w, size);
}
pub fn HPyUnicode_DecodeFSDefault(arg_ctx: [*c]HPyContext, arg_v: [*c]const u8) callconv(.C) HPy {
    var ctx = arg_ctx;
    var v = arg_v;
    return ctx.*.ctx_Unicode_DecodeFSDefault.?(ctx, v);
}
pub fn HPyUnicode_DecodeFSDefaultAndSize(arg_ctx: [*c]HPyContext, arg_v: [*c]const u8, arg_size: HPy_ssize_t) callconv(.C) HPy {
    var ctx = arg_ctx;
    var v = arg_v;
    var size = arg_size;
    return ctx.*.ctx_Unicode_DecodeFSDefaultAndSize.?(ctx, v, size);
}
pub fn HPyUnicode_EncodeFSDefault(arg_ctx: [*c]HPyContext, arg_h: HPy) callconv(.C) HPy {
    var ctx = arg_ctx;
    var h = arg_h;
    return ctx.*.ctx_Unicode_EncodeFSDefault.?(ctx, h);
}
pub fn HPyUnicode_ReadChar(arg_ctx: [*c]HPyContext, arg_h: HPy, arg_index: HPy_ssize_t) callconv(.C) HPy_UCS4 {
    var ctx = arg_ctx;
    var h = arg_h;
    var index = arg_index;
    return ctx.*.ctx_Unicode_ReadChar.?(ctx, h, index);
}
pub fn HPyUnicode_DecodeASCII(arg_ctx: [*c]HPyContext, arg_ascii: [*c]const u8, arg_size: HPy_ssize_t, arg_errors: [*c]const u8) callconv(.C) HPy {
    var ctx = arg_ctx;
    var ascii = arg_ascii;
    var size = arg_size;
    var errors = arg_errors;
    return ctx.*.ctx_Unicode_DecodeASCII.?(ctx, ascii, size, errors);
}
pub fn HPyUnicode_DecodeLatin1(arg_ctx: [*c]HPyContext, arg_latin1: [*c]const u8, arg_size: HPy_ssize_t, arg_errors: [*c]const u8) callconv(.C) HPy {
    var ctx = arg_ctx;
    var latin1 = arg_latin1;
    var size = arg_size;
    var errors = arg_errors;
    return ctx.*.ctx_Unicode_DecodeLatin1.?(ctx, latin1, size, errors);
}
pub fn HPyUnicode_FromEncodedObject(arg_ctx: [*c]HPyContext, arg_obj: HPy, arg_encoding: [*c]const u8, arg_errors: [*c]const u8) callconv(.C) HPy {
    var ctx = arg_ctx;
    var obj = arg_obj;
    var encoding = arg_encoding;
    var errors = arg_errors;
    return ctx.*.ctx_Unicode_FromEncodedObject.?(ctx, obj, encoding, errors);
}
pub fn HPyUnicode_Substring(arg_ctx: [*c]HPyContext, arg_str: HPy, arg_start: HPy_ssize_t, arg_end: HPy_ssize_t) callconv(.C) HPy {
    var ctx = arg_ctx;
    var str = arg_str;
    var start = arg_start;
    var end = arg_end;
    return ctx.*.ctx_Unicode_Substring.?(ctx, str, start, end);
}
pub fn HPyList_Check(arg_ctx: [*c]HPyContext, arg_h: HPy) callconv(.C) c_int {
    var ctx = arg_ctx;
    var h = arg_h;
    return ctx.*.ctx_List_Check.?(ctx, h);
}
pub fn HPyList_New(arg_ctx: [*c]HPyContext, arg_len: HPy_ssize_t) callconv(.C) HPy {
    var ctx = arg_ctx;
    var len = arg_len;
    return ctx.*.ctx_List_New.?(ctx, len);
}
pub fn HPyList_Append(arg_ctx: [*c]HPyContext, arg_h_list: HPy, arg_h_item: HPy) callconv(.C) c_int {
    var ctx = arg_ctx;
    var h_list = arg_h_list;
    var h_item = arg_h_item;
    return ctx.*.ctx_List_Append.?(ctx, h_list, h_item);
}
pub fn HPyDict_Check(arg_ctx: [*c]HPyContext, arg_h: HPy) callconv(.C) c_int {
    var ctx = arg_ctx;
    var h = arg_h;
    return ctx.*.ctx_Dict_Check.?(ctx, h);
}
pub fn HPyDict_New(arg_ctx: [*c]HPyContext) callconv(.C) HPy {
    var ctx = arg_ctx;
    return ctx.*.ctx_Dict_New.?(ctx);
}
pub fn HPyDict_Keys(arg_ctx: [*c]HPyContext, arg_h: HPy) callconv(.C) HPy {
    var ctx = arg_ctx;
    var h = arg_h;
    return ctx.*.ctx_Dict_Keys.?(ctx, h);
}
pub fn HPyDict_Copy(arg_ctx: [*c]HPyContext, arg_h: HPy) callconv(.C) HPy {
    var ctx = arg_ctx;
    var h = arg_h;
    return ctx.*.ctx_Dict_Copy.?(ctx, h);
}
pub fn HPyTuple_Check(arg_ctx: [*c]HPyContext, arg_h: HPy) callconv(.C) c_int {
    var ctx = arg_ctx;
    var h = arg_h;
    return ctx.*.ctx_Tuple_Check.?(ctx, h);
}
pub fn HPyTuple_FromArray(arg_ctx: [*c]HPyContext, arg_items: [*c]HPy, arg_n: HPy_ssize_t) callconv(.C) HPy {
    var ctx = arg_ctx;
    var items = arg_items;
    var n = arg_n;
    return ctx.*.ctx_Tuple_FromArray.?(ctx, items, n);
}
pub fn HPySlice_Unpack(arg_ctx: [*c]HPyContext, arg_slice: HPy, arg_start: [*c]HPy_ssize_t, arg_stop: [*c]HPy_ssize_t, arg_step: [*c]HPy_ssize_t) callconv(.C) c_int {
    var ctx = arg_ctx;
    var slice = arg_slice;
    var start = arg_start;
    var stop = arg_stop;
    var step = arg_step;
    return ctx.*.ctx_Slice_Unpack.?(ctx, slice, start, stop, step);
}
pub fn HPyImport_ImportModule(arg_ctx: [*c]HPyContext, arg_utf8_name: [*c]const u8) callconv(.C) HPy {
    var ctx = arg_ctx;
    var utf8_name = arg_utf8_name;
    return ctx.*.ctx_Import_ImportModule.?(ctx, utf8_name);
}
pub fn HPyCapsule_New(arg_ctx: [*c]HPyContext, arg_pointer: ?*anyopaque, arg_utf8_name: [*c]const u8, arg_destructor: [*c]HPyCapsule_Destructor) callconv(.C) HPy {
    var ctx = arg_ctx;
    var pointer = arg_pointer;
    var utf8_name = arg_utf8_name;
    var destructor = arg_destructor;
    return ctx.*.ctx_Capsule_New.?(ctx, pointer, utf8_name, destructor);
}
pub fn HPyCapsule_Get(arg_ctx: [*c]HPyContext, arg_capsule: HPy, arg_key: _HPyCapsule_key, arg_utf8_name: [*c]const u8) callconv(.C) ?*anyopaque {
    var ctx = arg_ctx;
    var capsule = arg_capsule;
    var key = arg_key;
    var utf8_name = arg_utf8_name;
    return ctx.*.ctx_Capsule_Get.?(ctx, capsule, key, utf8_name);
}
pub fn HPyCapsule_IsValid(arg_ctx: [*c]HPyContext, arg_capsule: HPy, arg_utf8_name: [*c]const u8) callconv(.C) c_int {
    var ctx = arg_ctx;
    var capsule = arg_capsule;
    var utf8_name = arg_utf8_name;
    return ctx.*.ctx_Capsule_IsValid.?(ctx, capsule, utf8_name);
}
pub fn HPyCapsule_Set(arg_ctx: [*c]HPyContext, arg_capsule: HPy, arg_key: _HPyCapsule_key, arg_value: ?*anyopaque) callconv(.C) c_int {
    var ctx = arg_ctx;
    var capsule = arg_capsule;
    var key = arg_key;
    var value = arg_value;
    return ctx.*.ctx_Capsule_Set.?(ctx, capsule, key, value);
}
pub fn _HPy_CallRealFunctionFromTrampoline(arg_ctx: [*c]HPyContext, arg_sig: HPyFunc_Signature, arg_func: HPyCFunction, arg_args: ?*anyopaque) callconv(.C) void {
    var ctx = arg_ctx;
    var sig = arg_sig;
    var func = arg_func;
    var args = arg_args;
    ctx.*.ctx_CallRealFunctionFromTrampoline.?(ctx, sig, func, args);
}
pub fn HPyListBuilder_New(arg_ctx: [*c]HPyContext, arg_size: HPy_ssize_t) callconv(.C) HPyListBuilder {
    var ctx = arg_ctx;
    var size = arg_size;
    return ctx.*.ctx_ListBuilder_New.?(ctx, size);
}
pub fn HPyListBuilder_Set(arg_ctx: [*c]HPyContext, arg_builder: HPyListBuilder, arg_index: HPy_ssize_t, arg_h_item: HPy) callconv(.C) void {
    var ctx = arg_ctx;
    var builder = arg_builder;
    var index = arg_index;
    var h_item = arg_h_item;
    ctx.*.ctx_ListBuilder_Set.?(ctx, builder, index, h_item);
}
pub fn HPyListBuilder_Build(arg_ctx: [*c]HPyContext, arg_builder: HPyListBuilder) callconv(.C) HPy {
    var ctx = arg_ctx;
    var builder = arg_builder;
    return ctx.*.ctx_ListBuilder_Build.?(ctx, builder);
}
pub fn HPyListBuilder_Cancel(arg_ctx: [*c]HPyContext, arg_builder: HPyListBuilder) callconv(.C) void {
    var ctx = arg_ctx;
    var builder = arg_builder;
    ctx.*.ctx_ListBuilder_Cancel.?(ctx, builder);
}
pub fn HPyTupleBuilder_New(arg_ctx: [*c]HPyContext, arg_size: HPy_ssize_t) callconv(.C) HPyTupleBuilder {
    var ctx = arg_ctx;
    var size = arg_size;
    return ctx.*.ctx_TupleBuilder_New.?(ctx, size);
}
pub fn HPyTupleBuilder_Set(arg_ctx: [*c]HPyContext, arg_builder: HPyTupleBuilder, arg_index: HPy_ssize_t, arg_h_item: HPy) callconv(.C) void {
    var ctx = arg_ctx;
    var builder = arg_builder;
    var index = arg_index;
    var h_item = arg_h_item;
    ctx.*.ctx_TupleBuilder_Set.?(ctx, builder, index, h_item);
}
pub fn HPyTupleBuilder_Build(arg_ctx: [*c]HPyContext, arg_builder: HPyTupleBuilder) callconv(.C) HPy {
    var ctx = arg_ctx;
    var builder = arg_builder;
    return ctx.*.ctx_TupleBuilder_Build.?(ctx, builder);
}
pub fn HPyTupleBuilder_Cancel(arg_ctx: [*c]HPyContext, arg_builder: HPyTupleBuilder) callconv(.C) void {
    var ctx = arg_ctx;
    var builder = arg_builder;
    ctx.*.ctx_TupleBuilder_Cancel.?(ctx, builder);
}
pub fn HPyTracker_New(arg_ctx: [*c]HPyContext, arg_size: HPy_ssize_t) callconv(.C) HPyTracker {
    var ctx = arg_ctx;
    var size = arg_size;
    return ctx.*.ctx_Tracker_New.?(ctx, size);
}
pub fn HPyTracker_Add(arg_ctx: [*c]HPyContext, arg_ht: HPyTracker, arg_h: HPy) callconv(.C) c_int {
    var ctx = arg_ctx;
    var ht = arg_ht;
    var h = arg_h;
    return ctx.*.ctx_Tracker_Add.?(ctx, ht, h);
}
pub fn HPyTracker_ForgetAll(arg_ctx: [*c]HPyContext, arg_ht: HPyTracker) callconv(.C) void {
    var ctx = arg_ctx;
    var ht = arg_ht;
    ctx.*.ctx_Tracker_ForgetAll.?(ctx, ht);
}
pub fn HPyTracker_Close(arg_ctx: [*c]HPyContext, arg_ht: HPyTracker) callconv(.C) void {
    var ctx = arg_ctx;
    var ht = arg_ht;
    ctx.*.ctx_Tracker_Close.?(ctx, ht);
}
pub fn HPyField_Store(arg_ctx: [*c]HPyContext, arg_target_object: HPy, arg_target_field: [*c]HPyField, arg_h: HPy) callconv(.C) void {
    var ctx = arg_ctx;
    var target_object = arg_target_object;
    var target_field = arg_target_field;
    var h = arg_h;
    ctx.*.ctx_Field_Store.?(ctx, target_object, target_field, h);
}
pub fn HPyField_Load(arg_ctx: [*c]HPyContext, arg_source_object: HPy, arg_source_field: HPyField) callconv(.C) HPy {
    var ctx = arg_ctx;
    var source_object = arg_source_object;
    var source_field = arg_source_field;
    return ctx.*.ctx_Field_Load.?(ctx, source_object, source_field);
}
pub fn HPy_ReenterPythonExecution(arg_ctx: [*c]HPyContext, arg_state: HPyThreadState) callconv(.C) void {
    var ctx = arg_ctx;
    var state = arg_state;
    ctx.*.ctx_ReenterPythonExecution.?(ctx, state);
}
pub fn HPy_LeavePythonExecution(arg_ctx: [*c]HPyContext) callconv(.C) HPyThreadState {
    var ctx = arg_ctx;
    return ctx.*.ctx_LeavePythonExecution.?(ctx);
}
pub fn HPyGlobal_Store(arg_ctx: [*c]HPyContext, arg_global: [*c]HPyGlobal, arg_h: HPy) callconv(.C) void {
    var ctx = arg_ctx;
    var global = arg_global;
    var h = arg_h;
    ctx.*.ctx_Global_Store.?(ctx, global, h);
}
pub fn HPyGlobal_Load(arg_ctx: [*c]HPyContext, arg_global: HPyGlobal) callconv(.C) HPy {
    var ctx = arg_ctx;
    var global = arg_global;
    return ctx.*.ctx_Global_Load.?(ctx, global);
}
pub fn _HPy_Dump(arg_ctx: [*c]HPyContext, arg_h: HPy) callconv(.C) void {
    var ctx = arg_ctx;
    var h = arg_h;
    ctx.*.ctx_Dump.?(ctx, h);
}
pub fn HPy_Compile_s(arg_ctx: [*c]HPyContext, arg_utf8_source: [*c]const u8, arg_utf8_filename: [*c]const u8, arg_kind: HPy_SourceKind) callconv(.C) HPy {
    var ctx = arg_ctx;
    var utf8_source = arg_utf8_source;
    var utf8_filename = arg_utf8_filename;
    var kind = arg_kind;
    return ctx.*.ctx_Compile_s.?(ctx, utf8_source, utf8_filename, kind);
}
pub fn HPy_EvalCode(arg_ctx: [*c]HPyContext, arg_code: HPy, arg_globals: HPy, arg_locals: HPy) callconv(.C) HPy {
    var ctx = arg_ctx;
    var code = arg_code;
    var globals = arg_globals;
    var locals = arg_locals;
    return ctx.*.ctx_EvalCode.?(ctx, code, globals, locals);
}
pub fn HPyContextVar_New(arg_ctx: [*c]HPyContext, arg_name: [*c]const u8, arg_default_value: HPy) callconv(.C) HPy {
    var ctx = arg_ctx;
    var name = arg_name;
    var default_value = arg_default_value;
    return ctx.*.ctx_ContextVar_New.?(ctx, name, default_value);
}
pub fn HPyContextVar_Get(arg_ctx: [*c]HPyContext, arg_context_var: HPy, arg_default_value: HPy, arg_result: [*c]HPy) callconv(.C) i32 {
    var ctx = arg_ctx;
    var context_var = arg_context_var;
    var default_value = arg_default_value;
    var result = arg_result;
    return ctx.*.ctx_ContextVar_Get.?(ctx, context_var, default_value, result);
}
pub fn HPyContextVar_Set(arg_ctx: [*c]HPyContext, arg_context_var: HPy, arg_value: HPy) callconv(.C) HPy {
    var ctx = arg_ctx;
    var context_var = arg_context_var;
    var value = arg_value;
    return ctx.*.ctx_ContextVar_Set.?(ctx, context_var, value);
}
pub fn HPy_SetCallFunction(arg_ctx: [*c]HPyContext, arg_h: HPy, arg_func: [*c]HPyCallFunction) callconv(.C) c_int {
    var ctx = arg_ctx;
    var h = arg_h;
    var func = arg_func;
    return ctx.*.ctx_SetCallFunction.?(ctx, h, func);
}
pub fn _HPy_New(arg_ctx: [*c]HPyContext, arg_h_type: HPy, arg_data: [*c]?*anyopaque) callconv(.C) HPy {
    var ctx = arg_ctx;
    var h_type = arg_h_type;
    var data = arg_data;
    var data_result: ?*anyopaque = undefined;
    var h: HPy = ctx.*.ctx_New.?(ctx, h_type, &data_result);
    data.* = data_result;
    return h;
}
pub fn HPy_FatalError(arg_ctx: [*c]HPyContext, arg_message: [*c]const u8) callconv(.C) noreturn {
    var ctx = arg_ctx;
    var message = arg_message;
    ctx.*.ctx_FatalError.?(ctx, message);
    abort();
}
pub fn HPyCapsule_GetPointer(arg_ctx: [*c]HPyContext, arg_capsule: HPy, arg_name: [*c]const u8) callconv(.C) ?*anyopaque {
    var ctx = arg_ctx;
    var capsule = arg_capsule;
    var name = arg_name;
    return ctx.*.ctx_Capsule_Get.?(ctx, capsule, @bitCast(c_uint, HPyCapsule_key_Pointer), name);
}
pub fn HPyCapsule_GetName(arg_ctx: [*c]HPyContext, arg_capsule: HPy) callconv(.C) [*c]const u8 {
    var ctx = arg_ctx;
    var capsule = arg_capsule;
    return @ptrCast([*c]const u8, @alignCast(@import("std").meta.alignment([*c]const u8), ctx.*.ctx_Capsule_Get.?(ctx, capsule, @bitCast(c_uint, HPyCapsule_key_Name), null)));
}
pub fn HPyCapsule_GetContext(arg_ctx: [*c]HPyContext, arg_capsule: HPy) callconv(.C) ?*anyopaque {
    var ctx = arg_ctx;
    var capsule = arg_capsule;
    return ctx.*.ctx_Capsule_Get.?(ctx, capsule, @bitCast(c_uint, HPyCapsule_key_Context), null);
}
pub fn HPyCapsule_SetPointer(arg_ctx: [*c]HPyContext, arg_capsule: HPy, arg_pointer: ?*anyopaque) callconv(.C) c_int {
    var ctx = arg_ctx;
    var capsule = arg_capsule;
    var pointer = arg_pointer;
    return ctx.*.ctx_Capsule_Set.?(ctx, capsule, @bitCast(c_uint, HPyCapsule_key_Pointer), pointer);
}
pub fn HPyCapsule_SetName(arg_ctx: [*c]HPyContext, arg_capsule: HPy, arg_name: [*c]const u8) callconv(.C) c_int {
    var ctx = arg_ctx;
    var capsule = arg_capsule;
    var name = arg_name;
    return ctx.*.ctx_Capsule_Set.?(ctx, capsule, @bitCast(c_uint, HPyCapsule_key_Name), @intToPtr(?*anyopaque, @ptrToInt(name)));
}
pub fn HPyCapsule_SetContext(arg_ctx: [*c]HPyContext, arg_capsule: HPy, arg_context: ?*anyopaque) callconv(.C) c_int {
    var ctx = arg_ctx;
    var capsule = arg_capsule;
    var context = arg_context;
    return ctx.*.ctx_Capsule_Set.?(ctx, capsule, @bitCast(c_uint, HPyCapsule_key_Context), context);
}
pub fn HPyCapsule_SetDestructor(arg_ctx: [*c]HPyContext, arg_capsule: HPy, arg_destructor: [*c]HPyCapsule_Destructor) callconv(.C) c_int {
    var ctx = arg_ctx;
    var capsule = arg_capsule;
    var destructor = arg_destructor;
    return ctx.*.ctx_Capsule_Set.?(ctx, capsule, @bitCast(c_uint, HPyCapsule_key_Destructor), @ptrCast(?*anyopaque, destructor));
}
pub extern fn __assert_fail(__assertion: [*c]const u8, __file: [*c]const u8, __line: c_uint, __function: [*c]const u8) noreturn;
pub extern fn __assert_perror_fail(__errnum: c_int, __file: [*c]const u8, __line: c_uint, __function: [*c]const u8) noreturn;
pub extern fn __assert(__assertion: [*c]const u8, __file: [*c]const u8, __line: c_int) noreturn;
pub fn HPyErr_SetFromErrno(arg_ctx: [*c]HPyContext, arg_h_type: HPy) callconv(.C) HPy {
    var ctx = arg_ctx;
    var h_type = arg_h_type;
    return HPyErr_SetFromErrnoWithFilenameObjects(ctx, h_type, HPy{
        ._i = @bitCast(isize, @as(c_long, @as(c_int, 0))),
    }, HPy{
        ._i = @bitCast(isize, @as(c_long, @as(c_int, 0))),
    });
}
pub fn HPyErr_SetFromErrnoWithFilenameObject(arg_ctx: [*c]HPyContext, arg_h_type: HPy, arg_filename: HPy) callconv(.C) HPy {
    var ctx = arg_ctx;
    var h_type = arg_h_type;
    var filename = arg_filename;
    return HPyErr_SetFromErrnoWithFilenameObjects(ctx, h_type, filename, HPy{
        ._i = @bitCast(isize, @as(c_long, @as(c_int, 0))),
    });
} // /home/february/projects/hpy/hpy/devel/include/hpy/inline_helpers.h:66:1: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn HPyTuple_Pack(ctx: [*c]HPyContext, n: HPy_ssize_t, ...) HPy;
pub fn HPy_DelAttr(arg_ctx: [*c]HPyContext, arg_obj: HPy, arg_name: HPy) callconv(.C) c_int {
    var ctx = arg_ctx;
    var obj = arg_obj;
    var name = arg_name;
    return HPy_SetAttr(ctx, obj, name, HPy{
        ._i = @bitCast(isize, @as(c_long, @as(c_int, 0))),
    });
}
pub fn HPy_DelAttr_s(arg_ctx: [*c]HPyContext, arg_obj: HPy, arg_utf8_name: [*c]const u8) callconv(.C) c_int {
    var ctx = arg_ctx;
    var obj = arg_obj;
    var utf8_name = arg_utf8_name;
    return HPy_SetAttr_s(ctx, obj, utf8_name, HPy{
        ._i = @bitCast(isize, @as(c_long, @as(c_int, 0))),
    });
}
pub fn HPyLong_FromLong(arg_ctx: [*c]HPyContext, arg_l: c_long) callconv(.C) HPy {
    var ctx = arg_ctx;
    var l = arg_l;
    if (@sizeOf(c_long) <= @sizeOf(i32)) return HPyLong_FromInt32_t(ctx, @bitCast(i32, @truncate(c_int, l)));
    _ = blk: {
        _ = @sizeOf(c_int);
        break :blk blk_1: {
            break :blk_1 if (@sizeOf(c_long) <= @sizeOf(i64)) {} else {
                __assert_fail("sizeof(long) <= sizeof(int64_t)", "/home/february/projects/hpy/hpy/devel/include/hpy/inline_helpers.h", @bitCast(c_uint, @as(c_int, 145)), "HPy HPyLong_FromLong(HPyContext *, long)");
            };
        };
    };
    return HPyLong_FromInt64_t(ctx, @bitCast(i64, l));
}
pub fn HPyLong_FromUnsignedLong(arg_ctx: [*c]HPyContext, arg_l: c_ulong) callconv(.C) HPy {
    var ctx = arg_ctx;
    var l = arg_l;
    if (@sizeOf(c_ulong) <= @sizeOf(u32)) return HPyLong_FromUInt32_t(ctx, @bitCast(u32, @truncate(c_uint, l)));
    _ = blk: {
        _ = @sizeOf(c_int);
        break :blk blk_1: {
            break :blk_1 if (@sizeOf(c_ulong) <= @sizeOf(u64)) {} else {
                __assert_fail("sizeof(unsigned long) <= sizeof(uint64_t)", "/home/february/projects/hpy/hpy/devel/include/hpy/inline_helpers.h", @bitCast(c_uint, @as(c_int, 165)), "HPy HPyLong_FromUnsignedLong(HPyContext *, unsigned long)");
            };
        };
    };
    return HPyLong_FromUInt64_t(ctx, @bitCast(u64, l));
}
pub fn HPyLong_FromLongLong(arg_ctx: [*c]HPyContext, arg_l: c_longlong) callconv(.C) HPy {
    var ctx = arg_ctx;
    var l = arg_l;
    _ = blk: {
        _ = @sizeOf(c_int);
        break :blk blk_1: {
            break :blk_1 if (@sizeOf(c_longlong) <= @sizeOf(i64)) {} else {
                __assert_fail("sizeof(long long) <= sizeof(int64_t)", "/home/february/projects/hpy/hpy/devel/include/hpy/inline_helpers.h", @bitCast(c_uint, @as(c_int, 183)), "HPy HPyLong_FromLongLong(HPyContext *, long long)");
            };
        };
    };
    return HPyLong_FromInt64_t(ctx, @bitCast(i64, @truncate(c_long, l)));
}
pub fn HPyLong_FromUnsignedLongLong(arg_ctx: [*c]HPyContext, arg_l: c_ulonglong) callconv(.C) HPy {
    var ctx = arg_ctx;
    var l = arg_l;
    _ = blk: {
        _ = @sizeOf(c_int);
        break :blk blk_1: {
            break :blk_1 if (@sizeOf(c_ulonglong) <= @sizeOf(u64)) {} else {
                __assert_fail("sizeof(unsigned long long) <= sizeof(uint64_t)", "/home/february/projects/hpy/hpy/devel/include/hpy/inline_helpers.h", @bitCast(c_uint, @as(c_int, 201)), "HPy HPyLong_FromUnsignedLongLong(HPyContext *, unsigned long long)");
            };
        };
    };
    return HPyLong_FromUInt64_t(ctx, @bitCast(u64, @truncate(c_ulong, l)));
}
pub fn HPyLong_AsLong(arg_ctx: [*c]HPyContext, arg_h: HPy) callconv(.C) c_long {
    var ctx = arg_ctx;
    var h = arg_h;
    if (@sizeOf(c_long) <= @sizeOf(i32)) return @bitCast(c_long, @as(c_long, HPyLong_AsInt32_t(ctx, h))) else if (@sizeOf(c_long) <= @sizeOf(i64)) return @bitCast(c_long, HPyLong_AsInt64_t(ctx, h));
    return 0;
}
pub fn HPyLong_AsUnsignedLong(arg_ctx: [*c]HPyContext, arg_h: HPy) callconv(.C) c_ulong {
    var ctx = arg_ctx;
    var h = arg_h;
    if (@sizeOf(c_ulong) <= @sizeOf(u32)) return @bitCast(c_ulong, @as(c_ulong, HPyLong_AsUInt32_t(ctx, h))) else if (@sizeOf(c_ulong) <= @sizeOf(u64)) return @bitCast(c_ulong, HPyLong_AsUInt64_t(ctx, h));
    return 0;
}
pub fn HPyLong_AsUnsignedLongMask(arg_ctx: [*c]HPyContext, arg_h: HPy) callconv(.C) c_ulong {
    var ctx = arg_ctx;
    var h = arg_h;
    if (@sizeOf(c_ulong) <= @sizeOf(u32)) return @bitCast(c_ulong, @as(c_ulong, HPyLong_AsUInt32_tMask(ctx, h))) else if (@sizeOf(c_ulong) <= @sizeOf(u64)) return @bitCast(c_ulong, HPyLong_AsUInt64_tMask(ctx, h));
    return 0;
}
pub fn HPyLong_AsLongLong(arg_ctx: [*c]HPyContext, arg_h: HPy) callconv(.C) c_longlong {
    var ctx = arg_ctx;
    var h = arg_h;
    _ = blk: {
        _ = @sizeOf(c_int);
        break :blk blk_1: {
            break :blk_1 if (@sizeOf(c_longlong) <= @sizeOf(i64)) {} else {
                __assert_fail("sizeof(long long) <= sizeof(int64_t)", "/home/february/projects/hpy/hpy/devel/include/hpy/inline_helpers.h", @bitCast(c_uint, @as(c_int, 322)), "long long HPyLong_AsLongLong(HPyContext *, HPy)");
            };
        };
    };
    return @bitCast(c_longlong, @as(c_longlong, HPyLong_AsInt64_t(ctx, h)));
}
pub fn HPyLong_AsUnsignedLongLong(arg_ctx: [*c]HPyContext, arg_h: HPy) callconv(.C) c_ulonglong {
    var ctx = arg_ctx;
    var h = arg_h;
    _ = blk: {
        _ = @sizeOf(c_int);
        break :blk blk_1: {
            break :blk_1 if (@sizeOf(c_ulonglong) <= @sizeOf(u64)) {} else {
                __assert_fail("sizeof(unsigned long long) <= sizeof(uint64_t)", "/home/february/projects/hpy/hpy/devel/include/hpy/inline_helpers.h", @bitCast(c_uint, @as(c_int, 348)), "unsigned long long HPyLong_AsUnsignedLongLong(HPyContext *, HPy)");
            };
        };
    };
    return @bitCast(c_ulonglong, @as(c_ulonglong, HPyLong_AsUInt64_t(ctx, h)));
}
pub fn HPyLong_AsUnsignedLongLongMask(arg_ctx: [*c]HPyContext, arg_h: HPy) callconv(.C) c_ulonglong {
    var ctx = arg_ctx;
    var h = arg_h;
    _ = blk: {
        _ = @sizeOf(c_int);
        break :blk blk_1: {
            break :blk_1 if (@sizeOf(c_ulonglong) <= @sizeOf(u64)) {} else {
                __assert_fail("sizeof(unsigned long long) <= sizeof(uint64_t)", "/home/february/projects/hpy/hpy/devel/include/hpy/inline_helpers.h", @bitCast(c_uint, @as(c_int, 377)), "unsigned long long HPyLong_AsUnsignedLongLongMask(HPyContext *, HPy)");
            };
        };
    };
    return @bitCast(c_ulonglong, @as(c_ulonglong, HPyLong_AsUInt64_tMask(ctx, h)));
}
pub fn HPyBool_FromLong(arg_ctx: [*c]HPyContext, arg_v: c_long) callconv(.C) HPy {
    var ctx = arg_ctx;
    var v = arg_v;
    return HPyBool_FromBool(ctx, (if (v != 0) @as(c_int, 1) else @as(c_int, 0)) != 0);
}
pub fn HPySlice_AdjustIndices(arg___HPy_UNUSED_TAGGEDctx: [*c]HPyContext, arg_length: HPy_ssize_t, arg_start: [*c]HPy_ssize_t, arg_stop: [*c]HPy_ssize_t, arg_step: HPy_ssize_t) callconv(.C) HPy_ssize_t {
    var __HPy_UNUSED_TAGGEDctx = arg___HPy_UNUSED_TAGGEDctx;
    _ = @TypeOf(__HPy_UNUSED_TAGGEDctx);
    var length = arg_length;
    var start = arg_start;
    var stop = arg_stop;
    var step = arg_step;
    _ = blk: {
        _ = @sizeOf(c_int);
        break :blk blk_1: {
            break :blk_1 if (step != @bitCast(HPy_ssize_t, @as(c_long, @as(c_int, 0)))) {} else {
                __assert_fail("step != 0", "/home/february/projects/hpy/hpy/devel/include/hpy/inline_helpers.h", @bitCast(c_uint, @as(c_int, 426)), "HPy_ssize_t HPySlice_AdjustIndices(HPyContext *, HPy_ssize_t, HPy_ssize_t *, HPy_ssize_t *, HPy_ssize_t)");
            };
        };
    };
    _ = blk: {
        _ = @sizeOf(c_int);
        break :blk blk_1: {
            break :blk_1 if (step >= -@as(c_long, 9223372036854775807)) {} else {
                __assert_fail("step >= -HPY_SSIZE_T_MAX", "/home/february/projects/hpy/hpy/devel/include/hpy/inline_helpers.h", @bitCast(c_uint, @as(c_int, 427)), "HPy_ssize_t HPySlice_AdjustIndices(HPyContext *, HPy_ssize_t, HPy_ssize_t *, HPy_ssize_t *, HPy_ssize_t)");
            };
        };
    };
    if (start.* < @bitCast(HPy_ssize_t, @as(c_long, @as(c_int, 0)))) {
        start.* += length;
        if (start.* < @bitCast(HPy_ssize_t, @as(c_long, @as(c_int, 0)))) {
            start.* = @bitCast(HPy_ssize_t, @as(c_long, if (step < @bitCast(HPy_ssize_t, @as(c_long, @as(c_int, 0)))) -@as(c_int, 1) else @as(c_int, 0)));
        }
    } else if (start.* >= length) {
        start.* = if (step < @bitCast(HPy_ssize_t, @as(c_long, @as(c_int, 0)))) length - @bitCast(HPy_ssize_t, @as(c_long, @as(c_int, 1))) else length;
    }
    if (stop.* < @bitCast(HPy_ssize_t, @as(c_long, @as(c_int, 0)))) {
        stop.* += length;
        if (stop.* < @bitCast(HPy_ssize_t, @as(c_long, @as(c_int, 0)))) {
            stop.* = @bitCast(HPy_ssize_t, @as(c_long, if (step < @bitCast(HPy_ssize_t, @as(c_long, @as(c_int, 0)))) -@as(c_int, 1) else @as(c_int, 0)));
        }
    } else if (stop.* >= length) {
        stop.* = if (step < @bitCast(HPy_ssize_t, @as(c_long, @as(c_int, 0)))) length - @bitCast(HPy_ssize_t, @as(c_long, @as(c_int, 1))) else length;
    }
    if (step < @bitCast(HPy_ssize_t, @as(c_long, @as(c_int, 0)))) {
        if (stop.* < start.*) {
            return @divTrunc((start.* - stop.*) - @bitCast(HPy_ssize_t, @as(c_long, @as(c_int, 1))), -step) + @bitCast(HPy_ssize_t, @as(c_long, @as(c_int, 1)));
        }
    } else {
        if (start.* < stop.*) {
            return @divTrunc((stop.* - start.*) - @bitCast(HPy_ssize_t, @as(c_long, @as(c_int, 1))), step) + @bitCast(HPy_ssize_t, @as(c_long, @as(c_int, 1)));
        }
    }
    return 0;
}
pub fn HPy_CallMethodTupleDict_s(arg_ctx: [*c]HPyContext, arg_utf8_name: [*c]const u8, arg_receiver: HPy, arg_args: HPy, arg_kw: HPy) callconv(.C) HPy {
    var ctx = arg_ctx;
    var utf8_name = arg_utf8_name;
    var receiver = arg_receiver;
    var args = arg_args;
    var kw = arg_kw;
    var method: HPy = HPy_GetAttr_s(ctx, receiver, utf8_name);
    if (method._i == @bitCast(isize, @as(c_long, @as(c_int, 0)))) {
        return HPy{
            ._i = @bitCast(isize, @as(c_long, @as(c_int, 0))),
        };
    }
    var result: HPy = HPy_CallTupleDict(ctx, method, args, kw);
    HPy_Close(ctx, method);
    return result;
}
pub fn HPy_CallMethodTupleDict(arg_ctx: [*c]HPyContext, arg_name: HPy, arg_receiver: HPy, arg_args: HPy, arg_kw: HPy) callconv(.C) HPy {
    var ctx = arg_ctx;
    var name = arg_name;
    var receiver = arg_receiver;
    var args = arg_args;
    var kw = arg_kw;
    var method: HPy = HPy_GetAttr(ctx, receiver, name);
    if (method._i == @bitCast(isize, @as(c_long, @as(c_int, 0)))) {
        return HPy{
            ._i = @bitCast(isize, @as(c_long, @as(c_int, 0))),
        };
    }
    var result: HPy = HPy_CallTupleDict(ctx, method, args, kw);
    HPy_Close(ctx, method);
    return result;
}
pub const say_hello_impl_sig: c_int = 3;
const enum_unnamed_3 = c_uint;
pub fn say_hello_impl(arg_ctx: [*c]HPyContext, arg_self: HPy) callconv(.C) HPy {
    var ctx = arg_ctx;
    var self = arg_self;
    _ = @TypeOf(self);
    return HPyUnicode_FromString(ctx, "Hello world!");
}
pub const say_hello_trampoline_sig: c_int = 3;
const enum_unnamed_4 = c_uint;
pub fn say_hello_trampoline(arg_self: ?*cpy_PyObject) callconv(.C) ?*cpy_PyObject {
    var self = arg_self;
    var a: _HPyFunc_args_NOARGS = _HPyFunc_args_NOARGS{
        .self = self,
        .result = null,
    };
    _HPy_CallRealFunctionFromTrampoline(_ctx_for_trampolines, @bitCast(c_uint, HPyFunc_NOARGS), @ptrCast(HPyCFunction, @alignCast(@import("std").meta.alignment(HPyCFunction), &say_hello_impl)), @ptrCast(?*anyopaque, &a));
    return a.result;
}
pub export var say_hello: HPyDef = HPyDef{
    .kind = @bitCast(c_uint, HPyDef_Kind_Meth),
    .unnamed_0 = union_unnamed_2{
        .meth = HPyMeth{
            .name = "say_hello",
            .impl = @ptrCast(HPyCFunction, @alignCast(@import("std").meta.alignment(HPyCFunction), &say_hello_impl)),
            .cpy_trampoline = @ptrCast(cpy_PyCFunction, @alignCast(@import("std").meta.alignment(cpy_PyCFunction), &say_hello_trampoline)),
            .signature = @bitCast(c_uint, HPyFunc_NOARGS),
            .doc = null,
        },
    },
};
pub var QuickstartCMethods: [2][*c]HPyDef = [2][*c]HPyDef{
    &say_hello,
    null,
};
pub var quickstart_c_def: HPyModuleDef = HPyModuleDef{
    .doc = "HPy Quickstart C Example",
    .size = @import("std").mem.zeroes(HPy_ssize_t),
    .legacy_methods = null,
    .defines = @ptrCast([*c][*c]HPyDef, @alignCast(@import("std").meta.alignment([*c][*c]HPyDef), &QuickstartCMethods)),
    .globals = null,
};
pub export fn get_required_hpy_major_version_quickstart_c() u32 {
    return 0;
}
pub export fn get_required_hpy_minor_version_quickstart_c() u32 {
    return 0;
}
pub export fn HPyInitGlobalContext_quickstart_c(arg_ctx: [*c]HPyContext) void {
    var ctx = arg_ctx;
    _ctx_for_trampolines = ctx;
}
pub export fn HPyInit_quickstart_c() [*c]HPyModuleDef {
    return &quickstart_c_def;
}
pub const __INTMAX_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `L`"); // (no file):80:9
pub const __UINTMAX_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `UL`"); // (no file):86:9
pub const __FLT16_DENORM_MIN__ = @compileError("unable to translate C expr: unexpected token 'IntegerLiteral'"); // (no file):109:9
pub const __FLT16_EPSILON__ = @compileError("unable to translate C expr: unexpected token 'IntegerLiteral'"); // (no file):113:9
pub const __FLT16_MAX__ = @compileError("unable to translate C expr: unexpected token 'IntegerLiteral'"); // (no file):119:9
pub const __FLT16_MIN__ = @compileError("unable to translate C expr: unexpected token 'IntegerLiteral'"); // (no file):122:9
pub const __INT64_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `L`"); // (no file):183:9
pub const __UINT32_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `U`"); // (no file):205:9
pub const __UINT64_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `UL`"); // (no file):213:9
pub const __seg_gs = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // (no file):342:9
pub const __seg_fs = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // (no file):343:9
pub const __GLIBC_USE = @compileError("unable to translate macro: undefined identifier `__GLIBC_USE_`"); // /usr/include/features.h:186:9
pub const __glibc_has_attribute = @compileError("unable to translate macro: undefined identifier `__has_attribute`"); // /usr/include/sys/cdefs.h:45:10
pub const __glibc_has_extension = @compileError("unable to translate macro: undefined identifier `__has_extension`"); // /usr/include/sys/cdefs.h:55:10
pub const __THROW = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /usr/include/sys/cdefs.h:79:11
pub const __THROWNL = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /usr/include/sys/cdefs.h:80:11
pub const __NTH = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /usr/include/sys/cdefs.h:81:11
pub const __NTHNL = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /usr/include/sys/cdefs.h:82:11
pub const __CONCAT = @compileError("unable to translate C expr: unexpected token '##'"); // /usr/include/sys/cdefs.h:124:9
pub const __STRING = @compileError("unable to translate C expr: unexpected token '#'"); // /usr/include/sys/cdefs.h:125:9
pub const __glibc_unsigned_or_positive = @compileError("unable to translate macro: undefined identifier `__typeof`"); // /usr/include/sys/cdefs.h:160:9
pub const __glibc_fortify = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /usr/include/sys/cdefs.h:185:9
pub const __glibc_fortify_n = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /usr/include/sys/cdefs.h:195:9
pub const __warnattr = @compileError("unable to translate C expr: unexpected token 'Eof'"); // /usr/include/sys/cdefs.h:207:10
pub const __errordecl = @compileError("unable to translate C expr: unexpected token 'extern'"); // /usr/include/sys/cdefs.h:208:10
pub const __flexarr = @compileError("unable to translate C expr: unexpected token '['"); // /usr/include/sys/cdefs.h:216:10
pub const __REDIRECT = @compileError("unable to translate macro: undefined identifier `__asm__`"); // /usr/include/sys/cdefs.h:247:10
pub const __REDIRECT_NTH = @compileError("unable to translate macro: undefined identifier `__asm__`"); // /usr/include/sys/cdefs.h:254:11
pub const __REDIRECT_NTHNL = @compileError("unable to translate macro: undefined identifier `__asm__`"); // /usr/include/sys/cdefs.h:256:11
pub const __ASMNAME2 = @compileError("unable to translate C expr: unexpected token 'Identifier'"); // /usr/include/sys/cdefs.h:260:10
pub const __attribute_malloc__ = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /usr/include/sys/cdefs.h:281:10
pub const __attribute_alloc_size__ = @compileError("unable to translate C expr: unexpected token 'Eof'"); // /usr/include/sys/cdefs.h:292:10
pub const __attribute_alloc_align__ = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /usr/include/sys/cdefs.h:298:10
pub const __attribute_pure__ = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /usr/include/sys/cdefs.h:308:10
pub const __attribute_const__ = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /usr/include/sys/cdefs.h:315:10
pub const __attribute_maybe_unused__ = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /usr/include/sys/cdefs.h:321:10
pub const __attribute_used__ = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /usr/include/sys/cdefs.h:330:10
pub const __attribute_noinline__ = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /usr/include/sys/cdefs.h:331:10
pub const __attribute_deprecated__ = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /usr/include/sys/cdefs.h:339:10
pub const __attribute_deprecated_msg__ = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /usr/include/sys/cdefs.h:349:10
pub const __attribute_format_arg__ = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /usr/include/sys/cdefs.h:362:10
pub const __attribute_format_strfmon__ = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /usr/include/sys/cdefs.h:372:10
pub const __attribute_nonnull__ = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /usr/include/sys/cdefs.h:384:11
pub const __returns_nonnull = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /usr/include/sys/cdefs.h:397:10
pub const __attribute_warn_unused_result__ = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /usr/include/sys/cdefs.h:406:10
pub const __always_inline = @compileError("unable to translate macro: undefined identifier `__inline`"); // /usr/include/sys/cdefs.h:424:10
pub const __attribute_artificial__ = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /usr/include/sys/cdefs.h:433:10
pub const __extern_inline = @compileError("unable to translate macro: undefined identifier `__inline`"); // /usr/include/sys/cdefs.h:451:11
pub const __extern_always_inline = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /usr/include/sys/cdefs.h:452:11
pub const __restrict_arr = @compileError("unable to translate macro: undefined identifier `__restrict`"); // /usr/include/sys/cdefs.h:495:10
pub const __attribute_copy__ = @compileError("unable to translate C expr: unexpected token 'Eof'"); // /usr/include/sys/cdefs.h:544:10
pub const __LDBL_REDIR2_DECL = @compileError("unable to translate C expr: unexpected token 'Eof'"); // /usr/include/sys/cdefs.h:620:10
pub const __LDBL_REDIR_DECL = @compileError("unable to translate C expr: unexpected token 'Eof'"); // /usr/include/sys/cdefs.h:621:10
pub const __glibc_macro_warning1 = @compileError("unable to translate macro: undefined identifier `_Pragma`"); // /usr/include/sys/cdefs.h:635:10
pub const __glibc_macro_warning = @compileError("unable to translate macro: undefined identifier `GCC`"); // /usr/include/sys/cdefs.h:636:10
pub const __fortified_attr_access = @compileError("unable to translate C expr: unexpected token 'Eof'"); // /usr/include/sys/cdefs.h:681:11
pub const __attr_access = @compileError("unable to translate C expr: unexpected token 'Eof'"); // /usr/include/sys/cdefs.h:682:11
pub const __attr_access_none = @compileError("unable to translate C expr: unexpected token 'Eof'"); // /usr/include/sys/cdefs.h:683:11
pub const __attr_dealloc = @compileError("unable to translate C expr: unexpected token 'Eof'"); // /usr/include/sys/cdefs.h:693:10
pub const __attribute_returns_twice__ = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /usr/include/sys/cdefs.h:700:10
pub const __CFLOAT32 = @compileError("unable to translate: TODO _Complex"); // /usr/include/bits/floatn-common.h:149:12
pub const __CFLOAT64 = @compileError("unable to translate: TODO _Complex"); // /usr/include/bits/floatn-common.h:160:13
pub const __CFLOAT32X = @compileError("unable to translate: TODO _Complex"); // /usr/include/bits/floatn-common.h:169:12
pub const __CFLOAT64X = @compileError("unable to translate: TODO _Complex"); // /usr/include/bits/floatn-common.h:178:13
pub const __builtin_nansf32 = @compileError("unable to translate macro: undefined identifier `__builtin_nansf`"); // /usr/include/bits/floatn-common.h:221:12
pub const __builtin_huge_valf64 = @compileError("unable to translate macro: undefined identifier `__builtin_huge_val`"); // /usr/include/bits/floatn-common.h:255:13
pub const __builtin_inff64 = @compileError("unable to translate macro: undefined identifier `__builtin_inf`"); // /usr/include/bits/floatn-common.h:256:13
pub const __builtin_nanf64 = @compileError("unable to translate macro: undefined identifier `__builtin_nan`"); // /usr/include/bits/floatn-common.h:257:13
pub const __builtin_nansf64 = @compileError("unable to translate macro: undefined identifier `__builtin_nans`"); // /usr/include/bits/floatn-common.h:258:13
pub const __builtin_huge_valf32x = @compileError("unable to translate macro: undefined identifier `__builtin_huge_val`"); // /usr/include/bits/floatn-common.h:272:12
pub const __builtin_inff32x = @compileError("unable to translate macro: undefined identifier `__builtin_inf`"); // /usr/include/bits/floatn-common.h:273:12
pub const __builtin_nanf32x = @compileError("unable to translate macro: undefined identifier `__builtin_nan`"); // /usr/include/bits/floatn-common.h:274:12
pub const __builtin_nansf32x = @compileError("unable to translate macro: undefined identifier `__builtin_nans`"); // /usr/include/bits/floatn-common.h:275:12
pub const __builtin_huge_valf64x = @compileError("unable to translate macro: undefined identifier `__builtin_huge_vall`"); // /usr/include/bits/floatn-common.h:289:13
pub const __builtin_inff64x = @compileError("unable to translate macro: undefined identifier `__builtin_infl`"); // /usr/include/bits/floatn-common.h:290:13
pub const __builtin_nanf64x = @compileError("unable to translate macro: undefined identifier `__builtin_nanl`"); // /usr/include/bits/floatn-common.h:291:13
pub const __builtin_nansf64x = @compileError("unable to translate macro: undefined identifier `__builtin_nansl`"); // /usr/include/bits/floatn-common.h:292:13
pub const __STD_TYPE = @compileError("unable to translate C expr: unexpected token 'typedef'"); // /usr/include/bits/types.h:137:10
pub const __FSID_T_TYPE = @compileError("unable to translate macro: undefined identifier `__val`"); // /usr/include/bits/typesizes.h:73:9
pub const __FD_ZERO = @compileError("unable to translate macro: undefined identifier `__i`"); // /usr/include/bits/select.h:25:9
pub const __FD_SET = @compileError("unable to translate C expr: expected ')' instead got '|='"); // /usr/include/bits/select.h:32:9
pub const __FD_CLR = @compileError("unable to translate C expr: expected ')' instead got '&='"); // /usr/include/bits/select.h:34:9
pub const __PTHREAD_MUTEX_INITIALIZER = @compileError("unable to translate C expr: unexpected token '{'"); // /usr/include/bits/struct_mutex.h:56:10
pub const __PTHREAD_RWLOCK_ELISION_EXTRA = @compileError("unable to translate C expr: unexpected token '{'"); // /usr/include/bits/struct_rwlock.h:40:11
pub const __ONCE_FLAG_INIT = @compileError("unable to translate C expr: unexpected token '{'"); // /usr/include/bits/thread-shared-types.h:113:9
pub const va_start = @compileError("unable to translate macro: undefined identifier `__builtin_va_start`"); // /snap/zig/7691/lib/include/stdarg.h:33:9
pub const va_end = @compileError("unable to translate macro: undefined identifier `__builtin_va_end`"); // /snap/zig/7691/lib/include/stdarg.h:35:9
pub const va_arg = @compileError("unable to translate macro: undefined identifier `__builtin_va_arg`"); // /snap/zig/7691/lib/include/stdarg.h:36:9
pub const __va_copy = @compileError("unable to translate macro: undefined identifier `__builtin_va_copy`"); // /snap/zig/7691/lib/include/stdarg.h:41:9
pub const va_copy = @compileError("unable to translate macro: undefined identifier `__builtin_va_copy`"); // /snap/zig/7691/lib/include/stdarg.h:46:9
pub const _HPy_HIDDEN = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /home/february/projects/hpy/hpy/devel/include/hpy.h:71:12
pub const _HPy_UNUSED = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /home/february/projects/hpy/hpy/devel/include/hpy.h:72:12
pub const _HPy_UNUSED_ARG = @compileError("unable to translate macro: undefined identifier `__HPy_UNUSED_TAGGED`"); // /home/february/projects/hpy/hpy/devel/include/hpy.h:77:9
pub const _HPy_NO_RETURN = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /home/february/projects/hpy/hpy/devel/include/hpy.h:83:11
pub const _HPY_compiler_has_attribute = @compileError("unable to translate macro: undefined identifier `__has_attribute`"); // /home/february/projects/hpy/hpy/devel/include/hpy.h:94:12
pub const _HPY_LEGACY = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /home/february/projects/hpy/hpy/devel/include/hpy.h:102:13
pub const HPyAPI_FUNC = @compileError("unable to translate C expr: unexpected token 'static'"); // /home/february/projects/hpy/hpy/devel/include/hpy.h:140:9
pub const HPy_EXPORTED_SYMBOL = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /home/february/projects/hpy/hpy/devel/include/hpy/hpyexports.h:9:17
pub const HPy_New = @compileError("unable to translate C expr: expected ')' instead got '*'"); // /home/february/projects/hpy/hpy/devel/include/hpy/macros.h:12:9
pub const HPy_RETURN_RICHCOMPARE = @compileError("unable to translate macro: undefined identifier `result`"); // /home/february/projects/hpy/hpy/devel/include/hpy/macros.h:29:9
pub const HPy_BEGIN_LEAVE_PYTHON = @compileError("unable to translate macro: undefined identifier `_token`"); // /home/february/projects/hpy/hpy/devel/include/hpy/macros.h:64:9
pub const HPy_END_LEAVE_PYTHON = @compileError("unable to translate macro: undefined identifier `_token`"); // /home/february/projects/hpy/hpy/devel/include/hpy/macros.h:68:9
pub const HPyFunc_DECLARE = @compileError("unable to translate macro: undefined identifier `_sig`"); // /home/february/projects/hpy/hpy/devel/include/hpy/hpyfunc.h:66:9
pub const HPyFunc_TRAMPOLINE = @compileError("unable to translate macro: undefined identifier `_sig`"); // /home/february/projects/hpy/hpy/devel/include/hpy/hpyfunc.h:78:9
pub const HPy_VISIT = @compileError("unable to translate macro: undefined identifier `vret`"); // /home/february/projects/hpy/hpy/devel/include/hpy/hpyfunc.h:104:9
pub const _HPyFunc_DECLARE_HPyFunc_NOARGS = @compileError("unable to translate macro: undefined identifier `ctx`"); // /home/february/projects/hpy/hpy/devel/include/hpy/autogen_hpyfunc_declare.h:13:9
pub const _HPyFunc_DECLARE_HPyFunc_O = @compileError("unable to translate macro: undefined identifier `ctx`"); // /home/february/projects/hpy/hpy/devel/include/hpy/autogen_hpyfunc_declare.h:14:9
pub const _HPyFunc_DECLARE_HPyFunc_VARARGS = @compileError("unable to translate macro: undefined identifier `ctx`"); // /home/february/projects/hpy/hpy/devel/include/hpy/autogen_hpyfunc_declare.h:15:9
pub const _HPyFunc_DECLARE_HPyFunc_KEYWORDS = @compileError("unable to translate macro: undefined identifier `ctx`"); // /home/february/projects/hpy/hpy/devel/include/hpy/autogen_hpyfunc_declare.h:16:9
pub const _HPyFunc_DECLARE_HPyFunc_UNARYFUNC = @compileError("unable to translate macro: undefined identifier `ctx`"); // /home/february/projects/hpy/hpy/devel/include/hpy/autogen_hpyfunc_declare.h:17:9
pub const _HPyFunc_DECLARE_HPyFunc_BINARYFUNC = @compileError("unable to translate macro: undefined identifier `ctx`"); // /home/february/projects/hpy/hpy/devel/include/hpy/autogen_hpyfunc_declare.h:18:9
pub const _HPyFunc_DECLARE_HPyFunc_TERNARYFUNC = @compileError("unable to translate macro: undefined identifier `ctx`"); // /home/february/projects/hpy/hpy/devel/include/hpy/autogen_hpyfunc_declare.h:19:9
pub const _HPyFunc_DECLARE_HPyFunc_INQUIRY = @compileError("unable to translate macro: undefined identifier `ctx`"); // /home/february/projects/hpy/hpy/devel/include/hpy/autogen_hpyfunc_declare.h:20:9
pub const _HPyFunc_DECLARE_HPyFunc_LENFUNC = @compileError("unable to translate macro: undefined identifier `ctx`"); // /home/february/projects/hpy/hpy/devel/include/hpy/autogen_hpyfunc_declare.h:21:9
pub const _HPyFunc_DECLARE_HPyFunc_SSIZEARGFUNC = @compileError("unable to translate macro: undefined identifier `ctx`"); // /home/february/projects/hpy/hpy/devel/include/hpy/autogen_hpyfunc_declare.h:22:9
pub const _HPyFunc_DECLARE_HPyFunc_SSIZESSIZEARGFUNC = @compileError("unable to translate macro: undefined identifier `ctx`"); // /home/february/projects/hpy/hpy/devel/include/hpy/autogen_hpyfunc_declare.h:23:9
pub const _HPyFunc_DECLARE_HPyFunc_SSIZEOBJARGPROC = @compileError("unable to translate macro: undefined identifier `ctx`"); // /home/february/projects/hpy/hpy/devel/include/hpy/autogen_hpyfunc_declare.h:24:9
pub const _HPyFunc_DECLARE_HPyFunc_SSIZESSIZEOBJARGPROC = @compileError("unable to translate macro: undefined identifier `ctx`"); // /home/february/projects/hpy/hpy/devel/include/hpy/autogen_hpyfunc_declare.h:25:9
pub const _HPyFunc_DECLARE_HPyFunc_OBJOBJARGPROC = @compileError("unable to translate macro: undefined identifier `ctx`"); // /home/february/projects/hpy/hpy/devel/include/hpy/autogen_hpyfunc_declare.h:26:9
pub const _HPyFunc_DECLARE_HPyFunc_FREEFUNC = @compileError("unable to translate macro: undefined identifier `ctx`"); // /home/february/projects/hpy/hpy/devel/include/hpy/autogen_hpyfunc_declare.h:27:9
pub const _HPyFunc_DECLARE_HPyFunc_GETATTRFUNC = @compileError("unable to translate macro: undefined identifier `ctx`"); // /home/february/projects/hpy/hpy/devel/include/hpy/autogen_hpyfunc_declare.h:28:9
pub const _HPyFunc_DECLARE_HPyFunc_GETATTROFUNC = @compileError("unable to translate macro: undefined identifier `ctx`"); // /home/february/projects/hpy/hpy/devel/include/hpy/autogen_hpyfunc_declare.h:29:9
pub const _HPyFunc_DECLARE_HPyFunc_SETATTRFUNC = @compileError("unable to translate macro: undefined identifier `ctx`"); // /home/february/projects/hpy/hpy/devel/include/hpy/autogen_hpyfunc_declare.h:30:9
pub const _HPyFunc_DECLARE_HPyFunc_SETATTROFUNC = @compileError("unable to translate macro: undefined identifier `ctx`"); // /home/february/projects/hpy/hpy/devel/include/hpy/autogen_hpyfunc_declare.h:31:9
pub const _HPyFunc_DECLARE_HPyFunc_REPRFUNC = @compileError("unable to translate macro: undefined identifier `ctx`"); // /home/february/projects/hpy/hpy/devel/include/hpy/autogen_hpyfunc_declare.h:32:9
pub const _HPyFunc_DECLARE_HPyFunc_HASHFUNC = @compileError("unable to translate macro: undefined identifier `ctx`"); // /home/february/projects/hpy/hpy/devel/include/hpy/autogen_hpyfunc_declare.h:33:9
pub const _HPyFunc_DECLARE_HPyFunc_RICHCMPFUNC = @compileError("unable to translate macro: undefined identifier `ctx`"); // /home/february/projects/hpy/hpy/devel/include/hpy/autogen_hpyfunc_declare.h:34:9
pub const _HPyFunc_DECLARE_HPyFunc_GETITERFUNC = @compileError("unable to translate macro: undefined identifier `ctx`"); // /home/february/projects/hpy/hpy/devel/include/hpy/autogen_hpyfunc_declare.h:35:9
pub const _HPyFunc_DECLARE_HPyFunc_ITERNEXTFUNC = @compileError("unable to translate macro: undefined identifier `ctx`"); // /home/february/projects/hpy/hpy/devel/include/hpy/autogen_hpyfunc_declare.h:36:9
pub const _HPyFunc_DECLARE_HPyFunc_DESCRGETFUNC = @compileError("unable to translate macro: undefined identifier `ctx`"); // /home/february/projects/hpy/hpy/devel/include/hpy/autogen_hpyfunc_declare.h:37:9
pub const _HPyFunc_DECLARE_HPyFunc_DESCRSETFUNC = @compileError("unable to translate macro: undefined identifier `ctx`"); // /home/february/projects/hpy/hpy/devel/include/hpy/autogen_hpyfunc_declare.h:38:9
pub const _HPyFunc_DECLARE_HPyFunc_INITPROC = @compileError("unable to translate macro: undefined identifier `ctx`"); // /home/february/projects/hpy/hpy/devel/include/hpy/autogen_hpyfunc_declare.h:39:9
pub const _HPyFunc_DECLARE_HPyFunc_NEWFUNC = @compileError("unable to translate macro: undefined identifier `ctx`"); // /home/february/projects/hpy/hpy/devel/include/hpy/autogen_hpyfunc_declare.h:40:9
pub const _HPyFunc_DECLARE_HPyFunc_GETTER = @compileError("unable to translate macro: undefined identifier `ctx`"); // /home/february/projects/hpy/hpy/devel/include/hpy/autogen_hpyfunc_declare.h:41:9
pub const _HPyFunc_DECLARE_HPyFunc_SETTER = @compileError("unable to translate macro: undefined identifier `ctx`"); // /home/february/projects/hpy/hpy/devel/include/hpy/autogen_hpyfunc_declare.h:42:9
pub const _HPyFunc_DECLARE_HPyFunc_OBJOBJPROC = @compileError("unable to translate macro: undefined identifier `ctx`"); // /home/february/projects/hpy/hpy/devel/include/hpy/autogen_hpyfunc_declare.h:43:9
pub const _HPyFunc_DECLARE_HPyFunc_GETBUFFERPROC = @compileError("unable to translate macro: undefined identifier `ctx`"); // /home/february/projects/hpy/hpy/devel/include/hpy/autogen_hpyfunc_declare.h:44:9
pub const _HPyFunc_DECLARE_HPyFunc_RELEASEBUFFERPROC = @compileError("unable to translate macro: undefined identifier `ctx`"); // /home/february/projects/hpy/hpy/devel/include/hpy/autogen_hpyfunc_declare.h:45:9
pub const _HPyFunc_DECLARE_HPyFunc_TRAVERSEPROC = @compileError("unable to translate macro: undefined identifier `object`"); // /home/february/projects/hpy/hpy/devel/include/hpy/autogen_hpyfunc_declare.h:46:9
pub const _HPyFunc_DECLARE_HPyFunc_DESTRUCTOR = @compileError("unable to translate macro: undefined identifier `ctx`"); // /home/february/projects/hpy/hpy/devel/include/hpy/autogen_hpyfunc_declare.h:47:9
pub const _HPyFunc_DECLARE_HPyFunc_DESTROYFUNC = @compileError("unable to translate C expr: unexpected token 'static'"); // /home/february/projects/hpy/hpy/devel/include/hpy/autogen_hpyfunc_declare.h:48:9
pub const _HPyFunc_DECLARE_HPyFunc_MOD_CREATE = @compileError("unable to translate macro: undefined identifier `ctx`"); // /home/february/projects/hpy/hpy/devel/include/hpy/autogen_hpyfunc_declare.h:49:9
pub const _HPyFunc_TRAMPOLINE_HPyFunc_VARARGS = @compileError("unable to translate macro: undefined identifier `self`"); // /home/february/projects/hpy/hpy/devel/include/hpy/universal/hpyfunc_trampolines.h:45:9
pub const _HPyFunc_TRAMPOLINE_HPyFunc_KEYWORDS = @compileError("unable to translate macro: undefined identifier `self`"); // /home/february/projects/hpy/hpy/devel/include/hpy/universal/hpyfunc_trampolines.h:55:9
pub const _HPyFunc_TRAMPOLINE_HPyFunc_INITPROC = @compileError("unable to translate macro: undefined identifier `self`"); // /home/february/projects/hpy/hpy/devel/include/hpy/universal/hpyfunc_trampolines.h:66:9
pub const _HPyFunc_TRAMPOLINE_HPyFunc_NEWFUNC = @compileError("unable to translate macro: undefined identifier `self`"); // /home/february/projects/hpy/hpy/devel/include/hpy/universal/hpyfunc_trampolines.h:76:9
pub const _HPyFunc_TRAMPOLINE_HPyFunc_DESTROYFUNC = @compileError("unable to translate C expr: unexpected token 'static'"); // /home/february/projects/hpy/hpy/devel/include/hpy/universal/hpyfunc_trampolines.h:89:9
pub const _HPyFunc_TRAMPOLINE_HPyFunc_RICHCMPFUNC = @compileError("unable to translate macro: undefined identifier `self`"); // /home/february/projects/hpy/hpy/devel/include/hpy/universal/hpyfunc_trampolines.h:95:9
pub const _HPyFunc_TRAMPOLINE_HPyFunc_GETBUFFERPROC = @compileError("unable to translate macro: undefined identifier `self`"); // /home/february/projects/hpy/hpy/devel/include/hpy/universal/hpyfunc_trampolines.h:112:9
pub const _HPyFunc_TRAMPOLINE_HPyFunc_RELEASEBUFFERPROC = @compileError("unable to translate macro: undefined identifier `self`"); // /home/february/projects/hpy/hpy/devel/include/hpy/universal/hpyfunc_trampolines.h:126:9
pub const _HPyFunc_TRAMPOLINE_HPyFunc_TRAVERSEPROC = @compileError("unable to translate macro: undefined identifier `self`"); // /home/february/projects/hpy/hpy/devel/include/hpy/universal/hpyfunc_trampolines.h:144:9
pub const HPyCapsule_DESTRUCTOR_TRAMPOLINE = @compileError("unable to translate macro: undefined identifier `capsule`"); // /home/february/projects/hpy/hpy/devel/include/hpy/universal/hpyfunc_trampolines.h:154:9
pub const _HPyFunc_TRAMPOLINE_HPyFunc_MOD_CREATE = @compileError("unable to translate macro: undefined identifier `spec`"); // /home/february/projects/hpy/hpy/devel/include/hpy/universal/hpyfunc_trampolines.h:166:9
pub const _HPyFunc_TRAMPOLINE_HPyFunc_NOARGS = @compileError("unable to translate macro: undefined identifier `self`"); // /home/february/projects/hpy/hpy/devel/include/hpy/universal/autogen_hpyfunc_trampolines.h:18:9
pub const _HPyFunc_TRAMPOLINE_HPyFunc_O = @compileError("unable to translate macro: undefined identifier `self`"); // /home/february/projects/hpy/hpy/devel/include/hpy/universal/autogen_hpyfunc_trampolines.h:33:9
pub const _HPyFunc_TRAMPOLINE_HPyFunc_UNARYFUNC = @compileError("unable to translate macro: undefined identifier `arg0`"); // /home/february/projects/hpy/hpy/devel/include/hpy/universal/autogen_hpyfunc_trampolines.h:47:9
pub const _HPyFunc_TRAMPOLINE_HPyFunc_BINARYFUNC = @compileError("unable to translate macro: undefined identifier `arg0`"); // /home/february/projects/hpy/hpy/devel/include/hpy/universal/autogen_hpyfunc_trampolines.h:62:9
pub const _HPyFunc_TRAMPOLINE_HPyFunc_TERNARYFUNC = @compileError("unable to translate macro: undefined identifier `arg0`"); // /home/february/projects/hpy/hpy/devel/include/hpy/universal/autogen_hpyfunc_trampolines.h:78:9
pub const _HPyFunc_TRAMPOLINE_HPyFunc_INQUIRY = @compileError("unable to translate macro: undefined identifier `arg0`"); // /home/february/projects/hpy/hpy/devel/include/hpy/universal/autogen_hpyfunc_trampolines.h:92:9
pub const _HPyFunc_TRAMPOLINE_HPyFunc_LENFUNC = @compileError("unable to translate macro: undefined identifier `arg0`"); // /home/february/projects/hpy/hpy/devel/include/hpy/universal/autogen_hpyfunc_trampolines.h:106:9
pub const _HPyFunc_TRAMPOLINE_HPyFunc_SSIZEARGFUNC = @compileError("unable to translate macro: undefined identifier `arg0`"); // /home/february/projects/hpy/hpy/devel/include/hpy/universal/autogen_hpyfunc_trampolines.h:121:9
pub const _HPyFunc_TRAMPOLINE_HPyFunc_SSIZESSIZEARGFUNC = @compileError("unable to translate macro: undefined identifier `arg0`"); // /home/february/projects/hpy/hpy/devel/include/hpy/universal/autogen_hpyfunc_trampolines.h:137:9
pub const _HPyFunc_TRAMPOLINE_HPyFunc_SSIZEOBJARGPROC = @compileError("unable to translate macro: undefined identifier `arg0`"); // /home/february/projects/hpy/hpy/devel/include/hpy/universal/autogen_hpyfunc_trampolines.h:153:9
pub const _HPyFunc_TRAMPOLINE_HPyFunc_SSIZESSIZEOBJARGPROC = @compileError("unable to translate macro: undefined identifier `arg0`"); // /home/february/projects/hpy/hpy/devel/include/hpy/universal/autogen_hpyfunc_trampolines.h:170:9
pub const _HPyFunc_TRAMPOLINE_HPyFunc_OBJOBJARGPROC = @compileError("unable to translate macro: undefined identifier `arg0`"); // /home/february/projects/hpy/hpy/devel/include/hpy/universal/autogen_hpyfunc_trampolines.h:186:9
pub const _HPyFunc_TRAMPOLINE_HPyFunc_FREEFUNC = @compileError("unable to translate macro: undefined identifier `arg0`"); // /home/february/projects/hpy/hpy/devel/include/hpy/universal/autogen_hpyfunc_trampolines.h:199:9
pub const _HPyFunc_TRAMPOLINE_HPyFunc_GETATTRFUNC = @compileError("unable to translate macro: undefined identifier `arg0`"); // /home/february/projects/hpy/hpy/devel/include/hpy/universal/autogen_hpyfunc_trampolines.h:214:9
pub const _HPyFunc_TRAMPOLINE_HPyFunc_GETATTROFUNC = @compileError("unable to translate macro: undefined identifier `arg0`"); // /home/february/projects/hpy/hpy/devel/include/hpy/universal/autogen_hpyfunc_trampolines.h:229:9
pub const _HPyFunc_TRAMPOLINE_HPyFunc_SETATTRFUNC = @compileError("unable to translate macro: undefined identifier `arg0`"); // /home/february/projects/hpy/hpy/devel/include/hpy/universal/autogen_hpyfunc_trampolines.h:245:9
pub const _HPyFunc_TRAMPOLINE_HPyFunc_SETATTROFUNC = @compileError("unable to translate macro: undefined identifier `arg0`"); // /home/february/projects/hpy/hpy/devel/include/hpy/universal/autogen_hpyfunc_trampolines.h:261:9
pub const _HPyFunc_TRAMPOLINE_HPyFunc_REPRFUNC = @compileError("unable to translate macro: undefined identifier `arg0`"); // /home/february/projects/hpy/hpy/devel/include/hpy/universal/autogen_hpyfunc_trampolines.h:275:9
pub const _HPyFunc_TRAMPOLINE_HPyFunc_HASHFUNC = @compileError("unable to translate macro: undefined identifier `arg0`"); // /home/february/projects/hpy/hpy/devel/include/hpy/universal/autogen_hpyfunc_trampolines.h:289:9
pub const _HPyFunc_TRAMPOLINE_HPyFunc_GETITERFUNC = @compileError("unable to translate macro: undefined identifier `arg0`"); // /home/february/projects/hpy/hpy/devel/include/hpy/universal/autogen_hpyfunc_trampolines.h:303:9
pub const _HPyFunc_TRAMPOLINE_HPyFunc_ITERNEXTFUNC = @compileError("unable to translate macro: undefined identifier `arg0`"); // /home/february/projects/hpy/hpy/devel/include/hpy/universal/autogen_hpyfunc_trampolines.h:317:9
pub const _HPyFunc_TRAMPOLINE_HPyFunc_DESCRGETFUNC = @compileError("unable to translate macro: undefined identifier `arg0`"); // /home/february/projects/hpy/hpy/devel/include/hpy/universal/autogen_hpyfunc_trampolines.h:333:9
pub const _HPyFunc_TRAMPOLINE_HPyFunc_DESCRSETFUNC = @compileError("unable to translate macro: undefined identifier `arg0`"); // /home/february/projects/hpy/hpy/devel/include/hpy/universal/autogen_hpyfunc_trampolines.h:349:9
pub const _HPyFunc_TRAMPOLINE_HPyFunc_GETTER = @compileError("unable to translate macro: undefined identifier `arg0`"); // /home/february/projects/hpy/hpy/devel/include/hpy/universal/autogen_hpyfunc_trampolines.h:364:9
pub const _HPyFunc_TRAMPOLINE_HPyFunc_SETTER = @compileError("unable to translate macro: undefined identifier `arg0`"); // /home/february/projects/hpy/hpy/devel/include/hpy/universal/autogen_hpyfunc_trampolines.h:380:9
pub const _HPyFunc_TRAMPOLINE_HPyFunc_OBJOBJPROC = @compileError("unable to translate macro: undefined identifier `arg0`"); // /home/february/projects/hpy/hpy/devel/include/hpy/universal/autogen_hpyfunc_trampolines.h:395:9
pub const _HPyFunc_TRAMPOLINE_HPyFunc_DESTRUCTOR = @compileError("unable to translate macro: undefined identifier `arg0`"); // /home/february/projects/hpy/hpy/devel/include/hpy/universal/autogen_hpyfunc_trampolines.h:408:9
pub const offsetof = @compileError("unable to translate macro: undefined identifier `__builtin_offsetof`"); // /snap/zig/7691/lib/include/stddef.h:111:9
pub const HPySlot_SIG = @compileError("unable to translate macro: undefined identifier `_HPySlot_SIG__`"); // /home/february/projects/hpy/hpy/devel/include/hpy/hpydef.h:219:9
pub const HPyDef_SLOT_IMPL = @compileError("unable to translate macro: undefined identifier `_slot`"); // /home/february/projects/hpy/hpy/devel/include/hpy/hpydef.h:232:9
pub const HPyDef_SLOT = @compileError("unable to translate macro: undefined identifier `_impl`"); // /home/february/projects/hpy/hpy/devel/include/hpy/hpydef.h:252:9
pub const _HPyDef_SLOT = @compileError("unable to translate macro: undefined identifier `_trampoline`"); // /home/february/projects/hpy/hpy/devel/include/hpy/hpydef.h:256:9
pub const HPyDef_METH_IMPL = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /home/february/projects/hpy/hpy/devel/include/hpy/hpydef.h:269:9
pub const HPyDef_METH = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /home/february/projects/hpy/hpy/devel/include/hpy/hpydef.h:301:9
pub const HPyDef_MEMBER = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /home/february/projects/hpy/hpy/devel/include/hpy/hpydef.h:321:9
pub const HPyDef_GET_IMPL = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /home/february/projects/hpy/hpy/devel/include/hpy/hpydef.h:332:9
pub const HPyDef_GET = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /home/february/projects/hpy/hpy/devel/include/hpy/hpydef.h:359:9
pub const HPyDef_SET_IMPL = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /home/february/projects/hpy/hpy/devel/include/hpy/hpydef.h:362:9
pub const HPyDef_SET = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /home/february/projects/hpy/hpy/devel/include/hpy/hpydef.h:389:9
pub const HPyDef_GETSET_IMPL = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /home/february/projects/hpy/hpy/devel/include/hpy/hpydef.h:392:9
pub const HPyDef_GETSET = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /home/february/projects/hpy/hpy/devel/include/hpy/hpydef.h:424:9
pub const HPyCapsule_DESTRUCTOR = @compileError("unable to translate macro: undefined identifier `_impl`"); // /home/february/projects/hpy/hpy/devel/include/hpy/hpydef.h:427:9
pub const HPyDef_CALL_FUNCTION = @compileError("unable to translate macro: undefined identifier `_impl`"); // /home/february/projects/hpy/hpy/devel/include/hpy/hpydef.h:450:9
pub const HPyAPI_UNUSED = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /home/february/projects/hpy/hpy/devel/include/hpy/hpytype.h:6:9
pub const _HPyType_HELPER_TYPE = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /home/february/projects/hpy/hpy/devel/include/hpy/hpytype.h:209:9
pub const _HPyType_HELPER_FNAME = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /home/february/projects/hpy/hpy/devel/include/hpy/hpytype.h:210:9
pub const _HPyType_HELPER_DEFINE_SHAPE = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /home/february/projects/hpy/hpy/devel/include/hpy/hpytype.h:211:9
pub const _HPyType_HELPER_AS_STRUCT = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /home/february/projects/hpy/hpy/devel/include/hpy/hpytype.h:213:9
pub const HPyType_HELPERS = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /home/february/projects/hpy/hpy/devel/include/hpy/hpytype.h:263:9
pub const SHAPE = @compileError("unable to translate macro: undefined identifier `_SHAPE`"); // /home/february/projects/hpy/hpy/devel/include/hpy/hpytype.h:276:9
pub const HPY_MOD_EMBEDDABLE = @compileError("unable to translate C expr: unexpected token 'Eof'"); // /home/february/projects/hpy/hpy/devel/include/hpy/hpymodule.h:23:9
pub const HPy_MODINIT = @compileError("unable to translate macro: undefined identifier `get_required_hpy_major_version_`"); // /home/february/projects/hpy/hpy/devel/include/hpy/hpymodule.h:130:9
pub const __ASSERT_VOID_CAST = @compileError("unable to translate C expr: unexpected token 'Eof'"); // /usr/include/assert.h:40:10
pub const assert = @compileError("unable to translate macro: undefined identifier `__extension__`"); // /usr/include/assert.h:107:11
pub const __ASSERT_FUNCTION = @compileError("unable to translate macro: undefined identifier `__extension__`"); // /usr/include/assert.h:129:12
pub const static_assert = @compileError("unable to translate C expr: unexpected token '_Static_assert'"); // /usr/include/assert.h:143:10
pub const __llvm__ = @as(c_int, 1);
pub const __clang__ = @as(c_int, 1);
pub const __clang_major__ = @as(c_int, 16);
pub const __clang_minor__ = @as(c_int, 0);
pub const __clang_patchlevel__ = @as(c_int, 1);
pub const __clang_version__ = "16.0.1 (https://github.com/ziglang/zig-bootstrap bf1b2cdb83141ad9336eec42160c9fe87f90198d)";
pub const __GNUC__ = @as(c_int, 4);
pub const __GNUC_MINOR__ = @as(c_int, 2);
pub const __GNUC_PATCHLEVEL__ = @as(c_int, 1);
pub const __GXX_ABI_VERSION = @as(c_int, 1002);
pub const __ATOMIC_RELAXED = @as(c_int, 0);
pub const __ATOMIC_CONSUME = @as(c_int, 1);
pub const __ATOMIC_ACQUIRE = @as(c_int, 2);
pub const __ATOMIC_RELEASE = @as(c_int, 3);
pub const __ATOMIC_ACQ_REL = @as(c_int, 4);
pub const __ATOMIC_SEQ_CST = @as(c_int, 5);
pub const __OPENCL_MEMORY_SCOPE_WORK_ITEM = @as(c_int, 0);
pub const __OPENCL_MEMORY_SCOPE_WORK_GROUP = @as(c_int, 1);
pub const __OPENCL_MEMORY_SCOPE_DEVICE = @as(c_int, 2);
pub const __OPENCL_MEMORY_SCOPE_ALL_SVM_DEVICES = @as(c_int, 3);
pub const __OPENCL_MEMORY_SCOPE_SUB_GROUP = @as(c_int, 4);
pub const __PRAGMA_REDEFINE_EXTNAME = @as(c_int, 1);
pub const __VERSION__ = "Clang 16.0.1 (https://github.com/ziglang/zig-bootstrap bf1b2cdb83141ad9336eec42160c9fe87f90198d)";
pub const __OBJC_BOOL_IS_BOOL = @as(c_int, 0);
pub const __CONSTANT_CFSTRINGS__ = @as(c_int, 1);
pub const __clang_literal_encoding__ = "UTF-8";
pub const __clang_wide_literal_encoding__ = "UTF-32";
pub const __ORDER_LITTLE_ENDIAN__ = @as(c_int, 1234);
pub const __ORDER_BIG_ENDIAN__ = @as(c_int, 4321);
pub const __ORDER_PDP_ENDIAN__ = @as(c_int, 3412);
pub const __BYTE_ORDER__ = __ORDER_LITTLE_ENDIAN__;
pub const __LITTLE_ENDIAN__ = @as(c_int, 1);
pub const _LP64 = @as(c_int, 1);
pub const __LP64__ = @as(c_int, 1);
pub const __CHAR_BIT__ = @as(c_int, 8);
pub const __BOOL_WIDTH__ = @as(c_int, 8);
pub const __SHRT_WIDTH__ = @as(c_int, 16);
pub const __INT_WIDTH__ = @as(c_int, 32);
pub const __LONG_WIDTH__ = @as(c_int, 64);
pub const __LLONG_WIDTH__ = @as(c_int, 64);
pub const __BITINT_MAXWIDTH__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 8388608, .decimal);
pub const __SCHAR_MAX__ = @as(c_int, 127);
pub const __SHRT_MAX__ = @as(c_int, 32767);
pub const __INT_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __LONG_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __LONG_LONG_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __WCHAR_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __WCHAR_WIDTH__ = @as(c_int, 32);
pub const __WINT_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const __WINT_WIDTH__ = @as(c_int, 32);
pub const __INTMAX_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __INTMAX_WIDTH__ = @as(c_int, 64);
pub const __SIZE_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __SIZE_WIDTH__ = @as(c_int, 64);
pub const __UINTMAX_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __UINTMAX_WIDTH__ = @as(c_int, 64);
pub const __PTRDIFF_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __PTRDIFF_WIDTH__ = @as(c_int, 64);
pub const __INTPTR_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __INTPTR_WIDTH__ = @as(c_int, 64);
pub const __UINTPTR_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __UINTPTR_WIDTH__ = @as(c_int, 64);
pub const __SIZEOF_DOUBLE__ = @as(c_int, 8);
pub const __SIZEOF_FLOAT__ = @as(c_int, 4);
pub const __SIZEOF_INT__ = @as(c_int, 4);
pub const __SIZEOF_LONG__ = @as(c_int, 8);
pub const __SIZEOF_LONG_DOUBLE__ = @as(c_int, 16);
pub const __SIZEOF_LONG_LONG__ = @as(c_int, 8);
pub const __SIZEOF_POINTER__ = @as(c_int, 8);
pub const __SIZEOF_SHORT__ = @as(c_int, 2);
pub const __SIZEOF_PTRDIFF_T__ = @as(c_int, 8);
pub const __SIZEOF_SIZE_T__ = @as(c_int, 8);
pub const __SIZEOF_WCHAR_T__ = @as(c_int, 4);
pub const __SIZEOF_WINT_T__ = @as(c_int, 4);
pub const __SIZEOF_INT128__ = @as(c_int, 16);
pub const __INTMAX_TYPE__ = c_long;
pub const __INTMAX_FMTd__ = "ld";
pub const __INTMAX_FMTi__ = "li";
pub const __UINTMAX_TYPE__ = c_ulong;
pub const __UINTMAX_FMTo__ = "lo";
pub const __UINTMAX_FMTu__ = "lu";
pub const __UINTMAX_FMTx__ = "lx";
pub const __UINTMAX_FMTX__ = "lX";
pub const __PTRDIFF_TYPE__ = c_long;
pub const __PTRDIFF_FMTd__ = "ld";
pub const __PTRDIFF_FMTi__ = "li";
pub const __INTPTR_TYPE__ = c_long;
pub const __INTPTR_FMTd__ = "ld";
pub const __INTPTR_FMTi__ = "li";
pub const __SIZE_TYPE__ = c_ulong;
pub const __SIZE_FMTo__ = "lo";
pub const __SIZE_FMTu__ = "lu";
pub const __SIZE_FMTx__ = "lx";
pub const __SIZE_FMTX__ = "lX";
pub const __WCHAR_TYPE__ = c_int;
pub const __WINT_TYPE__ = c_uint;
pub const __SIG_ATOMIC_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __SIG_ATOMIC_WIDTH__ = @as(c_int, 32);
pub const __CHAR16_TYPE__ = c_ushort;
pub const __CHAR32_TYPE__ = c_uint;
pub const __UINTPTR_TYPE__ = c_ulong;
pub const __UINTPTR_FMTo__ = "lo";
pub const __UINTPTR_FMTu__ = "lu";
pub const __UINTPTR_FMTx__ = "lx";
pub const __UINTPTR_FMTX__ = "lX";
pub const __FLT16_HAS_DENORM__ = @as(c_int, 1);
pub const __FLT16_DIG__ = @as(c_int, 3);
pub const __FLT16_DECIMAL_DIG__ = @as(c_int, 5);
pub const __FLT16_HAS_INFINITY__ = @as(c_int, 1);
pub const __FLT16_HAS_QUIET_NAN__ = @as(c_int, 1);
pub const __FLT16_MANT_DIG__ = @as(c_int, 11);
pub const __FLT16_MAX_10_EXP__ = @as(c_int, 4);
pub const __FLT16_MAX_EXP__ = @as(c_int, 16);
pub const __FLT16_MIN_10_EXP__ = -@as(c_int, 4);
pub const __FLT16_MIN_EXP__ = -@as(c_int, 13);
pub const __FLT_DENORM_MIN__ = @as(f32, 1.40129846e-45);
pub const __FLT_HAS_DENORM__ = @as(c_int, 1);
pub const __FLT_DIG__ = @as(c_int, 6);
pub const __FLT_DECIMAL_DIG__ = @as(c_int, 9);
pub const __FLT_EPSILON__ = @as(f32, 1.19209290e-7);
pub const __FLT_HAS_INFINITY__ = @as(c_int, 1);
pub const __FLT_HAS_QUIET_NAN__ = @as(c_int, 1);
pub const __FLT_MANT_DIG__ = @as(c_int, 24);
pub const __FLT_MAX_10_EXP__ = @as(c_int, 38);
pub const __FLT_MAX_EXP__ = @as(c_int, 128);
pub const __FLT_MAX__ = @as(f32, 3.40282347e+38);
pub const __FLT_MIN_10_EXP__ = -@as(c_int, 37);
pub const __FLT_MIN_EXP__ = -@as(c_int, 125);
pub const __FLT_MIN__ = @as(f32, 1.17549435e-38);
pub const __DBL_DENORM_MIN__ = @as(f64, 4.9406564584124654e-324);
pub const __DBL_HAS_DENORM__ = @as(c_int, 1);
pub const __DBL_DIG__ = @as(c_int, 15);
pub const __DBL_DECIMAL_DIG__ = @as(c_int, 17);
pub const __DBL_EPSILON__ = @as(f64, 2.2204460492503131e-16);
pub const __DBL_HAS_INFINITY__ = @as(c_int, 1);
pub const __DBL_HAS_QUIET_NAN__ = @as(c_int, 1);
pub const __DBL_MANT_DIG__ = @as(c_int, 53);
pub const __DBL_MAX_10_EXP__ = @as(c_int, 308);
pub const __DBL_MAX_EXP__ = @as(c_int, 1024);
pub const __DBL_MAX__ = @as(f64, 1.7976931348623157e+308);
pub const __DBL_MIN_10_EXP__ = -@as(c_int, 307);
pub const __DBL_MIN_EXP__ = -@as(c_int, 1021);
pub const __DBL_MIN__ = @as(f64, 2.2250738585072014e-308);
pub const __LDBL_DENORM_MIN__ = @as(c_longdouble, 3.64519953188247460253e-4951);
pub const __LDBL_HAS_DENORM__ = @as(c_int, 1);
pub const __LDBL_DIG__ = @as(c_int, 18);
pub const __LDBL_DECIMAL_DIG__ = @as(c_int, 21);
pub const __LDBL_EPSILON__ = @as(c_longdouble, 1.08420217248550443401e-19);
pub const __LDBL_HAS_INFINITY__ = @as(c_int, 1);
pub const __LDBL_HAS_QUIET_NAN__ = @as(c_int, 1);
pub const __LDBL_MANT_DIG__ = @as(c_int, 64);
pub const __LDBL_MAX_10_EXP__ = @as(c_int, 4932);
pub const __LDBL_MAX_EXP__ = @as(c_int, 16384);
pub const __LDBL_MAX__ = @as(c_longdouble, 1.18973149535723176502e+4932);
pub const __LDBL_MIN_10_EXP__ = -@as(c_int, 4931);
pub const __LDBL_MIN_EXP__ = -@as(c_int, 16381);
pub const __LDBL_MIN__ = @as(c_longdouble, 3.36210314311209350626e-4932);
pub const __POINTER_WIDTH__ = @as(c_int, 64);
pub const __BIGGEST_ALIGNMENT__ = @as(c_int, 16);
pub const __WINT_UNSIGNED__ = @as(c_int, 1);
pub const __INT8_TYPE__ = i8;
pub const __INT8_FMTd__ = "hhd";
pub const __INT8_FMTi__ = "hhi";
pub const __INT8_C_SUFFIX__ = "";
pub const __INT16_TYPE__ = c_short;
pub const __INT16_FMTd__ = "hd";
pub const __INT16_FMTi__ = "hi";
pub const __INT16_C_SUFFIX__ = "";
pub const __INT32_TYPE__ = c_int;
pub const __INT32_FMTd__ = "d";
pub const __INT32_FMTi__ = "i";
pub const __INT32_C_SUFFIX__ = "";
pub const __INT64_TYPE__ = c_long;
pub const __INT64_FMTd__ = "ld";
pub const __INT64_FMTi__ = "li";
pub const __UINT8_TYPE__ = u8;
pub const __UINT8_FMTo__ = "hho";
pub const __UINT8_FMTu__ = "hhu";
pub const __UINT8_FMTx__ = "hhx";
pub const __UINT8_FMTX__ = "hhX";
pub const __UINT8_C_SUFFIX__ = "";
pub const __UINT8_MAX__ = @as(c_int, 255);
pub const __INT8_MAX__ = @as(c_int, 127);
pub const __UINT16_TYPE__ = c_ushort;
pub const __UINT16_FMTo__ = "ho";
pub const __UINT16_FMTu__ = "hu";
pub const __UINT16_FMTx__ = "hx";
pub const __UINT16_FMTX__ = "hX";
pub const __UINT16_C_SUFFIX__ = "";
pub const __UINT16_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
pub const __INT16_MAX__ = @as(c_int, 32767);
pub const __UINT32_TYPE__ = c_uint;
pub const __UINT32_FMTo__ = "o";
pub const __UINT32_FMTu__ = "u";
pub const __UINT32_FMTx__ = "x";
pub const __UINT32_FMTX__ = "X";
pub const __UINT32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const __INT32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __UINT64_TYPE__ = c_ulong;
pub const __UINT64_FMTo__ = "lo";
pub const __UINT64_FMTu__ = "lu";
pub const __UINT64_FMTx__ = "lx";
pub const __UINT64_FMTX__ = "lX";
pub const __UINT64_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __INT64_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __INT_LEAST8_TYPE__ = i8;
pub const __INT_LEAST8_MAX__ = @as(c_int, 127);
pub const __INT_LEAST8_WIDTH__ = @as(c_int, 8);
pub const __INT_LEAST8_FMTd__ = "hhd";
pub const __INT_LEAST8_FMTi__ = "hhi";
pub const __UINT_LEAST8_TYPE__ = u8;
pub const __UINT_LEAST8_MAX__ = @as(c_int, 255);
pub const __UINT_LEAST8_FMTo__ = "hho";
pub const __UINT_LEAST8_FMTu__ = "hhu";
pub const __UINT_LEAST8_FMTx__ = "hhx";
pub const __UINT_LEAST8_FMTX__ = "hhX";
pub const __INT_LEAST16_TYPE__ = c_short;
pub const __INT_LEAST16_MAX__ = @as(c_int, 32767);
pub const __INT_LEAST16_WIDTH__ = @as(c_int, 16);
pub const __INT_LEAST16_FMTd__ = "hd";
pub const __INT_LEAST16_FMTi__ = "hi";
pub const __UINT_LEAST16_TYPE__ = c_ushort;
pub const __UINT_LEAST16_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
pub const __UINT_LEAST16_FMTo__ = "ho";
pub const __UINT_LEAST16_FMTu__ = "hu";
pub const __UINT_LEAST16_FMTx__ = "hx";
pub const __UINT_LEAST16_FMTX__ = "hX";
pub const __INT_LEAST32_TYPE__ = c_int;
pub const __INT_LEAST32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __INT_LEAST32_WIDTH__ = @as(c_int, 32);
pub const __INT_LEAST32_FMTd__ = "d";
pub const __INT_LEAST32_FMTi__ = "i";
pub const __UINT_LEAST32_TYPE__ = c_uint;
pub const __UINT_LEAST32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const __UINT_LEAST32_FMTo__ = "o";
pub const __UINT_LEAST32_FMTu__ = "u";
pub const __UINT_LEAST32_FMTx__ = "x";
pub const __UINT_LEAST32_FMTX__ = "X";
pub const __INT_LEAST64_TYPE__ = c_long;
pub const __INT_LEAST64_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __INT_LEAST64_WIDTH__ = @as(c_int, 64);
pub const __INT_LEAST64_FMTd__ = "ld";
pub const __INT_LEAST64_FMTi__ = "li";
pub const __UINT_LEAST64_TYPE__ = c_ulong;
pub const __UINT_LEAST64_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __UINT_LEAST64_FMTo__ = "lo";
pub const __UINT_LEAST64_FMTu__ = "lu";
pub const __UINT_LEAST64_FMTx__ = "lx";
pub const __UINT_LEAST64_FMTX__ = "lX";
pub const __INT_FAST8_TYPE__ = i8;
pub const __INT_FAST8_MAX__ = @as(c_int, 127);
pub const __INT_FAST8_WIDTH__ = @as(c_int, 8);
pub const __INT_FAST8_FMTd__ = "hhd";
pub const __INT_FAST8_FMTi__ = "hhi";
pub const __UINT_FAST8_TYPE__ = u8;
pub const __UINT_FAST8_MAX__ = @as(c_int, 255);
pub const __UINT_FAST8_FMTo__ = "hho";
pub const __UINT_FAST8_FMTu__ = "hhu";
pub const __UINT_FAST8_FMTx__ = "hhx";
pub const __UINT_FAST8_FMTX__ = "hhX";
pub const __INT_FAST16_TYPE__ = c_short;
pub const __INT_FAST16_MAX__ = @as(c_int, 32767);
pub const __INT_FAST16_WIDTH__ = @as(c_int, 16);
pub const __INT_FAST16_FMTd__ = "hd";
pub const __INT_FAST16_FMTi__ = "hi";
pub const __UINT_FAST16_TYPE__ = c_ushort;
pub const __UINT_FAST16_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
pub const __UINT_FAST16_FMTo__ = "ho";
pub const __UINT_FAST16_FMTu__ = "hu";
pub const __UINT_FAST16_FMTx__ = "hx";
pub const __UINT_FAST16_FMTX__ = "hX";
pub const __INT_FAST32_TYPE__ = c_int;
pub const __INT_FAST32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __INT_FAST32_WIDTH__ = @as(c_int, 32);
pub const __INT_FAST32_FMTd__ = "d";
pub const __INT_FAST32_FMTi__ = "i";
pub const __UINT_FAST32_TYPE__ = c_uint;
pub const __UINT_FAST32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const __UINT_FAST32_FMTo__ = "o";
pub const __UINT_FAST32_FMTu__ = "u";
pub const __UINT_FAST32_FMTx__ = "x";
pub const __UINT_FAST32_FMTX__ = "X";
pub const __INT_FAST64_TYPE__ = c_long;
pub const __INT_FAST64_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __INT_FAST64_WIDTH__ = @as(c_int, 64);
pub const __INT_FAST64_FMTd__ = "ld";
pub const __INT_FAST64_FMTi__ = "li";
pub const __UINT_FAST64_TYPE__ = c_ulong;
pub const __UINT_FAST64_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __UINT_FAST64_FMTo__ = "lo";
pub const __UINT_FAST64_FMTu__ = "lu";
pub const __UINT_FAST64_FMTx__ = "lx";
pub const __UINT_FAST64_FMTX__ = "lX";
pub const __USER_LABEL_PREFIX__ = "";
pub const __FINITE_MATH_ONLY__ = @as(c_int, 0);
pub const __GNUC_STDC_INLINE__ = @as(c_int, 1);
pub const __GCC_ATOMIC_TEST_AND_SET_TRUEVAL = @as(c_int, 1);
pub const __CLANG_ATOMIC_BOOL_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_CHAR_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_CHAR16_T_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_CHAR32_T_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_WCHAR_T_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_SHORT_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_INT_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_LONG_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_LLONG_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_POINTER_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_BOOL_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_CHAR_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_CHAR16_T_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_CHAR32_T_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_WCHAR_T_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_SHORT_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_INT_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_LONG_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_LLONG_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_POINTER_LOCK_FREE = @as(c_int, 2);
pub const __NO_INLINE__ = @as(c_int, 1);
pub const __PIC__ = @as(c_int, 2);
pub const __pic__ = @as(c_int, 2);
pub const __FLT_RADIX__ = @as(c_int, 2);
pub const __DECIMAL_DIG__ = __LDBL_DECIMAL_DIG__;
pub const __SSP_STRONG__ = @as(c_int, 2);
pub const __GCC_ASM_FLAG_OUTPUTS__ = @as(c_int, 1);
pub const __code_model_small__ = @as(c_int, 1);
pub const __amd64__ = @as(c_int, 1);
pub const __amd64 = @as(c_int, 1);
pub const __x86_64 = @as(c_int, 1);
pub const __x86_64__ = @as(c_int, 1);
pub const __SEG_GS = @as(c_int, 1);
pub const __SEG_FS = @as(c_int, 1);
pub const __corei7 = @as(c_int, 1);
pub const __corei7__ = @as(c_int, 1);
pub const __tune_corei7__ = @as(c_int, 1);
pub const __REGISTER_PREFIX__ = "";
pub const __NO_MATH_INLINES = @as(c_int, 1);
pub const __AES__ = @as(c_int, 1);
pub const __PCLMUL__ = @as(c_int, 1);
pub const __LAHF_SAHF__ = @as(c_int, 1);
pub const __LZCNT__ = @as(c_int, 1);
pub const __RDRND__ = @as(c_int, 1);
pub const __FSGSBASE__ = @as(c_int, 1);
pub const __BMI__ = @as(c_int, 1);
pub const __BMI2__ = @as(c_int, 1);
pub const __POPCNT__ = @as(c_int, 1);
pub const __RTM__ = @as(c_int, 1);
pub const __PRFCHW__ = @as(c_int, 1);
pub const __RDSEED__ = @as(c_int, 1);
pub const __ADX__ = @as(c_int, 1);
pub const __MOVBE__ = @as(c_int, 1);
pub const __FMA__ = @as(c_int, 1);
pub const __F16C__ = @as(c_int, 1);
pub const __FXSR__ = @as(c_int, 1);
pub const __XSAVE__ = @as(c_int, 1);
pub const __XSAVEOPT__ = @as(c_int, 1);
pub const __XSAVEC__ = @as(c_int, 1);
pub const __XSAVES__ = @as(c_int, 1);
pub const __CLFLUSHOPT__ = @as(c_int, 1);
pub const __INVPCID__ = @as(c_int, 1);
pub const __CRC32__ = @as(c_int, 1);
pub const __AVX2__ = @as(c_int, 1);
pub const __AVX__ = @as(c_int, 1);
pub const __SSE4_2__ = @as(c_int, 1);
pub const __SSE4_1__ = @as(c_int, 1);
pub const __SSSE3__ = @as(c_int, 1);
pub const __SSE3__ = @as(c_int, 1);
pub const __SSE2__ = @as(c_int, 1);
pub const __SSE2_MATH__ = @as(c_int, 1);
pub const __SSE__ = @as(c_int, 1);
pub const __SSE_MATH__ = @as(c_int, 1);
pub const __MMX__ = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_8 = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_16 = @as(c_int, 1);
pub const __SIZEOF_FLOAT128__ = @as(c_int, 16);
pub const unix = @as(c_int, 1);
pub const __unix = @as(c_int, 1);
pub const __unix__ = @as(c_int, 1);
pub const linux = @as(c_int, 1);
pub const __linux = @as(c_int, 1);
pub const __linux__ = @as(c_int, 1);
pub const __ELF__ = @as(c_int, 1);
pub const __gnu_linux__ = @as(c_int, 1);
pub const __FLOAT128__ = @as(c_int, 1);
pub const __STDC__ = @as(c_int, 1);
pub const __STDC_HOSTED__ = @as(c_int, 1);
pub const __STDC_VERSION__ = @as(c_long, 201710);
pub const __STDC_UTF_16__ = @as(c_int, 1);
pub const __STDC_UTF_32__ = @as(c_int, 1);
pub const __GLIBC_MINOR__ = @as(c_int, 35);
pub const _DEBUG = @as(c_int, 1);
pub const HPY = @as(c_int, 1);
pub const HPY_ABI_UNIVERSAL = @as(c_int, 1);
pub const __GCC_HAVE_DWARF2_CFI_ASM = @as(c_int, 1);
pub const HPy_H = "";
pub const HPY_ABI_VERSION = @as(c_int, 0);
pub const HPY_ABI_VERSION_MINOR = @as(c_int, 0);
pub const HPY_ABI_TAG = "hpy0";
pub const HPY_ABI = "universal";
pub const __GLIBC_INTERNAL_STARTING_HEADER_IMPLEMENTATION = "";
pub const _FEATURES_H = @as(c_int, 1);
pub const __KERNEL_STRICT_NAMES = "";
pub inline fn __GNUC_PREREQ(maj: anytype, min: anytype) @TypeOf(((__GNUC__ << @as(c_int, 16)) + __GNUC_MINOR__) >= ((maj << @as(c_int, 16)) + min)) {
    return ((__GNUC__ << @as(c_int, 16)) + __GNUC_MINOR__) >= ((maj << @as(c_int, 16)) + min);
}
pub inline fn __glibc_clang_prereq(maj: anytype, min: anytype) @TypeOf(((__clang_major__ << @as(c_int, 16)) + __clang_minor__) >= ((maj << @as(c_int, 16)) + min)) {
    return ((__clang_major__ << @as(c_int, 16)) + __clang_minor__) >= ((maj << @as(c_int, 16)) + min);
}
pub const _DEFAULT_SOURCE = @as(c_int, 1);
pub const __GLIBC_USE_ISOC2X = @as(c_int, 0);
pub const __USE_ISOC11 = @as(c_int, 1);
pub const __USE_ISOC99 = @as(c_int, 1);
pub const __USE_ISOC95 = @as(c_int, 1);
pub const __USE_POSIX_IMPLICITLY = @as(c_int, 1);
pub const _POSIX_SOURCE = @as(c_int, 1);
pub const _POSIX_C_SOURCE = @as(c_long, 200809);
pub const __USE_POSIX = @as(c_int, 1);
pub const __USE_POSIX2 = @as(c_int, 1);
pub const __USE_POSIX199309 = @as(c_int, 1);
pub const __USE_POSIX199506 = @as(c_int, 1);
pub const __USE_XOPEN2K = @as(c_int, 1);
pub const __USE_XOPEN2K8 = @as(c_int, 1);
pub const _ATFILE_SOURCE = @as(c_int, 1);
pub const __WORDSIZE = @as(c_int, 64);
pub const __WORDSIZE_TIME64_COMPAT32 = @as(c_int, 1);
pub const __SYSCALL_WORDSIZE = @as(c_int, 64);
pub const __TIMESIZE = __WORDSIZE;
pub const __USE_MISC = @as(c_int, 1);
pub const __USE_ATFILE = @as(c_int, 1);
pub const __USE_FORTIFY_LEVEL = @as(c_int, 0);
pub const __GLIBC_USE_DEPRECATED_GETS = @as(c_int, 0);
pub const __GLIBC_USE_DEPRECATED_SCANF = @as(c_int, 0);
pub const _STDC_PREDEF_H = @as(c_int, 1);
pub const __STDC_IEC_559__ = @as(c_int, 1);
pub const __STDC_IEC_60559_BFP__ = @as(c_long, 201404);
pub const __STDC_IEC_559_COMPLEX__ = @as(c_int, 1);
pub const __STDC_IEC_60559_COMPLEX__ = @as(c_long, 201404);
pub const __STDC_ISO_10646__ = @as(c_long, 201706);
pub const __GNU_LIBRARY__ = @as(c_int, 6);
pub const __GLIBC__ = @as(c_int, 2);
pub inline fn __GLIBC_PREREQ(maj: anytype, min: anytype) @TypeOf(((__GLIBC__ << @as(c_int, 16)) + __GLIBC_MINOR__) >= ((maj << @as(c_int, 16)) + min)) {
    return ((__GLIBC__ << @as(c_int, 16)) + __GLIBC_MINOR__) >= ((maj << @as(c_int, 16)) + min);
}
pub const _SYS_CDEFS_H = @as(c_int, 1);
pub inline fn __glibc_has_builtin(name: anytype) @TypeOf(__has_builtin(name)) {
    return __has_builtin(name);
}
pub const __LEAF = "";
pub const __LEAF_ATTR = "";
pub inline fn __P(args: anytype) @TypeOf(args) {
    return args;
}
pub inline fn __PMT(args: anytype) @TypeOf(args) {
    return args;
}
pub const __ptr_t = ?*anyopaque;
pub const __BEGIN_DECLS = "";
pub const __END_DECLS = "";
pub inline fn __bos(ptr: anytype) @TypeOf(__builtin_object_size(ptr, __USE_FORTIFY_LEVEL > @as(c_int, 1))) {
    return __builtin_object_size(ptr, __USE_FORTIFY_LEVEL > @as(c_int, 1));
}
pub inline fn __bos0(ptr: anytype) @TypeOf(__builtin_object_size(ptr, @as(c_int, 0))) {
    return __builtin_object_size(ptr, @as(c_int, 0));
}
pub inline fn __glibc_objsize0(__o: anytype) @TypeOf(__bos0(__o)) {
    return __bos0(__o);
}
pub inline fn __glibc_objsize(__o: anytype) @TypeOf(__bos(__o)) {
    return __bos(__o);
}
pub inline fn __glibc_safe_len_cond(__l: anytype, __s: anytype, __osz: anytype) @TypeOf(__l <= @import("std").zig.c_translation.MacroArithmetic.div(__osz, __s)) {
    return __l <= @import("std").zig.c_translation.MacroArithmetic.div(__osz, __s);
}
pub inline fn __glibc_safe_or_unknown_len(__l: anytype, __s: anytype, __osz: anytype) @TypeOf(((__glibc_unsigned_or_positive(__l) != 0) and (__builtin_constant_p(__glibc_safe_len_cond(__SIZE_TYPE__(__l), __s, __osz)) != 0)) and (__glibc_safe_len_cond(__SIZE_TYPE__(__l), __s, __osz) != 0)) {
    return ((__glibc_unsigned_or_positive(__l) != 0) and (__builtin_constant_p(__glibc_safe_len_cond(__SIZE_TYPE__(__l), __s, __osz)) != 0)) and (__glibc_safe_len_cond(__SIZE_TYPE__(__l), __s, __osz) != 0);
}
pub inline fn __glibc_unsafe_len(__l: anytype, __s: anytype, __osz: anytype) @TypeOf(((__glibc_unsigned_or_positive(__l) != 0) and (__builtin_constant_p(__glibc_safe_len_cond(__SIZE_TYPE__(__l), __s, __osz)) != 0)) and !(__glibc_safe_len_cond(__SIZE_TYPE__(__l), __s, __osz) != 0)) {
    return ((__glibc_unsigned_or_positive(__l) != 0) and (__builtin_constant_p(__glibc_safe_len_cond(__SIZE_TYPE__(__l), __s, __osz)) != 0)) and !(__glibc_safe_len_cond(__SIZE_TYPE__(__l), __s, __osz) != 0);
}
pub const __glibc_c99_flexarr_available = @as(c_int, 1);
pub inline fn __ASMNAME(cname: anytype) @TypeOf(__ASMNAME2(__USER_LABEL_PREFIX__, cname)) {
    return __ASMNAME2(__USER_LABEL_PREFIX__, cname);
}
pub inline fn __nonnull(params: anytype) @TypeOf(__attribute_nonnull__(params)) {
    return __attribute_nonnull__(params);
}
pub const __wur = "";
pub const __fortify_function = __extern_always_inline ++ __attribute_artificial__;
pub inline fn __glibc_unlikely(cond: anytype) @TypeOf(__builtin_expect(cond, @as(c_int, 0))) {
    return __builtin_expect(cond, @as(c_int, 0));
}
pub inline fn __glibc_likely(cond: anytype) @TypeOf(__builtin_expect(cond, @as(c_int, 1))) {
    return __builtin_expect(cond, @as(c_int, 1));
}
pub const __attribute_nonstring__ = "";
pub const __LDOUBLE_REDIRECTS_TO_FLOAT128_ABI = @as(c_int, 0);
pub inline fn __LDBL_REDIR1(name: anytype, proto: anytype, alias: anytype) @TypeOf(name ++ proto) {
    _ = @TypeOf(alias);
    return name ++ proto;
}
pub inline fn __LDBL_REDIR(name: anytype, proto: anytype) @TypeOf(name ++ proto) {
    return name ++ proto;
}
pub inline fn __LDBL_REDIR1_NTH(name: anytype, proto: anytype, alias: anytype) @TypeOf(name ++ proto ++ __THROW) {
    _ = @TypeOf(alias);
    return name ++ proto ++ __THROW;
}
pub inline fn __LDBL_REDIR_NTH(name: anytype, proto: anytype) @TypeOf(name ++ proto ++ __THROW) {
    return name ++ proto ++ __THROW;
}
pub inline fn __REDIRECT_LDBL(name: anytype, proto: anytype, alias: anytype) @TypeOf(__REDIRECT(name, proto, alias)) {
    return __REDIRECT(name, proto, alias);
}
pub inline fn __REDIRECT_NTH_LDBL(name: anytype, proto: anytype, alias: anytype) @TypeOf(__REDIRECT_NTH(name, proto, alias)) {
    return __REDIRECT_NTH(name, proto, alias);
}
pub const __HAVE_GENERIC_SELECTION = @as(c_int, 1);
pub const __attr_dealloc_free = "";
pub const __stub___compat_bdflush = "";
pub const __stub_chflags = "";
pub const __stub_fchflags = "";
pub const __stub_gtty = "";
pub const __stub_revoke = "";
pub const __stub_setlogin = "";
pub const __stub_sigreturn = "";
pub const __stub_stty = "";
pub const __GLIBC_USE_LIB_EXT2 = @as(c_int, 0);
pub const __GLIBC_USE_IEC_60559_BFP_EXT = @as(c_int, 0);
pub const __GLIBC_USE_IEC_60559_BFP_EXT_C2X = @as(c_int, 0);
pub const __GLIBC_USE_IEC_60559_EXT = @as(c_int, 0);
pub const __GLIBC_USE_IEC_60559_FUNCS_EXT = @as(c_int, 0);
pub const __GLIBC_USE_IEC_60559_FUNCS_EXT_C2X = @as(c_int, 0);
pub const __GLIBC_USE_IEC_60559_TYPES_EXT = @as(c_int, 0);
pub const __need_size_t = "";
pub const __need_wchar_t = "";
pub const __need_NULL = "";
pub const _SIZE_T = "";
pub const _WCHAR_T = "";
pub const NULL = @import("std").zig.c_translation.cast(?*anyopaque, @as(c_int, 0));
pub const _STDLIB_H = @as(c_int, 1);
pub const WNOHANG = @as(c_int, 1);
pub const WUNTRACED = @as(c_int, 2);
pub const WSTOPPED = @as(c_int, 2);
pub const WEXITED = @as(c_int, 4);
pub const WCONTINUED = @as(c_int, 8);
pub const WNOWAIT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x01000000, .hexadecimal);
pub const __WNOTHREAD = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x20000000, .hexadecimal);
pub const __WALL = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x40000000, .hexadecimal);
pub const __WCLONE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x80000000, .hexadecimal);
pub inline fn __WEXITSTATUS(status: anytype) @TypeOf((status & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xff00, .hexadecimal)) >> @as(c_int, 8)) {
    return (status & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xff00, .hexadecimal)) >> @as(c_int, 8);
}
pub inline fn __WTERMSIG(status: anytype) @TypeOf(status & @as(c_int, 0x7f)) {
    return status & @as(c_int, 0x7f);
}
pub inline fn __WSTOPSIG(status: anytype) @TypeOf(__WEXITSTATUS(status)) {
    return __WEXITSTATUS(status);
}
pub inline fn __WIFEXITED(status: anytype) @TypeOf(__WTERMSIG(status) == @as(c_int, 0)) {
    return __WTERMSIG(status) == @as(c_int, 0);
}
pub inline fn __WIFSIGNALED(status: anytype) @TypeOf((@import("std").zig.c_translation.cast(i8, (status & @as(c_int, 0x7f)) + @as(c_int, 1)) >> @as(c_int, 1)) > @as(c_int, 0)) {
    return (@import("std").zig.c_translation.cast(i8, (status & @as(c_int, 0x7f)) + @as(c_int, 1)) >> @as(c_int, 1)) > @as(c_int, 0);
}
pub inline fn __WIFSTOPPED(status: anytype) @TypeOf((status & @as(c_int, 0xff)) == @as(c_int, 0x7f)) {
    return (status & @as(c_int, 0xff)) == @as(c_int, 0x7f);
}
pub inline fn __WIFCONTINUED(status: anytype) @TypeOf(status == __W_CONTINUED) {
    return status == __W_CONTINUED;
}
pub inline fn __WCOREDUMP(status: anytype) @TypeOf(status & __WCOREFLAG) {
    return status & __WCOREFLAG;
}
pub inline fn __W_EXITCODE(ret: anytype, sig: anytype) @TypeOf((ret << @as(c_int, 8)) | sig) {
    return (ret << @as(c_int, 8)) | sig;
}
pub inline fn __W_STOPCODE(sig: anytype) @TypeOf((sig << @as(c_int, 8)) | @as(c_int, 0x7f)) {
    return (sig << @as(c_int, 8)) | @as(c_int, 0x7f);
}
pub const __W_CONTINUED = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xffff, .hexadecimal);
pub const __WCOREFLAG = @as(c_int, 0x80);
pub inline fn WEXITSTATUS(status: anytype) @TypeOf(__WEXITSTATUS(status)) {
    return __WEXITSTATUS(status);
}
pub inline fn WTERMSIG(status: anytype) @TypeOf(__WTERMSIG(status)) {
    return __WTERMSIG(status);
}
pub inline fn WSTOPSIG(status: anytype) @TypeOf(__WSTOPSIG(status)) {
    return __WSTOPSIG(status);
}
pub inline fn WIFEXITED(status: anytype) @TypeOf(__WIFEXITED(status)) {
    return __WIFEXITED(status);
}
pub inline fn WIFSIGNALED(status: anytype) @TypeOf(__WIFSIGNALED(status)) {
    return __WIFSIGNALED(status);
}
pub inline fn WIFSTOPPED(status: anytype) @TypeOf(__WIFSTOPPED(status)) {
    return __WIFSTOPPED(status);
}
pub inline fn WIFCONTINUED(status: anytype) @TypeOf(__WIFCONTINUED(status)) {
    return __WIFCONTINUED(status);
}
pub const _BITS_FLOATN_H = "";
pub const __HAVE_FLOAT128 = @as(c_int, 0);
pub const __HAVE_DISTINCT_FLOAT128 = @as(c_int, 0);
pub const __HAVE_FLOAT64X = @as(c_int, 1);
pub const __HAVE_FLOAT64X_LONG_DOUBLE = @as(c_int, 1);
pub const _BITS_FLOATN_COMMON_H = "";
pub const __HAVE_FLOAT16 = @as(c_int, 0);
pub const __HAVE_FLOAT32 = @as(c_int, 1);
pub const __HAVE_FLOAT64 = @as(c_int, 1);
pub const __HAVE_FLOAT32X = @as(c_int, 1);
pub const __HAVE_FLOAT128X = @as(c_int, 0);
pub const __HAVE_DISTINCT_FLOAT16 = __HAVE_FLOAT16;
pub const __HAVE_DISTINCT_FLOAT32 = @as(c_int, 0);
pub const __HAVE_DISTINCT_FLOAT64 = @as(c_int, 0);
pub const __HAVE_DISTINCT_FLOAT32X = @as(c_int, 0);
pub const __HAVE_DISTINCT_FLOAT64X = @as(c_int, 0);
pub const __HAVE_DISTINCT_FLOAT128X = __HAVE_FLOAT128X;
pub const __HAVE_FLOAT128_UNLIKE_LDBL = (__HAVE_DISTINCT_FLOAT128 != 0) and (__LDBL_MANT_DIG__ != @as(c_int, 113));
pub const __HAVE_FLOATN_NOT_TYPEDEF = @as(c_int, 0);
pub const __f32 = @import("std").zig.c_translation.Macros.F_SUFFIX;
pub inline fn __f64(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __f32x(x: anytype) @TypeOf(x) {
    return x;
}
pub const __f64x = @import("std").zig.c_translation.Macros.L_SUFFIX;
pub inline fn __builtin_huge_valf32() @TypeOf(__builtin_huge_valf()) {
    return __builtin_huge_valf();
}
pub inline fn __builtin_inff32() @TypeOf(__builtin_inff()) {
    return __builtin_inff();
}
pub inline fn __builtin_nanf32(x: anytype) @TypeOf(__builtin_nanf(x)) {
    return __builtin_nanf(x);
}
pub const __ldiv_t_defined = @as(c_int, 1);
pub const __lldiv_t_defined = @as(c_int, 1);
pub const RAND_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const EXIT_FAILURE = @as(c_int, 1);
pub const EXIT_SUCCESS = @as(c_int, 0);
pub const MB_CUR_MAX = __ctype_get_mb_cur_max();
pub const _SYS_TYPES_H = @as(c_int, 1);
pub const _BITS_TYPES_H = @as(c_int, 1);
pub const __S16_TYPE = c_short;
pub const __U16_TYPE = c_ushort;
pub const __S32_TYPE = c_int;
pub const __U32_TYPE = c_uint;
pub const __SLONGWORD_TYPE = c_long;
pub const __ULONGWORD_TYPE = c_ulong;
pub const __SQUAD_TYPE = c_long;
pub const __UQUAD_TYPE = c_ulong;
pub const __SWORD_TYPE = c_long;
pub const __UWORD_TYPE = c_ulong;
pub const __SLONG32_TYPE = c_int;
pub const __ULONG32_TYPE = c_uint;
pub const __S64_TYPE = c_long;
pub const __U64_TYPE = c_ulong;
pub const _BITS_TYPESIZES_H = @as(c_int, 1);
pub const __SYSCALL_SLONG_TYPE = __SLONGWORD_TYPE;
pub const __SYSCALL_ULONG_TYPE = __ULONGWORD_TYPE;
pub const __DEV_T_TYPE = __UQUAD_TYPE;
pub const __UID_T_TYPE = __U32_TYPE;
pub const __GID_T_TYPE = __U32_TYPE;
pub const __INO_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const __INO64_T_TYPE = __UQUAD_TYPE;
pub const __MODE_T_TYPE = __U32_TYPE;
pub const __NLINK_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const __FSWORD_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __OFF_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __OFF64_T_TYPE = __SQUAD_TYPE;
pub const __PID_T_TYPE = __S32_TYPE;
pub const __RLIM_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const __RLIM64_T_TYPE = __UQUAD_TYPE;
pub const __BLKCNT_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __BLKCNT64_T_TYPE = __SQUAD_TYPE;
pub const __FSBLKCNT_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const __FSBLKCNT64_T_TYPE = __UQUAD_TYPE;
pub const __FSFILCNT_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const __FSFILCNT64_T_TYPE = __UQUAD_TYPE;
pub const __ID_T_TYPE = __U32_TYPE;
pub const __CLOCK_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __TIME_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __USECONDS_T_TYPE = __U32_TYPE;
pub const __SUSECONDS_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __SUSECONDS64_T_TYPE = __SQUAD_TYPE;
pub const __DADDR_T_TYPE = __S32_TYPE;
pub const __KEY_T_TYPE = __S32_TYPE;
pub const __CLOCKID_T_TYPE = __S32_TYPE;
pub const __TIMER_T_TYPE = ?*anyopaque;
pub const __BLKSIZE_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __SSIZE_T_TYPE = __SWORD_TYPE;
pub const __CPU_MASK_TYPE = __SYSCALL_ULONG_TYPE;
pub const __OFF_T_MATCHES_OFF64_T = @as(c_int, 1);
pub const __INO_T_MATCHES_INO64_T = @as(c_int, 1);
pub const __RLIM_T_MATCHES_RLIM64_T = @as(c_int, 1);
pub const __STATFS_MATCHES_STATFS64 = @as(c_int, 1);
pub const __KERNEL_OLD_TIMEVAL_MATCHES_TIMEVAL64 = @as(c_int, 1);
pub const __FD_SETSIZE = @as(c_int, 1024);
pub const _BITS_TIME64_H = @as(c_int, 1);
pub const __TIME64_T_TYPE = __TIME_T_TYPE;
pub const __u_char_defined = "";
pub const __ino_t_defined = "";
pub const __dev_t_defined = "";
pub const __gid_t_defined = "";
pub const __mode_t_defined = "";
pub const __nlink_t_defined = "";
pub const __uid_t_defined = "";
pub const __off_t_defined = "";
pub const __pid_t_defined = "";
pub const __id_t_defined = "";
pub const __ssize_t_defined = "";
pub const __daddr_t_defined = "";
pub const __key_t_defined = "";
pub const __clock_t_defined = @as(c_int, 1);
pub const __clockid_t_defined = @as(c_int, 1);
pub const __time_t_defined = @as(c_int, 1);
pub const __timer_t_defined = @as(c_int, 1);
pub const _BITS_STDINT_INTN_H = @as(c_int, 1);
pub const __BIT_TYPES_DEFINED__ = @as(c_int, 1);
pub const _ENDIAN_H = @as(c_int, 1);
pub const _BITS_ENDIAN_H = @as(c_int, 1);
pub const __LITTLE_ENDIAN = @as(c_int, 1234);
pub const __BIG_ENDIAN = @as(c_int, 4321);
pub const __PDP_ENDIAN = @as(c_int, 3412);
pub const _BITS_ENDIANNESS_H = @as(c_int, 1);
pub const __BYTE_ORDER = __LITTLE_ENDIAN;
pub const __FLOAT_WORD_ORDER = __BYTE_ORDER;
pub inline fn __LONG_LONG_PAIR(HI: anytype, LO: anytype) @TypeOf(HI) {
    return blk: {
        _ = @TypeOf(LO);
        break :blk HI;
    };
}
pub const LITTLE_ENDIAN = __LITTLE_ENDIAN;
pub const BIG_ENDIAN = __BIG_ENDIAN;
pub const PDP_ENDIAN = __PDP_ENDIAN;
pub const BYTE_ORDER = __BYTE_ORDER;
pub const _BITS_BYTESWAP_H = @as(c_int, 1);
pub inline fn __bswap_constant_16(x: anytype) __uint16_t {
    return @import("std").zig.c_translation.cast(__uint16_t, ((x >> @as(c_int, 8)) & @as(c_int, 0xff)) | ((x & @as(c_int, 0xff)) << @as(c_int, 8)));
}
pub inline fn __bswap_constant_32(x: anytype) @TypeOf(((((x & @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0xff000000, .hexadecimal)) >> @as(c_int, 24)) | ((x & @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x00ff0000, .hexadecimal)) >> @as(c_int, 8))) | ((x & @as(c_uint, 0x0000ff00)) << @as(c_int, 8))) | ((x & @as(c_uint, 0x000000ff)) << @as(c_int, 24))) {
    return ((((x & @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0xff000000, .hexadecimal)) >> @as(c_int, 24)) | ((x & @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x00ff0000, .hexadecimal)) >> @as(c_int, 8))) | ((x & @as(c_uint, 0x0000ff00)) << @as(c_int, 8))) | ((x & @as(c_uint, 0x000000ff)) << @as(c_int, 24));
}
pub inline fn __bswap_constant_64(x: anytype) @TypeOf(((((((((x & @as(c_ulonglong, 0xff00000000000000)) >> @as(c_int, 56)) | ((x & @as(c_ulonglong, 0x00ff000000000000)) >> @as(c_int, 40))) | ((x & @as(c_ulonglong, 0x0000ff0000000000)) >> @as(c_int, 24))) | ((x & @as(c_ulonglong, 0x000000ff00000000)) >> @as(c_int, 8))) | ((x & @as(c_ulonglong, 0x00000000ff000000)) << @as(c_int, 8))) | ((x & @as(c_ulonglong, 0x0000000000ff0000)) << @as(c_int, 24))) | ((x & @as(c_ulonglong, 0x000000000000ff00)) << @as(c_int, 40))) | ((x & @as(c_ulonglong, 0x00000000000000ff)) << @as(c_int, 56))) {
    return ((((((((x & @as(c_ulonglong, 0xff00000000000000)) >> @as(c_int, 56)) | ((x & @as(c_ulonglong, 0x00ff000000000000)) >> @as(c_int, 40))) | ((x & @as(c_ulonglong, 0x0000ff0000000000)) >> @as(c_int, 24))) | ((x & @as(c_ulonglong, 0x000000ff00000000)) >> @as(c_int, 8))) | ((x & @as(c_ulonglong, 0x00000000ff000000)) << @as(c_int, 8))) | ((x & @as(c_ulonglong, 0x0000000000ff0000)) << @as(c_int, 24))) | ((x & @as(c_ulonglong, 0x000000000000ff00)) << @as(c_int, 40))) | ((x & @as(c_ulonglong, 0x00000000000000ff)) << @as(c_int, 56));
}
pub const _BITS_UINTN_IDENTITY_H = @as(c_int, 1);
pub inline fn htobe16(x: anytype) @TypeOf(__bswap_16(x)) {
    return __bswap_16(x);
}
pub inline fn htole16(x: anytype) @TypeOf(__uint16_identity(x)) {
    return __uint16_identity(x);
}
pub inline fn be16toh(x: anytype) @TypeOf(__bswap_16(x)) {
    return __bswap_16(x);
}
pub inline fn le16toh(x: anytype) @TypeOf(__uint16_identity(x)) {
    return __uint16_identity(x);
}
pub inline fn htobe32(x: anytype) @TypeOf(__bswap_32(x)) {
    return __bswap_32(x);
}
pub inline fn htole32(x: anytype) @TypeOf(__uint32_identity(x)) {
    return __uint32_identity(x);
}
pub inline fn be32toh(x: anytype) @TypeOf(__bswap_32(x)) {
    return __bswap_32(x);
}
pub inline fn le32toh(x: anytype) @TypeOf(__uint32_identity(x)) {
    return __uint32_identity(x);
}
pub inline fn htobe64(x: anytype) @TypeOf(__bswap_64(x)) {
    return __bswap_64(x);
}
pub inline fn htole64(x: anytype) @TypeOf(__uint64_identity(x)) {
    return __uint64_identity(x);
}
pub inline fn be64toh(x: anytype) @TypeOf(__bswap_64(x)) {
    return __bswap_64(x);
}
pub inline fn le64toh(x: anytype) @TypeOf(__uint64_identity(x)) {
    return __uint64_identity(x);
}
pub const _SYS_SELECT_H = @as(c_int, 1);
pub inline fn __FD_ISSET(d: anytype, s: anytype) @TypeOf((__FDS_BITS(s)[@intCast(usize, __FD_ELT(d))] & __FD_MASK(d)) != @as(c_int, 0)) {
    return (__FDS_BITS(s)[@intCast(usize, __FD_ELT(d))] & __FD_MASK(d)) != @as(c_int, 0);
}
pub const __sigset_t_defined = @as(c_int, 1);
pub const ____sigset_t_defined = "";
pub const _SIGSET_NWORDS = @import("std").zig.c_translation.MacroArithmetic.div(@as(c_int, 1024), @as(c_int, 8) * @import("std").zig.c_translation.sizeof(c_ulong));
pub const __timeval_defined = @as(c_int, 1);
pub const _STRUCT_TIMESPEC = @as(c_int, 1);
pub const __suseconds_t_defined = "";
pub const __NFDBITS = @as(c_int, 8) * @import("std").zig.c_translation.cast(c_int, @import("std").zig.c_translation.sizeof(__fd_mask));
pub inline fn __FD_ELT(d: anytype) @TypeOf(@import("std").zig.c_translation.MacroArithmetic.div(d, __NFDBITS)) {
    return @import("std").zig.c_translation.MacroArithmetic.div(d, __NFDBITS);
}
pub inline fn __FD_MASK(d: anytype) __fd_mask {
    return @import("std").zig.c_translation.cast(__fd_mask, @as(c_ulong, 1) << @import("std").zig.c_translation.MacroArithmetic.rem(d, __NFDBITS));
}
pub inline fn __FDS_BITS(set: anytype) @TypeOf(set.*.__fds_bits) {
    return set.*.__fds_bits;
}
pub const FD_SETSIZE = __FD_SETSIZE;
pub const NFDBITS = __NFDBITS;
pub inline fn FD_SET(fd: anytype, fdsetp: anytype) @TypeOf(__FD_SET(fd, fdsetp)) {
    return __FD_SET(fd, fdsetp);
}
pub inline fn FD_CLR(fd: anytype, fdsetp: anytype) @TypeOf(__FD_CLR(fd, fdsetp)) {
    return __FD_CLR(fd, fdsetp);
}
pub inline fn FD_ISSET(fd: anytype, fdsetp: anytype) @TypeOf(__FD_ISSET(fd, fdsetp)) {
    return __FD_ISSET(fd, fdsetp);
}
pub inline fn FD_ZERO(fdsetp: anytype) @TypeOf(__FD_ZERO(fdsetp)) {
    return __FD_ZERO(fdsetp);
}
pub const __blksize_t_defined = "";
pub const __blkcnt_t_defined = "";
pub const __fsblkcnt_t_defined = "";
pub const __fsfilcnt_t_defined = "";
pub const _BITS_PTHREADTYPES_COMMON_H = @as(c_int, 1);
pub const _THREAD_SHARED_TYPES_H = @as(c_int, 1);
pub const _BITS_PTHREADTYPES_ARCH_H = @as(c_int, 1);
pub const __SIZEOF_PTHREAD_MUTEX_T = @as(c_int, 40);
pub const __SIZEOF_PTHREAD_ATTR_T = @as(c_int, 56);
pub const __SIZEOF_PTHREAD_RWLOCK_T = @as(c_int, 56);
pub const __SIZEOF_PTHREAD_BARRIER_T = @as(c_int, 32);
pub const __SIZEOF_PTHREAD_MUTEXATTR_T = @as(c_int, 4);
pub const __SIZEOF_PTHREAD_COND_T = @as(c_int, 48);
pub const __SIZEOF_PTHREAD_CONDATTR_T = @as(c_int, 4);
pub const __SIZEOF_PTHREAD_RWLOCKATTR_T = @as(c_int, 8);
pub const __SIZEOF_PTHREAD_BARRIERATTR_T = @as(c_int, 4);
pub const __LOCK_ALIGNMENT = "";
pub const __ONCE_ALIGNMENT = "";
pub const _BITS_ATOMIC_WIDE_COUNTER_H = "";
pub const _THREAD_MUTEX_INTERNAL_H = @as(c_int, 1);
pub const __PTHREAD_MUTEX_HAVE_PREV = @as(c_int, 1);
pub const _RWLOCK_INTERNAL_H = "";
pub inline fn __PTHREAD_RWLOCK_INITIALIZER(__flags: anytype) @TypeOf(__flags) {
    return blk: {
        _ = @as(c_int, 0);
        _ = @as(c_int, 0);
        _ = @as(c_int, 0);
        _ = @as(c_int, 0);
        _ = @as(c_int, 0);
        _ = @as(c_int, 0);
        _ = @as(c_int, 0);
        _ = @as(c_int, 0);
        _ = @TypeOf(__PTHREAD_RWLOCK_ELISION_EXTRA);
        _ = @as(c_int, 0);
        break :blk __flags;
    };
}
pub const __have_pthread_attr_t = @as(c_int, 1);
pub const _ALLOCA_H = @as(c_int, 1);
pub const __COMPAR_FN_T = "";
pub const __CLANG_STDINT_H = "";
pub const _STDINT_H = @as(c_int, 1);
pub const _BITS_WCHAR_H = @as(c_int, 1);
pub const __WCHAR_MAX = __WCHAR_MAX__;
pub const __WCHAR_MIN = -__WCHAR_MAX - @as(c_int, 1);
pub const _BITS_STDINT_UINTN_H = @as(c_int, 1);
pub const __intptr_t_defined = "";
pub const __INT64_C = @import("std").zig.c_translation.Macros.L_SUFFIX;
pub const __UINT64_C = @import("std").zig.c_translation.Macros.UL_SUFFIX;
pub const INT8_MIN = -@as(c_int, 128);
pub const INT16_MIN = -@as(c_int, 32767) - @as(c_int, 1);
pub const INT32_MIN = -@import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal) - @as(c_int, 1);
pub const INT64_MIN = -__INT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 9223372036854775807, .decimal)) - @as(c_int, 1);
pub const INT8_MAX = @as(c_int, 127);
pub const INT16_MAX = @as(c_int, 32767);
pub const INT32_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const INT64_MAX = __INT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 9223372036854775807, .decimal));
pub const UINT8_MAX = @as(c_int, 255);
pub const UINT16_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
pub const UINT32_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const UINT64_MAX = __UINT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 18446744073709551615, .decimal));
pub const INT_LEAST8_MIN = -@as(c_int, 128);
pub const INT_LEAST16_MIN = -@as(c_int, 32767) - @as(c_int, 1);
pub const INT_LEAST32_MIN = -@import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal) - @as(c_int, 1);
pub const INT_LEAST64_MIN = -__INT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 9223372036854775807, .decimal)) - @as(c_int, 1);
pub const INT_LEAST8_MAX = @as(c_int, 127);
pub const INT_LEAST16_MAX = @as(c_int, 32767);
pub const INT_LEAST32_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const INT_LEAST64_MAX = __INT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 9223372036854775807, .decimal));
pub const UINT_LEAST8_MAX = @as(c_int, 255);
pub const UINT_LEAST16_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
pub const UINT_LEAST32_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const UINT_LEAST64_MAX = __UINT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 18446744073709551615, .decimal));
pub const INT_FAST8_MIN = -@as(c_int, 128);
pub const INT_FAST16_MIN = -@import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal) - @as(c_int, 1);
pub const INT_FAST32_MIN = -@import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal) - @as(c_int, 1);
pub const INT_FAST64_MIN = -__INT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 9223372036854775807, .decimal)) - @as(c_int, 1);
pub const INT_FAST8_MAX = @as(c_int, 127);
pub const INT_FAST16_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const INT_FAST32_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const INT_FAST64_MAX = __INT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 9223372036854775807, .decimal));
pub const UINT_FAST8_MAX = @as(c_int, 255);
pub const UINT_FAST16_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const UINT_FAST32_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const UINT_FAST64_MAX = __UINT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 18446744073709551615, .decimal));
pub const INTPTR_MIN = -@import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal) - @as(c_int, 1);
pub const INTPTR_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const UINTPTR_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const INTMAX_MIN = -__INT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 9223372036854775807, .decimal)) - @as(c_int, 1);
pub const INTMAX_MAX = __INT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 9223372036854775807, .decimal));
pub const UINTMAX_MAX = __UINT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 18446744073709551615, .decimal));
pub const PTRDIFF_MIN = -@import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal) - @as(c_int, 1);
pub const PTRDIFF_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const SIG_ATOMIC_MIN = -@import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal) - @as(c_int, 1);
pub const SIG_ATOMIC_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const SIZE_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const WCHAR_MIN = __WCHAR_MIN;
pub const WCHAR_MAX = __WCHAR_MAX;
pub const WINT_MIN = @as(c_uint, 0);
pub const WINT_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub inline fn INT8_C(c: anytype) @TypeOf(c) {
    return c;
}
pub inline fn INT16_C(c: anytype) @TypeOf(c) {
    return c;
}
pub inline fn INT32_C(c: anytype) @TypeOf(c) {
    return c;
}
pub const INT64_C = @import("std").zig.c_translation.Macros.L_SUFFIX;
pub inline fn UINT8_C(c: anytype) @TypeOf(c) {
    return c;
}
pub inline fn UINT16_C(c: anytype) @TypeOf(c) {
    return c;
}
pub const UINT32_C = @import("std").zig.c_translation.Macros.U_SUFFIX;
pub const UINT64_C = @import("std").zig.c_translation.Macros.UL_SUFFIX;
pub const INTMAX_C = @import("std").zig.c_translation.Macros.L_SUFFIX;
pub const UINTMAX_C = @import("std").zig.c_translation.Macros.UL_SUFFIX;
pub const __GNUC_VA_LIST = "";
pub const __STDARG_H = "";
pub const _VA_LIST = "";
pub inline fn _hconv(h: anytype) HPy {
    return @import("std").mem.zeroInit(HPy, .{h});
}
pub inline fn _hfconv(h: anytype) HPyField {
    return @import("std").mem.zeroInit(HPyField, .{h});
}
pub inline fn _htsconv(h: anytype) HPyThreadState {
    return @import("std").mem.zeroInit(HPyThreadState, .{h});
}
pub inline fn _hgconv(h: anytype) HPyGlobal {
    return @import("std").mem.zeroInit(HPyGlobal, .{h});
}
pub const HPyAPI_INLINE_HELPER = HPyAPI_FUNC;
pub const HPyAPI_IMPL = _HPy_HIDDEN;
pub const HPyAPI_HELPER = _HPy_HIDDEN;
pub const HPy_NULL = _hconv(@as(c_int, 0));
pub inline fn HPy_IsNull(h: anytype) @TypeOf(h._i == @as(c_int, 0)) {
    return h._i == @as(c_int, 0);
}
pub const HPyField_NULL = _hfconv(@as(c_int, 0));
pub inline fn HPyField_IsNull(f: anytype) @TypeOf(f._i == @as(c_int, 0)) {
    return f._i == @as(c_int, 0);
}
pub const HPY_SSIZE_T_MAX = INTPTR_MAX;
pub const HPY_SSIZE_T_MIN = -HPY_SSIZE_T_MAX - @as(c_int, 1);
pub const HPY_UNIVERSAL_CPY_TYPES_H = "";
pub const HPy_EXPORTS_H = "";
pub const _HPy_PARSE_PID = "i";
pub const HPyLong_FromPid = HPyLong_FromLong;
pub const HPyLong_AsPid = HPyLong_AsLong;
pub const HPY_UNIVERSAL_HPYFUNC_H = "";
pub const HPY_UNIVERSAL_HPYFUNC_TRAMPOLINES_H = "";
pub const HPY_UNIVERSAL_HPYDEF_H = "";
pub const __STDDEF_H = "";
pub const __need_ptrdiff_t = "";
pub const __need_STDDEF_H_misc = "";
pub const _PTRDIFF_T = "";
pub const __CLANG_MAX_ALIGN_T_DEFINED = "";
pub const _HPySlot_SIG__HPy_bf_getbuffer = HPyFunc_GETBUFFERPROC;
pub const _HPySlot_SIG__HPy_bf_releasebuffer = HPyFunc_RELEASEBUFFERPROC;
pub const _HPySlot_SIG__HPy_mp_ass_subscript = HPyFunc_OBJOBJARGPROC;
pub const _HPySlot_SIG__HPy_mp_length = HPyFunc_LENFUNC;
pub const _HPySlot_SIG__HPy_mp_subscript = HPyFunc_BINARYFUNC;
pub const _HPySlot_SIG__HPy_nb_absolute = HPyFunc_UNARYFUNC;
pub const _HPySlot_SIG__HPy_nb_add = HPyFunc_BINARYFUNC;
pub const _HPySlot_SIG__HPy_nb_and = HPyFunc_BINARYFUNC;
pub const _HPySlot_SIG__HPy_nb_bool = HPyFunc_INQUIRY;
pub const _HPySlot_SIG__HPy_nb_divmod = HPyFunc_BINARYFUNC;
pub const _HPySlot_SIG__HPy_nb_float = HPyFunc_UNARYFUNC;
pub const _HPySlot_SIG__HPy_nb_floor_divide = HPyFunc_BINARYFUNC;
pub const _HPySlot_SIG__HPy_nb_index = HPyFunc_UNARYFUNC;
pub const _HPySlot_SIG__HPy_nb_inplace_add = HPyFunc_BINARYFUNC;
pub const _HPySlot_SIG__HPy_nb_inplace_and = HPyFunc_BINARYFUNC;
pub const _HPySlot_SIG__HPy_nb_inplace_floor_divide = HPyFunc_BINARYFUNC;
pub const _HPySlot_SIG__HPy_nb_inplace_lshift = HPyFunc_BINARYFUNC;
pub const _HPySlot_SIG__HPy_nb_inplace_multiply = HPyFunc_BINARYFUNC;
pub const _HPySlot_SIG__HPy_nb_inplace_or = HPyFunc_BINARYFUNC;
pub const _HPySlot_SIG__HPy_nb_inplace_power = HPyFunc_TERNARYFUNC;
pub const _HPySlot_SIG__HPy_nb_inplace_remainder = HPyFunc_BINARYFUNC;
pub const _HPySlot_SIG__HPy_nb_inplace_rshift = HPyFunc_BINARYFUNC;
pub const _HPySlot_SIG__HPy_nb_inplace_subtract = HPyFunc_BINARYFUNC;
pub const _HPySlot_SIG__HPy_nb_inplace_true_divide = HPyFunc_BINARYFUNC;
pub const _HPySlot_SIG__HPy_nb_inplace_xor = HPyFunc_BINARYFUNC;
pub const _HPySlot_SIG__HPy_nb_int = HPyFunc_UNARYFUNC;
pub const _HPySlot_SIG__HPy_nb_invert = HPyFunc_UNARYFUNC;
pub const _HPySlot_SIG__HPy_nb_lshift = HPyFunc_BINARYFUNC;
pub const _HPySlot_SIG__HPy_nb_multiply = HPyFunc_BINARYFUNC;
pub const _HPySlot_SIG__HPy_nb_negative = HPyFunc_UNARYFUNC;
pub const _HPySlot_SIG__HPy_nb_or = HPyFunc_BINARYFUNC;
pub const _HPySlot_SIG__HPy_nb_positive = HPyFunc_UNARYFUNC;
pub const _HPySlot_SIG__HPy_nb_power = HPyFunc_TERNARYFUNC;
pub const _HPySlot_SIG__HPy_nb_remainder = HPyFunc_BINARYFUNC;
pub const _HPySlot_SIG__HPy_nb_rshift = HPyFunc_BINARYFUNC;
pub const _HPySlot_SIG__HPy_nb_subtract = HPyFunc_BINARYFUNC;
pub const _HPySlot_SIG__HPy_nb_true_divide = HPyFunc_BINARYFUNC;
pub const _HPySlot_SIG__HPy_nb_xor = HPyFunc_BINARYFUNC;
pub const _HPySlot_SIG__HPy_sq_ass_item = HPyFunc_SSIZEOBJARGPROC;
pub const _HPySlot_SIG__HPy_sq_concat = HPyFunc_BINARYFUNC;
pub const _HPySlot_SIG__HPy_sq_contains = HPyFunc_OBJOBJPROC;
pub const _HPySlot_SIG__HPy_sq_inplace_concat = HPyFunc_BINARYFUNC;
pub const _HPySlot_SIG__HPy_sq_inplace_repeat = HPyFunc_SSIZEARGFUNC;
pub const _HPySlot_SIG__HPy_sq_item = HPyFunc_SSIZEARGFUNC;
pub const _HPySlot_SIG__HPy_sq_length = HPyFunc_LENFUNC;
pub const _HPySlot_SIG__HPy_sq_repeat = HPyFunc_SSIZEARGFUNC;
pub const _HPySlot_SIG__HPy_tp_call = HPyFunc_KEYWORDS;
pub const _HPySlot_SIG__HPy_tp_hash = HPyFunc_HASHFUNC;
pub const _HPySlot_SIG__HPy_tp_init = HPyFunc_INITPROC;
pub const _HPySlot_SIG__HPy_tp_new = HPyFunc_NEWFUNC;
pub const _HPySlot_SIG__HPy_tp_repr = HPyFunc_REPRFUNC;
pub const _HPySlot_SIG__HPy_tp_richcompare = HPyFunc_RICHCMPFUNC;
pub const _HPySlot_SIG__HPy_tp_str = HPyFunc_REPRFUNC;
pub const _HPySlot_SIG__HPy_tp_traverse = HPyFunc_TRAVERSEPROC;
pub const _HPySlot_SIG__HPy_nb_matrix_multiply = HPyFunc_BINARYFUNC;
pub const _HPySlot_SIG__HPy_nb_inplace_matrix_multiply = HPyFunc_BINARYFUNC;
pub const _HPySlot_SIG__HPy_tp_finalize = HPyFunc_DESTRUCTOR;
pub const _HPySlot_SIG__HPy_tp_destroy = HPyFunc_DESTROYFUNC;
pub const _HPySlot_SIG__HPy_mod_create = HPyFunc_MOD_CREATE;
pub const _HPySlot_SIG__HPy_mod_exec = HPyFunc_INQUIRY;
pub const HPY_UNIVERSAL_HPYTYPE_H = "";
pub const __STDBOOL_H = "";
pub const __bool_true_false_are_defined = @as(c_int, 1);
pub const @"bool" = bool;
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const _Py_TPFLAGS_HEAPTYPE = @as(c_ulong, 1) << @as(c_int, 9);
pub const _Py_TPFLAGS_HAVE_VERSION_TAG = @as(c_ulong, 1) << @as(c_int, 18);
pub const HPy_TPFLAGS_DEFAULT = _Py_TPFLAGS_HEAPTYPE | _Py_TPFLAGS_HAVE_VERSION_TAG;
pub const HPy_TPFLAGS_HAVE_VECTORCALL = @as(c_ulong, 1) << @as(c_int, 11);
pub const HPy_TPFLAGS_BASETYPE = @as(c_ulong, 1) << @as(c_int, 10);
pub const HPy_TPFLAGS_HAVE_GC = @as(c_ulong, 1) << @as(c_int, 14);
pub inline fn HPyType_LEGACY_HELPERS(TYPE: anytype) @TypeOf(HPyType_HELPERS(TYPE, HPyType_BuiltinShape_Legacy)) {
    return HPyType_HELPERS(TYPE, HPyType_BuiltinShape_Legacy);
}
pub inline fn _HPyType_HELPER_X(X: anytype) @TypeOf(X) {
    return X;
}
pub const HPyType_BuiltinShape_Legacy_AsStruct = _HPy_AsStruct_Legacy;
pub const HPyType_BuiltinShape_Object_AsStruct = _HPy_AsStruct_Object;
pub const HPyType_BuiltinShape_Type_AsStruct = _HPy_AsStruct_Type;
pub const HPyType_BuiltinShape_Long_AsStruct = _HPy_AsStruct_Long;
pub const HPyType_BuiltinShape_Float_AsStruct = _HPy_AsStruct_Float;
pub const HPyType_BuiltinShape_Unicode_AsStruct = _HPy_AsStruct_Unicode;
pub const HPyType_BuiltinShape_Tuple_AsStruct = _HPy_AsStruct_Tuple;
pub const HPyType_BuiltinShape_List_AsStruct = _HPy_AsStruct_List;
pub const HPY_UNIVERSAL_HPYMODULE_H = "";
pub const _HPy_CTX_MODIFIER = _HPy_HIDDEN;
pub const HPy_EXPORTED_FUNC = HPy_EXPORTED_SYMBOL;
pub const HPY_COMMON_RUNTIME_ARGPARSE_H = "";
pub const HPY_COMMON_RUNTIME_BUILDVALUE_H = "";
pub const HPY_COMMON_RUNTIME_FORMAT_H = "";
pub const HPY_COMMON_RUNTIME_HELPERS_H = "";
pub const HPY_COMMON_RUNTIME_STRUCTSEQ_H = "";
pub const HPY_MISC_TRAMPOLINES_H = "";
pub const HPY_INLINE_HELPERS_H = "";
pub const _ASSERT_H = @as(c_int, 1);
pub const _ASSERT_H_DECLS = "";
pub const timeval = struct_timeval;
pub const timespec = struct_timespec;
pub const __pthread_internal_list = struct___pthread_internal_list;
pub const __pthread_internal_slist = struct___pthread_internal_slist;
pub const __pthread_mutex_s = struct___pthread_mutex_s;
pub const __pthread_rwlock_arch_t = struct___pthread_rwlock_arch_t;
pub const __pthread_cond_s = struct___pthread_cond_s;
pub const random_data = struct_random_data;
pub const drand48_data = struct_drand48_data;
pub const __va_list_tag = struct___va_list_tag;
pub const _HPy_s = struct__HPy_s;
pub const FORBIDDEN_cpy_PyObject = struct_FORBIDDEN_cpy_PyObject;
pub const _HPyContext_s = struct__HPyContext_s;
pub const FORBIDDEN_PyMethodDef = struct_FORBIDDEN_PyMethodDef;
pub const FORBIDDEN_PyModuleDef = struct_FORBIDDEN_PyModuleDef;
pub const FORBIDDEN_bufferinfo = struct_FORBIDDEN_bufferinfo;
