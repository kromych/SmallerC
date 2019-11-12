/*
Copyright (c) 2019 Roman Kiselev
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this
   list of conditions and the following disclaimer.
2. Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation
   and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

/*
  Assumptions:
    1) There is no liveness analysis here so it is assumed
       the registers the parameters use are always live


  Calling conventions:
    1) Parameters to functions are passed in the registers
       rdi, rsi, rdx, rcx, r8, r9, and further values are
       passed on the stack in reverse order.
    2) The stack is 16-byte aligned just before the call instruction is called.
       Functions preserve the registers
       rbx, rsp, rbp, r12, r13, r14, and r15;
       while rax, rdi, rsi, rdx, rcx, r8, r9, r10, r11 are scratch registers.
    3) The return value is stored in the rax register, or if it is a 128-bit value,
       then the higher 64-bits go in rdx.
*/

STATIC
void GenAddrData(int Size, char* Label, int ofs)
{
  printf2("# NYI: GenAddrData\n");
}

STATIC
void GenDumpChar(int ch)
{
  printf2("# NYI: GenDumpChar\n");
}

STATIC
void GenExpr(void)
{
  /* These registers are used as a stack */
  char*           scratch_registers_q[] = { "%rax", "%rdi", "%rsi", "%rdx", "%rcx", "%r8",  "%r9",  "%r10",  "%r11"  };
  char*           scratch_registers_l[] = { "%eax", "%edi", "%esi", "%edx", "%ecx", "%r8d", "%r9d", "%r10d", "%r11d" };
  char*           scratch_registers_w[] = {  "%ax",  "%di",  "%si",  "%dx",  "%cx", "%r8w", "%r9w", "%r10w", "%r11w" };
  char*           scratch_registers_b[] = {  "%al", "%dil", "%sil",  "%dl",  "%cl", "%r8b", "%r9b", "%r10b", "%r11b" };

  char*           scratch_registers_indirect[] = { "(%rax)", "(%rdi)", "(%rsi)", "(%rdx)", "(%rcx)", "(%r8)", "(%r9)", "(%r10)", "(%r11)" };
  unsigned        current_active_reg = 0;
  const unsigned  max_scratch_reg = sizeof scratch_registers_q / sizeof scratch_registers_q[0];

  printf2("# GenExpr\n");

  for (int i = 0; i < sp; ++i)
  {
    int tok = stack[i][0];
    int v = stack[i][1];

    if (current_active_reg >= max_scratch_reg)
    {
      errorInternal(640001);
    }

    switch (tok)
    {
    case tokReturn:
      printf2("\t\t/*** Returning result in rax ***/");
      break;

    case tokLocalOfs:
      printf2("\t\tleaq\t\t%d(%%rbp), %s", v, scratch_registers_q[current_active_reg++]);
      break;

    case tokUnaryStar:
      {
        char    size_suff = '?';
        char**  scratch_registers = NULL;

        if (current_active_reg == 0)
        {
          errorInternal(640004);
        }

        switch (v)
        {
          case -1:
          case 1:
            size_suff = 'b';
            scratch_registers = scratch_registers_b;

            break;

          case -2:
          case 2:
            size_suff = 'w';
            scratch_registers = scratch_registers_w;

            break;

          case -4:
          case 4:
            size_suff = 'l';
            scratch_registers = scratch_registers_l;

            break;

          case -8:
          case 8:
            size_suff = 'q';
            scratch_registers = scratch_registers_q;

            break;

          default:
            errorInternal(640003);
            break;
        }

        printf2("\t\tmov%c\t\t%s, %s\n", size_suff, scratch_registers_indirect[current_active_reg - 1], scratch_registers[current_active_reg - 1]);

        if (abs(v) < 8) 
        {
          /* For 32 bit registers, zero-extend is performed by the hardware ? */

          if (v < 0) 
          {
            /* Sign-extend */
            printf2("\t\tmovsx%c\t\t%s, %s", size_suff, scratch_registers[current_active_reg - 1], scratch_registers_q[current_active_reg - 1]);
          }
          else
          {
            /* Zero-extend */
            printf2("\t\tmovzx%c\t\t%s, %s", size_suff, scratch_registers[current_active_reg - 1], scratch_registers_q[current_active_reg - 1]);
          }
        }
      }
      break;

    case tokNumInt:
    case tokNumUint:
      printf2("\t\tmovq\t\t$0x%lx, %s", (unsigned long)v, scratch_registers_q[current_active_reg++]);
      break;

    case '=':
      {
        char    size_suff = '?';
        char**  scratch_registers = NULL;

        if (current_active_reg < 2)
        {
          errorInternal(640002);
        }

        switch (v)
        {
          case -1:
          case 1:
            size_suff = 'b';
            scratch_registers = scratch_registers_b;

            break;

          case -2:
          case 2:
            size_suff = 'w';
            scratch_registers = scratch_registers_w;

            break;

          case -4:
          case 4:
            size_suff = 'l';
            scratch_registers = scratch_registers_l;

            break;

          case -8:
          case 8:
            size_suff = 'q';
            scratch_registers = scratch_registers_q;

            break;

          default:
            errorInternal(640003);
            break;
        }

        printf2("\t\tmov%c\t\t%s, %s", size_suff, scratch_registers[current_active_reg -1], scratch_registers_indirect[current_active_reg - 2]);

        current_active_reg -= 1;
      }
      break;

    case '(':
      printf2("\t\t/*** Passing %d arguments to a function ***/", v);
      break;

    case tokIdent:
      if (v >= IdentTableLen)
      {
        errorInternal(640008);
      }

      printf2("\t\tcall\t\t%s", &IdentTable[v]);
      break;

    case ')':
      if (i == 0)
      {
        errorInternal(640006);
      }

      printf2("\t\t/*** Returned from a function of %d arguments ***/", v);

      /* Preserve its result */
      current_active_reg += 1;

      break;

    case '+':
      printf2("\t\taddq\t\t%s, %s", scratch_registers_q[current_active_reg - 1], scratch_registers_q[current_active_reg - 2]);

      current_active_reg -= 1;

      break;

    case tokEQ:
    case tokNEQ:
      printf2("\t\tcmpq\t\t%s, %s", scratch_registers_q[current_active_reg - 1], scratch_registers_q[current_active_reg - 2]);

      current_active_reg -= 1;
      break;

    case tokIfNot:
      printf2("\t\tjne\t\t__L%d", v);

      current_active_reg -= 1;
      break;

    case tokIf:
      printf2("\t\tje\t\t__L%d", v);

      current_active_reg -= 1;
      break;

    default: 
      printf2("\t\t/*** NOT YET IMPLEMENTED ***/");
      /* errorInternal(102); */
      break;
    }

    printf2("\t\t\t\t# TOKEN: %s, VALUE: %i\n", GetTokenName(tok), v); 
  }
}

