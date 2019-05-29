masm.exe /zi code.asm,;
masm.exe /zi print.asm,;
masm.exe /zi enter.asm,;
masm.exe /zi bin.asm,;
masm.exe /zi bins.asm,;
masm.exe /zi dec.asm,;
masm.exe /zi decs.asm,;
masm.exe /zi hex.asm,;
masm.exe /zi hexs.asm,;
link.exe /co code.obj print.obj enter.obj bin.obj bins.obj dec.obj decs.obj hex.obj hexs.obj,;
pause
