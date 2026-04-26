#define PY_SSIZE_T_CLEAN
#include "Python.h"

const char python_script[] = {
  #embed "script.py"
};

void print_exclamation13() {
  PyStatus status;
  PyConfig config;
  PyConfig_InitPythonConfig(&config);

  status = Py_InitializeFromConfig(&config);
  if (PyStatus_Exception(status)) {
      goto exception;
  }
  PyConfig_Clear(&config);

  PyRun_SimpleString(python_script);

  Py_FinalizeEx();
  return;

  exception:
     PyConfig_Clear(&config);
     Py_ExitStatusException(status);
}
