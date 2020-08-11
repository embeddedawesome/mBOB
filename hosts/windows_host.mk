# Check the version of Make
$(if $(filter 4,$(firstword $(subst ., ,$(MAKE_VERSION)))),,$(error You're doing it wrong. Must run make version 4.0+. This is version $(MAKE_VERSION)))

HOST_EXECUTABLE_SUFFIX  := .exe

SLASH_QUOTE_START :="\"
SLASH_QUOTE_END   :=\""

ESC_QUOTE:="
ESC_SPACE:=$(SPACE)

COMMA             :=,
ECHO              :=$(BOB_SDK_DIRECTORY)tools/common/win32/echo$(HOST_EXECUTABLE_SUFFIX)
CP                :=$(BOB_SDK_DIRECTORY)tools/common/win32/cp$(HOST_EXECUTABLE_SUFFIX)
PERL              :=$(BOB_SDK_DIRECTORY)tools/common/win32/perl$(HOST_EXECUTABLE_SUFFIX)
AWK               :=$(BOB_SDK_DIRECTORY)tools/common/win32/awk$(HOST_EXECUTABLE_SUFFIX)
QUOTES_FOR_ECHO   :=
TOUCH             :=$(ECHO) >
QUIET             :=@
RM                :=$(BOB_SDK_DIRECTORY)tools/common/win32/rm$(HOST_EXECUTABLE_SUFFIX)
SILENCE_MAKE      :=-s
CAT               :=$(BOB_SDK_DIRECTORY)tools/common/win32/cat$(HOST_EXECUTABLE_SUFFIX)
GIT               :=$(BOB_SDK_DIRECTORY)tools/common/win32/git$(HOST_EXECUTABLE_SUFFIX)
OPENSSL           :=$(BOB_SDK_DIRECTORY)tools/common/win32/openssl$(HOST_EXECUTABLE_SUFFIX)
export OPENSSL_CONF=tools/common/win32/openssl.cnf
CURL              :=$(BOB_SDK_DIRECTORY)tools/common/win32/curl$(HOST_EXECUTABLE_SUFFIX)

BOB_ABSOLUTE_SUBST :=/cygdrive/$(firstword $(subst /, ,$(subst /cygdrive/,,$(abspath .))))

DEV_NULL          :=NUL

# Helper util to clean up a directory. $(1) is the directory or even component makefile
define CLEAN_DIRECTORY
$(subst $(BOB_SDK_PATH)/,,$(realpath $(dir $(1))))
endef

# $(1) is the directory name
define MKDIR
md $(1)
endef

CREATE_FILE     =$(file >$(1),$(2))
APPEND_TO_FILE  =$(file >>$(1),$(2))

