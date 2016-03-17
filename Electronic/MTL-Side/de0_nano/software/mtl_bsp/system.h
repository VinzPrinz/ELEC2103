/*
 * system.h - SOPC Builder system and BSP software package information
 *
 * Machine generated for CPU 'CPU' in SOPC Builder design 'MTL_SOPC'
 * SOPC Builder design path: ../../MTL_SOPC.sopcinfo
 *
 * Generated: Thu Mar 17 12:05:55 CET 2016
 */

/*
 * DO NOT MODIFY THIS FILE
 *
 * Changing this file will have subtle consequences
 * which will almost certainly lead to a nonfunctioning
 * system. If you do modify this file, be aware that your
 * changes will be overwritten and lost when this file
 * is generated again.
 *
 * DO NOT MODIFY THIS FILE
 */

/*
 * License Agreement
 *
 * Copyright (c) 2008
 * Altera Corporation, San Jose, California, USA.
 * All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 *
 * This agreement shall be governed in all respects by the laws of the State
 * of California and by the laws of the United States of America.
 */

#ifndef __SYSTEM_H_
#define __SYSTEM_H_

/* Include definitions from linker script generator */
#include "linker.h"


/*
 * CPU configuration
 *
 */

#define ALT_CPU_ARCHITECTURE "altera_nios2_gen2"
#define ALT_CPU_BIG_ENDIAN 0
#define ALT_CPU_BREAK_ADDR 0x00010820
#define ALT_CPU_CPU_ARCH_NIOS2_R1
#define ALT_CPU_CPU_FREQ 50000000u
#define ALT_CPU_CPU_ID_SIZE 1
#define ALT_CPU_CPU_ID_VALUE 0x00000000
#define ALT_CPU_CPU_IMPLEMENTATION "tiny"
#define ALT_CPU_DATA_ADDR_WIDTH 0x11
#define ALT_CPU_DCACHE_LINE_SIZE 0
#define ALT_CPU_DCACHE_LINE_SIZE_LOG2 0
#define ALT_CPU_DCACHE_SIZE 0
#define ALT_CPU_EXCEPTION_ADDR 0x00008020
#define ALT_CPU_FLASH_ACCELERATOR_LINES 0
#define ALT_CPU_FLASH_ACCELERATOR_LINE_SIZE 0
#define ALT_CPU_FLUSHDA_SUPPORTED
#define ALT_CPU_FREQ 50000000
#define ALT_CPU_HARDWARE_DIVIDE_PRESENT 0
#define ALT_CPU_HARDWARE_MULTIPLY_PRESENT 0
#define ALT_CPU_HARDWARE_MULX_PRESENT 0
#define ALT_CPU_HAS_DEBUG_CORE 1
#define ALT_CPU_HAS_DEBUG_STUB
#define ALT_CPU_HAS_ILLEGAL_INSTRUCTION_EXCEPTION
#define ALT_CPU_HAS_JMPI_INSTRUCTION
#define ALT_CPU_ICACHE_LINE_SIZE 0
#define ALT_CPU_ICACHE_LINE_SIZE_LOG2 0
#define ALT_CPU_ICACHE_SIZE 0
#define ALT_CPU_INST_ADDR_WIDTH 0x11
#define ALT_CPU_NAME "CPU"
#define ALT_CPU_OCI_VERSION 1
#define ALT_CPU_RESET_ADDR 0x00008000


/*
 * CPU configuration (with legacy prefix - don't use these anymore)
 *
 */

