         SSTACK     SEGMENT para stack 'STACK'
                    DB   256 DUP('STACK____')
         SSTACK		ENDS

         SD1        SEGMENT para common 'DATA'
         			W	dw 	3444h
         SD1 		ENDS 
END
