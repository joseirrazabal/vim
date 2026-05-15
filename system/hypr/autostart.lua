-- Extra autostart processes.
o.exec_on_start("uwsm-app -- elephant")
o.exec_on_start("uwsm-app -- env GSK_RENDERER=cairo walker --gapplication-service")
o.exec_on_start("uwsm-app -- clipse -listen")