#define NIOS2_BIG_ENDIAN 0
#define NIOS2_BREAK_ADDR 0x00010820
#define NIOS2_CPU_ARCH_NIOS2_R1
#define NIOS2_CPU_FREQ 50000000u
#define NIOS2_CPU_ID_SIZE 1
#define NIOS2_CPU_ID_VALUE 0x00000000
#define NIOS2_CPU_IMPLEMENTATION "tiny"
#define NIOS2_DATA_ADDR_WIDTH 0x11
#define NIOS2_DCACHE_LINE_SIZE 0
#define NIOS2_DCACHE_LINE_SIZE_LOG2 0
#define NIOS2_DCACHE_SIZE 0
#define NIOS2_EXCEPTION_ADDR 0x00008020
#define NIOS2_FLASH_ACCELERATOR_LINES 0
#define NIOS2_FLASH_ACCELERATOR_LINE_SIZE 0
#define NIOS2_FLUSHDA_SUPPORTED
#define NIOS2_HARDWARE_DIVIDE_PRESENT 0
#define NIOS2_HARDWARE_MULTIPLY_PRESENT 0
#define NIOS2_HARDWARE_MULX_PRESENT 0
#define NIOS2_HAS_DEBUG_CORE 1
#define NIOS2_HAS_DEBUG_STUB
#define NIOS2_HAS_ILLEGAL_INSTRUCTION_EXCEPTION
#define NIOS2_HAS_JMPI_INSTRUCTION
#define NIOS2_ICACHE_LINE_SIZE 0
#define NIOS2_ICACHE_LINE_SIZE_LOG2 0
#define NIOS2_ICACHE_SIZE 0
#define NIOS2_INST_ADDR_WIDTH 0x11
#define NIOS2_OCI_VERSION 1
#define NIOS2_RESET_ADDR 0x00008000


/*
 * Define for each module class mastered by the CPU
 *
 */

#define __ALTERA_AVALON_JTAG_UART
#define __ALTERA_AVALON_ONCHIP_MEMORY2
#define __ALTERA_AVALON_PIO
#define __ALTERA_AVALON_TIMER
#define __ALTERA_NIOS2_GEN2
#define __MAPTRANSFER
#define __MTL_INTERFACE_IRQ


/*
 * JTAG_UART configuration
 *
 */

#define ALT_MODULE_CLASS_JTAG_UART altera_avalon_jtag_uart
#define JTAG_UART_BASE 0x11460
#define JTAG_UART_IRQ 0
#define JTAG_UART_IRQ_INTERRUPT_CONTROLLER_ID 0
#define JTAG_UART_NAME "/dev/JTAG_UART"
#define JTAG_UART_READ_DEPTH 64
#define JTAG_UART_READ_THRESHOLD 8
#define JTAG_UART_SPAN 8
#define JTAG_UART_TYPE "altera_avalon_jtag_uart"
#define JTAG_UART_WRITE_DEPTH 64
#define JTAG_UART_WRITE_THRESHOLD 8


/*
 * KEY configuration
 *
 */

#define ALT_MODULE_CLASS_KEY altera_avalon_pio
#define KEY_BASE 0x11440
#define KEY_BIT_CLEARING_EDGE_REGISTER 0
#define KEY_BIT_MODIFYING_OUTPUT_REGISTER 0
#define KEY_CAPTURE 0
#define KEY_DATA_WIDTH 1
#define KEY_DO_TEST_BENCH_WIRING 0
#define KEY_DRIVEN_SIM_VALUE 0
#define KEY_EDGE_TYPE "NONE"
#define KEY_FREQ 50000000
#define KEY_HAS_IN 1
#define KEY_HAS_OUT 0
#define KEY_HAS_TRI 0
#define KEY_IRQ -1
#define KEY_IRQ_INTERRUPT_CONTROLLER_ID -1
#define KEY_IRQ_TYPE "NONE"
#define KEY_NAME "/dev/KEY"
#define KEY_RESET_VALUE 0
#define KEY_SPAN 16
#define KEY_TYPE "altera_avalon_pio"


/*
 * System configuration
 *
 */

