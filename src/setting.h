
#ifdef TANS_PRE
#define USE_ABS_INT
#endif
#ifdef COS_PRE
#define USE_ABS_INT
#endif
#ifdef SIN_PRE
#define USE_ABS_INT
#endif





#ifdef MAKE_MENUS
#define RENDER_NUMS
#endif

#ifdef USE_TPRINT
#define USE_PRINT_FUNCS
#define USE_STR_LEN
#endif

#ifdef RENDER_NUMS
#define USE_PRINT_FUNCS
#endif
#ifdef USE_PRINT_FUNCS
#define USE_PUT
#endif

#ifdef PROJ_NO_ROT
#define USE_VEC
#define USE_DEG_2_RAD
#define USE_SIN_COS
#endif

#ifdef ROT_PROJ
#define USE_VEC
#define USE_DEG_2_RAD
#define USE_SIN_COS
#endif

#ifdef USE_LINE
#define USE_ABS_INT
#endif




int __clib__i;
int __clib__j;
int __clib__returnval;
char __clib__c;

#ifdef USE_PUT
void vputs(char* s);
void vputc(char c) ;
#endif

