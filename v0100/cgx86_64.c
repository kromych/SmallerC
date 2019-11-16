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

/* These registers are used as a stack when calculating expressions*/

const char*     scratch_registers_q[] = { "%rax", "%rdi", "%rsi", "%rdx", "%rcx", "%r8",  "%r9",  "%r10",  "%r11"  };
const char*     scratch_registers_l[] = { "%eax", "%edi", "%esi", "%edx", "%ecx", "%r8d", "%r9d", "%r10d", "%r11d" };
const char*     scratch_registers_w[] = {  "%ax",  "%di",  "%si",  "%dx",  "%cx", "%r8w", "%r9w", "%r10w", "%r11w" };
const char*     scratch_registers_b[] = {  "%al", "%dil", "%sil",  "%dl",  "%cl", "%r8b", "%r9b", "%r10b", "%r11b" };
const unsigned  max_scratch_reg = sizeof scratch_registers_q / sizeof scratch_registers_q[0];

const char*     scratch_registers_indirect[] = { "(%rax)", "(%rdi)", "(%rsi)", "(%rdx)", "(%rcx)", "(%r8)", "(%r9)", "(%r10)", "(%r11)" };

const char*     arg_registers_q[] = { "%rdi", "%rsi", "%rdx", "%rcx", "%r8",  "%r9",  "%r10",  "%r11" };
const unsigned  max_arg_reg = sizeof arg_registers_q / sizeof arg_registers_q[0];

unsigned        last_scratch_reg = 0;

STATIC
void GenAddrData(int Size, char* Label, int ofs)
{
  printf2("# NYI: GenAddrData\n");
}

STATIC
void GenDumpChar(int ch)
{
  if (ch < 0)
  {
    if (TokenStringLen)
      printf2("\"\n");
    return;
  }

  if (TokenStringLen == 0)
  {
    GenStartAsciiString();
    printf2("\"");
  }

  if (ch >= 0x20 && ch <= 0x7E)
  {
    if (ch == '"' || ch == '\\')
      printf2("\\");
    printf2("%c", ch);
  }
  else
  {
    printf2("\\%03o", ch);
  }
}

STATIC
void x64GenCondJump(unsigned op, unsigned label_num, unsigned not)
{
  const char* cond_code = "?";

  switch (op)
  {
    case '>':         cond_code = not ? "le" :  "g"; break;
    case '<':         cond_code = not ? "ge" :  "l"; break;
    case tokEQ:       cond_code = not ? "ne" :  "e"; break;
    case tokNEQ:      cond_code = not ? "e"  : "ne"; break;
    case tokLEQ:      cond_code = not ? "g"  : "le"; break;
    case tokGEQ:      cond_code = not ? "l"  : "ge"; break;
    case tokULess:    cond_code = not ? "ae" :  "b"; break;
    case tokUGreater: cond_code = not ? "be" :  "a"; break;
    case tokULEQ:     cond_code = not ? "a"  : "be"; break;
    case tokUGEQ:     cond_code = not ? "b"  : "ae"; break;
    default:          errorInternal(640010); break;
  }

  printf2("\t\tj%s\t\t\t.L%d\t", cond_code, label_num);
}

STATIC
void x64GenIf(unsigned op, unsigned label_num)
{
  x64GenCondJump(op, label_num, 0);
}

STATIC
void x64GenIfNot(unsigned op, unsigned label_num)
{
  x64GenCondJump(op, label_num, 1);
}

STATIC
void x64GenAssign(unsigned active_reg, signed size)
{
  char          size_suff = '?';
  const char**  scratch_registers = NULL;

  if (active_reg < 2)
  {
    errorInternal(640002);
  }

  switch (abs(size))
  {
    case 1:
      size_suff = 'b';
      scratch_registers = scratch_registers_b;

      break;

    case 2:
      size_suff = 'w';
      scratch_registers = scratch_registers_w;

      break;

    case 4:
      size_suff = 'l';
      scratch_registers = scratch_registers_l;

      break;

    case 8:
      size_suff = 'q';
      scratch_registers = scratch_registers_q;

      break;

    default:
      errorInternal(640003);
      break;
  }

  printf2("\t\tmov%c\t\t%s, %s", size_suff, scratch_registers[active_reg -1], scratch_registers_indirect[active_reg - 2]);
}

