#!/bin/bash

# If BASH_SOURCE is undefined we may be running under zsh, in that case
# provide a zsh-compatible alternative
DIR="$(dirname "$($READLINK -f "${BASH_SOURCE[0]:-${(%):-%x}}")")"
CHIPYARD_DIR="$(dirname "$DIR")"

CONDA_INSTALL_PREFIX=$CHIPYARD_DIR/conda-env
CONDA_CMD="conda" # some installers install mamba or micromamba
CONDA_ENV_NAME="chipyard"

DRY_RUN_OPTION=""
DRY_RUN_ECHO=()

usage()
{
    echo "Usage: $0 [options]"
    echo
    echo "Options:"
    echo "[--help]                  List this help"
    echo "[--prefix <prefix>]       Install prefix for conda environments. Defaults to $CONDA_INSTALL_PREFIX."
    echo "[--env <name>]            Name of environment to create for conda. Defaults to '$CONDA_ENV_NAME'."
    echo "[--dry-run]               Pass-through to all conda commands and only print other commands."
    echo "                          NOTE: --dry-run will still install conda to --prefix"
    echo
    echo "Examples:"
    echo "  % $0 --prefix ~/conda"
    echo "     Install a $CONDA_ENV_NAME conda environment into $HOME/conda"
    echo "  % $0 --prefix ~/conda --env my_custom_env"
    echo "     Install a my_custom_env conda environment into $HOME/conda"
    echo "  % $0 --prefix \${CONDA_EXE%/bin/conda} --env my_custom_env"
    echo "     Create my_custom_env in existing conda install"
    echo "     NOTES:"
    echo "       * CONDA_EXE is set in your environment when you activate a conda env"
}


while [ $# -gt 0 ]; do
    case "$1" in
        --help)
            usage
            exit 1
            ;;
        --prefix)
            shift
            CONDA_INSTALL_PREFIX="$1"
            shift
            ;;
        --env)
            shift
            CONDA_ENV_NAME="$1"
            shift
            if [[ "$CONDA_ENV_NAME" == "base" ]]; then
                echo "::ERROR:: best practice is to install into a named environment, not base. Aborting."
                exit 1
            fi
            ;;
        --dry-run)
            shift
            DRY_RUN_OPTION="--dry-run"
            DRY_RUN_ECHO=(echo "Would Run:")
            ;;
        *)
            echo "Invalid Argument: $1"
            usage
            exit 1
            ;;
    esac
done

set -ex
set -o pipefail

# uname options are not portable so do what https://www.gnu.org/software/coreutils/faq/coreutils-faq.html#uname-is-system-specific
# suggests and iteratively probe the system type
if ! type uname >&/dev/null; then
    echo "::ERROR:: need 'uname' command available to determine if we support this sytem"
    exit 1
fi

if [[ "$(uname)" != "Linux" ]]; then
    echo "::ERROR:: $0 only supports 'Linux' not '$(uname)'"
    exit 1
fi

if [[ "$(uname -mo)" != "x86_64 GNU/Linux" ]]; then
    echo "::ERROR:: $0 only supports 'x86_64 GNU/Linux' not '$(uname -io)'"
    exit 1
fi

if [[ ! -r /etc/os-release ]]; then
    echo "::ERROR:: $0 depends on /etc/os-release for distro-specific setup and it doesn't exist here"
    exit 1
fi

OS_FLAVOR=$(grep '^ID=' /etc/os-release | awk -F= '{print $2}' | tr -d '"')
OS_VERSION=$(grep '^VERSION_ID=' /etc/os-release | awk -F= '{print $2}' | tr -d '"')

# detect supported platforms
case "$OS_FLAVOR" in
    ubuntu)
        ;;
    centos)
        ;;
    *)
        echo "::ERROR:: Unknown OS flavor '$OS_FLAVOR'. Unable to do Conda setup."
        exit 1
        ;;
esac

# everything else is platform-agnostic and could easily be expanded to Windows and/or OSX

INSTALL_TYPE=user

CONDA_EXE=$(which conda)

if [[ -x "$CONDA_EXE" ]]; then
    echo "::INFO:: '$CONDA_EXE' already exists"
else
    echo "::ERROR:: '$CONDA_EXE' doesn't exist. Make sure conda is installed on your system"
    exit 1
fi