STATIC
void GenFin(void)
{
  printf2("# NYI: GenFin\n");
}

void GenFxnEpilog(void)
{
  if (CurFxnParamCntMin)
  {
    /* Free the space for homing the parameters on the stack */

    printf2("\t\taddq\t\t$0x%lx, %%rsp\t\t\t\t# Free the space used by the homed parameters and locals\n", CurFxnParamCntMin*8);
  }
  printf2("\t\tpopq\t\t%%rbp\t\t\t\t# Restore rbp\n");
  printf2("\t\tpopq\t\t%%rsp\t\t\t\t# Restore rsp\n");
  printf2("\t\tret\t\t\t\t# Pop the return address from the stack, and return to the caller\n");
  printf2("\t\t.cfi_endproc\n");
}

STATIC
void GenFxnProlog(void)
{
  char* arg_registers[] = { "rdi", "rsi", "rdx", "rcx", "r8", "r9" };

  printf2("\t\t.cfi_startproc\n");
  printf2("\t\tpushq\t\t%%rsp\t\t\t\t# Save rsp\n");
  printf2("\t\tpushq\t\t%%rbp\t\t\t\t# Save rbp\n");

  if (CurFxnParamCntMin)
  {
    /* Space for homing the parameters on the stack */

    printf2("\t\tsubq\t\t$0x%lx, %%rsp\t\t\t\t# Space for homing the parameters on the stack\n", CurFxnParamCntMin*8);

    if (CurFxnParamCntMin > 6)
    {
      error("More than 6 parameters is not supported");
    }
    
    for (int i = 0; i < CurFxnParamCntMin; ++i)
    {
      printf2("\t\tmovq\t\t%%%s, 0x%lx(%%rsp)\t\t\t\t# Home parameter %i\n", arg_registers[i], i*8, i);
    }
  }

  printf2("\t\tmovq\t\t%%rsp, %%rbp\t\t\t\t# Set the base pointer after the last homed parameter\n");

  /* Now [rbp+...] accesses a parameter, [rbp-...] accesses a local */

  CurFxnLocalOfs = 0;
}

