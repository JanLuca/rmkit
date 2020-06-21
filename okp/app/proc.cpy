namespace proc:
  def stop_xochitl():
    #ifdef REMARKABLE
    if system("systemctl stop xochitl 2> /dev/null") == 0:
      print "STOPPED XOCHITL"
    #endif
    return

  def start_xochitl():
    #ifdef REMARKABLE
    if system("systemctl restart xochitl 2> /dev/null") == 0:
      print "STARTING XOCHITL"
    #endif
    return

  bool check_process(string name):
    char command[64]
    sprintf(command, "ps | grep -v grep | grep %s 2>&1 > /dev/null", name.c_str());
    return 0 == system(command);

  void launch_harmony():
    if check_process("./harmony/harmony"):
      print "HARMONY IS ALREADY RUNNING"
      return

    print "LAUNCHING HARMONY"
    if system("./harmony/harmony") != 0:
      print "COULDN'T LAUNCH HARMONY..."