STATIC
void x64GenDeref(unsigned active_reg, signed size)
{
  char          size_suff = '?';
  const char**  scratch_registers = NULL;

  if (active_reg == 0)
  {
    errorInternal(640004);
  }

  switch (abs(size))
  {
    case 1:
      size_suff = 'b';
      scratch_registers = scratch_registers_b;

      break;

    case 2:
      size_suff = 'w';
      scratch_registers = scratch_registers_w;

      break;

    case 4:
      size_suff = 'l';
      scratch_registers = scratch_registers_l;

      break;

    case 8:
      size_suff = 'q';
      scratch_registers = scratch_registers_q;

      break;

    default:
      errorInternal(640003);
      break;
  }

  printf2("\t\tmov%c\t\t%s, %s", size_suff, scratch_registers_indirect[active_reg - 1], scratch_registers[active_reg - 1]);

  if (abs(size) < 8) 
  {
    /* For 32 bit registers, zero-extend is performed by the hardware ? */

    if (size < 0) 
    {
      /* Sign-extend */
      printf2("\n\t\tmovsx%c\t\t%s, %s", size_suff, scratch_registers[active_reg - 1], scratch_registers_q[active_reg - 1]);
    }
    else
    {
      /* Zero-extend */
      printf2("\n\t\tmovzx%c\t\t%s, %s", size_suff, scratch_registers[active_reg - 1], scratch_registers_q[active_reg - 1]);
    }
  }
}

STATIC
void x64GenALU(unsigned active_reg, signed op)
{
  const char* op_str = "";

  if (active_reg < 2)
  {
    errorInternal(6400018);
  }

  /* 
    Mul and Div need special treatment as they have signed and unsigned versions,
    and use rax and rdx.
   */

  switch (op)
  {
  case '+': op_str = "add"; break;
  case '-': op_str = "sub"; break;

  case '&': op_str = "and"; break;
  case '|': op_str =  "or"; break;
  case '^': op_str = "xor"; break;

  default: errorInternal(6400011); break;
  }

  printf2("\t\t%sq\t\t%s, %s", op_str, scratch_registers_q[active_reg - 1], scratch_registers_q[active_reg - 2]);
}

STATIC
void GenExpr(void)
{
  unsigned current_active_reg = 0;
  unsigned current_arg_reg = 0;
  unsigned latest_compare_op = 0;

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
      printf2("\t\t/*** Result in rax ***/");
      break;

    case tokLocalOfs:
      printf2("\t\tleaq\t\t%d(%%rbp), %s", v, scratch_registers_q[current_active_reg++]);
      break;

    case tokUnaryStar:
      x64GenDeref(current_active_reg, v);
      break;

    case tokNumInt:
    case tokNumUint:
      if (v != 0)
      {
        printf2("\t\tmovq\t\t$0x%lx, %s", (unsigned long)v, scratch_registers_q[current_active_reg++]);
      }
      else
      {
        printf2("\t\txorq\t\t%s, %s", scratch_registers_q[current_active_reg], scratch_registers_q[current_active_reg]);
        ++current_active_reg;
      }
      break;

    case '=':
      x64GenAssign(current_active_reg, v);

      current_active_reg -= 1;
      break;

    case '(':
      if (CurFxnMinLocalOfs != 0)
      {
        /* Protect locals */
        printf2("\t\tsubq\t\t$%ld, %%rsp # Protect locals\n", abs(CurFxnMinLocalOfs)*8);
      }

      for (int r = 0; r < current_active_reg; ++r)
      {
         printf2("\t\tpushq\t\t%s # Save register in use\n", scratch_registers_q[r]);
      }

      last_scratch_reg = current_active_reg - 1;
      current_active_reg = 0;
      current_arg_reg = 0;
      break;

    case ',':
      printf2("\t\tmovq\t\t%s, -%d(%rsp)", scratch_registers_q[--current_active_reg], 8*(++current_arg_reg));

      break;

    case tokIdent:
      if (v >= IdentTableLen)
      {
        errorInternal(640008);
      }

      if ((i < sp - 1) && (stack[i+1][0] == ')'))
      {
        for (int r = 0; r < current_arg_reg; ++r)
        {
          printf2("\t\tmovq\t\t-%d(%rsp), %s\n", 8*(r+1), arg_registers_q[r]);
        }

        printf2("\t\tcall\t\t%s", &IdentTable[v]);
      }
      else
      {
        if (isdigit(IdentTable[v]))
        {
          printf2("\t\tleaq\t\t.L%s(%%rip), %s", &IdentTable[v], scratch_registers_q[current_active_reg++]);
        }
        else
        {
          printf2("\t\tleaq\t\t%s(%%rip), %s", &IdentTable[v], scratch_registers_q[current_active_reg++]);
        }
      }
      break;

    case ')':
      if (i == 0)
      {
        errorInternal(640006);
      }

      printf2("\t\t/*** Returned ***/\n", v);

      /* Preserve its result */
      if (last_scratch_reg + 1 != 0)
      {
        // If any registers were in use before the call,
        // move the result past the last used one

        printf2("\n\t\tmovq\t\t%%rax, %s # Save result\n", scratch_registers_q[last_scratch_reg + 1]);
      }

      for (int r = last_scratch_reg; r >= 0; --r)
      {
        printf2("\n\t\tpopq\t\t%s # Restore register in use\n", scratch_registers_q[r]);
      }

      current_active_reg = last_scratch_reg + 2;

      if (CurFxnMinLocalOfs != 0)
      {
        printf2("\n\t\taddq\t\t$%ld, %%rsp", abs(CurFxnMinLocalOfs)*8);
      }

      break;

    case '+':
    case '-':
    case '~':
    case '*':
    case '/':
    case '%':
    case '&':
    case '|':
    case '^':
    case '!':
      x64GenALU(current_active_reg, tok);

      current_active_reg -= 1;
      break;

    case tokEQ:
    case tokNEQ:
    case tokLEQ:
    case tokGEQ:
    case tokULess:
    case tokUGreater:
    case tokULEQ:
    case tokUGEQ:
    case '>':
    case '<':
      if (current_active_reg < 2)
      {
        errorInternal(6400014);
      }

      latest_compare_op = tok;
      printf2("\t\tcmpq\t\t%s, %s", scratch_registers_q[current_active_reg - 1], scratch_registers_q[current_active_reg - 2]);

      current_active_reg -= 1;
      break;

    case tokIfNot:
      x64GenIfNot(latest_compare_op, v);

      current_active_reg -= 1;
      break;

    case tokIf:
      x64GenIf(latest_compare_op, v);

      current_active_reg -= 1;
      break;

    default: 
      printf2("\t\t\t\t/* NOT YET IMPLEMENTED */\n"); 
      //errorInternal(102);
      break;
    }

    printf2("\t\t\t\t# TOKEN: %s, VALUE: %i, next active register: %s\n", GetTokenName(tok), v, scratch_registers_q[current_active_reg]); 
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

  printf2("\t\taddq\t\t$16, %%rsp\t\t\t\t# TODO: Stack cookie\n");

  printf2("\t\tpopq\t\t%%rbp\t\t\t\t\t# Restore rbp\n");
  printf2("\t\tpopq\t\t%%rsp\t\t\t\t\t# Restore rsp\n");
  printf2("\t\tret\t\t\t\t\t\t\t\t\t# Pop the return address from the stack, and return to the caller\n");
  printf2("\t\t.cfi_endproc\n");
}