#define ALT_DEVICE_FAMILY "Cyclone IV E"
#define ALT_ENHANCED_INTERRUPT_API_PRESENT
#define ALT_IRQ_BASE NULL
#define ALT_LOG_PORT "/dev/null"
#define ALT_LOG_PORT_BASE 0x0
#define ALT_LOG_PORT_DEV null
#define ALT_LOG_PORT_TYPE ""
#define ALT_NUM_EXTERNAL_INTERRUPT_CONTROLLERS 0
#define ALT_NUM_INTERNAL_INTERRUPT_CONTROLLERS 1
#define ALT_NUM_INTERRUPT_CONTROLLERS 1
#define ALT_STDERR "/dev/JTAG_UART"
#define ALT_STDERR_BASE 0x11460
#define ALT_STDERR_DEV JTAG_UART
#define ALT_STDERR_IS_JTAG_UART
#define ALT_STDERR_PRESENT
#define ALT_STDERR_TYPE "altera_avalon_jtag_uart"
#define ALT_STDIN "/dev/JTAG_UART"
#define ALT_STDIN_BASE 0x11460
#define ALT_STDIN_DEV JTAG_UART
#define ALT_STDIN_IS_JTAG_UART
#define ALT_STDIN_PRESENT
#define ALT_STDIN_TYPE "altera_avalon_jtag_uart"
#define ALT_STDOUT "/dev/JTAG_UART"
#define ALT_STDOUT_BASE 0x11460
#define ALT_STDOUT_DEV JTAG_UART
#define ALT_STDOUT_IS_JTAG_UART
#define ALT_STDOUT_PRESENT
#define ALT_STDOUT_TYPE "altera_avalon_jtag_uart"
#define ALT_SYSTEM_NAME "MTL_SOPC"


/*
 * TESTLED configuration
 *
 */

#define ALT_MODULE_CLASS_TESTLED altera_avalon_pio
#define TESTLED_BASE 0x11430
#define TESTLED_BIT_CLEARING_EDGE_REGISTER 0
#define TESTLED_BIT_MODIFYING_OUTPUT_REGISTER 0
#define TESTLED_CAPTURE 0
#define TESTLED_DATA_WIDTH 4
#define TESTLED_DO_TEST_BENCH_WIRING 0
#define TESTLED_DRIVEN_SIM_VALUE 0
#define TESTLED_EDGE_TYPE "NONE"
#define TESTLED_FREQ 50000000
#define TESTLED_HAS_IN 0
#define TESTLED_HAS_OUT 1
#define TESTLED_HAS_TRI 0
#define TESTLED_IRQ -1
#define TESTLED_IRQ_INTERRUPT_CONTROLLER_ID -1
#define TESTLED_IRQ_TYPE "NONE"
#define TESTLED_NAME "/dev/TESTLED"
#define TESTLED_RESET_VALUE 0
#define TESTLED_SPAN 16
#define TESTLED_TYPE "altera_avalon_pio"


/*
 * TIMER configuration
 *
 */

#define ALT_MODULE_CLASS_TIMER altera_avalon_timer
#define TIMER_ALWAYS_RUN 0
#define TIMER_BASE 0x11400
#define TIMER_COUNTER_SIZE 32
#define TIMER_FIXED_PERIOD 0
#define TIMER_FREQ 50000000
#define TIMER_IRQ 2
#define TIMER_IRQ_INTERRUPT_CONTROLLER_ID 0
#define TIMER_LOAD_VALUE 99999
#define TIMER_MULT 0.001
#define TIMER_NAME "/dev/TIMER"
#define TIMER_PERIOD 2
#define TIMER_PERIOD_UNITS "ms"
#define TIMER_RESET_OUTPUT 0
#define TIMER_SNAPSHOT 1
#define TIMER_SPAN 32
#define TIMER_TICKS_PER_SEC 500
#define TIMER_TIMEOUT_PULSE_OUTPUT 0
#define TIMER_TYPE "altera_avalon_timer"


/*
 * TOUCHDATA configuration
 *
 */

