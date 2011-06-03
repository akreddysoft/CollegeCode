open(PIPE1,"dir |");	#piping of dos command


@temp=<PIPE1>;
print(@temp);

open(PIPE1,"link df |");	#piping of external win32 process


@temp=<PIPE1>;
print(@temp);



open(PIPE1,"tasm df |");	#piping of external 16bit dos process
				#perl is great


@temp=<PIPE1>;
print(@temp);