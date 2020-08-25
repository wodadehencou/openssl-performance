
OPENSSL_ROOT := /usr/local/opt/openssl
CFLAGS := -D NO_SM

# disable AES-NI instructions
# OPENSSL_ia32cap="~0x20"

open3: OPENSSL_ROOT := ./../openssl-install
open3: CFLAGS :=
open: OPENSSL_ROOT := /usr/local/opt/openssl@1.1
open: CFLAGS := -D NO_SM
gm: OPENSSL_ROOT := ./../gmssl-install
gm: CFLAGS := -D GM

open3 open gm: clean run

openssl-performance: main.c
	gcc ${CFLAGS} -L ${OPENSSL_ROOT}/lib -I ${OPENSSL_ROOT}/include \
		-o $@ \
		$< \
		-lcrypto

run: openssl-performance
	OPENSSL_ia32cap="~0x200000000000000" \
	LD_LIBRARY_PATH=${OPENSSL_ROOT}/lib:$$LD_LIBRARY_PATH \
	./$<


clean:
	$(RM) -f openssl-performance