STATIC
void GenFxnProlog(void)
{
  char* arg_registers[] = { "rdi", "rsi", "rdx", "rcx", "r8", "r9" };

  printf2("\t\t.cfi_startproc\n");
  printf2("\t\tpushq\t\t%%rsp\t\t\t\t\t# Save rsp\n");
  printf2("\t\tpushq\t\t%%rbp\t\t\t\t\t# Save rbp\n");

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
      printf2("\t\tmovq\t\t%%%s, 0x%lx(%%rsp)\t\t\t# Home parameter %i\n", arg_registers[i], i*8, i);
    }
  }

  /* Stack cookie */

  printf2("\t\tsubq\t\t$16, %%rsp\t\t\t\t# TODO: Stack cookie\n");

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
  CodeHeaderFooter[0] = "\t\t.text\n\t\t.code64";
  DataHeaderFooter[0] = "\t\t.data";
  RoDataHeaderFooter[0] = "\t\t.section\t.rodata, \"a\", @progbits";
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
    printf2("\t\t.short\t\t%d\n", Val);
  else if (Size == 4)
    printf2("\t\t.int\t\t%d\n", Val);
  else if (Size == 8)
    printf2("\t\t.quad\t\t%d\n", Val);
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
  printf2("\t\tjmp\t\t\t.L%d\n", label);
}

STATIC
void GenLabel(char* Label, int Static)
{
  if (!Static && GenExterns)
  {
    printf2("\t\t.global\t\t%s\n", Label);
  }

  if (CurFxnName)
  {
    printf2("\t\t.type\t\t%s, %%function\n", Label);
  }
  else
  {
    printf2("\t\t.type\t\t%s, %%object\n", Label);
  }

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
  printf2(".L%d:\n", Label);
}

STATIC
void GenStartAsciiString(void)
{
  printf2("\t\t.ascii\t\t");
}

STATIC
void GenPrintLabel(char* Label)
{
  printf2("# NYI: GenPrintLabel\n");
  if (isdigit(*Label))
    printf2(".L%s", Label);
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
  printf2("\t\t.align\t\t8\n");
}

STATIC
void GenZeroData(unsigned Size, int bss)
{
  printf2("\t\t.skip\t\t%d\n", Size);
}