#define ALT_MODULE_CLASS_TOUCHDATA altera_avalon_pio
#define TOUCHDATA_BASE 0x11420
#define TOUCHDATA_BIT_CLEARING_EDGE_REGISTER 0
#define TOUCHDATA_BIT_MODIFYING_OUTPUT_REGISTER 0
#define TOUCHDATA_CAPTURE 0
#define TOUCHDATA_DATA_WIDTH 20
#define TOUCHDATA_DO_TEST_BENCH_WIRING 0
#define TOUCHDATA_DRIVEN_SIM_VALUE 0
#define TOUCHDATA_EDGE_TYPE "NONE"
#define TOUCHDATA_FREQ 50000000
#define TOUCHDATA_HAS_IN 1
#define TOUCHDATA_HAS_OUT 0
#define TOUCHDATA_HAS_TRI 0
#define TOUCHDATA_IRQ -1
#define TOUCHDATA_IRQ_INTERRUPT_CONTROLLER_ID -1
#define TOUCHDATA_IRQ_TYPE "NONE"
#define TOUCHDATA_NAME "/dev/TOUCHDATA"
#define TOUCHDATA_RESET_VALUE 0
#define TOUCHDATA_SPAN 16
#define TOUCHDATA_TYPE "altera_avalon_pio"


/*
 * hal configuration
 *
 */

#define ALT_MAX_FD 32
#define ALT_SYS_CLK TIMER
#define ALT_TIMESTAMP_CLK none


/*
 * mapTransfer configuration
 *
 */

#define ALT_MODULE_CLASS_mapTransfer mapTransfer
#define MAPTRANSFER_BASE 0x11450
#define MAPTRANSFER_IRQ -1
#define MAPTRANSFER_IRQ_INTERRUPT_CONTROLLER_ID -1
#define MAPTRANSFER_NAME "/dev/mapTransfer"
#define MAPTRANSFER_SPAN 16
#define MAPTRANSFER_TYPE "mapTransfer"


/*
 * mem configuration
 *
 */

#define ALT_MODULE_CLASS_mem altera_avalon_onchip_memory2
#define MEM_ALLOW_IN_SYSTEM_MEMORY_CONTENT_EDITOR 0
#define MEM_ALLOW_MRAM_SIM_CONTENTS_ONLY_FILE 0
#define MEM_BASE 0x8000
#define MEM_CONTENTS_INFO ""
#define MEM_DUAL_PORT 0
#define MEM_GUI_RAM_BLOCK_TYPE "AUTO"
#define MEM_INIT_CONTENTS_FILE "MTL_SOPC_mem"
#define MEM_INIT_MEM_CONTENT 1
#define MEM_INSTANCE_ID "NONE"
#define MEM_IRQ -1
#define MEM_IRQ_INTERRUPT_CONTROLLER_ID -1
#define MEM_NAME "/dev/mem"
#define MEM_NON_DEFAULT_INIT_FILE_ENABLED 0
#define MEM_RAM_BLOCK_TYPE "AUTO"
#define MEM_READ_DURING_WRITE_MODE "DONT_CARE"
#define MEM_SINGLE_CLOCK_OP 0
#define MEM_SIZE_MULTIPLE 1
#define MEM_SIZE_VALUE 20000
#define MEM_SPAN 20000
#define MEM_TYPE "altera_avalon_onchip_memory2"
#define MEM_WRITABLE 1


/*
 * mtl_interface_irq_0 configuration
 *
 */

#define ALT_MODULE_CLASS_mtl_interface_irq_0 mtl_interface_irq
#define MTL_INTERFACE_IRQ_0_BASE 0x11000
#define MTL_INTERFACE_IRQ_0_IRQ -1
#define MTL_INTERFACE_IRQ_0_IRQ_INTERRUPT_CONTROLLER_ID -1
#define MTL_INTERFACE_IRQ_0_NAME "/dev/mtl_interface_irq_0"
#define MTL_INTERFACE_IRQ_0_SPAN 1024
#define MTL_INTERFACE_IRQ_0_TYPE "mtl_interface_irq"

#endif /* __SYSTEM_H_ */
