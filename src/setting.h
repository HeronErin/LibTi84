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