STATIC
int GenFxnSizeNeeded(void)
{
  return 0;
}

STATIC
void GenInit(void)
{
  // initialization of target-specific code generator
  SizeOfWord = 8;
  OutputFormat = FormatSegmented;
  CodeHeaderFooter[0] = "\t\t.text";
  DataHeaderFooter[0] = "\t\t.data";
  RoDataHeaderFooter[0] = "\t\t.rdata";
  BssHeaderFooter[0] = "\t\t.bss";
  UseLeadingUnderscores = 0;
  FileHeader = "";
}

STATIC
void GenInitFinalize(void)
{
  // finalization of initialization of target-specific code generator
  printf2("# NYI: GenInitFinalize\n");
}

STATIC
int GenInitParams(int argc, char** argv, int* idx)
{
  return 0;
}

STATIC
void GenIntData(int Size, int Val)
{
  Val = truncInt(Val);
  if (Size == 1)
    printf2("\t\t.byte\t\t%d\n", Val);
  else if (Size == 2)
    printf2("\t\t.half\t\t%d\n", Val);
  else if (Size == 4)
    printf2("\t\t.word\t\t%d\n", Val);
  else if (Size == 8)
    printf2("\t\t.xword\t\t%d\n", Val);
}

void GenIsrProlog(void)
{
  printf2("# NYI: GenIsrProlog\n");
}

void GenIsrEpilog(void)
{
  printf2("# NYI: GenIsrEpilog\n");
}

STATIC
void GenJumpIfEqual(int val, int label)
{
  printf2("# NYI: GenJumpIfEqual\n");
}

STATIC
void GenJumpIfNotZero(int label)
{
  printf2("# NYI: GenJumpIfNotZero\n");
}

STATIC
void GenJumpIfZero(int label)
{
  printf2("# NYI: GenJumpIfZero\n");
}

STATIC
void GenJumpUncond(int label)
{
  printf2("\t\tjmp\t\t__L%d\n", label);
}

STATIC
void GenLabel(char* Label, int Static)
{
  if (!Static && GenExterns)
  {
    printf2("\t\t.global\t\t%s\n", Label);
  }
  printf2("\t\t.type\t\t%s, %%function\n", Label);
  printf2("%s:\n", Label);
}

STATIC
int GenMaxLocalsSize(void)
{
  return 0x7FFFFFFF;
}

STATIC
void GenNumLabel(int Label)
{
  printf2("__L%d:\n", Label);
}

STATIC
void GenStartAsciiString(void)
{
  printf2("# NYI: GenStartAsciiString\n");
}

STATIC
void GenPrintLabel(char* Label)
{
  printf2("# NYI: GenPrintLabel\n");
  if (isdigit(*Label))
    printf2("__L%s", Label);
  else
    printf2("%s", Label);
}

STATIC
void GenRecordFxnSize(char* startLabelName, int endLabelNo)
{
  printf2("# NYI: GenRecordFxnSize\n");
}

STATIC
void GenStartCommentLine(void)
{
  printf2("# ");
}

STATIC
void GenWordAlignment(int bss)
{
  printf2("\t\t.align\t\t8 ; GenWordAlignment\n");
}

STATIC
void GenZeroData(unsigned Size, int bss)
{
  printf2("# NYI: GenZeroData\n");
}
