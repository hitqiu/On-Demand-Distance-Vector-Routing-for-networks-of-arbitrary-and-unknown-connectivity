CC = gcc

LIBS = -lm /home/sreekar/nwprg/assign3/unpv13e/libunp.a
FLAGS =  -g -O2
CFLAGS = ${FLAGS} -I/home/sreekar/nwprg/assign3/unpv13e/lib
			
all: odr_main time_client time_server

time_client: client.o get_hw_addrs.o
	${CC} ${FLAGS} -o client client.o get_hw_addrs.o ${LIBS}

time_server: server.o get_hw_addrs.o
	${CC} ${FLAGS} -o server server.o get_hw_addrs.o ${LIBS}

odr_main: odr.o get_hw_addrs.o
	${CC} ${FLAGS} -o odr odr.o get_hw_addrs.o ${LIBS}

odr.o: odr.c
	${CC} ${CFLAGS} -c odr.c



get_hw_addrs.o: get_hw_addrs.c
	${CC} ${FLAGS} -c get_hw_addrs.c
	
client.o: client.c
	${CC} ${CFLAGS} -c client.c

server.o: server.c
	${CC} ${CFLAGS} -c server.c


clean:
	rm odr.o get_hw_addrs.o client.o server.o  odr client server