# https://conda-forge.org/feedstock-outputs/
#   filterable list of all conda-forge packages
# https://conda-forge.org/#contribute
#   instructions on adding a recipe
# https://docs.conda.io/projects/conda/en/latest/user-guide/concepts/pkg-specs.html#package-match-specifications
#   documentation on package_spec syntax for constraining versions
CONDA_PACKAGE_SPECS=()


# handy tool for introspecting package relationships and file ownership
# see https://github.com/rvalieris/conda-tree
CONDA_PACKAGE_SPECS=( conda-tree )

# bundle FireSim driver with deps into installer shell-script
CONDA_PACKAGE_SPECS=( constructor )

# https://docs.conda.io/projects/conda-build/en/latest/resources/compiler-tools.html#using-the-compiler-packages
#    for notes on using the conda compilers
# elfutils has trouble building with gcc 11 for something that looks like it needs to be fixed upstream
# ebl_syscall_abi.c:37:64: error: argument 5 of type 'int *' declared as a pointer [-Werror=array-parameter=]
#    37 | ebl_syscall_abi (Ebl *ebl, int *sp, int *pc, int *callno, int *args)
#       |                                                           ~~~~~^~~~
# In file included from ./../libasm/libasm.h:35,
#                  from ./libeblP.h:33,
#                  from ebl_syscall_abi.c:33:
# ./libebl.h:254:46: note: previously declared as an array 'int[6]'
#   254 |                             int *callno, int args[6]);
#       |                                          ~~~~^~~~~~~
#
# pin to gcc=10 until we get that fixed.

CONDA_PACKAGE_SPECS+=( gcc=10 gxx=10 binutils conda-gcc-specs )

# if building riscv-toolchain from source, we need to use bison=3.4 until we have
# https://github.com/riscv-collab/riscv-binutils-gdb/commit/314ec7aeeb1b2e68f0d8fb9990f2335f475a6e33
CONDA_PACKAGE_SPECS+=( bison=3.4 )

# poky deps
CONDA_PACKAGE_SPECS+=( python=3.8 patch texinfo subversion chrpath git wget )
# qemu deps
CONDA_PACKAGE_SPECS+=( gtk3 glib pkg-config bison flex )
# qemu also requires being built against kernel-headers >= 2.6.38 because of it's use of
# MADV_NOHUGEPAGE in a call to madvise.  See:
# https://man7.org/linux/man-pages/man2/madvise.2.html
# https://conda-forge.org/docs/maintainer/knowledge_base.html#using-centos-7
# obvi this would need to be made linux-specific if we supported other MacOS or Windows
CONDA_PACKAGE_SPECS+=( "kernel-headers_linux-64>=2.6.38" )
# firemarshal deps
CONDA_PACKAGE_SPECS+=( rsync psutil doit gitpython humanfriendly e2fsprogs ctags bison flex expat )
# cross-compile glibc 2.28+ deps
# current version of buildroot won't build with make 4.3 https://github.com/firesim/FireMarshal/issues/236
CONDA_PACKAGE_SPECS+=( make!=4.3 )
# build-libelf wants autoconf
CONDA_PACKAGE_SPECS+=( autoconf automake libtool )
# other misc deps
CONDA_PACKAGE_SPECS+=(
    sbt \
    ca-certificates \
    mosh \
    gmp \
    mpfr \
    mpc \
    zlib \
    vim \
    git  \
    openjdk \
    gengetopt \
    libffi \
    expat \
    libusb1 \
    ncurses \
    cmake \
    graphviz \
    expect \
    dtc \
    verilator==4.034 \
)

if [[ "$CONDA_ENV_NAME" == "base" ]]; then
    # NOTE: arg parsing disallows installing to base but this logic is correct if we ever change
    CONDA_SUBCOMMAND=install
else
    if [[ -d "${CONDA_INSTALL_PREFIX}/envs/${CONDA_ENV_NAME}" ]]; then
        # 'create' clobbers the existing environment and doesn't leave a revision entry in
        # `conda list --revisions`, so use install instead
        CONDA_SUBCOMMAND=install
    else
        CONDA_SUBCOMMAND=create
    fi
fi

"${CONDA_EXE}" "$CONDA_SUBCOMMAND" $DRY_RUN_OPTION -n "$CONDA_ENV_NAME" -y "${CONDA_PACKAGE_SPECS[@]}"

echo "conda environment successfully created"
