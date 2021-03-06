ifeq ($(TARGET_BOARD_PLATFORM), clovertrail)
LOCAL_CFLAGS        += -DUSE_CLOVERTRAIL
libhevcd_cflags_x86 += -DX86 -DDISABLE_AVX2 -m32 -mno-avx -DDEFAULT_ARCH=ARCH_X86_SSSE3
else
libhevcd_cflags_x86 += -DX86 -DDISABLE_AVX2 -m32 -msse4.2 -mno-avx -DDEFAULT_ARCH=D_ARCH_X86_SSE42
endif

libhevcd_inc_dir_x86   +=  $(LOCAL_PATH)/decoder/x86
libhevcd_inc_dir_x86   +=  $(LOCAL_PATH)/common/x86

libhevcd_srcs_c_x86    +=  decoder/x86/ihevcd_function_selector.c
libhevcd_srcs_c_x86    +=  decoder/x86/ihevcd_function_selector_generic.c
libhevcd_srcs_c_x86    +=  decoder/x86/ihevcd_function_selector_ssse3.c
ifneq ($(TARGET_BOARD_PLATFORM), clovertrail)
libhevcd_srcs_c_x86    +=  decoder/x86/ihevcd_function_selector_sse42.c
endif


libhevcd_srcs_c_x86    +=  common/x86/ihevc_inter_pred_filters_ssse3_intr.c
libhevcd_srcs_c_x86    +=  common/x86/ihevc_weighted_pred_ssse3_intr.c
libhevcd_srcs_c_x86    +=  common/x86/ihevc_intra_pred_filters_ssse3_intr.c
libhevcd_srcs_c_x86    +=  common/x86/ihevc_chroma_intra_pred_filters_ssse3_intr.c
libhevcd_srcs_c_x86    +=  common/x86/ihevc_itrans_recon_ssse3_intr.c
libhevcd_srcs_c_x86    +=  common/x86/ihevc_itrans_recon_16x16_ssse3_intr.c
libhevcd_srcs_c_x86    +=  common/x86/ihevc_itrans_recon_32x32_ssse3_intr.c
libhevcd_srcs_c_x86    +=  common/x86/ihevc_sao_ssse3_intr.c
libhevcd_srcs_c_x86    +=  common/x86/ihevc_deblk_ssse3_intr.c
libhevcd_srcs_c_x86    +=  common/x86/ihevc_padding_ssse3_intr.c
libhevcd_srcs_c_x86    +=  common/x86/ihevc_mem_fns_ssse3_intr.c
libhevcd_srcs_c_x86    +=  decoder/x86/ihevcd_fmt_conv_ssse3_intr.c
libhevcd_srcs_c_x86    +=  decoder/x86/ihevcd_it_rec_dc_ssse3_intr.c



ifneq ($(TARGET_BOARD_PLATFORM), clovertrail)
libhevcd_srcs_c_x86    +=  common/x86/ihevc_inter_pred_filters_sse42_intr.c
libhevcd_srcs_c_x86    +=  common/x86/ihevc_weighted_pred_sse42_intr.c
libhevcd_srcs_c_x86    +=  common/x86/ihevc_intra_pred_filters_sse42_intr.c
libhevcd_srcs_c_x86    +=  common/x86/ihevc_chroma_intra_pred_filters_sse42_intr.c
libhevcd_srcs_c_x86    +=  common/x86/ihevc_itrans_recon_sse42_intr.c
libhevcd_srcs_c_x86    +=  common/x86/ihevc_16x16_itrans_recon_sse42_intr.c
libhevcd_srcs_c_x86    +=  common/x86/ihevc_32x32_itrans_recon_sse42_intr.c
libhevcd_srcs_c_x86    +=  decoder/x86/ihevcd_it_rec_dc_sse42_intr.c
endif

libhevcd_srcs_c_x86    +=  common/x86/ihevc_tables_x86_intr.c

LOCAL_SRC_FILES_x86 += $(libhevcd_srcs_c_x86) $(libhevcd_srcs_asm_x86)
LOCAL_C_INCLUDES_x86 += $(libhevcd_inc_dir_x86)
LOCAL_CFLAGS_x86 += $(libhevcd_cflags_x86)



