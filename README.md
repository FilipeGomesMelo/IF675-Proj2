# IF675-Proj2
Um controlador de forno micro-ondas implementado usando a HDL verilog durante a cadeira de sistemas digitais seguindo as especificações do livro Digital Systems Principles and Applications, 12º edição.

## Alunos: Bruna Alves, Filipe Gomes, José Rodrigo Moura e Humberto Lima

## **Gerar arquivos windows**:
- *Controlador de Input*:
> iverilog -o saida codigos_nivel1/control_input_nivel2/control_input.v codigos_nivel1/control_input_nivel2/modulos_nivel3/*.v test/control_input_TB.v

- *Controlador de Magnetron*:
> iverilog -o saida codigos_nivel1/control_magnetron_nivel2/control_mag.v codigos_nivel1/control_magnetron_nivel2/modulos_nivel3/*.v test/control_mag_TB.v

- *Decodificador*:
> iverilog -o saida codigos_nivel1/decoder_nivel2/decoder.v test/decoder_TB.v

- *Timer*:
> iverilog -o saida codigos_nivel1/timer_nivel2/timer.v codigos_nivel1/timer_nivel2/modulos_nivel3/*.v test/timer_TB.v

- *Microondas*:
> iverilog -o saida codigos_nivel1/control_input_nivel2/control_input.v codigos_nivel1/control_input_nivel2/modulos_nivel3/\*.v codigos_nivel1/control_magnetron_nivel2/control_mag.v codigos_nivel1/control_magnetron_nivel2/modulos_nivel3/\*.v codigos_nivel1/decoder_nivel2/decoder.v codigos_nivel1/timer_nivel2/timer.v codigos_nivel1/timer_nivel2/modulos_nivel3/\*.v codigos_nivel1/micro_ondas.v test/micro_ondas_TB.v

#
###### *Projeto referente a matéria de Sistemas Digitais/CIN-UFPE no periodo de 2020.2*
